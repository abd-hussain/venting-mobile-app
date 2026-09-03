// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_call_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorCallReportEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorCallReportEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorCallReportEvent()';
}


}

/// @nodoc
class $VentorCallReportEventCopyWith<$Res>  {
$VentorCallReportEventCopyWith(VentorCallReportEvent _, $Res Function(VentorCallReportEvent) __);
}


/// Adds pattern-matching-related methods to [VentorCallReportEvent].
extension VentorCallReportEventPatterns on VentorCallReportEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ReasonSelected value)?  reasonSelected,TResult Function( _DetailsChanged value)?  detailsChanged,TResult Function( _SubmitRequested value)?  submitRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReasonSelected() when reasonSelected != null:
return reasonSelected(_that);case _DetailsChanged() when detailsChanged != null:
return detailsChanged(_that);case _SubmitRequested() when submitRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ReasonSelected value)  reasonSelected,required TResult Function( _DetailsChanged value)  detailsChanged,required TResult Function( _SubmitRequested value)  submitRequested,}){
final _that = this;
switch (_that) {
case _ReasonSelected():
return reasonSelected(_that);case _DetailsChanged():
return detailsChanged(_that);case _SubmitRequested():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ReasonSelected value)?  reasonSelected,TResult? Function( _DetailsChanged value)?  detailsChanged,TResult? Function( _SubmitRequested value)?  submitRequested,}){
final _that = this;
switch (_that) {
case _ReasonSelected() when reasonSelected != null:
return reasonSelected(_that);case _DetailsChanged() when detailsChanged != null:
return detailsChanged(_that);case _SubmitRequested() when submitRequested != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( VentorCallReportReason reason)?  reasonSelected,TResult Function( String details)?  detailsChanged,TResult Function( String sessionId)?  submitRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReasonSelected() when reasonSelected != null:
return reasonSelected(_that.reason);case _DetailsChanged() when detailsChanged != null:
return detailsChanged(_that.details);case _SubmitRequested() when submitRequested != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( VentorCallReportReason reason)  reasonSelected,required TResult Function( String details)  detailsChanged,required TResult Function( String sessionId)  submitRequested,}) {final _that = this;
switch (_that) {
case _ReasonSelected():
return reasonSelected(_that.reason);case _DetailsChanged():
return detailsChanged(_that.details);case _SubmitRequested():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( VentorCallReportReason reason)?  reasonSelected,TResult? Function( String details)?  detailsChanged,TResult? Function( String sessionId)?  submitRequested,}) {final _that = this;
switch (_that) {
case _ReasonSelected() when reasonSelected != null:
return reasonSelected(_that.reason);case _DetailsChanged() when detailsChanged != null:
return detailsChanged(_that.details);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc


class _ReasonSelected implements VentorCallReportEvent {
  const _ReasonSelected(this.reason);
  

 final  VentorCallReportReason reason;

/// Create a copy of VentorCallReportEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReasonSelectedCopyWith<_ReasonSelected> get copyWith => __$ReasonSelectedCopyWithImpl<_ReasonSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReasonSelected&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'VentorCallReportEvent.reasonSelected(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$ReasonSelectedCopyWith<$Res> implements $VentorCallReportEventCopyWith<$Res> {
  factory _$ReasonSelectedCopyWith(_ReasonSelected value, $Res Function(_ReasonSelected) _then) = __$ReasonSelectedCopyWithImpl;
@useResult
$Res call({
 VentorCallReportReason reason
});




}
/// @nodoc
class __$ReasonSelectedCopyWithImpl<$Res>
    implements _$ReasonSelectedCopyWith<$Res> {
  __$ReasonSelectedCopyWithImpl(this._self, this._then);

  final _ReasonSelected _self;
  final $Res Function(_ReasonSelected) _then;

/// Create a copy of VentorCallReportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_ReasonSelected(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as VentorCallReportReason,
  ));
}


}

/// @nodoc


class _DetailsChanged implements VentorCallReportEvent {
  const _DetailsChanged(this.details);
  

 final  String details;

/// Create a copy of VentorCallReportEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailsChangedCopyWith<_DetailsChanged> get copyWith => __$DetailsChangedCopyWithImpl<_DetailsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailsChanged&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,details);

@override
String toString() {
  return 'VentorCallReportEvent.detailsChanged(details: $details)';
}


}

