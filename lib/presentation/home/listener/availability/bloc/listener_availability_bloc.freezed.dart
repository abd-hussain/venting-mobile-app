// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_availability_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerAvailabilityEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAvailabilityEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerAvailabilityEvent()';
}


}

/// @nodoc
class $ListenerAvailabilityEventCopyWith<$Res>  {
$ListenerAvailabilityEventCopyWith(ListenerAvailabilityEvent _, $Res Function(ListenerAvailabilityEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerAvailabilityEvent].
extension ListenerAvailabilityEventPatterns on ListenerAvailabilityEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _OnlineStatusChanged value)?  onlineStatusChanged,TResult Function( _InstantCallsChanged value)?  instantCallsChanged,TResult Function( _SessionLengthChanged value)?  sessionLengthChanged,TResult Function( _BreakLengthChanged value)?  breakLengthChanged,TResult Function( _DayScheduleChanged value)?  dayScheduleChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _OnlineStatusChanged() when onlineStatusChanged != null:
return onlineStatusChanged(_that);case _InstantCallsChanged() when instantCallsChanged != null:
return instantCallsChanged(_that);case _SessionLengthChanged() when sessionLengthChanged != null:
return sessionLengthChanged(_that);case _BreakLengthChanged() when breakLengthChanged != null:
return breakLengthChanged(_that);case _DayScheduleChanged() when dayScheduleChanged != null:
return dayScheduleChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _OnlineStatusChanged value)  onlineStatusChanged,required TResult Function( _InstantCallsChanged value)  instantCallsChanged,required TResult Function( _SessionLengthChanged value)  sessionLengthChanged,required TResult Function( _BreakLengthChanged value)  breakLengthChanged,required TResult Function( _DayScheduleChanged value)  dayScheduleChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _OnlineStatusChanged():
return onlineStatusChanged(_that);case _InstantCallsChanged():
return instantCallsChanged(_that);case _SessionLengthChanged():
return sessionLengthChanged(_that);case _BreakLengthChanged():
return breakLengthChanged(_that);case _DayScheduleChanged():
return dayScheduleChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _OnlineStatusChanged value)?  onlineStatusChanged,TResult? Function( _InstantCallsChanged value)?  instantCallsChanged,TResult? Function( _SessionLengthChanged value)?  sessionLengthChanged,TResult? Function( _BreakLengthChanged value)?  breakLengthChanged,TResult? Function( _DayScheduleChanged value)?  dayScheduleChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _OnlineStatusChanged() when onlineStatusChanged != null:
return onlineStatusChanged(_that);case _InstantCallsChanged() when instantCallsChanged != null:
return instantCallsChanged(_that);case _SessionLengthChanged() when sessionLengthChanged != null:
return sessionLengthChanged(_that);case _BreakLengthChanged() when breakLengthChanged != null:
return breakLengthChanged(_that);case _DayScheduleChanged() when dayScheduleChanged != null:
return dayScheduleChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function( bool isOnline)?  onlineStatusChanged,TResult Function( bool acceptInstantCalls)?  instantCallsChanged,TResult Function( PreferredSessionLengthSelection sessionLength)?  sessionLengthChanged,TResult Function( int breakLengthMinutes)?  breakLengthChanged,TResult Function( String dayId,  bool enabled,  List<TimeSlot> slots)?  dayScheduleChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _OnlineStatusChanged() when onlineStatusChanged != null:
return onlineStatusChanged(_that.isOnline);case _InstantCallsChanged() when instantCallsChanged != null:
return instantCallsChanged(_that.acceptInstantCalls);case _SessionLengthChanged() when sessionLengthChanged != null:
return sessionLengthChanged(_that.sessionLength);case _BreakLengthChanged() when breakLengthChanged != null:
return breakLengthChanged(_that.breakLengthMinutes);case _DayScheduleChanged() when dayScheduleChanged != null:
return dayScheduleChanged(_that.dayId,_that.enabled,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function( bool isOnline)  onlineStatusChanged,required TResult Function( bool acceptInstantCalls)  instantCallsChanged,required TResult Function( PreferredSessionLengthSelection sessionLength)  sessionLengthChanged,required TResult Function( int breakLengthMinutes)  breakLengthChanged,required TResult Function( String dayId,  bool enabled,  List<TimeSlot> slots)  dayScheduleChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _OnlineStatusChanged():
return onlineStatusChanged(_that.isOnline);case _InstantCallsChanged():
return instantCallsChanged(_that.acceptInstantCalls);case _SessionLengthChanged():
return sessionLengthChanged(_that.sessionLength);case _BreakLengthChanged():
return breakLengthChanged(_that.breakLengthMinutes);case _DayScheduleChanged():
return dayScheduleChanged(_that.dayId,_that.enabled,_that.slots);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function( bool isOnline)?  onlineStatusChanged,TResult? Function( bool acceptInstantCalls)?  instantCallsChanged,TResult? Function( PreferredSessionLengthSelection sessionLength)?  sessionLengthChanged,TResult? Function( int breakLengthMinutes)?  breakLengthChanged,TResult? Function( String dayId,  bool enabled,  List<TimeSlot> slots)?  dayScheduleChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _OnlineStatusChanged() when onlineStatusChanged != null:
return onlineStatusChanged(_that.isOnline);case _InstantCallsChanged() when instantCallsChanged != null:
return instantCallsChanged(_that.acceptInstantCalls);case _SessionLengthChanged() when sessionLengthChanged != null:
return sessionLengthChanged(_that.sessionLength);case _BreakLengthChanged() when breakLengthChanged != null:
return breakLengthChanged(_that.breakLengthMinutes);case _DayScheduleChanged() when dayScheduleChanged != null:
return dayScheduleChanged(_that.dayId,_that.enabled,_that.slots);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerAvailabilityEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerAvailabilityEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements ListenerAvailabilityEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerAvailabilityEvent.retryLoad()';
}


}




