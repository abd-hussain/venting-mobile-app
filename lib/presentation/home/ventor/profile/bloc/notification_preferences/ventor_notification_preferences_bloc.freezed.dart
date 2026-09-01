// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_notification_preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorNotificationPreferencesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorNotificationPreferencesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorNotificationPreferencesEvent()';
}


}

/// @nodoc
class $VentorNotificationPreferencesEventCopyWith<$Res>  {
$VentorNotificationPreferencesEventCopyWith(VentorNotificationPreferencesEvent _, $Res Function(VentorNotificationPreferencesEvent) __);
}


/// Adds pattern-matching-related methods to [VentorNotificationPreferencesEvent].
extension VentorNotificationPreferencesEventPatterns on VentorNotificationPreferencesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SaveRequested value)?  saveRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveRequested() when saveRequested != null:
return saveRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SaveRequested value)  saveRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SaveRequested():
return saveRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SaveRequested value)?  saveRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveRequested() when saveRequested != null:
return saveRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( VentorNotificationPreferences preferences)?  saveRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveRequested() when saveRequested != null:
return saveRequested(_that.preferences);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( VentorNotificationPreferences preferences)  saveRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SaveRequested():
return saveRequested(_that.preferences);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( VentorNotificationPreferences preferences)?  saveRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveRequested() when saveRequested != null:
return saveRequested(_that.preferences);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorNotificationPreferencesEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorNotificationPreferencesEvent.started()';
}


}




/// @nodoc


class _SaveRequested implements VentorNotificationPreferencesEvent {
  const _SaveRequested({required this.preferences});
  

 final  VentorNotificationPreferences preferences;

/// Create a copy of VentorNotificationPreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveRequestedCopyWith<_SaveRequested> get copyWith => __$SaveRequestedCopyWithImpl<_SaveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveRequested&&(identical(other.preferences, preferences) || other.preferences == preferences));
}


@override
int get hashCode => Object.hash(runtimeType,preferences);

@override
String toString() {
  return 'VentorNotificationPreferencesEvent.saveRequested(preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class _$SaveRequestedCopyWith<$Res> implements $VentorNotificationPreferencesEventCopyWith<$Res> {
  factory _$SaveRequestedCopyWith(_SaveRequested value, $Res Function(_SaveRequested) _then) = __$SaveRequestedCopyWithImpl;
@useResult
$Res call({
 VentorNotificationPreferences preferences
});




}
/// @nodoc
class __$SaveRequestedCopyWithImpl<$Res>
    implements _$SaveRequestedCopyWith<$Res> {
  __$SaveRequestedCopyWithImpl(this._self, this._then);

  final _SaveRequested _self;
  final $Res Function(_SaveRequested) _then;

/// Create a copy of VentorNotificationPreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preferences = null,}) {
  return _then(_SaveRequested(
preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as VentorNotificationPreferences,
  ));
}


}

