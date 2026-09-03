import 'package:venting_mobile_app/domain/data/app/session_call_credentials.dart';

class ListenerCallArgs {
  const ListenerCallArgs({
    required this.sessionId,
    required this.ventorName,
    required this.ventorRating,
    required this.durationMinutes,
    required this.isVideoCall,
    this.ventorAvatarUrl,
    this.callCredentials,
  });

  final String sessionId;
  final String ventorName;
  final String? ventorAvatarUrl;
  final double ventorRating;
  final int durationMinutes;
  final bool isVideoCall;
  final SessionCallCredentials? callCredentials;

  ListenerCallArgs copyWith({
    String? sessionId,
    String? ventorName,
    String? ventorAvatarUrl,
    double? ventorRating,
    int? durationMinutes,
    bool? isVideoCall,
    SessionCallCredentials? callCredentials,
  }) {
    return ListenerCallArgs(
      sessionId: sessionId ?? this.sessionId,
      ventorName: ventorName ?? this.ventorName,
      ventorAvatarUrl: ventorAvatarUrl ?? this.ventorAvatarUrl,
      ventorRating: ventorRating ?? this.ventorRating,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      isVideoCall: isVideoCall ?? this.isVideoCall,
      callCredentials: callCredentials ?? this.callCredentials,
    );
  }
}
