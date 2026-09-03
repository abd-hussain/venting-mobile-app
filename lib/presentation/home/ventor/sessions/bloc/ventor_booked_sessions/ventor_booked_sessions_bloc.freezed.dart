// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_booked_sessions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorBookedSessionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBookedSessionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBookedSessionsEvent()';
}


}

/// @nodoc
class $VentorBookedSessionsEventCopyWith<$Res>  {
$VentorBookedSessionsEventCopyWith(VentorBookedSessionsEvent _, $Res Function(VentorBookedSessionsEvent) __);
}


/// Adds pattern-matching-related methods to [VentorBookedSessionsEvent].
extension VentorBookedSessionsEventPatterns on VentorBookedSessionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _SessionUpdated value)?  sessionUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _SessionUpdated() when sessionUpdated != null:
return sessionUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _SessionUpdated value)  sessionUpdated,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _RefreshRequested():
return refreshRequested(_that);case _SessionUpdated():
return sessionUpdated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _SessionUpdated value)?  sessionUpdated,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _SessionUpdated() when sessionUpdated != null:
return sessionUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function()?  refreshRequested,TResult Function( VentorBookedSession session)?  sessionUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _SessionUpdated() when sessionUpdated != null:
return sessionUpdated(_that.session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function()  refreshRequested,required TResult Function( VentorBookedSession session)  sessionUpdated,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _RefreshRequested():
return refreshRequested();case _SessionUpdated():
return sessionUpdated(_that.session);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function()?  refreshRequested,TResult? Function( VentorBookedSession session)?  sessionUpdated,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _SessionUpdated() when sessionUpdated != null:
return sessionUpdated(_that.session);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorBookedSessionsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBookedSessionsEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements VentorBookedSessionsEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBookedSessionsEvent.retryLoad()';
}


}




/// @nodoc


class _RefreshRequested implements VentorBookedSessionsEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBookedSessionsEvent.refreshRequested()';
}


}




/// @nodoc


class _SessionUpdated implements VentorBookedSessionsEvent {
  const _SessionUpdated(this.session);
  

 final  VentorBookedSession session;

/// Create a copy of VentorBookedSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionUpdatedCopyWith<_SessionUpdated> get copyWith => __$SessionUpdatedCopyWithImpl<_SessionUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionUpdated&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'VentorBookedSessionsEvent.sessionUpdated(session: $session)';
}


}

/// @nodoc
abstract mixin class _$SessionUpdatedCopyWith<$Res> implements $VentorBookedSessionsEventCopyWith<$Res> {
  factory _$SessionUpdatedCopyWith(_SessionUpdated value, $Res Function(_SessionUpdated) _then) = __$SessionUpdatedCopyWithImpl;
@useResult
$Res call({
 VentorBookedSession session
});




}
/// @nodoc
class __$SessionUpdatedCopyWithImpl<$Res>
    implements _$SessionUpdatedCopyWith<$Res> {
  __$SessionUpdatedCopyWithImpl(this._self, this._then);

  final _SessionUpdated _self;
  final $Res Function(_SessionUpdated) _then;

/// Create a copy of VentorBookedSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(_SessionUpdated(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as VentorBookedSession,
  ));
}


}

/// @nodoc
mixin _$VentorBookedSessionsState {

 VentorBookedSessionsStatus get status; List<VentorBookedSession> get sessions; bool get isRefreshing; String get errorMessage;
/// Create a copy of VentorBookedSessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorBookedSessionsStateCopyWith<VentorBookedSessionsState> get copyWith => _$VentorBookedSessionsStateCopyWithImpl<VentorBookedSessionsState>(this as VentorBookedSessionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBookedSessionsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(sessions),isRefreshing,errorMessage);

@override
String toString() {
  return 'VentorBookedSessionsState(status: $status, sessions: $sessions, isRefreshing: $isRefreshing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorBookedSessionsStateCopyWith<$Res>  {
  factory $VentorBookedSessionsStateCopyWith(VentorBookedSessionsState value, $Res Function(VentorBookedSessionsState) _then) = _$VentorBookedSessionsStateCopyWithImpl;
@useResult
$Res call({
 VentorBookedSessionsStatus status, List<VentorBookedSession> sessions, bool isRefreshing, String errorMessage
});




}
/// @nodoc
class _$VentorBookedSessionsStateCopyWithImpl<$Res>
    implements $VentorBookedSessionsStateCopyWith<$Res> {
  _$VentorBookedSessionsStateCopyWithImpl(this._self, this._then);

  final VentorBookedSessionsState _self;
  final $Res Function(VentorBookedSessionsState) _then;

/// Create a copy of VentorBookedSessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? sessions = null,Object? isRefreshing = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionsStatus,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<VentorBookedSession>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorBookedSessionsState].
extension VentorBookedSessionsStatePatterns on VentorBookedSessionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorBookedSessionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorBookedSessionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorBookedSessionsState value)  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorBookedSessionsState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorBookedSessionsStatus status,  List<VentorBookedSession> sessions,  bool isRefreshing,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorBookedSessionsState() when $default != null:
return $default(_that.status,_that.sessions,_that.isRefreshing,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorBookedSessionsStatus status,  List<VentorBookedSession> sessions,  bool isRefreshing,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionsState():
return $default(_that.status,_that.sessions,_that.isRefreshing,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorBookedSessionsStatus status,  List<VentorBookedSession> sessions,  bool isRefreshing,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionsState() when $default != null:
return $default(_that.status,_that.sessions,_that.isRefreshing,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorBookedSessionsState extends VentorBookedSessionsState {
  const _VentorBookedSessionsState({this.status = VentorBookedSessionsStatus.initial, final  List<VentorBookedSession> sessions = const <VentorBookedSession>[], this.isRefreshing = false, this.errorMessage = ''}): _sessions = sessions,super._();
  

@override@JsonKey() final  VentorBookedSessionsStatus status;
 final  List<VentorBookedSession> _sessions;
@override@JsonKey() List<VentorBookedSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  String errorMessage;

/// Create a copy of VentorBookedSessionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorBookedSessionsStateCopyWith<_VentorBookedSessionsState> get copyWith => __$VentorBookedSessionsStateCopyWithImpl<_VentorBookedSessionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorBookedSessionsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_sessions),isRefreshing,errorMessage);

@override
String toString() {
  return 'VentorBookedSessionsState(status: $status, sessions: $sessions, isRefreshing: $isRefreshing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorBookedSessionsStateCopyWith<$Res> implements $VentorBookedSessionsStateCopyWith<$Res> {
  factory _$VentorBookedSessionsStateCopyWith(_VentorBookedSessionsState value, $Res Function(_VentorBookedSessionsState) _then) = __$VentorBookedSessionsStateCopyWithImpl;
@override @useResult
$Res call({
 VentorBookedSessionsStatus status, List<VentorBookedSession> sessions, bool isRefreshing, String errorMessage
});




}
/// @nodoc
class __$VentorBookedSessionsStateCopyWithImpl<$Res>
    implements _$VentorBookedSessionsStateCopyWith<$Res> {
  __$VentorBookedSessionsStateCopyWithImpl(this._self, this._then);

  final _VentorBookedSessionsState _self;
  final $Res Function(_VentorBookedSessionsState) _then;

/// Create a copy of VentorBookedSessionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? sessions = null,Object? isRefreshing = null,Object? errorMessage = null,}) {
  return _then(_VentorBookedSessionsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionsStatus,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<VentorBookedSession>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
