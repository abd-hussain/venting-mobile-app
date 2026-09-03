// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_call_join_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerCallJoinEvent {

 String get sessionId;
/// Create a copy of ListenerCallJoinEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerCallJoinEventCopyWith<ListenerCallJoinEvent> get copyWith => _$ListenerCallJoinEventCopyWithImpl<ListenerCallJoinEvent>(this as ListenerCallJoinEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerCallJoinEvent&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'ListenerCallJoinEvent(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $ListenerCallJoinEventCopyWith<$Res>  {
  factory $ListenerCallJoinEventCopyWith(ListenerCallJoinEvent value, $Res Function(ListenerCallJoinEvent) _then) = _$ListenerCallJoinEventCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$ListenerCallJoinEventCopyWithImpl<$Res>
    implements $ListenerCallJoinEventCopyWith<$Res> {
  _$ListenerCallJoinEventCopyWithImpl(this._self, this._then);

  final ListenerCallJoinEvent _self;
  final $Res Function(ListenerCallJoinEvent) _then;

/// Create a copy of ListenerCallJoinEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerCallJoinEvent].
extension ListenerCallJoinEventPatterns on ListenerCallJoinEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _JoinRequested value)?  joinRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JoinRequested() when joinRequested != null:
return joinRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _JoinRequested value)  joinRequested,}){
final _that = this;
switch (_that) {
case _JoinRequested():
return joinRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _JoinRequested value)?  joinRequested,}){
final _that = this;
switch (_that) {
case _JoinRequested() when joinRequested != null:
return joinRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String sessionId)?  joinRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JoinRequested() when joinRequested != null:
return joinRequested(_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String sessionId)  joinRequested,}) {final _that = this;
switch (_that) {
case _JoinRequested():
return joinRequested(_that.sessionId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String sessionId)?  joinRequested,}) {final _that = this;
switch (_that) {
case _JoinRequested() when joinRequested != null:
return joinRequested(_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc


class _JoinRequested implements ListenerCallJoinEvent {
  const _JoinRequested({required this.sessionId});
  

@override final  String sessionId;

/// Create a copy of ListenerCallJoinEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinRequestedCopyWith<_JoinRequested> get copyWith => __$JoinRequestedCopyWithImpl<_JoinRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinRequested&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'ListenerCallJoinEvent.joinRequested(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$JoinRequestedCopyWith<$Res> implements $ListenerCallJoinEventCopyWith<$Res> {
  factory _$JoinRequestedCopyWith(_JoinRequested value, $Res Function(_JoinRequested) _then) = __$JoinRequestedCopyWithImpl;
@override @useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class __$JoinRequestedCopyWithImpl<$Res>
    implements _$JoinRequestedCopyWith<$Res> {
  __$JoinRequestedCopyWithImpl(this._self, this._then);

  final _JoinRequested _self;
  final $Res Function(_JoinRequested) _then;

/// Create a copy of ListenerCallJoinEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_JoinRequested(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ListenerCallJoinState {

 ListenerCallJoinStatus get status; bool get joinSucceeded; SessionCallCredentials? get callCredentials; String get errorMessage;
/// Create a copy of ListenerCallJoinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerCallJoinStateCopyWith<ListenerCallJoinState> get copyWith => _$ListenerCallJoinStateCopyWithImpl<ListenerCallJoinState>(this as ListenerCallJoinState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerCallJoinState&&(identical(other.status, status) || other.status == status)&&(identical(other.joinSucceeded, joinSucceeded) || other.joinSucceeded == joinSucceeded)&&(identical(other.callCredentials, callCredentials) || other.callCredentials == callCredentials)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,joinSucceeded,callCredentials,errorMessage);

@override
String toString() {
  return 'ListenerCallJoinState(status: $status, joinSucceeded: $joinSucceeded, callCredentials: $callCredentials, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerCallJoinStateCopyWith<$Res>  {
  factory $ListenerCallJoinStateCopyWith(ListenerCallJoinState value, $Res Function(ListenerCallJoinState) _then) = _$ListenerCallJoinStateCopyWithImpl;
@useResult
$Res call({
 ListenerCallJoinStatus status, bool joinSucceeded, SessionCallCredentials? callCredentials, String errorMessage
});




}
/// @nodoc
class _$ListenerCallJoinStateCopyWithImpl<$Res>
    implements $ListenerCallJoinStateCopyWith<$Res> {
  _$ListenerCallJoinStateCopyWithImpl(this._self, this._then);

  final ListenerCallJoinState _self;
  final $Res Function(ListenerCallJoinState) _then;

/// Create a copy of ListenerCallJoinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? joinSucceeded = null,Object? callCredentials = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerCallJoinStatus,joinSucceeded: null == joinSucceeded ? _self.joinSucceeded : joinSucceeded // ignore: cast_nullable_to_non_nullable
as bool,callCredentials: freezed == callCredentials ? _self.callCredentials : callCredentials // ignore: cast_nullable_to_non_nullable
as SessionCallCredentials?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerCallJoinState].
extension ListenerCallJoinStatePatterns on ListenerCallJoinState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerCallJoinState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerCallJoinState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerCallJoinState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerCallJoinState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerCallJoinState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerCallJoinState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerCallJoinStatus status,  bool joinSucceeded,  SessionCallCredentials? callCredentials,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerCallJoinState() when $default != null:
return $default(_that.status,_that.joinSucceeded,_that.callCredentials,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerCallJoinStatus status,  bool joinSucceeded,  SessionCallCredentials? callCredentials,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerCallJoinState():
return $default(_that.status,_that.joinSucceeded,_that.callCredentials,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerCallJoinStatus status,  bool joinSucceeded,  SessionCallCredentials? callCredentials,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerCallJoinState() when $default != null:
return $default(_that.status,_that.joinSucceeded,_that.callCredentials,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerCallJoinState extends ListenerCallJoinState {
  const _ListenerCallJoinState({this.status = ListenerCallJoinStatus.ready, this.joinSucceeded = false, this.callCredentials, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  ListenerCallJoinStatus status;
@override@JsonKey() final  bool joinSucceeded;
@override final  SessionCallCredentials? callCredentials;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerCallJoinState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerCallJoinStateCopyWith<_ListenerCallJoinState> get copyWith => __$ListenerCallJoinStateCopyWithImpl<_ListenerCallJoinState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerCallJoinState&&(identical(other.status, status) || other.status == status)&&(identical(other.joinSucceeded, joinSucceeded) || other.joinSucceeded == joinSucceeded)&&(identical(other.callCredentials, callCredentials) || other.callCredentials == callCredentials)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,joinSucceeded,callCredentials,errorMessage);

@override
String toString() {
  return 'ListenerCallJoinState(status: $status, joinSucceeded: $joinSucceeded, callCredentials: $callCredentials, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerCallJoinStateCopyWith<$Res> implements $ListenerCallJoinStateCopyWith<$Res> {
  factory _$ListenerCallJoinStateCopyWith(_ListenerCallJoinState value, $Res Function(_ListenerCallJoinState) _then) = __$ListenerCallJoinStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerCallJoinStatus status, bool joinSucceeded, SessionCallCredentials? callCredentials, String errorMessage
});




}
/// @nodoc
class __$ListenerCallJoinStateCopyWithImpl<$Res>
    implements _$ListenerCallJoinStateCopyWith<$Res> {
  __$ListenerCallJoinStateCopyWithImpl(this._self, this._then);

  final _ListenerCallJoinState _self;
  final $Res Function(_ListenerCallJoinState) _then;

/// Create a copy of ListenerCallJoinState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? joinSucceeded = null,Object? callCredentials = freezed,Object? errorMessage = null,}) {
  return _then(_ListenerCallJoinState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerCallJoinStatus,joinSucceeded: null == joinSucceeded ? _self.joinSucceeded : joinSucceeded // ignore: cast_nullable_to_non_nullable
as bool,callCredentials: freezed == callCredentials ? _self.callCredentials : callCredentials // ignore: cast_nullable_to_non_nullable
as SessionCallCredentials?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
