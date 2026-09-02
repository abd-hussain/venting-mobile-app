// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorDashboardEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorDashboardEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorDashboardEvent()';
}


}

/// @nodoc
class $VentorDashboardEventCopyWith<$Res>  {
$VentorDashboardEventCopyWith(VentorDashboardEvent _, $Res Function(VentorDashboardEvent) __);
}


/// Adds pattern-matching-related methods to [VentorDashboardEvent].
extension VentorDashboardEventPatterns on VentorDashboardEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _UpcomingSessionUpdated value)?  upcomingSessionUpdated,TResult Function( _MoodCheckInSubmitted value)?  moodCheckInSubmitted,TResult Function( _StreakClaimRequested value)?  streakClaimRequested,TResult Function( _MoodFeedbackCleared value)?  moodFeedbackCleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _UpcomingSessionUpdated() when upcomingSessionUpdated != null:
return upcomingSessionUpdated(_that);case _MoodCheckInSubmitted() when moodCheckInSubmitted != null:
return moodCheckInSubmitted(_that);case _StreakClaimRequested() when streakClaimRequested != null:
return streakClaimRequested(_that);case _MoodFeedbackCleared() when moodFeedbackCleared != null:
return moodFeedbackCleared(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _UpcomingSessionUpdated value)  upcomingSessionUpdated,required TResult Function( _MoodCheckInSubmitted value)  moodCheckInSubmitted,required TResult Function( _StreakClaimRequested value)  streakClaimRequested,required TResult Function( _MoodFeedbackCleared value)  moodFeedbackCleared,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RefreshRequested():
return refreshRequested(_that);case _UpcomingSessionUpdated():
return upcomingSessionUpdated(_that);case _MoodCheckInSubmitted():
return moodCheckInSubmitted(_that);case _StreakClaimRequested():
return streakClaimRequested(_that);case _MoodFeedbackCleared():
return moodFeedbackCleared(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _UpcomingSessionUpdated value)?  upcomingSessionUpdated,TResult? Function( _MoodCheckInSubmitted value)?  moodCheckInSubmitted,TResult? Function( _StreakClaimRequested value)?  streakClaimRequested,TResult? Function( _MoodFeedbackCleared value)?  moodFeedbackCleared,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _UpcomingSessionUpdated() when upcomingSessionUpdated != null:
return upcomingSessionUpdated(_that);case _MoodCheckInSubmitted() when moodCheckInSubmitted != null:
return moodCheckInSubmitted(_that);case _StreakClaimRequested() when streakClaimRequested != null:
return streakClaimRequested(_that);case _MoodFeedbackCleared() when moodFeedbackCleared != null:
return moodFeedbackCleared(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function( VentorBookedSessionData? session)?  upcomingSessionUpdated,TResult Function( VentorMoodKindData mood,  String? note)?  moodCheckInSubmitted,TResult Function()?  streakClaimRequested,TResult Function()?  moodFeedbackCleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _UpcomingSessionUpdated() when upcomingSessionUpdated != null:
return upcomingSessionUpdated(_that.session);case _MoodCheckInSubmitted() when moodCheckInSubmitted != null:
return moodCheckInSubmitted(_that.mood,_that.note);case _StreakClaimRequested() when streakClaimRequested != null:
return streakClaimRequested();case _MoodFeedbackCleared() when moodFeedbackCleared != null:
return moodFeedbackCleared();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function( VentorBookedSessionData? session)  upcomingSessionUpdated,required TResult Function( VentorMoodKindData mood,  String? note)  moodCheckInSubmitted,required TResult Function()  streakClaimRequested,required TResult Function()  moodFeedbackCleared,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RefreshRequested():
return refreshRequested();case _UpcomingSessionUpdated():
return upcomingSessionUpdated(_that.session);case _MoodCheckInSubmitted():
return moodCheckInSubmitted(_that.mood,_that.note);case _StreakClaimRequested():
return streakClaimRequested();case _MoodFeedbackCleared():
return moodFeedbackCleared();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function( VentorBookedSessionData? session)?  upcomingSessionUpdated,TResult? Function( VentorMoodKindData mood,  String? note)?  moodCheckInSubmitted,TResult? Function()?  streakClaimRequested,TResult? Function()?  moodFeedbackCleared,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _UpcomingSessionUpdated() when upcomingSessionUpdated != null:
return upcomingSessionUpdated(_that.session);case _MoodCheckInSubmitted() when moodCheckInSubmitted != null:
return moodCheckInSubmitted(_that.mood,_that.note);case _StreakClaimRequested() when streakClaimRequested != null:
return streakClaimRequested();case _MoodFeedbackCleared() when moodFeedbackCleared != null:
return moodFeedbackCleared();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorDashboardEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorDashboardEvent.started()';
}


}




