// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_call_rating_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorCallRatingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorCallRatingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorCallRatingEvent()';
}


}

/// @nodoc
class $VentorCallRatingEventCopyWith<$Res>  {
$VentorCallRatingEventCopyWith(VentorCallRatingEvent _, $Res Function(VentorCallRatingEvent) __);
}


/// Adds pattern-matching-related methods to [VentorCallRatingEvent].
extension VentorCallRatingEventPatterns on VentorCallRatingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StarsChanged value)?  starsChanged,TResult Function( _TipChanged value)?  tipChanged,TResult Function( _ReviewChanged value)?  reviewChanged,TResult Function( _ReportCaptured value)?  reportCaptured,TResult Function( _SubmitRequested value)?  submitRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StarsChanged() when starsChanged != null:
return starsChanged(_that);case _TipChanged() when tipChanged != null:
return tipChanged(_that);case _ReviewChanged() when reviewChanged != null:
return reviewChanged(_that);case _ReportCaptured() when reportCaptured != null:
return reportCaptured(_that);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StarsChanged value)  starsChanged,required TResult Function( _TipChanged value)  tipChanged,required TResult Function( _ReviewChanged value)  reviewChanged,required TResult Function( _ReportCaptured value)  reportCaptured,required TResult Function( _SubmitRequested value)  submitRequested,}){
final _that = this;
switch (_that) {
case _StarsChanged():
return starsChanged(_that);case _TipChanged():
return tipChanged(_that);case _ReviewChanged():
return reviewChanged(_that);case _ReportCaptured():
return reportCaptured(_that);case _SubmitRequested():
return submitRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StarsChanged value)?  starsChanged,TResult? Function( _TipChanged value)?  tipChanged,TResult? Function( _ReviewChanged value)?  reviewChanged,TResult? Function( _ReportCaptured value)?  reportCaptured,TResult? Function( _SubmitRequested value)?  submitRequested,}){
final _that = this;
switch (_that) {
case _StarsChanged() when starsChanged != null:
return starsChanged(_that);case _TipChanged() when tipChanged != null:
return tipChanged(_that);case _ReviewChanged() when reviewChanged != null:
return reviewChanged(_that);case _ReportCaptured() when reportCaptured != null:
return reportCaptured(_that);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int stars)?  starsChanged,TResult Function( int? tipAmount)?  tipChanged,TResult Function( String review)?  reviewChanged,TResult Function( VentorCallReportReason reason,  String? details,  bool alreadySubmitted)?  reportCaptured,TResult Function( String sessionId)?  submitRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StarsChanged() when starsChanged != null:
return starsChanged(_that.stars);case _TipChanged() when tipChanged != null:
return tipChanged(_that.tipAmount);case _ReviewChanged() when reviewChanged != null:
return reviewChanged(_that.review);case _ReportCaptured() when reportCaptured != null:
return reportCaptured(_that.reason,_that.details,_that.alreadySubmitted);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int stars)  starsChanged,required TResult Function( int? tipAmount)  tipChanged,required TResult Function( String review)  reviewChanged,required TResult Function( VentorCallReportReason reason,  String? details,  bool alreadySubmitted)  reportCaptured,required TResult Function( String sessionId)  submitRequested,}) {final _that = this;
switch (_that) {
case _StarsChanged():
return starsChanged(_that.stars);case _TipChanged():
return tipChanged(_that.tipAmount);case _ReviewChanged():
return reviewChanged(_that.review);case _ReportCaptured():
return reportCaptured(_that.reason,_that.details,_that.alreadySubmitted);case _SubmitRequested():
return submitRequested(_that.sessionId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int stars)?  starsChanged,TResult? Function( int? tipAmount)?  tipChanged,TResult? Function( String review)?  reviewChanged,TResult? Function( VentorCallReportReason reason,  String? details,  bool alreadySubmitted)?  reportCaptured,TResult? Function( String sessionId)?  submitRequested,}) {final _that = this;
switch (_that) {
case _StarsChanged() when starsChanged != null:
return starsChanged(_that.stars);case _TipChanged() when tipChanged != null:
return tipChanged(_that.tipAmount);case _ReviewChanged() when reviewChanged != null:
return reviewChanged(_that.review);case _ReportCaptured() when reportCaptured != null:
return reportCaptured(_that.reason,_that.details,_that.alreadySubmitted);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc


class _StarsChanged implements VentorCallRatingEvent {
  const _StarsChanged(this.stars);
  

 final  int stars;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StarsChangedCopyWith<_StarsChanged> get copyWith => __$StarsChangedCopyWithImpl<_StarsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StarsChanged&&(identical(other.stars, stars) || other.stars == stars));
}


@override
int get hashCode => Object.hash(runtimeType,stars);

@override
String toString() {
  return 'VentorCallRatingEvent.starsChanged(stars: $stars)';
}


}

