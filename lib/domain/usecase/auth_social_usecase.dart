import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_session_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/social_sign_in_result.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_social_repository.dart';

class AuthSocialUsecase {
  const AuthSocialUsecase(this._authSocialRepository);

  final AuthSocialRepository _authSocialRepository;

  TaskEither<Exception, AuthSessionResponseModel> call({
    required SocialSignInResult signInResult,
    required String role,
  }) => _authSocialRepository.call(
    provider: signInResult.provider,
    idToken: signInResult.idToken,
    role: role,
    nonce: signInResult.nonce,
    fullName: signInResult.fullName,
  );
}
