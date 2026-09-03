// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_call_end_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorCallEndEvent {

 String get sessionId; int? get durationSeconds;
/// Create a copy of VentorCallEndEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorCallEndEventCopyWith<VentorCallEndEvent> get copyWith => _$VentorCallEndEventCopyWithImpl<VentorCallEndEvent>(this as VentorCallEndEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorCallEndEvent&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,durationSeconds);

@override
String toString() {
  return 'VentorCallEndEvent(sessionId: $sessionId, durationSeconds: $durationSeconds)';
}


}

/// @nodoc
abstract mixin class $VentorCallEndEventCopyWith<$Res>  {
  factory $VentorCallEndEventCopyWith(VentorCallEndEvent value, $Res Function(VentorCallEndEvent) _then) = _$VentorCallEndEventCopyWithImpl;
@useResult
$Res call({
 String sessionId, int? durationSeconds
});




}
/// @nodoc
class _$VentorCallEndEventCopyWithImpl<$Res>
    implements $VentorCallEndEventCopyWith<$Res> {
  _$VentorCallEndEventCopyWithImpl(this._self, this._then);

  final VentorCallEndEvent _self;
  final $Res Function(VentorCallEndEvent) _then;

/// Create a copy of VentorCallEndEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? durationSeconds = freezed,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorCallEndEvent].
extension VentorCallEndEventPatterns on VentorCallEndEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EndRequested value)?  endRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EndRequested() when endRequested != null:
return endRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EndRequested value)  endRequested,}){
final _that = this;
switch (_that) {
case _EndRequested():
return endRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EndRequested value)?  endRequested,}){
final _that = this;
switch (_that) {
case _EndRequested() when endRequested != null:
return endRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String sessionId,  int? durationSeconds)?  endRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EndRequested() when endRequested != null:
return endRequested(_that.sessionId,_that.durationSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String sessionId,  int? durationSeconds)  endRequested,}) {final _that = this;
switch (_that) {
case _EndRequested():
return endRequested(_that.sessionId,_that.durationSeconds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String sessionId,  int? durationSeconds)?  endRequested,}) {final _that = this;
switch (_that) {
case _EndRequested() when endRequested != null:
return endRequested(_that.sessionId,_that.durationSeconds);case _:
  return null;

}
}

}

/// @nodoc


class _EndRequested implements VentorCallEndEvent {
  const _EndRequested({required this.sessionId, this.durationSeconds});
  

@override final  String sessionId;
@override final  int? durationSeconds;

/// Create a copy of VentorCallEndEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndRequestedCopyWith<_EndRequested> get copyWith => __$EndRequestedCopyWithImpl<_EndRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndRequested&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,durationSeconds);

@override
String toString() {
  return 'VentorCallEndEvent.endRequested(sessionId: $sessionId, durationSeconds: $durationSeconds)';
}


}

/// @nodoc
abstract mixin class _$EndRequestedCopyWith<$Res> implements $VentorCallEndEventCopyWith<$Res> {
  factory _$EndRequestedCopyWith(_EndRequested value, $Res Function(_EndRequested) _then) = __$EndRequestedCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, int? durationSeconds
});




}
/// @nodoc
class __$EndRequestedCopyWithImpl<$Res>
    implements _$EndRequestedCopyWith<$Res> {
  __$EndRequestedCopyWithImpl(this._self, this._then);

  final _EndRequested _self;
  final $Res Function(_EndRequested) _then;

/// Create a copy of VentorCallEndEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? durationSeconds = freezed,}) {
  return _then(_EndRequested(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$VentorCallEndState {

 VentorCallEndStatus get status; bool get endSucceeded; String get errorMessage;
/// Create a copy of VentorCallEndState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorCallEndStateCopyWith<VentorCallEndState> get copyWith => _$VentorCallEndStateCopyWithImpl<VentorCallEndState>(this as VentorCallEndState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorCallEndState&&(identical(other.status, status) || other.status == status)&&(identical(other.endSucceeded, endSucceeded) || other.endSucceeded == endSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,endSucceeded,errorMessage);

@override
String toString() {
  return 'VentorCallEndState(status: $status, endSucceeded: $endSucceeded, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorCallEndStateCopyWith<$Res>  {
  factory $VentorCallEndStateCopyWith(VentorCallEndState value, $Res Function(VentorCallEndState) _then) = _$VentorCallEndStateCopyWithImpl;
@useResult
$Res call({
 VentorCallEndStatus status, bool endSucceeded, String errorMessage
});




}
/// @nodoc
class _$VentorCallEndStateCopyWithImpl<$Res>
    implements $VentorCallEndStateCopyWith<$Res> {
  _$VentorCallEndStateCopyWithImpl(this._self, this._then);

  final VentorCallEndState _self;
  final $Res Function(VentorCallEndState) _then;

/// Create a copy of VentorCallEndState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? endSucceeded = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorCallEndStatus,endSucceeded: null == endSucceeded ? _self.endSucceeded : endSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorCallEndState].
extension VentorCallEndStatePatterns on VentorCallEndState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorCallEndState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorCallEndState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorCallEndState value)  $default,){
final _that = this;
switch (_that) {
case _VentorCallEndState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorCallEndState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorCallEndState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorCallEndStatus status,  bool endSucceeded,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorCallEndState() when $default != null:
return $default(_that.status,_that.endSucceeded,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorCallEndStatus status,  bool endSucceeded,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorCallEndState():
return $default(_that.status,_that.endSucceeded,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorCallEndStatus status,  bool endSucceeded,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorCallEndState() when $default != null:
return $default(_that.status,_that.endSucceeded,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorCallEndState extends VentorCallEndState {
  const _VentorCallEndState({this.status = VentorCallEndStatus.ready, this.endSucceeded = false, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  VentorCallEndStatus status;
@override@JsonKey() final  bool endSucceeded;
@override@JsonKey() final  String errorMessage;

/// Create a copy of VentorCallEndState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorCallEndStateCopyWith<_VentorCallEndState> get copyWith => __$VentorCallEndStateCopyWithImpl<_VentorCallEndState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorCallEndState&&(identical(other.status, status) || other.status == status)&&(identical(other.endSucceeded, endSucceeded) || other.endSucceeded == endSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,endSucceeded,errorMessage);

@override
String toString() {
  return 'VentorCallEndState(status: $status, endSucceeded: $endSucceeded, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorCallEndStateCopyWith<$Res> implements $VentorCallEndStateCopyWith<$Res> {
  factory _$VentorCallEndStateCopyWith(_VentorCallEndState value, $Res Function(_VentorCallEndState) _then) = __$VentorCallEndStateCopyWithImpl;
@override @useResult
$Res call({
 VentorCallEndStatus status, bool endSucceeded, String errorMessage
});




}
/// @nodoc
class __$VentorCallEndStateCopyWithImpl<$Res>
    implements _$VentorCallEndStateCopyWith<$Res> {
  __$VentorCallEndStateCopyWithImpl(this._self, this._then);

  final _VentorCallEndState _self;
  final $Res Function(_VentorCallEndState) _then;

/// Create a copy of VentorCallEndState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? endSucceeded = null,Object? errorMessage = null,}) {
  return _then(_VentorCallEndState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorCallEndStatus,endSucceeded: null == endSucceeded ? _self.endSucceeded : endSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