/// @nodoc


class _RefreshRequested implements VentorDashboardEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorDashboardEvent.refreshRequested()';
}


}




/// @nodoc


class _UpcomingSessionUpdated implements VentorDashboardEvent {
  const _UpcomingSessionUpdated({this.session});
  

 final  VentorBookedSessionData? session;

/// Create a copy of VentorDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpcomingSessionUpdatedCopyWith<_UpcomingSessionUpdated> get copyWith => __$UpcomingSessionUpdatedCopyWithImpl<_UpcomingSessionUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpcomingSessionUpdated&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'VentorDashboardEvent.upcomingSessionUpdated(session: $session)';
}


}

/// @nodoc
abstract mixin class _$UpcomingSessionUpdatedCopyWith<$Res> implements $VentorDashboardEventCopyWith<$Res> {
  factory _$UpcomingSessionUpdatedCopyWith(_UpcomingSessionUpdated value, $Res Function(_UpcomingSessionUpdated) _then) = __$UpcomingSessionUpdatedCopyWithImpl;
@useResult
$Res call({
 VentorBookedSessionData? session
});




}
/// @nodoc
class __$UpcomingSessionUpdatedCopyWithImpl<$Res>
    implements _$UpcomingSessionUpdatedCopyWith<$Res> {
  __$UpcomingSessionUpdatedCopyWithImpl(this._self, this._then);

  final _UpcomingSessionUpdated _self;
  final $Res Function(_UpcomingSessionUpdated) _then;

/// Create a copy of VentorDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = freezed,}) {
  return _then(_UpcomingSessionUpdated(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionData?,
  ));
}


}

/// @nodoc


class _MoodCheckInSubmitted implements VentorDashboardEvent {
  const _MoodCheckInSubmitted({required this.mood, this.note});
  

 final  VentorMoodKindData mood;
 final  String? note;

/// Create a copy of VentorDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoodCheckInSubmittedCopyWith<_MoodCheckInSubmitted> get copyWith => __$MoodCheckInSubmittedCopyWithImpl<_MoodCheckInSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoodCheckInSubmitted&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,mood,note);

@override
String toString() {
  return 'VentorDashboardEvent.moodCheckInSubmitted(mood: $mood, note: $note)';
}


}

