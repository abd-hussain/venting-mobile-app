// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_notification_preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerNotificationPreferencesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNotificationPreferencesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerNotificationPreferencesEvent()';
}


}

/// @nodoc
class $ListenerNotificationPreferencesEventCopyWith<$Res>  {
$ListenerNotificationPreferencesEventCopyWith(ListenerNotificationPreferencesEvent _, $Res Function(ListenerNotificationPreferencesEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerNotificationPreferencesEvent].
extension ListenerNotificationPreferencesEventPatterns on ListenerNotificationPreferencesEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ListenerNotificationPreferences preferences)?  saveRequested,required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ListenerNotificationPreferences preferences)  saveRequested,}) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ListenerNotificationPreferences preferences)?  saveRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveRequested() when saveRequested != null:
return saveRequested(_that.preferences);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerNotificationPreferencesEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerNotificationPreferencesEvent.started()';
}


}




/// @nodoc


class _SaveRequested implements ListenerNotificationPreferencesEvent {
  const _SaveRequested({required this.preferences});
  

 final  ListenerNotificationPreferences preferences;

/// Create a copy of ListenerNotificationPreferencesEvent
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
  return 'ListenerNotificationPreferencesEvent.saveRequested(preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class _$SaveRequestedCopyWith<$Res> implements $ListenerNotificationPreferencesEventCopyWith<$Res> {
  factory _$SaveRequestedCopyWith(_SaveRequested value, $Res Function(_SaveRequested) _then) = __$SaveRequestedCopyWithImpl;
@useResult
$Res call({
 ListenerNotificationPreferences preferences
});




}
/// @nodoc
class __$SaveRequestedCopyWithImpl<$Res>
    implements _$SaveRequestedCopyWith<$Res> {
  __$SaveRequestedCopyWithImpl(this._self, this._then);

  final _SaveRequested _self;
  final $Res Function(_SaveRequested) _then;

/// Create a copy of ListenerNotificationPreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preferences = null,}) {
  return _then(_SaveRequested(
preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as ListenerNotificationPreferences,
  ));
}


}

/// @nodoc
mixin _$ListenerNotificationPreferencesState {

 ListenerNotificationPreferencesStatus get status; ListenerNotificationPreferences? get savedPreferences; String get errorMessage;
/// Create a copy of ListenerNotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerNotificationPreferencesStateCopyWith<ListenerNotificationPreferencesState> get copyWith => _$ListenerNotificationPreferencesStateCopyWithImpl<ListenerNotificationPreferencesState>(this as ListenerNotificationPreferencesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNotificationPreferencesState&&(identical(other.status, status) || other.status == status)&&(identical(other.savedPreferences, savedPreferences) || other.savedPreferences == savedPreferences)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,savedPreferences,errorMessage);

@override
String toString() {
  return 'ListenerNotificationPreferencesState(status: $status, savedPreferences: $savedPreferences, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerNotificationPreferencesStateCopyWith<$Res>  {
  factory $ListenerNotificationPreferencesStateCopyWith(ListenerNotificationPreferencesState value, $Res Function(ListenerNotificationPreferencesState) _then) = _$ListenerNotificationPreferencesStateCopyWithImpl;
@useResult
$Res call({
 ListenerNotificationPreferencesStatus status, ListenerNotificationPreferences? savedPreferences, String errorMessage
});




}
/// @nodoc
class _$ListenerNotificationPreferencesStateCopyWithImpl<$Res>
    implements $ListenerNotificationPreferencesStateCopyWith<$Res> {
  _$ListenerNotificationPreferencesStateCopyWithImpl(this._self, this._then);

  final ListenerNotificationPreferencesState _self;
  final $Res Function(ListenerNotificationPreferencesState) _then;

/// Create a copy of ListenerNotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? savedPreferences = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerNotificationPreferencesStatus,savedPreferences: freezed == savedPreferences ? _self.savedPreferences : savedPreferences // ignore: cast_nullable_to_non_nullable
as ListenerNotificationPreferences?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerNotificationPreferencesState].
extension ListenerNotificationPreferencesStatePatterns on ListenerNotificationPreferencesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerNotificationPreferencesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerNotificationPreferencesState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerNotificationPreferencesState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerNotificationPreferencesStatus status,  ListenerNotificationPreferences? savedPreferences,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerNotificationPreferencesStatus status,  ListenerNotificationPreferences? savedPreferences,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerNotificationPreferencesStatus status,  ListenerNotificationPreferences? savedPreferences,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesState() when $default != null:
return $default(_that.status,_that.savedPreferences,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerNotificationPreferencesState extends ListenerNotificationPreferencesState {
  const _ListenerNotificationPreferencesState({this.status = ListenerNotificationPreferencesStatus.initial, this.savedPreferences, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  ListenerNotificationPreferencesStatus status;
@override final  ListenerNotificationPreferences? savedPreferences;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerNotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerNotificationPreferencesStateCopyWith<_ListenerNotificationPreferencesState> get copyWith => __$ListenerNotificationPreferencesStateCopyWithImpl<_ListenerNotificationPreferencesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerNotificationPreferencesState&&(identical(other.status, status) || other.status == status)&&(identical(other.savedPreferences, savedPreferences) || other.savedPreferences == savedPreferences)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,savedPreferences,errorMessage);

@override
String toString() {
  return 'ListenerNotificationPreferencesState(status: $status, savedPreferences: $savedPreferences, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerNotificationPreferencesStateCopyWith<$Res> implements $ListenerNotificationPreferencesStateCopyWith<$Res> {
  factory _$ListenerNotificationPreferencesStateCopyWith(_ListenerNotificationPreferencesState value, $Res Function(_ListenerNotificationPreferencesState) _then) = __$ListenerNotificationPreferencesStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerNotificationPreferencesStatus status, ListenerNotificationPreferences? savedPreferences, String errorMessage
});




}
/// @nodoc
class __$ListenerNotificationPreferencesStateCopyWithImpl<$Res>
    implements _$ListenerNotificationPreferencesStateCopyWith<$Res> {
  __$ListenerNotificationPreferencesStateCopyWithImpl(this._self, this._then);

  final _ListenerNotificationPreferencesState _self;
  final $Res Function(_ListenerNotificationPreferencesState) _then;

/// Create a copy of ListenerNotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? savedPreferences = freezed,Object? errorMessage = null,}) {
  return _then(_ListenerNotificationPreferencesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerNotificationPreferencesStatus,savedPreferences: freezed == savedPreferences ? _self.savedPreferences : savedPreferences // ignore: cast_nullable_to_non_nullable
as ListenerNotificationPreferences?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
