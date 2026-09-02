import 'package:venting_mobile_app/domain/data/app/ventor_home.dart';
import 'package:venting_mobile_app/presentation/home/ventor/home/ventor_home_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';

VentorMoodKind? ventorMoodKindFromData(VentorMoodKindData? mood) {
  if (mood == null) return null;
  return switch (mood) {
    VentorMoodKindData.great => VentorMoodKind.great,
    VentorMoodKindData.okay => VentorMoodKind.okay,
    VentorMoodKindData.anxious => VentorMoodKind.anxious,
    VentorMoodKindData.sad => VentorMoodKind.sad,
    VentorMoodKindData.angry => VentorMoodKind.angry,
  };
}

VentorMoodKindData ventorMoodKindToData(VentorMoodKind mood) {
  return switch (mood) {
    VentorMoodKind.great => VentorMoodKindData.great,
    VentorMoodKind.okay => VentorMoodKindData.okay,
    VentorMoodKind.anxious => VentorMoodKindData.anxious,
    VentorMoodKind.sad => VentorMoodKindData.sad,
    VentorMoodKind.angry => VentorMoodKindData.angry,
  };
}

VentorBookedSession ventorBookedSessionFromData(VentorBookedSessionData data) {
  return VentorBookedSession(
    id: data.id,
    listenerId: data.listenerId,
    listenerName: data.listenerName,
    listenerAvatarUrl: data.listenerAvatarUrl,
    durationMinutes: data.durationMinutes,
    status: _statusFromData(data.status),
    callMode: _callModeFromData(data.callMode),
    speechLanguage: data.speechLanguage,
    amountPaid: data.amountPaid,
    voiceChangeEnabled: data.voiceChangeEnabled,
    scheduledAt: data.scheduledAt,
    isInstant: data.isInstant,
    refundedToBalance: data.refundedToBalance,
  );
}

VentorBookedSessionData ventorBookedSessionToData(VentorBookedSession session) {
  return VentorBookedSessionData(
    id: session.id,
    listenerId: session.listenerId,
    listenerName: session.listenerName,
    listenerAvatarUrl: session.listenerAvatarUrl,
    durationMinutes: session.durationMinutes,
    status: _statusToData(session.status),
    callMode: _callModeToData(session.callMode),
    speechLanguage: session.speechLanguage,
    amountPaid: session.amountPaid,
    voiceChangeEnabled: session.voiceChangeEnabled,
    scheduledAt: session.scheduledAt,
    isInstant: session.isInstant,
    refundedToBalance: session.refundedToBalance,
  );
}

VentorBookedSessionStatus _statusFromData(
  VentorBookedSessionStatusData status,
) {
  return switch (status) {
    VentorBookedSessionStatusData.live => VentorBookedSessionStatus.live,
    VentorBookedSessionStatusData.completed =>
      VentorBookedSessionStatus.completed,
    VentorBookedSessionStatusData.cancelled =>
      VentorBookedSessionStatus.cancelled,
    VentorBookedSessionStatusData.upcoming =>
      VentorBookedSessionStatus.upcoming,
  };
}

VentorBookedSessionStatusData _statusToData(VentorBookedSessionStatus status) {
  return switch (status) {
    VentorBookedSessionStatus.live => VentorBookedSessionStatusData.live,
    VentorBookedSessionStatus.completed =>
      VentorBookedSessionStatusData.completed,
    VentorBookedSessionStatus.cancelled =>
      VentorBookedSessionStatusData.cancelled,
    VentorBookedSessionStatus.upcoming =>
      VentorBookedSessionStatusData.upcoming,
  };
}

VentorBookedCallMode _callModeFromData(VentorBookedCallModeData mode) {
  return switch (mode) {
    VentorBookedCallModeData.video => VentorBookedCallMode.video,
    VentorBookedCallModeData.voice => VentorBookedCallMode.voice,
  };
}

VentorBookedCallModeData _callModeToData(VentorBookedCallMode mode) {
  return switch (mode) {
    VentorBookedCallMode.video => VentorBookedCallModeData.video,
    VentorBookedCallMode.voice => VentorBookedCallModeData.voice,
  };
}
