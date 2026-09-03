part of 'ventor_call_rating_bloc.dart';

enum VentorCallRatingStatus { ready, submitting }

@freezed
sealed class VentorCallRatingState with _$VentorCallRatingState {
  const factory VentorCallRatingState({
    @Default(VentorCallRatingStatus.ready) VentorCallRatingStatus status,
    @Default(5) int stars,
    int? tipAmount,
    @Default('') String review,
    VentorCallReportReason? reportReason,
    String? reportDetails,
    @Default(false) bool reportAlreadySubmitted,
    @Default(false) bool submitSucceeded,
    double? tipCharged,
    @Default('') String errorMessage,
  }) = _VentorCallRatingState;

  const VentorCallRatingState._();

  bool get isSubmitting => status == VentorCallRatingStatus.submitting;

  bool get hasReport => reportReason != null;
}