/// @nodoc


class _OnlineStatusChanged implements ListenerAvailabilityEvent {
  const _OnlineStatusChanged({required this.isOnline});
  

 final  bool isOnline;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnlineStatusChangedCopyWith<_OnlineStatusChanged> get copyWith => __$OnlineStatusChangedCopyWithImpl<_OnlineStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnlineStatusChanged&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}


@override
int get hashCode => Object.hash(runtimeType,isOnline);

@override
String toString() {
  return 'ListenerAvailabilityEvent.onlineStatusChanged(isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$OnlineStatusChangedCopyWith<$Res> implements $ListenerAvailabilityEventCopyWith<$Res> {
  factory _$OnlineStatusChangedCopyWith(_OnlineStatusChanged value, $Res Function(_OnlineStatusChanged) _then) = __$OnlineStatusChangedCopyWithImpl;
@useResult
$Res call({
 bool isOnline
});




}
/// @nodoc
class __$OnlineStatusChangedCopyWithImpl<$Res>
    implements _$OnlineStatusChangedCopyWith<$Res> {
  __$OnlineStatusChangedCopyWithImpl(this._self, this._then);

  final _OnlineStatusChanged _self;
  final $Res Function(_OnlineStatusChanged) _then;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isOnline = null,}) {
  return _then(_OnlineStatusChanged(
isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _InstantCallsChanged implements ListenerAvailabilityEvent {
  const _InstantCallsChanged({required this.acceptInstantCalls});
  

 final  bool acceptInstantCalls;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstantCallsChangedCopyWith<_InstantCallsChanged> get copyWith => __$InstantCallsChangedCopyWithImpl<_InstantCallsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstantCallsChanged&&(identical(other.acceptInstantCalls, acceptInstantCalls) || other.acceptInstantCalls == acceptInstantCalls));
}


@override
int get hashCode => Object.hash(runtimeType,acceptInstantCalls);

@override
String toString() {
  return 'ListenerAvailabilityEvent.instantCallsChanged(acceptInstantCalls: $acceptInstantCalls)';
}


}

/// @nodoc
abstract mixin class _$InstantCallsChangedCopyWith<$Res> implements $ListenerAvailabilityEventCopyWith<$Res> {
  factory _$InstantCallsChangedCopyWith(_InstantCallsChanged value, $Res Function(_InstantCallsChanged) _then) = __$InstantCallsChangedCopyWithImpl;
@useResult
$Res call({
 bool acceptInstantCalls
});




}
/// @nodoc
class __$InstantCallsChangedCopyWithImpl<$Res>
    implements _$InstantCallsChangedCopyWith<$Res> {
  __$InstantCallsChangedCopyWithImpl(this._self, this._then);

  final _InstantCallsChanged _self;
  final $Res Function(_InstantCallsChanged) _then;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? acceptInstantCalls = null,}) {
  return _then(_InstantCallsChanged(
acceptInstantCalls: null == acceptInstantCalls ? _self.acceptInstantCalls : acceptInstantCalls // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SessionLengthChanged implements ListenerAvailabilityEvent {
  const _SessionLengthChanged({required this.sessionLength});
  

 final  PreferredSessionLengthSelection sessionLength;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionLengthChangedCopyWith<_SessionLengthChanged> get copyWith => __$SessionLengthChangedCopyWithImpl<_SessionLengthChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionLengthChanged&&(identical(other.sessionLength, sessionLength) || other.sessionLength == sessionLength));
}


@override
int get hashCode => Object.hash(runtimeType,sessionLength);

@override
String toString() {
  return 'ListenerAvailabilityEvent.sessionLengthChanged(sessionLength: $sessionLength)';
}


}

