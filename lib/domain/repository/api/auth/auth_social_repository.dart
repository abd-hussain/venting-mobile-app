import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_session_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/social_auth_provider.dart';
import 'package:venting_mobile_app/domain/data/app/social_sign_in_result.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class AuthSocialRepository extends BaseRepository {
  const AuthSocialRepository(super.apiClient);

  TaskEither<Exception, AuthSessionResponseModel> call({
    required SocialAuthProvider provider,
    required String idToken,
    required String role,
    String? nonce,
    SocialSignInFullName? fullName,
  }) {
    final body = <String, dynamic>{
      'provider': provider.apiValue,
      'id_token': idToken,
      'role': role,
      if (nonce != null && nonce.isNotEmpty) 'nonce': nonce,
      if (fullName != null && !fullName.isEmpty) 'full_name': fullName.toJson(),
    };

    return executeRequest(
      request: apiClient.post<Object?>('v1/auth/social', data: body),
      fromJson: AuthSessionResponseModel.fromJson,
    );
  }
}