/// @nodoc
abstract mixin class _$StarsChangedCopyWith<$Res> implements $VentorCallRatingEventCopyWith<$Res> {
  factory _$StarsChangedCopyWith(_StarsChanged value, $Res Function(_StarsChanged) _then) = __$StarsChangedCopyWithImpl;
@useResult
$Res call({
 int stars
});




}
/// @nodoc
class __$StarsChangedCopyWithImpl<$Res>
    implements _$StarsChangedCopyWith<$Res> {
  __$StarsChangedCopyWithImpl(this._self, this._then);

  final _StarsChanged _self;
  final $Res Function(_StarsChanged) _then;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stars = null,}) {
  return _then(_StarsChanged(
null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _TipChanged implements VentorCallRatingEvent {
  const _TipChanged(this.tipAmount);
  

 final  int? tipAmount;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TipChangedCopyWith<_TipChanged> get copyWith => __$TipChangedCopyWithImpl<_TipChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TipChanged&&(identical(other.tipAmount, tipAmount) || other.tipAmount == tipAmount));
}


@override
int get hashCode => Object.hash(runtimeType,tipAmount);

@override
String toString() {
  return 'VentorCallRatingEvent.tipChanged(tipAmount: $tipAmount)';
}


}

/// @nodoc
abstract mixin class _$TipChangedCopyWith<$Res> implements $VentorCallRatingEventCopyWith<$Res> {
  factory _$TipChangedCopyWith(_TipChanged value, $Res Function(_TipChanged) _then) = __$TipChangedCopyWithImpl;
@useResult
$Res call({
 int? tipAmount
});




}
/// @nodoc
class __$TipChangedCopyWithImpl<$Res>
    implements _$TipChangedCopyWith<$Res> {
  __$TipChangedCopyWithImpl(this._self, this._then);

  final _TipChanged _self;
  final $Res Function(_TipChanged) _then;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tipAmount = freezed,}) {
  return _then(_TipChanged(
freezed == tipAmount ? _self.tipAmount : tipAmount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _ReviewChanged implements VentorCallRatingEvent {
  const _ReviewChanged(this.review);
  

 final  String review;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewChangedCopyWith<_ReviewChanged> get copyWith => __$ReviewChangedCopyWithImpl<_ReviewChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewChanged&&(identical(other.review, review) || other.review == review));
}


@override
int get hashCode => Object.hash(runtimeType,review);

@override
String toString() {
  return 'VentorCallRatingEvent.reviewChanged(review: $review)';
}


}

/// @nodoc
abstract mixin class _$ReviewChangedCopyWith<$Res> implements $VentorCallRatingEventCopyWith<$Res> {
  factory _$ReviewChangedCopyWith(_ReviewChanged value, $Res Function(_ReviewChanged) _then) = __$ReviewChangedCopyWithImpl;
@useResult
$Res call({
 String review
});




}
/// @nodoc
class __$ReviewChangedCopyWithImpl<$Res>
    implements _$ReviewChangedCopyWith<$Res> {
  __$ReviewChangedCopyWithImpl(this._self, this._then);

  final _ReviewChanged _self;
  final $Res Function(_ReviewChanged) _then;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? review = null,}) {
  return _then(_ReviewChanged(
null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ReportCaptured implements VentorCallRatingEvent {
  const _ReportCaptured({required this.reason, this.details, this.alreadySubmitted = true});
  

 final  VentorCallReportReason reason;
 final  String? details;
@JsonKey() final  bool alreadySubmitted;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportCapturedCopyWith<_ReportCaptured> get copyWith => __$ReportCapturedCopyWithImpl<_ReportCaptured>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportCaptured&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.details, details) || other.details == details)&&(identical(other.alreadySubmitted, alreadySubmitted) || other.alreadySubmitted == alreadySubmitted));
}


