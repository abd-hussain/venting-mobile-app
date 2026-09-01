class ListenerCallArgs {
  const ListenerCallArgs({
    required this.sessionId,
    required this.ventorName,
    required this.ventorRating,
    required this.durationMinutes,
    required this.isVideoCall,
    this.ventorAvatarUrl,
  });

  final String sessionId;
  final String ventorName;
  final String? ventorAvatarUrl;
  final double ventorRating;
  final int durationMinutes;
  final bool isVideoCall;
}
