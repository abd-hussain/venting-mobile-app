import 'package:fpdart/fpdart.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/refresh_token_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_refresh_token_repository.dart';

class AuthRefreshTokenUsecase {
  final AuthRefreshTokenRepository authRefreshTokenRepository;
  final VentingPreferences ventingPreferences;

  const AuthRefreshTokenUsecase(
    this.authRefreshTokenRepository,
    this.ventingPreferences,
  );

  /// Returns refreshed tokens and persists them.
  /// On failure, clears local tokens so the session cannot hang half-open.
  TaskEither<Exception, RefreshTokenResponseModel> call() {
    final refreshToken = ventingPreferences.getValue(
      SavedConstants.refreshToken,
      '',
    );

    if (refreshToken.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'auth',
          code: 401,
          message: 'Refresh token is missing',
        ),
      );
    }

    return TaskEither(() async {
      final result = await authRefreshTokenRepository
          .call(refreshToken: refreshToken)
          .run();

      return await result.match(
        (error) async {
          await _clearTokens();
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'Failed to refresh tokens',
          );
          return Left(error);
        },
        (model) async {
          try {
            await ventingPreferences.setValue(
              SavedConstants.accessToken,
              model.data.access_token,
            );
            await ventingPreferences.setValue(
              SavedConstants.refreshToken,
              model.data.refresh_token,
            );
            return Right(model);
          } on Object catch (error) {
            await _clearTokens();
            final exception = error is Exception
                ? error
                : Exception(error.toString());
            LoggerManagerBase.logErrorMessage(
              error: exception,
              message: 'Failed to persist refreshed tokens',
            );
            return Left(exception);
          }
        },
      );
    });
  }

  Future<void> _clearTokens() async {
    await ventingPreferences.remove(SavedConstants.accessToken);
    await ventingPreferences.remove(SavedConstants.refreshToken);
  }
}
