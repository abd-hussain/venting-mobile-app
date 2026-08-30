import 'package:venting_mobile_app/domain/data/app/social_auth_provider.dart';

class SocialSignInFullName {
  const SocialSignInFullName({this.givenName, this.familyName});

  final String? givenName;
  final String? familyName;

  Map<String, String> toJson() {
    return {
      if (givenName != null && givenName!.isNotEmpty) 'given_name': givenName!,
      if (familyName != null && familyName!.isNotEmpty)
        'family_name': familyName!,
    };
  }

  bool get isEmpty =>
      (givenName == null || givenName!.isEmpty) &&
      (familyName == null || familyName!.isEmpty);
}

class SocialSignInResult {
  const SocialSignInResult({
    required this.provider,
    required this.idToken,
    this.email,
    this.nonce,
    this.fullName,
  });

  final SocialAuthProvider provider;
  final String idToken;
  final String? email;
  final String? nonce;
  final SocialSignInFullName? fullName;
}