/// @nodoc
abstract mixin class _$SessionLengthChangedCopyWith<$Res> implements $ListenerAvailabilityEventCopyWith<$Res> {
  factory _$SessionLengthChangedCopyWith(_SessionLengthChanged value, $Res Function(_SessionLengthChanged) _then) = __$SessionLengthChangedCopyWithImpl;
@useResult
$Res call({
 PreferredSessionLengthSelection sessionLength
});




}
/// @nodoc
class __$SessionLengthChangedCopyWithImpl<$Res>
    implements _$SessionLengthChangedCopyWith<$Res> {
  __$SessionLengthChangedCopyWithImpl(this._self, this._then);

  final _SessionLengthChanged _self;
  final $Res Function(_SessionLengthChanged) _then;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionLength = null,}) {
  return _then(_SessionLengthChanged(
sessionLength: null == sessionLength ? _self.sessionLength : sessionLength // ignore: cast_nullable_to_non_nullable
as PreferredSessionLengthSelection,
  ));
}


}

/// @nodoc


class _BreakLengthChanged implements ListenerAvailabilityEvent {
  const _BreakLengthChanged({required this.breakLengthMinutes});
  

 final  int breakLengthMinutes;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreakLengthChangedCopyWith<_BreakLengthChanged> get copyWith => __$BreakLengthChangedCopyWithImpl<_BreakLengthChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreakLengthChanged&&(identical(other.breakLengthMinutes, breakLengthMinutes) || other.breakLengthMinutes == breakLengthMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,breakLengthMinutes);

@override
String toString() {
  return 'ListenerAvailabilityEvent.breakLengthChanged(breakLengthMinutes: $breakLengthMinutes)';
}


}

