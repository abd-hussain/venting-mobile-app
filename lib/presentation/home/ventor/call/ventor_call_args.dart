import 'package:venting_mobile_app/domain/data/app/session_call_credentials.dart';

class VentorCallArgs {
  const VentorCallArgs({
    required this.sessionId,
    required this.listenerName,
    required this.listenerRating,
    required this.durationMinutes,
    required this.isVideoCall,
    required this.speechLanguage,
    this.listenerAvatarUrl,
    this.callCredentials,
  });

  final String sessionId;
  final String listenerName;
  final String? listenerAvatarUrl;
  final double listenerRating;
  final int durationMinutes;
  final bool isVideoCall;
  final String speechLanguage;
  final SessionCallCredentials? callCredentials;

  VentorCallArgs copyWith({
    String? sessionId,
    String? listenerName,
    String? listenerAvatarUrl,
    double? listenerRating,
    int? durationMinutes,
    bool? isVideoCall,
    String? speechLanguage,
    SessionCallCredentials? callCredentials,
  }) {
    return VentorCallArgs(
      sessionId: sessionId ?? this.sessionId,
      listenerName: listenerName ?? this.listenerName,
      listenerAvatarUrl: listenerAvatarUrl ?? this.listenerAvatarUrl,
      listenerRating: listenerRating ?? this.listenerRating,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      isVideoCall: isVideoCall ?? this.isVideoCall,
      speechLanguage: speechLanguage ?? this.speechLanguage,
      callCredentials: callCredentials ?? this.callCredentials,
    );
  }
}