/// @nodoc
abstract mixin class _$MoodCheckInSubmittedCopyWith<$Res> implements $VentorDashboardEventCopyWith<$Res> {
  factory _$MoodCheckInSubmittedCopyWith(_MoodCheckInSubmitted value, $Res Function(_MoodCheckInSubmitted) _then) = __$MoodCheckInSubmittedCopyWithImpl;
@useResult
$Res call({
 VentorMoodKindData mood, String? note
});




}
/// @nodoc
class __$MoodCheckInSubmittedCopyWithImpl<$Res>
    implements _$MoodCheckInSubmittedCopyWith<$Res> {
  __$MoodCheckInSubmittedCopyWithImpl(this._self, this._then);

  final _MoodCheckInSubmitted _self;
  final $Res Function(_MoodCheckInSubmitted) _then;

/// Create a copy of VentorDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mood = null,Object? note = freezed,}) {
  return _then(_MoodCheckInSubmitted(
mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as VentorMoodKindData,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _StreakClaimRequested implements VentorDashboardEvent {
  const _StreakClaimRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreakClaimRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorDashboardEvent.streakClaimRequested()';
}


}




/// @nodoc


class _MoodFeedbackCleared implements VentorDashboardEvent {
  const _MoodFeedbackCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoodFeedbackCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorDashboardEvent.moodFeedbackCleared()';
}


}




/// @nodoc
mixin _$VentorDashboardState {

 VentorDashboardStatus get status; String get displayName; VentorBookedSessionData? get upcomingSession; List<VentorHomeRecentSessionData> get recentSessions; String? get motivation; VentorDashboardPointsStatus get pointsStatus; int get points; VentorMoodKindData? get todayMood; String? get todayNote; VentorHomeStreakData? get streak; List<bool> get streakWeekChecked; bool get streakClaimed; bool get isSubmittingMood; bool get isClaimingStreak; VentorDashboardMoodFeedback get moodFeedback; VentorRewardsOverviewData? get rewardsOverview; String get errorMessage; String get moodErrorMessage;
/// Create a copy of VentorDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorDashboardStateCopyWith<VentorDashboardState> get copyWith => _$VentorDashboardStateCopyWithImpl<VentorDashboardState>(this as VentorDashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorDashboardState&&(identical(other.status, status) || other.status == status)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.upcomingSession, upcomingSession) || other.upcomingSession == upcomingSession)&&const DeepCollectionEquality().equals(other.recentSessions, recentSessions)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.pointsStatus, pointsStatus) || other.pointsStatus == pointsStatus)&&(identical(other.points, points) || other.points == points)&&(identical(other.todayMood, todayMood) || other.todayMood == todayMood)&&(identical(other.todayNote, todayNote) || other.todayNote == todayNote)&&(identical(other.streak, streak) || other.streak == streak)&&const DeepCollectionEquality().equals(other.streakWeekChecked, streakWeekChecked)&&(identical(other.streakClaimed, streakClaimed) || other.streakClaimed == streakClaimed)&&(identical(other.isSubmittingMood, isSubmittingMood) || other.isSubmittingMood == isSubmittingMood)&&(identical(other.isClaimingStreak, isClaimingStreak) || other.isClaimingStreak == isClaimingStreak)&&(identical(other.moodFeedback, moodFeedback) || other.moodFeedback == moodFeedback)&&(identical(other.rewardsOverview, rewardsOverview) || other.rewardsOverview == rewardsOverview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.moodErrorMessage, moodErrorMessage) || other.moodErrorMessage == moodErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,displayName,upcomingSession,const DeepCollectionEquality().hash(recentSessions),motivation,pointsStatus,points,todayMood,todayNote,streak,const DeepCollectionEquality().hash(streakWeekChecked),streakClaimed,isSubmittingMood,isClaimingStreak,moodFeedback,rewardsOverview,errorMessage,moodErrorMessage);

@override
String toString() {
  return 'VentorDashboardState(status: $status, displayName: $displayName, upcomingSession: $upcomingSession, recentSessions: $recentSessions, motivation: $motivation, pointsStatus: $pointsStatus, points: $points, todayMood: $todayMood, todayNote: $todayNote, streak: $streak, streakWeekChecked: $streakWeekChecked, streakClaimed: $streakClaimed, isSubmittingMood: $isSubmittingMood, isClaimingStreak: $isClaimingStreak, moodFeedback: $moodFeedback, rewardsOverview: $rewardsOverview, errorMessage: $errorMessage, moodErrorMessage: $moodErrorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorDashboardStateCopyWith<$Res>  {
  factory $VentorDashboardStateCopyWith(VentorDashboardState value, $Res Function(VentorDashboardState) _then) = _$VentorDashboardStateCopyWithImpl;
@useResult
$Res call({
 VentorDashboardStatus status, String displayName, VentorBookedSessionData? upcomingSession, List<VentorHomeRecentSessionData> recentSessions, String? motivation, VentorDashboardPointsStatus pointsStatus, int points, VentorMoodKindData? todayMood, String? todayNote, VentorHomeStreakData? streak, List<bool> streakWeekChecked, bool streakClaimed, bool isSubmittingMood, bool isClaimingStreak, VentorDashboardMoodFeedback moodFeedback, VentorRewardsOverviewData? rewardsOverview, String errorMessage, String moodErrorMessage
});




}
/// @nodoc
class _$VentorDashboardStateCopyWithImpl<$Res>
    implements $VentorDashboardStateCopyWith<$Res> {
  _$VentorDashboardStateCopyWithImpl(this._self, this._then);

  final VentorDashboardState _self;
  final $Res Function(VentorDashboardState) _then;

/// Create a copy of VentorDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? displayName = null,Object? upcomingSession = freezed,Object? recentSessions = null,Object? motivation = freezed,Object? pointsStatus = null,Object? points = null,Object? todayMood = freezed,Object? todayNote = freezed,Object? streak = freezed,Object? streakWeekChecked = null,Object? streakClaimed = null,Object? isSubmittingMood = null,Object? isClaimingStreak = null,Object? moodFeedback = null,Object? rewardsOverview = freezed,Object? errorMessage = null,Object? moodErrorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorDashboardStatus,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,upcomingSession: freezed == upcomingSession ? _self.upcomingSession : upcomingSession // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionData?,recentSessions: null == recentSessions ? _self.recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<VentorHomeRecentSessionData>,motivation: freezed == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String?,pointsStatus: null == pointsStatus ? _self.pointsStatus : pointsStatus // ignore: cast_nullable_to_non_nullable
as VentorDashboardPointsStatus,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,todayMood: freezed == todayMood ? _self.todayMood : todayMood // ignore: cast_nullable_to_non_nullable
as VentorMoodKindData?,todayNote: freezed == todayNote ? _self.todayNote : todayNote // ignore: cast_nullable_to_non_nullable
as String?,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as VentorHomeStreakData?,streakWeekChecked: null == streakWeekChecked ? _self.streakWeekChecked : streakWeekChecked // ignore: cast_nullable_to_non_nullable
as List<bool>,streakClaimed: null == streakClaimed ? _self.streakClaimed : streakClaimed // ignore: cast_nullable_to_non_nullable
as bool,isSubmittingMood: null == isSubmittingMood ? _self.isSubmittingMood : isSubmittingMood // ignore: cast_nullable_to_non_nullable
as bool,isClaimingStreak: null == isClaimingStreak ? _self.isClaimingStreak : isClaimingStreak // ignore: cast_nullable_to_non_nullable
as bool,moodFeedback: null == moodFeedback ? _self.moodFeedback : moodFeedback // ignore: cast_nullable_to_non_nullable
as VentorDashboardMoodFeedback,rewardsOverview: freezed == rewardsOverview ? _self.rewardsOverview : rewardsOverview // ignore: cast_nullable_to_non_nullable
as VentorRewardsOverviewData?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,moodErrorMessage: null == moodErrorMessage ? _self.moodErrorMessage : moodErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorDashboardState].
extension VentorDashboardStatePatterns on VentorDashboardState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorDashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorDashboardState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorDashboardState value)  $default,){
final _that = this;
switch (_that) {
case _VentorDashboardState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorDashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorDashboardState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorDashboardStatus status,  String displayName,  VentorBookedSessionData? upcomingSession,  List<VentorHomeRecentSessionData> recentSessions,  String? motivation,  VentorDashboardPointsStatus pointsStatus,  int points,  VentorMoodKindData? todayMood,  String? todayNote,  VentorHomeStreakData? streak,  List<bool> streakWeekChecked,  bool streakClaimed,  bool isSubmittingMood,  bool isClaimingStreak,  VentorDashboardMoodFeedback moodFeedback,  VentorRewardsOverviewData? rewardsOverview,  String errorMessage,  String moodErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorDashboardState() when $default != null:
return $default(_that.status,_that.displayName,_that.upcomingSession,_that.recentSessions,_that.motivation,_that.pointsStatus,_that.points,_that.todayMood,_that.todayNote,_that.streak,_that.streakWeekChecked,_that.streakClaimed,_that.isSubmittingMood,_that.isClaimingStreak,_that.moodFeedback,_that.rewardsOverview,_that.errorMessage,_that.moodErrorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorDashboardStatus status,  String displayName,  VentorBookedSessionData? upcomingSession,  List<VentorHomeRecentSessionData> recentSessions,  String? motivation,  VentorDashboardPointsStatus pointsStatus,  int points,  VentorMoodKindData? todayMood,  String? todayNote,  VentorHomeStreakData? streak,  List<bool> streakWeekChecked,  bool streakClaimed,  bool isSubmittingMood,  bool isClaimingStreak,  VentorDashboardMoodFeedback moodFeedback,  VentorRewardsOverviewData? rewardsOverview,  String errorMessage,  String moodErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorDashboardState():
return $default(_that.status,_that.displayName,_that.upcomingSession,_that.recentSessions,_that.motivation,_that.pointsStatus,_that.points,_that.todayMood,_that.todayNote,_that.streak,_that.streakWeekChecked,_that.streakClaimed,_that.isSubmittingMood,_that.isClaimingStreak,_that.moodFeedback,_that.rewardsOverview,_that.errorMessage,_that.moodErrorMessage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorDashboardStatus status,  String displayName,  VentorBookedSessionData? upcomingSession,  List<VentorHomeRecentSessionData> recentSessions,  String? motivation,  VentorDashboardPointsStatus pointsStatus,  int points,  VentorMoodKindData? todayMood,  String? todayNote,  VentorHomeStreakData? streak,  List<bool> streakWeekChecked,  bool streakClaimed,  bool isSubmittingMood,  bool isClaimingStreak,  VentorDashboardMoodFeedback moodFeedback,  VentorRewardsOverviewData? rewardsOverview,  String errorMessage,  String moodErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorDashboardState() when $default != null:
return $default(_that.status,_that.displayName,_that.upcomingSession,_that.recentSessions,_that.motivation,_that.pointsStatus,_that.points,_that.todayMood,_that.todayNote,_that.streak,_that.streakWeekChecked,_that.streakClaimed,_that.isSubmittingMood,_that.isClaimingStreak,_that.moodFeedback,_that.rewardsOverview,_that.errorMessage,_that.moodErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorDashboardState extends VentorDashboardState {
  const _VentorDashboardState({this.status = VentorDashboardStatus.initial, this.displayName = '', this.upcomingSession, final  List<VentorHomeRecentSessionData> recentSessions = const <VentorHomeRecentSessionData>[], this.motivation, this.pointsStatus = VentorDashboardPointsStatus.initial, this.points = 0, this.todayMood, this.todayNote, this.streak, final  List<bool> streakWeekChecked = const <bool>[false, false, false, false, false, false, false], this.streakClaimed = false, this.isSubmittingMood = false, this.isClaimingStreak = false, this.moodFeedback = VentorDashboardMoodFeedback.none, this.rewardsOverview, this.errorMessage = '', this.moodErrorMessage = ''}): _recentSessions = recentSessions,_streakWeekChecked = streakWeekChecked,super._();
  

@override@JsonKey() final  VentorDashboardStatus status;
@override@JsonKey() final  String displayName;
@override final  VentorBookedSessionData? upcomingSession;
 final  List<VentorHomeRecentSessionData> _recentSessions;
@override@JsonKey() List<VentorHomeRecentSessionData> get recentSessions {
  if (_recentSessions is EqualUnmodifiableListView) return _recentSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSessions);
}

@override final  String? motivation;
@override@JsonKey() final  VentorDashboardPointsStatus pointsStatus;
@override@JsonKey() final  int points;
@override final  VentorMoodKindData? todayMood;
@override final  String? todayNote;
@override final  VentorHomeStreakData? streak;
 final  List<bool> _streakWeekChecked;
@override@JsonKey() List<bool> get streakWeekChecked {
  if (_streakWeekChecked is EqualUnmodifiableListView) return _streakWeekChecked;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_streakWeekChecked);
}

@override@JsonKey() final  bool streakClaimed;
@override@JsonKey() final  bool isSubmittingMood;
@override@JsonKey() final  bool isClaimingStreak;
@override@JsonKey() final  VentorDashboardMoodFeedback moodFeedback;
@override final  VentorRewardsOverviewData? rewardsOverview;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String moodErrorMessage;

/// Create a copy of VentorDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorDashboardStateCopyWith<_VentorDashboardState> get copyWith => __$VentorDashboardStateCopyWithImpl<_VentorDashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorDashboardState&&(identical(other.status, status) || other.status == status)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.upcomingSession, upcomingSession) || other.upcomingSession == upcomingSession)&&const DeepCollectionEquality().equals(other._recentSessions, _recentSessions)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.pointsStatus, pointsStatus) || other.pointsStatus == pointsStatus)&&(identical(other.points, points) || other.points == points)&&(identical(other.todayMood, todayMood) || other.todayMood == todayMood)&&(identical(other.todayNote, todayNote) || other.todayNote == todayNote)&&(identical(other.streak, streak) || other.streak == streak)&&const DeepCollectionEquality().equals(other._streakWeekChecked, _streakWeekChecked)&&(identical(other.streakClaimed, streakClaimed) || other.streakClaimed == streakClaimed)&&(identical(other.isSubmittingMood, isSubmittingMood) || other.isSubmittingMood == isSubmittingMood)&&(identical(other.isClaimingStreak, isClaimingStreak) || other.isClaimingStreak == isClaimingStreak)&&(identical(other.moodFeedback, moodFeedback) || other.moodFeedback == moodFeedback)&&(identical(other.rewardsOverview, rewardsOverview) || other.rewardsOverview == rewardsOverview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.moodErrorMessage, moodErrorMessage) || other.moodErrorMessage == moodErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,displayName,upcomingSession,const DeepCollectionEquality().hash(_recentSessions),motivation,pointsStatus,points,todayMood,todayNote,streak,const DeepCollectionEquality().hash(_streakWeekChecked),streakClaimed,isSubmittingMood,isClaimingStreak,moodFeedback,rewardsOverview,errorMessage,moodErrorMessage);

@override
String toString() {
  return 'VentorDashboardState(status: $status, displayName: $displayName, upcomingSession: $upcomingSession, recentSessions: $recentSessions, motivation: $motivation, pointsStatus: $pointsStatus, points: $points, todayMood: $todayMood, todayNote: $todayNote, streak: $streak, streakWeekChecked: $streakWeekChecked, streakClaimed: $streakClaimed, isSubmittingMood: $isSubmittingMood, isClaimingStreak: $isClaimingStreak, moodFeedback: $moodFeedback, rewardsOverview: $rewardsOverview, errorMessage: $errorMessage, moodErrorMessage: $moodErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorDashboardStateCopyWith<$Res> implements $VentorDashboardStateCopyWith<$Res> {
  factory _$VentorDashboardStateCopyWith(_VentorDashboardState value, $Res Function(_VentorDashboardState) _then) = __$VentorDashboardStateCopyWithImpl;
@override @useResult
$Res call({
 VentorDashboardStatus status, String displayName, VentorBookedSessionData? upcomingSession, List<VentorHomeRecentSessionData> recentSessions, String? motivation, VentorDashboardPointsStatus pointsStatus, int points, VentorMoodKindData? todayMood, String? todayNote, VentorHomeStreakData? streak, List<bool> streakWeekChecked, bool streakClaimed, bool isSubmittingMood, bool isClaimingStreak, VentorDashboardMoodFeedback moodFeedback, VentorRewardsOverviewData? rewardsOverview, String errorMessage, String moodErrorMessage
});




}
/// @nodoc
class __$VentorDashboardStateCopyWithImpl<$Res>
    implements _$VentorDashboardStateCopyWith<$Res> {
  __$VentorDashboardStateCopyWithImpl(this._self, this._then);

  final _VentorDashboardState _self;
  final $Res Function(_VentorDashboardState) _then;

/// Create a copy of VentorDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? displayName = null,Object? upcomingSession = freezed,Object? recentSessions = null,Object? motivation = freezed,Object? pointsStatus = null,Object? points = null,Object? todayMood = freezed,Object? todayNote = freezed,Object? streak = freezed,Object? streakWeekChecked = null,Object? streakClaimed = null,Object? isSubmittingMood = null,Object? isClaimingStreak = null,Object? moodFeedback = null,Object? rewardsOverview = freezed,Object? errorMessage = null,Object? moodErrorMessage = null,}) {
  return _then(_VentorDashboardState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorDashboardStatus,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,upcomingSession: freezed == upcomingSession ? _self.upcomingSession : upcomingSession // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionData?,recentSessions: null == recentSessions ? _self._recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<VentorHomeRecentSessionData>,motivation: freezed == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String?,pointsStatus: null == pointsStatus ? _self.pointsStatus : pointsStatus // ignore: cast_nullable_to_non_nullable
as VentorDashboardPointsStatus,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,todayMood: freezed == todayMood ? _self.todayMood : todayMood // ignore: cast_nullable_to_non_nullable
as VentorMoodKindData?,todayNote: freezed == todayNote ? _self.todayNote : todayNote // ignore: cast_nullable_to_non_nullable
as String?,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as VentorHomeStreakData?,streakWeekChecked: null == streakWeekChecked ? _self._streakWeekChecked : streakWeekChecked // ignore: cast_nullable_to_non_nullable
as List<bool>,streakClaimed: null == streakClaimed ? _self.streakClaimed : streakClaimed // ignore: cast_nullable_to_non_nullable
as bool,isSubmittingMood: null == isSubmittingMood ? _self.isSubmittingMood : isSubmittingMood // ignore: cast_nullable_to_non_nullable
as bool,isClaimingStreak: null == isClaimingStreak ? _self.isClaimingStreak : isClaimingStreak // ignore: cast_nullable_to_non_nullable
as bool,moodFeedback: null == moodFeedback ? _self.moodFeedback : moodFeedback // ignore: cast_nullable_to_non_nullable
as VentorDashboardMoodFeedback,rewardsOverview: freezed == rewardsOverview ? _self.rewardsOverview : rewardsOverview // ignore: cast_nullable_to_non_nullable
as VentorRewardsOverviewData?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,moodErrorMessage: null == moodErrorMessage ? _self.moodErrorMessage : moodErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