/// @nodoc
abstract mixin class _$BreakLengthChangedCopyWith<$Res> implements $ListenerAvailabilityEventCopyWith<$Res> {
  factory _$BreakLengthChangedCopyWith(_BreakLengthChanged value, $Res Function(_BreakLengthChanged) _then) = __$BreakLengthChangedCopyWithImpl;
@useResult
$Res call({
 int breakLengthMinutes
});




}
/// @nodoc
class __$BreakLengthChangedCopyWithImpl<$Res>
    implements _$BreakLengthChangedCopyWith<$Res> {
  __$BreakLengthChangedCopyWithImpl(this._self, this._then);

  final _BreakLengthChanged _self;
  final $Res Function(_BreakLengthChanged) _then;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? breakLengthMinutes = null,}) {
  return _then(_BreakLengthChanged(
breakLengthMinutes: null == breakLengthMinutes ? _self.breakLengthMinutes : breakLengthMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DayScheduleChanged implements ListenerAvailabilityEvent {
  const _DayScheduleChanged({required this.dayId, required this.enabled, required final  List<TimeSlot> slots}): _slots = slots;
  

 final  String dayId;
 final  bool enabled;
 final  List<TimeSlot> _slots;
 List<TimeSlot> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayScheduleChangedCopyWith<_DayScheduleChanged> get copyWith => __$DayScheduleChangedCopyWithImpl<_DayScheduleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayScheduleChanged&&(identical(other.dayId, dayId) || other.dayId == dayId)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&const DeepCollectionEquality().equals(other._slots, _slots));
}


@override
int get hashCode => Object.hash(runtimeType,dayId,enabled,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'ListenerAvailabilityEvent.dayScheduleChanged(dayId: $dayId, enabled: $enabled, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$DayScheduleChangedCopyWith<$Res> implements $ListenerAvailabilityEventCopyWith<$Res> {
  factory _$DayScheduleChangedCopyWith(_DayScheduleChanged value, $Res Function(_DayScheduleChanged) _then) = __$DayScheduleChangedCopyWithImpl;
@useResult
$Res call({
 String dayId, bool enabled, List<TimeSlot> slots
});




}
/// @nodoc
class __$DayScheduleChangedCopyWithImpl<$Res>
    implements _$DayScheduleChangedCopyWith<$Res> {
  __$DayScheduleChangedCopyWithImpl(this._self, this._then);

  final _DayScheduleChanged _self;
  final $Res Function(_DayScheduleChanged) _then;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dayId = null,Object? enabled = null,Object? slots = null,}) {
  return _then(_DayScheduleChanged(
dayId: null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>,
  ));
}


}

