class VentorCallArgs {
  const VentorCallArgs({
    required this.sessionId,
    required this.listenerName,
    required this.listenerRating,
    required this.durationMinutes,
    required this.isVideoCall,
    required this.speechLanguage,
    this.listenerAvatarUrl,
  });

  final String sessionId;
  final String listenerName;
  final String? listenerAvatarUrl;
  final double listenerRating;
  final int durationMinutes;
  final bool isVideoCall;
  final String speechLanguage;
}
