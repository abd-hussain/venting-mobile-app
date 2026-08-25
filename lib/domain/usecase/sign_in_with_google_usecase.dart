import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/app/social_sign_in_result.dart';
import 'package:venting_mobile_app/domain/repository/app/social_sign_in_repository.dart';

class SignInWithGoogleUsecase {
  const SignInWithGoogleUsecase(this._socialSignInRepository);

  final SocialSignInRepository _socialSignInRepository;

  TaskEither<Exception, SocialSignInResult> call() =>
      _socialSignInRepository.signInWithGoogle();
}