/// @nodoc
mixin _$VentorNotificationPreferencesState {

 VentorNotificationPreferencesStatus get status; VentorNotificationPreferences? get savedPreferences; String get errorMessage;
/// Create a copy of VentorNotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorNotificationPreferencesStateCopyWith<VentorNotificationPreferencesState> get copyWith => _$VentorNotificationPreferencesStateCopyWithImpl<VentorNotificationPreferencesState>(this as VentorNotificationPreferencesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorNotificationPreferencesState&&(identical(other.status, status) || other.status == status)&&(identical(other.savedPreferences, savedPreferences) || other.savedPreferences == savedPreferences)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,savedPreferences,errorMessage);

@override
String toString() {
  return 'VentorNotificationPreferencesState(status: $status, savedPreferences: $savedPreferences, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorNotificationPreferencesStateCopyWith<$Res>  {
  factory $VentorNotificationPreferencesStateCopyWith(VentorNotificationPreferencesState value, $Res Function(VentorNotificationPreferencesState) _then) = _$VentorNotificationPreferencesStateCopyWithImpl;
@useResult
$Res call({
 VentorNotificationPreferencesStatus status, VentorNotificationPreferences? savedPreferences, String errorMessage
});




}
/// @nodoc
class _$VentorNotificationPreferencesStateCopyWithImpl<$Res>
    implements $VentorNotificationPreferencesStateCopyWith<$Res> {
  _$VentorNotificationPreferencesStateCopyWithImpl(this._self, this._then);

  final VentorNotificationPreferencesState _self;
  final $Res Function(VentorNotificationPreferencesState) _then;

/// Create a copy of VentorNotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? savedPreferences = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorNotificationPreferencesStatus,savedPreferences: freezed == savedPreferences ? _self.savedPreferences : savedPreferences // ignore: cast_nullable_to_non_nullable
as VentorNotificationPreferences?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorNotificationPreferencesState].
extension VentorNotificationPreferencesStatePatterns on VentorNotificationPreferencesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorNotificationPreferencesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorNotificationPreferencesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorNotificationPreferencesState value)  $default,){
final _that = this;
switch (_that) {
case _VentorNotificationPreferencesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorNotificationPreferencesState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorNotificationPreferencesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorNotificationPreferencesStatus status,  VentorNotificationPreferences? savedPreferences,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorNotificationPreferencesState() when $default != null:
return $default(_that.status,_that.savedPreferences,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorNotificationPreferencesStatus status,  VentorNotificationPreferences? savedPreferences,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorNotificationPreferencesState():
return $default(_that.status,_that.savedPreferences,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorNotificationPreferencesStatus status,  VentorNotificationPreferences? savedPreferences,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorNotificationPreferencesState() when $default != null:
return $default(_that.status,_that.savedPreferences,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorNotificationPreferencesState extends VentorNotificationPreferencesState {
  const _VentorNotificationPreferencesState({this.status = VentorNotificationPreferencesStatus.initial, this.savedPreferences, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  VentorNotificationPreferencesStatus status;
@override final  VentorNotificationPreferences? savedPreferences;
@override@JsonKey() final  String errorMessage;

/// Create a copy of VentorNotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorNotificationPreferencesStateCopyWith<_VentorNotificationPreferencesState> get copyWith => __$VentorNotificationPreferencesStateCopyWithImpl<_VentorNotificationPreferencesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorNotificationPreferencesState&&(identical(other.status, status) || other.status == status)&&(identical(other.savedPreferences, savedPreferences) || other.savedPreferences == savedPreferences)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,savedPreferences,errorMessage);

@override
String toString() {
  return 'VentorNotificationPreferencesState(status: $status, savedPreferences: $savedPreferences, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorNotificationPreferencesStateCopyWith<$Res> implements $VentorNotificationPreferencesStateCopyWith<$Res> {
  factory _$VentorNotificationPreferencesStateCopyWith(_VentorNotificationPreferencesState value, $Res Function(_VentorNotificationPreferencesState) _then) = __$VentorNotificationPreferencesStateCopyWithImpl;
@override @useResult
$Res call({
 VentorNotificationPreferencesStatus status, VentorNotificationPreferences? savedPreferences, String errorMessage
});




}
/// @nodoc
class __$VentorNotificationPreferencesStateCopyWithImpl<$Res>
    implements _$VentorNotificationPreferencesStateCopyWith<$Res> {
  __$VentorNotificationPreferencesStateCopyWithImpl(this._self, this._then);

  final _VentorNotificationPreferencesState _self;
  final $Res Function(_VentorNotificationPreferencesState) _then;

/// Create a copy of VentorNotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? savedPreferences = freezed,Object? errorMessage = null,}) {
  return _then(_VentorNotificationPreferencesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorNotificationPreferencesStatus,savedPreferences: freezed == savedPreferences ? _self.savedPreferences : savedPreferences // ignore: cast_nullable_to_non_nullable
as VentorNotificationPreferences?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
