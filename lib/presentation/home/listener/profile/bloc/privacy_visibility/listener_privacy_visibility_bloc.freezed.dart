// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_privacy_visibility_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerPrivacyVisibilityEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPrivacyVisibilityEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPrivacyVisibilityEvent()';
}


}

/// @nodoc
class $ListenerPrivacyVisibilityEventCopyWith<$Res>  {
$ListenerPrivacyVisibilityEventCopyWith(ListenerPrivacyVisibilityEvent _, $Res Function(ListenerPrivacyVisibilityEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerPrivacyVisibilityEvent].
extension ListenerPrivacyVisibilityEventPatterns on ListenerPrivacyVisibilityEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ListenerPrivacyVisibilitySettings settings)?  saveRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveRequested() when saveRequested != null:
return saveRequested(_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ListenerPrivacyVisibilitySettings settings)  saveRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SaveRequested():
return saveRequested(_that.settings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ListenerPrivacyVisibilitySettings settings)?  saveRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveRequested() when saveRequested != null:
return saveRequested(_that.settings);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerPrivacyVisibilityEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPrivacyVisibilityEvent.started()';
}


}




/// @nodoc


class _SaveRequested implements ListenerPrivacyVisibilityEvent {
  const _SaveRequested({required this.settings});
  

 final  ListenerPrivacyVisibilitySettings settings;

/// Create a copy of ListenerPrivacyVisibilityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveRequestedCopyWith<_SaveRequested> get copyWith => __$SaveRequestedCopyWithImpl<_SaveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveRequested&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'ListenerPrivacyVisibilityEvent.saveRequested(settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$SaveRequestedCopyWith<$Res> implements $ListenerPrivacyVisibilityEventCopyWith<$Res> {
  factory _$SaveRequestedCopyWith(_SaveRequested value, $Res Function(_SaveRequested) _then) = __$SaveRequestedCopyWithImpl;
@useResult
$Res call({
 ListenerPrivacyVisibilitySettings settings
});




}
/// @nodoc
class __$SaveRequestedCopyWithImpl<$Res>
    implements _$SaveRequestedCopyWith<$Res> {
  __$SaveRequestedCopyWithImpl(this._self, this._then);

  final _SaveRequested _self;
  final $Res Function(_SaveRequested) _then;

/// Create a copy of ListenerPrivacyVisibilityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? settings = null,}) {
  return _then(_SaveRequested(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as ListenerPrivacyVisibilitySettings,
  ));
}


}

/// @nodoc
mixin _$ListenerPrivacyVisibilityState {

 ListenerPrivacyVisibilityStatus get status; ListenerPrivacyVisibilitySettings? get savedSettings; String get errorMessage;
/// Create a copy of ListenerPrivacyVisibilityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPrivacyVisibilityStateCopyWith<ListenerPrivacyVisibilityState> get copyWith => _$ListenerPrivacyVisibilityStateCopyWithImpl<ListenerPrivacyVisibilityState>(this as ListenerPrivacyVisibilityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPrivacyVisibilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.savedSettings, savedSettings) || other.savedSettings == savedSettings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,savedSettings,errorMessage);

@override
String toString() {
  return 'ListenerPrivacyVisibilityState(status: $status, savedSettings: $savedSettings, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerPrivacyVisibilityStateCopyWith<$Res>  {
  factory $ListenerPrivacyVisibilityStateCopyWith(ListenerPrivacyVisibilityState value, $Res Function(ListenerPrivacyVisibilityState) _then) = _$ListenerPrivacyVisibilityStateCopyWithImpl;
@useResult
$Res call({
 ListenerPrivacyVisibilityStatus status, ListenerPrivacyVisibilitySettings? savedSettings, String errorMessage
});




}
/// @nodoc
class _$ListenerPrivacyVisibilityStateCopyWithImpl<$Res>
    implements $ListenerPrivacyVisibilityStateCopyWith<$Res> {
  _$ListenerPrivacyVisibilityStateCopyWithImpl(this._self, this._then);

  final ListenerPrivacyVisibilityState _self;
  final $Res Function(ListenerPrivacyVisibilityState) _then;

/// Create a copy of ListenerPrivacyVisibilityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? savedSettings = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerPrivacyVisibilityStatus,savedSettings: freezed == savedSettings ? _self.savedSettings : savedSettings // ignore: cast_nullable_to_non_nullable
as ListenerPrivacyVisibilitySettings?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerPrivacyVisibilityState].
extension ListenerPrivacyVisibilityStatePatterns on ListenerPrivacyVisibilityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPrivacyVisibilityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPrivacyVisibilityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPrivacyVisibilityState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPrivacyVisibilityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPrivacyVisibilityState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPrivacyVisibilityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerPrivacyVisibilityStatus status,  ListenerPrivacyVisibilitySettings? savedSettings,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPrivacyVisibilityState() when $default != null:
return $default(_that.status,_that.savedSettings,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerPrivacyVisibilityStatus status,  ListenerPrivacyVisibilitySettings? savedSettings,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerPrivacyVisibilityState():
return $default(_that.status,_that.savedSettings,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerPrivacyVisibilityStatus status,  ListenerPrivacyVisibilitySettings? savedSettings,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPrivacyVisibilityState() when $default != null:
return $default(_that.status,_that.savedSettings,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerPrivacyVisibilityState extends ListenerPrivacyVisibilityState {
  const _ListenerPrivacyVisibilityState({this.status = ListenerPrivacyVisibilityStatus.initial, this.savedSettings, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  ListenerPrivacyVisibilityStatus status;
@override final  ListenerPrivacyVisibilitySettings? savedSettings;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerPrivacyVisibilityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPrivacyVisibilityStateCopyWith<_ListenerPrivacyVisibilityState> get copyWith => __$ListenerPrivacyVisibilityStateCopyWithImpl<_ListenerPrivacyVisibilityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPrivacyVisibilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.savedSettings, savedSettings) || other.savedSettings == savedSettings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,savedSettings,errorMessage);

@override
String toString() {
  return 'ListenerPrivacyVisibilityState(status: $status, savedSettings: $savedSettings, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerPrivacyVisibilityStateCopyWith<$Res> implements $ListenerPrivacyVisibilityStateCopyWith<$Res> {
  factory _$ListenerPrivacyVisibilityStateCopyWith(_ListenerPrivacyVisibilityState value, $Res Function(_ListenerPrivacyVisibilityState) _then) = __$ListenerPrivacyVisibilityStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerPrivacyVisibilityStatus status, ListenerPrivacyVisibilitySettings? savedSettings, String errorMessage
});




}
/// @nodoc
class __$ListenerPrivacyVisibilityStateCopyWithImpl<$Res>
    implements _$ListenerPrivacyVisibilityStateCopyWith<$Res> {
  __$ListenerPrivacyVisibilityStateCopyWithImpl(this._self, this._then);

  final _ListenerPrivacyVisibilityState _self;
  final $Res Function(_ListenerPrivacyVisibilityState) _then;

/// Create a copy of ListenerPrivacyVisibilityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? savedSettings = freezed,Object? errorMessage = null,}) {
  return _then(_ListenerPrivacyVisibilityState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerPrivacyVisibilityStatus,savedSettings: freezed == savedSettings ? _self.savedSettings : savedSettings // ignore: cast_nullable_to_non_nullable
as ListenerPrivacyVisibilitySettings?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
