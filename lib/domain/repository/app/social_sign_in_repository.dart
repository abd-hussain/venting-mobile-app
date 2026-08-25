import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/app/social_auth_provider.dart';
import 'package:venting_mobile_app/domain/data/app/social_sign_in_result.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';

class SocialSignInRepository {
  SocialSignInRepository(this._appConfig);

  final AppConfig _appConfig;
  bool _googleInitialized = false;

  Future<void> _ensureGoogleInitialized() async {
    if (_googleInitialized) {
      return;
    }
    final serverClientId = _appConfig.googleWebClientId.isNotEmpty
        ? _appConfig.googleWebClientId
        : _appConfig.googleAndroidClientId;
    await GoogleSignIn.instance.initialize(
      clientId: _appConfig.googleIosClientId.isNotEmpty
          ? _appConfig.googleIosClientId
          : null,
      serverClientId: serverClientId.isNotEmpty ? serverClientId : null,
    );
    _googleInitialized = true;
  }

  TaskEither<Exception, SocialSignInResult> signInWithGoogle() {
    return TaskEither.tryCatch(
      () async {
        await _ensureGoogleInitialized();

        GoogleSignInAccount account;
        try {
          account = await GoogleSignIn.instance.authenticate(
            scopeHint: const ['email', 'profile'],
          );
        } on GoogleSignInException catch (error) {
          if (error.code == GoogleSignInExceptionCode.canceled) {
            throw const SocialSignInCancelledException();
          }
          rethrow;
        }

        final auth = account.authentication;
        final idToken = auth.idToken;
        if (idToken == null || idToken.isEmpty) {
          throw const MainAPIException(
            status: 'failed',
            type: 'auth',
            code: -20,
            message: 'Google sign-in did not return an ID token.',
          );
        }

        return SocialSignInResult(
          provider: SocialAuthProvider.google,
          idToken: idToken,
          email: account.email.trim().toLowerCase(),
        );
      },
      (error, stackTrace) {
        if (error is SocialSignInCancelledException) {
          return error;
        }
        if (error is MainAPIException) {
          return error;
        }
        LoggerManagerBase.logErrorMessage(
          error: error,
          stackTrace: stackTrace,
          message: 'SocialSignInRepository: Google sign-in failed',
        );
        return MainAPIException(
          status: 'failed',
          type: 'auth',
          code: -21,
          message: error.toString(),
        );
      },
    );
  }

  TaskEither<Exception, SocialSignInResult> signInWithApple() {
    return TaskEither.tryCatch(
      () async {
        final rawNonce = _generateNonce();
        final hashedNonce = _sha256ofString(rawNonce);

        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: const [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          nonce: hashedNonce,
        );

        final idToken = credential.identityToken;
        if (idToken == null || idToken.isEmpty) {
          throw const MainAPIException(
            status: 'failed',
            type: 'auth',
            code: -22,
            message: 'Apple sign-in did not return an identity token.',
          );
        }

        final givenName = credential.givenName?.trim();
        final familyName = credential.familyName?.trim();
        final fullName =
            (givenName != null && givenName.isNotEmpty) ||
                (familyName != null && familyName.isNotEmpty)
            ? SocialSignInFullName(givenName: givenName, familyName: familyName)
            : null;

        return SocialSignInResult(
          provider: SocialAuthProvider.apple,
          idToken: idToken,
          email: credential.email?.trim().toLowerCase(),
          nonce: rawNonce,
          fullName: fullName,
        );
      },
      (error, stackTrace) {
        if (error is SocialSignInCancelledException) {
          return error;
        }
        if (error is MainAPIException) {
          return error;
        }
        if (error is SignInWithAppleAuthorizationException &&
            error.code == AuthorizationErrorCode.canceled) {
          return const SocialSignInCancelledException();
        }
        LoggerManagerBase.logErrorMessage(
          error: error,
          stackTrace: stackTrace,
          message: 'SocialSignInRepository: Apple sign-in failed',
        );
        return MainAPIException(
          status: 'failed',
          type: 'auth',
          code: -23,
          message: error.toString(),
        );
      },
    );
  }

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    return sha256.convert(bytes).toString();
  }
}

class SocialSignInCancelledException implements Exception {
  const SocialSignInCancelledException();
}