@override
int get hashCode => Object.hash(runtimeType,reason,details,alreadySubmitted);

@override
String toString() {
  return 'VentorCallRatingEvent.reportCaptured(reason: $reason, details: $details, alreadySubmitted: $alreadySubmitted)';
}


}

/// @nodoc
abstract mixin class _$ReportCapturedCopyWith<$Res> implements $VentorCallRatingEventCopyWith<$Res> {
  factory _$ReportCapturedCopyWith(_ReportCaptured value, $Res Function(_ReportCaptured) _then) = __$ReportCapturedCopyWithImpl;
@useResult
$Res call({
 VentorCallReportReason reason, String? details, bool alreadySubmitted
});




}
/// @nodoc
class __$ReportCapturedCopyWithImpl<$Res>
    implements _$ReportCapturedCopyWith<$Res> {
  __$ReportCapturedCopyWithImpl(this._self, this._then);

  final _ReportCaptured _self;
  final $Res Function(_ReportCaptured) _then;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? details = freezed,Object? alreadySubmitted = null,}) {
  return _then(_ReportCaptured(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as VentorCallReportReason,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,alreadySubmitted: null == alreadySubmitted ? _self.alreadySubmitted : alreadySubmitted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SubmitRequested implements VentorCallRatingEvent {
  const _SubmitRequested({required this.sessionId});
  

 final  String sessionId;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitRequestedCopyWith<_SubmitRequested> get copyWith => __$SubmitRequestedCopyWithImpl<_SubmitRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitRequested&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'VentorCallRatingEvent.submitRequested(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$SubmitRequestedCopyWith<$Res> implements $VentorCallRatingEventCopyWith<$Res> {
  factory _$SubmitRequestedCopyWith(_SubmitRequested value, $Res Function(_SubmitRequested) _then) = __$SubmitRequestedCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class __$SubmitRequestedCopyWithImpl<$Res>
    implements _$SubmitRequestedCopyWith<$Res> {
  __$SubmitRequestedCopyWithImpl(this._self, this._then);

  final _SubmitRequested _self;
  final $Res Function(_SubmitRequested) _then;

/// Create a copy of VentorCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_SubmitRequested(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VentorCallRatingState {

 VentorCallRatingStatus get status; int get stars; int? get tipAmount; String get review; VentorCallReportReason? get reportReason; String? get reportDetails; bool get reportAlreadySubmitted; bool get submitSucceeded; double? get tipCharged; String get errorMessage;
/// Create a copy of VentorCallRatingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorCallRatingStateCopyWith<VentorCallRatingState> get copyWith => _$VentorCallRatingStateCopyWithImpl<VentorCallRatingState>(this as VentorCallRatingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorCallRatingState&&(identical(other.status, status) || other.status == status)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.tipAmount, tipAmount) || other.tipAmount == tipAmount)&&(identical(other.review, review) || other.review == review)&&(identical(other.reportReason, reportReason) || other.reportReason == reportReason)&&(identical(other.reportDetails, reportDetails) || other.reportDetails == reportDetails)&&(identical(other.reportAlreadySubmitted, reportAlreadySubmitted) || other.reportAlreadySubmitted == reportAlreadySubmitted)&&(identical(other.submitSucceeded, submitSucceeded) || other.submitSucceeded == submitSucceeded)&&(identical(other.tipCharged, tipCharged) || other.tipCharged == tipCharged)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,stars,tipAmount,review,reportReason,reportDetails,reportAlreadySubmitted,submitSucceeded,tipCharged,errorMessage);

@override
String toString() {
  return 'VentorCallRatingState(status: $status, stars: $stars, tipAmount: $tipAmount, review: $review, reportReason: $reportReason, reportDetails: $reportDetails, reportAlreadySubmitted: $reportAlreadySubmitted, submitSucceeded: $submitSucceeded, tipCharged: $tipCharged, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorCallRatingStateCopyWith<$Res>  {
  factory $VentorCallRatingStateCopyWith(VentorCallRatingState value, $Res Function(VentorCallRatingState) _then) = _$VentorCallRatingStateCopyWithImpl;
@useResult
$Res call({
 VentorCallRatingStatus status, int stars, int? tipAmount, String review, VentorCallReportReason? reportReason, String? reportDetails, bool reportAlreadySubmitted, bool submitSucceeded, double? tipCharged, String errorMessage
});




}
/// @nodoc
class _$VentorCallRatingStateCopyWithImpl<$Res>
    implements $VentorCallRatingStateCopyWith<$Res> {
  _$VentorCallRatingStateCopyWithImpl(this._self, this._then);

  final VentorCallRatingState _self;
  final $Res Function(VentorCallRatingState) _then;

/// Create a copy of VentorCallRatingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? stars = null,Object? tipAmount = freezed,Object? review = null,Object? reportReason = freezed,Object? reportDetails = freezed,Object? reportAlreadySubmitted = null,Object? submitSucceeded = null,Object? tipCharged = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorCallRatingStatus,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,tipAmount: freezed == tipAmount ? _self.tipAmount : tipAmount // ignore: cast_nullable_to_non_nullable
as int?,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String,reportReason: freezed == reportReason ? _self.reportReason : reportReason // ignore: cast_nullable_to_non_nullable
as VentorCallReportReason?,reportDetails: freezed == reportDetails ? _self.reportDetails : reportDetails // ignore: cast_nullable_to_non_nullable
as String?,reportAlreadySubmitted: null == reportAlreadySubmitted ? _self.reportAlreadySubmitted : reportAlreadySubmitted // ignore: cast_nullable_to_non_nullable
as bool,submitSucceeded: null == submitSucceeded ? _self.submitSucceeded : submitSucceeded // ignore: cast_nullable_to_non_nullable
as bool,tipCharged: freezed == tipCharged ? _self.tipCharged : tipCharged // ignore: cast_nullable_to_non_nullable
as double?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorCallRatingState].
extension VentorCallRatingStatePatterns on VentorCallRatingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorCallRatingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorCallRatingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorCallRatingState value)  $default,){
final _that = this;
switch (_that) {
case _VentorCallRatingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorCallRatingState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorCallRatingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorCallRatingStatus status,  int stars,  int? tipAmount,  String review,  VentorCallReportReason? reportReason,  String? reportDetails,  bool reportAlreadySubmitted,  bool submitSucceeded,  double? tipCharged,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorCallRatingState() when $default != null:
return $default(_that.status,_that.stars,_that.tipAmount,_that.review,_that.reportReason,_that.reportDetails,_that.reportAlreadySubmitted,_that.submitSucceeded,_that.tipCharged,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorCallRatingStatus status,  int stars,  int? tipAmount,  String review,  VentorCallReportReason? reportReason,  String? reportDetails,  bool reportAlreadySubmitted,  bool submitSucceeded,  double? tipCharged,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorCallRatingState():
return $default(_that.status,_that.stars,_that.tipAmount,_that.review,_that.reportReason,_that.reportDetails,_that.reportAlreadySubmitted,_that.submitSucceeded,_that.tipCharged,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorCallRatingStatus status,  int stars,  int? tipAmount,  String review,  VentorCallReportReason? reportReason,  String? reportDetails,  bool reportAlreadySubmitted,  bool submitSucceeded,  double? tipCharged,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorCallRatingState() when $default != null:
return $default(_that.status,_that.stars,_that.tipAmount,_that.review,_that.reportReason,_that.reportDetails,_that.reportAlreadySubmitted,_that.submitSucceeded,_that.tipCharged,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorCallRatingState extends VentorCallRatingState {
  const _VentorCallRatingState({this.status = VentorCallRatingStatus.ready, this.stars = 5, this.tipAmount, this.review = '', this.reportReason, this.reportDetails, this.reportAlreadySubmitted = false, this.submitSucceeded = false, this.tipCharged, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  VentorCallRatingStatus status;
@override@JsonKey() final  int stars;
@override final  int? tipAmount;
@override@JsonKey() final  String review;
@override final  VentorCallReportReason? reportReason;
@override final  String? reportDetails;
@override@JsonKey() final  bool reportAlreadySubmitted;
@override@JsonKey() final  bool submitSucceeded;
@override final  double? tipCharged;
@override@JsonKey() final  String errorMessage;

/// Create a copy of VentorCallRatingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorCallRatingStateCopyWith<_VentorCallRatingState> get copyWith => __$VentorCallRatingStateCopyWithImpl<_VentorCallRatingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorCallRatingState&&(identical(other.status, status) || other.status == status)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.tipAmount, tipAmount) || other.tipAmount == tipAmount)&&(identical(other.review, review) || other.review == review)&&(identical(other.reportReason, reportReason) || other.reportReason == reportReason)&&(identical(other.reportDetails, reportDetails) || other.reportDetails == reportDetails)&&(identical(other.reportAlreadySubmitted, reportAlreadySubmitted) || other.reportAlreadySubmitted == reportAlreadySubmitted)&&(identical(other.submitSucceeded, submitSucceeded) || other.submitSucceeded == submitSucceeded)&&(identical(other.tipCharged, tipCharged) || other.tipCharged == tipCharged)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,stars,tipAmount,review,reportReason,reportDetails,reportAlreadySubmitted,submitSucceeded,tipCharged,errorMessage);

@override
String toString() {
  return 'VentorCallRatingState(status: $status, stars: $stars, tipAmount: $tipAmount, review: $review, reportReason: $reportReason, reportDetails: $reportDetails, reportAlreadySubmitted: $reportAlreadySubmitted, submitSucceeded: $submitSucceeded, tipCharged: $tipCharged, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorCallRatingStateCopyWith<$Res> implements $VentorCallRatingStateCopyWith<$Res> {
  factory _$VentorCallRatingStateCopyWith(_VentorCallRatingState value, $Res Function(_VentorCallRatingState) _then) = __$VentorCallRatingStateCopyWithImpl;
@override @useResult
$Res call({
 VentorCallRatingStatus status, int stars, int? tipAmount, String review, VentorCallReportReason? reportReason, String? reportDetails, bool reportAlreadySubmitted, bool submitSucceeded, double? tipCharged, String errorMessage
});




}
/// @nodoc
class __$VentorCallRatingStateCopyWithImpl<$Res>
    implements _$VentorCallRatingStateCopyWith<$Res> {
  __$VentorCallRatingStateCopyWithImpl(this._self, this._then);

  final _VentorCallRatingState _self;
  final $Res Function(_VentorCallRatingState) _then;

/// Create a copy of VentorCallRatingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? stars = null,Object? tipAmount = freezed,Object? review = null,Object? reportReason = freezed,Object? reportDetails = freezed,Object? reportAlreadySubmitted = null,Object? submitSucceeded = null,Object? tipCharged = freezed,Object? errorMessage = null,}) {
  return _then(_VentorCallRatingState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorCallRatingStatus,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,tipAmount: freezed == tipAmount ? _self.tipAmount : tipAmount // ignore: cast_nullable_to_non_nullable
as int?,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String,reportReason: freezed == reportReason ? _self.reportReason : reportReason // ignore: cast_nullable_to_non_nullable
as VentorCallReportReason?,reportDetails: freezed == reportDetails ? _self.reportDetails : reportDetails // ignore: cast_nullable_to_non_nullable
as String?,reportAlreadySubmitted: null == reportAlreadySubmitted ? _self.reportAlreadySubmitted : reportAlreadySubmitted // ignore: cast_nullable_to_non_nullable
as bool,submitSucceeded: null == submitSucceeded ? _self.submitSucceeded : submitSucceeded // ignore: cast_nullable_to_non_nullable
as bool,tipCharged: freezed == tipCharged ? _self.tipCharged : tipCharged // ignore: cast_nullable_to_non_nullable
as double?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