/// @nodoc
abstract mixin class _$DetailsChangedCopyWith<$Res> implements $VentorCallReportEventCopyWith<$Res> {
  factory _$DetailsChangedCopyWith(_DetailsChanged value, $Res Function(_DetailsChanged) _then) = __$DetailsChangedCopyWithImpl;
@useResult
$Res call({
 String details
});




}
/// @nodoc
class __$DetailsChangedCopyWithImpl<$Res>
    implements _$DetailsChangedCopyWith<$Res> {
  __$DetailsChangedCopyWithImpl(this._self, this._then);

  final _DetailsChanged _self;
  final $Res Function(_DetailsChanged) _then;

/// Create a copy of VentorCallReportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? details = null,}) {
  return _then(_DetailsChanged(
null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SubmitRequested implements VentorCallReportEvent {
  const _SubmitRequested({required this.sessionId});
  

 final  String sessionId;

/// Create a copy of VentorCallReportEvent
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
  return 'VentorCallReportEvent.submitRequested(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$SubmitRequestedCopyWith<$Res> implements $VentorCallReportEventCopyWith<$Res> {
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

/// Create a copy of VentorCallReportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_SubmitRequested(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VentorCallReportState {

 VentorCallReportStatus get status; VentorCallReportReason? get selectedReason; String get details; bool get submitSucceeded; String get errorMessage;
/// Create a copy of VentorCallReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorCallReportStateCopyWith<VentorCallReportState> get copyWith => _$VentorCallReportStateCopyWithImpl<VentorCallReportState>(this as VentorCallReportState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorCallReportState&&(identical(other.status, status) || other.status == status)&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason)&&(identical(other.details, details) || other.details == details)&&(identical(other.submitSucceeded, submitSucceeded) || other.submitSucceeded == submitSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,selectedReason,details,submitSucceeded,errorMessage);

@override
String toString() {
  return 'VentorCallReportState(status: $status, selectedReason: $selectedReason, details: $details, submitSucceeded: $submitSucceeded, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorCallReportStateCopyWith<$Res>  {
  factory $VentorCallReportStateCopyWith(VentorCallReportState value, $Res Function(VentorCallReportState) _then) = _$VentorCallReportStateCopyWithImpl;
@useResult
$Res call({
 VentorCallReportStatus status, VentorCallReportReason? selectedReason, String details, bool submitSucceeded, String errorMessage
});




}
/// @nodoc
class _$VentorCallReportStateCopyWithImpl<$Res>
    implements $VentorCallReportStateCopyWith<$Res> {
  _$VentorCallReportStateCopyWithImpl(this._self, this._then);

  final VentorCallReportState _self;
  final $Res Function(VentorCallReportState) _then;

/// Create a copy of VentorCallReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? selectedReason = freezed,Object? details = null,Object? submitSucceeded = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorCallReportStatus,selectedReason: freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as VentorCallReportReason?,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,submitSucceeded: null == submitSucceeded ? _self.submitSucceeded : submitSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorCallReportState].
extension VentorCallReportStatePatterns on VentorCallReportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorCallReportState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorCallReportState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorCallReportState value)  $default,){
final _that = this;
switch (_that) {
case _VentorCallReportState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorCallReportState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorCallReportState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorCallReportStatus status,  VentorCallReportReason? selectedReason,  String details,  bool submitSucceeded,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorCallReportState() when $default != null:
return $default(_that.status,_that.selectedReason,_that.details,_that.submitSucceeded,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorCallReportStatus status,  VentorCallReportReason? selectedReason,  String details,  bool submitSucceeded,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorCallReportState():
return $default(_that.status,_that.selectedReason,_that.details,_that.submitSucceeded,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorCallReportStatus status,  VentorCallReportReason? selectedReason,  String details,  bool submitSucceeded,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorCallReportState() when $default != null:
return $default(_that.status,_that.selectedReason,_that.details,_that.submitSucceeded,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorCallReportState extends VentorCallReportState {
  const _VentorCallReportState({this.status = VentorCallReportStatus.ready, this.selectedReason, this.details = '', this.submitSucceeded = false, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  VentorCallReportStatus status;
@override final  VentorCallReportReason? selectedReason;
@override@JsonKey() final  String details;
@override@JsonKey() final  bool submitSucceeded;
@override@JsonKey() final  String errorMessage;

/// Create a copy of VentorCallReportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorCallReportStateCopyWith<_VentorCallReportState> get copyWith => __$VentorCallReportStateCopyWithImpl<_VentorCallReportState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorCallReportState&&(identical(other.status, status) || other.status == status)&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason)&&(identical(other.details, details) || other.details == details)&&(identical(other.submitSucceeded, submitSucceeded) || other.submitSucceeded == submitSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,selectedReason,details,submitSucceeded,errorMessage);

@override
String toString() {
  return 'VentorCallReportState(status: $status, selectedReason: $selectedReason, details: $details, submitSucceeded: $submitSucceeded, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorCallReportStateCopyWith<$Res> implements $VentorCallReportStateCopyWith<$Res> {
  factory _$VentorCallReportStateCopyWith(_VentorCallReportState value, $Res Function(_VentorCallReportState) _then) = __$VentorCallReportStateCopyWithImpl;
@override @useResult
$Res call({
 VentorCallReportStatus status, VentorCallReportReason? selectedReason, String details, bool submitSucceeded, String errorMessage
});




}
/// @nodoc
class __$VentorCallReportStateCopyWithImpl<$Res>
    implements _$VentorCallReportStateCopyWith<$Res> {
  __$VentorCallReportStateCopyWithImpl(this._self, this._then);

  final _VentorCallReportState _self;
  final $Res Function(_VentorCallReportState) _then;

/// Create a copy of VentorCallReportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? selectedReason = freezed,Object? details = null,Object? submitSucceeded = null,Object? errorMessage = null,}) {
  return _then(_VentorCallReportState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorCallReportStatus,selectedReason: freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as VentorCallReportReason?,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,submitSucceeded: null == submitSucceeded ? _self.submitSucceeded : submitSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