/// @nodoc
mixin _$ListenerAvailabilityState {

 ListenerAvailabilityStatus get status; ListenerAvailability? get availability; bool get isOnline; ListenerAvailabilitySavingTarget? get savingTarget; String? get savingDayId; String get errorMessage;
/// Create a copy of ListenerAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerAvailabilityStateCopyWith<ListenerAvailabilityState> get copyWith => _$ListenerAvailabilityStateCopyWithImpl<ListenerAvailabilityState>(this as ListenerAvailabilityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAvailabilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.savingTarget, savingTarget) || other.savingTarget == savingTarget)&&(identical(other.savingDayId, savingDayId) || other.savingDayId == savingDayId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,availability,isOnline,savingTarget,savingDayId,errorMessage);

@override
String toString() {
  return 'ListenerAvailabilityState(status: $status, availability: $availability, isOnline: $isOnline, savingTarget: $savingTarget, savingDayId: $savingDayId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerAvailabilityStateCopyWith<$Res>  {
  factory $ListenerAvailabilityStateCopyWith(ListenerAvailabilityState value, $Res Function(ListenerAvailabilityState) _then) = _$ListenerAvailabilityStateCopyWithImpl;
@useResult
$Res call({
 ListenerAvailabilityStatus status, ListenerAvailability? availability, bool isOnline, ListenerAvailabilitySavingTarget? savingTarget, String? savingDayId, String errorMessage
});




}
/// @nodoc
class _$ListenerAvailabilityStateCopyWithImpl<$Res>
    implements $ListenerAvailabilityStateCopyWith<$Res> {
  _$ListenerAvailabilityStateCopyWithImpl(this._self, this._then);

  final ListenerAvailabilityState _self;
  final $Res Function(ListenerAvailabilityState) _then;

/// Create a copy of ListenerAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? availability = freezed,Object? isOnline = null,Object? savingTarget = freezed,Object? savingDayId = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilityStatus,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as ListenerAvailability?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,savingTarget: freezed == savingTarget ? _self.savingTarget : savingTarget // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilitySavingTarget?,savingDayId: freezed == savingDayId ? _self.savingDayId : savingDayId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerAvailabilityState].
extension ListenerAvailabilityStatePatterns on ListenerAvailabilityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerAvailabilityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerAvailabilityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerAvailabilityState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerAvailabilityState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerAvailabilityStatus status,  ListenerAvailability? availability,  bool isOnline,  ListenerAvailabilitySavingTarget? savingTarget,  String? savingDayId,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerAvailabilityState() when $default != null:
return $default(_that.status,_that.availability,_that.isOnline,_that.savingTarget,_that.savingDayId,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerAvailabilityStatus status,  ListenerAvailability? availability,  bool isOnline,  ListenerAvailabilitySavingTarget? savingTarget,  String? savingDayId,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityState():
return $default(_that.status,_that.availability,_that.isOnline,_that.savingTarget,_that.savingDayId,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerAvailabilityStatus status,  ListenerAvailability? availability,  bool isOnline,  ListenerAvailabilitySavingTarget? savingTarget,  String? savingDayId,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityState() when $default != null:
return $default(_that.status,_that.availability,_that.isOnline,_that.savingTarget,_that.savingDayId,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerAvailabilityState extends ListenerAvailabilityState {
  const _ListenerAvailabilityState({this.status = ListenerAvailabilityStatus.initial, this.availability, this.isOnline = false, this.savingTarget, this.savingDayId, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  ListenerAvailabilityStatus status;
@override final  ListenerAvailability? availability;
@override@JsonKey() final  bool isOnline;
@override final  ListenerAvailabilitySavingTarget? savingTarget;
@override final  String? savingDayId;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerAvailabilityStateCopyWith<_ListenerAvailabilityState> get copyWith => __$ListenerAvailabilityStateCopyWithImpl<_ListenerAvailabilityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerAvailabilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.savingTarget, savingTarget) || other.savingTarget == savingTarget)&&(identical(other.savingDayId, savingDayId) || other.savingDayId == savingDayId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,availability,isOnline,savingTarget,savingDayId,errorMessage);

@override
String toString() {
  return 'ListenerAvailabilityState(status: $status, availability: $availability, isOnline: $isOnline, savingTarget: $savingTarget, savingDayId: $savingDayId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerAvailabilityStateCopyWith<$Res> implements $ListenerAvailabilityStateCopyWith<$Res> {
  factory _$ListenerAvailabilityStateCopyWith(_ListenerAvailabilityState value, $Res Function(_ListenerAvailabilityState) _then) = __$ListenerAvailabilityStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerAvailabilityStatus status, ListenerAvailability? availability, bool isOnline, ListenerAvailabilitySavingTarget? savingTarget, String? savingDayId, String errorMessage
});




}
/// @nodoc
class __$ListenerAvailabilityStateCopyWithImpl<$Res>
    implements _$ListenerAvailabilityStateCopyWith<$Res> {
  __$ListenerAvailabilityStateCopyWithImpl(this._self, this._then);

  final _ListenerAvailabilityState _self;
  final $Res Function(_ListenerAvailabilityState) _then;

/// Create a copy of ListenerAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? availability = freezed,Object? isOnline = null,Object? savingTarget = freezed,Object? savingDayId = freezed,Object? errorMessage = null,}) {
  return _then(_ListenerAvailabilityState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilityStatus,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as ListenerAvailability?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,savingTarget: freezed == savingTarget ? _self.savingTarget : savingTarget // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilitySavingTarget?,savingDayId: freezed == savingDayId ? _self.savingDayId : savingDayId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
