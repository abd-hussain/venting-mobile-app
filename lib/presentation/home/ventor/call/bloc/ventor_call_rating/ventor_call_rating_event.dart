part of 'ventor_call_rating_bloc.dart';

@freezed
sealed class VentorCallRatingEvent with _$VentorCallRatingEvent {
  const factory VentorCallRatingEvent.starsChanged(int stars) = _StarsChanged;

  const factory VentorCallRatingEvent.tipChanged(int? tipAmount) = _TipChanged;

  const factory VentorCallRatingEvent.reviewChanged(String review) =
      _ReviewChanged;

  const factory VentorCallRatingEvent.reportCaptured({
    required VentorCallReportReason reason,
    String? details,
    @Default(true) bool alreadySubmitted,
  }) = _ReportCaptured;

  const factory VentorCallRatingEvent.submitRequested({
    required String sessionId,
  }) = _SubmitRequested;
}
