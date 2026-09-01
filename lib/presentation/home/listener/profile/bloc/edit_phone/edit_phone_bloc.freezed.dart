// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_phone_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditPhoneEvent {

 IsoCode get country; String get nationalNumber;
/// Create a copy of EditPhoneEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditPhoneEventCopyWith<EditPhoneEvent> get copyWith => _$EditPhoneEventCopyWithImpl<EditPhoneEvent>(this as EditPhoneEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditPhoneEvent&&(identical(other.country, country) || other.country == country)&&(identical(other.nationalNumber, nationalNumber) || other.nationalNumber == nationalNumber));
}


@override
int get hashCode => Object.hash(runtimeType,country,nationalNumber);

@override
String toString() {
  return 'EditPhoneEvent(country: $country, nationalNumber: $nationalNumber)';
}


}

/// @nodoc
abstract mixin class $EditPhoneEventCopyWith<$Res>  {
  factory $EditPhoneEventCopyWith(EditPhoneEvent value, $Res Function(EditPhoneEvent) _then) = _$EditPhoneEventCopyWithImpl;
@useResult
$Res call({
 IsoCode country, String nationalNumber
});




}
/// @nodoc
class _$EditPhoneEventCopyWithImpl<$Res>
    implements $EditPhoneEventCopyWith<$Res> {
  _$EditPhoneEventCopyWithImpl(this._self, this._then);

  final EditPhoneEvent _self;
  final $Res Function(EditPhoneEvent) _then;

/// Create a copy of EditPhoneEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = null,Object? nationalNumber = null,}) {
  return _then(_self.copyWith(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as IsoCode,nationalNumber: null == nationalNumber ? _self.nationalNumber : nationalNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EditPhoneEvent].
extension EditPhoneEventPatterns on EditPhoneEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SaveRequested value)?  saveRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaveRequested() when saveRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SaveRequested value)  saveRequested,}){
final _that = this;
switch (_that) {
case _SaveRequested():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SaveRequested value)?  saveRequested,}){
final _that = this;
switch (_that) {
case _SaveRequested() when saveRequested != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( IsoCode country,  String nationalNumber)?  saveRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaveRequested() when saveRequested != null:
return saveRequested(_that.country,_that.nationalNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( IsoCode country,  String nationalNumber)  saveRequested,}) {final _that = this;
switch (_that) {
case _SaveRequested():
return saveRequested(_that.country,_that.nationalNumber);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( IsoCode country,  String nationalNumber)?  saveRequested,}) {final _that = this;
switch (_that) {
case _SaveRequested() when saveRequested != null:
return saveRequested(_that.country,_that.nationalNumber);case _:
  return null;

}
}

}

/// @nodoc


class _SaveRequested implements EditPhoneEvent {
  const _SaveRequested({required this.country, required this.nationalNumber});
  

@override final  IsoCode country;
@override final  String nationalNumber;

/// Create a copy of EditPhoneEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveRequestedCopyWith<_SaveRequested> get copyWith => __$SaveRequestedCopyWithImpl<_SaveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveRequested&&(identical(other.country, country) || other.country == country)&&(identical(other.nationalNumber, nationalNumber) || other.nationalNumber == nationalNumber));
}


@override
int get hashCode => Object.hash(runtimeType,country,nationalNumber);

@override
String toString() {
  return 'EditPhoneEvent.saveRequested(country: $country, nationalNumber: $nationalNumber)';
}


}

/// @nodoc
abstract mixin class _$SaveRequestedCopyWith<$Res> implements $EditPhoneEventCopyWith<$Res> {
  factory _$SaveRequestedCopyWith(_SaveRequested value, $Res Function(_SaveRequested) _then) = __$SaveRequestedCopyWithImpl;
@override @useResult
$Res call({
 IsoCode country, String nationalNumber
});




}
/// @nodoc
class __$SaveRequestedCopyWithImpl<$Res>
    implements _$SaveRequestedCopyWith<$Res> {
  __$SaveRequestedCopyWithImpl(this._self, this._then);

  final _SaveRequested _self;
  final $Res Function(_SaveRequested) _then;

/// Create a copy of EditPhoneEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = null,Object? nationalNumber = null,}) {
  return _then(_SaveRequested(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as IsoCode,nationalNumber: null == nationalNumber ? _self.nationalNumber : nationalNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$EditPhoneState {

 EditPhoneStatus get status; String get errorMessage; ListenerPhone? get savedPhone;
/// Create a copy of EditPhoneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditPhoneStateCopyWith<EditPhoneState> get copyWith => _$EditPhoneStateCopyWithImpl<EditPhoneState>(this as EditPhoneState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditPhoneState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.savedPhone, savedPhone) || other.savedPhone == savedPhone));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,savedPhone);

@override
String toString() {
  return 'EditPhoneState(status: $status, errorMessage: $errorMessage, savedPhone: $savedPhone)';
}


}

/// @nodoc
abstract mixin class $EditPhoneStateCopyWith<$Res>  {
  factory $EditPhoneStateCopyWith(EditPhoneState value, $Res Function(EditPhoneState) _then) = _$EditPhoneStateCopyWithImpl;
@useResult
$Res call({
 EditPhoneStatus status, String errorMessage, ListenerPhone? savedPhone
});




}
/// @nodoc
class _$EditPhoneStateCopyWithImpl<$Res>
    implements $EditPhoneStateCopyWith<$Res> {
  _$EditPhoneStateCopyWithImpl(this._self, this._then);

  final EditPhoneState _self;
  final $Res Function(EditPhoneState) _then;

/// Create a copy of EditPhoneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = null,Object? savedPhone = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditPhoneStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,savedPhone: freezed == savedPhone ? _self.savedPhone : savedPhone // ignore: cast_nullable_to_non_nullable
as ListenerPhone?,
  ));
}

}


/// Adds pattern-matching-related methods to [EditPhoneState].
extension EditPhoneStatePatterns on EditPhoneState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditPhoneState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditPhoneState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditPhoneState value)  $default,){
final _that = this;
switch (_that) {
case _EditPhoneState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditPhoneState value)?  $default,){
final _that = this;
switch (_that) {
case _EditPhoneState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditPhoneStatus status,  String errorMessage,  ListenerPhone? savedPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditPhoneState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.savedPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditPhoneStatus status,  String errorMessage,  ListenerPhone? savedPhone)  $default,) {final _that = this;
switch (_that) {
case _EditPhoneState():
return $default(_that.status,_that.errorMessage,_that.savedPhone);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditPhoneStatus status,  String errorMessage,  ListenerPhone? savedPhone)?  $default,) {final _that = this;
switch (_that) {
case _EditPhoneState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.savedPhone);case _:
  return null;

}
}

}

/// @nodoc


class _EditPhoneState extends EditPhoneState {
  const _EditPhoneState({this.status = EditPhoneStatus.idle, this.errorMessage = '', this.savedPhone}): super._();
  

@override@JsonKey() final  EditPhoneStatus status;
@override@JsonKey() final  String errorMessage;
@override final  ListenerPhone? savedPhone;

/// Create a copy of EditPhoneState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditPhoneStateCopyWith<_EditPhoneState> get copyWith => __$EditPhoneStateCopyWithImpl<_EditPhoneState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditPhoneState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.savedPhone, savedPhone) || other.savedPhone == savedPhone));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,savedPhone);

@override
String toString() {
  return 'EditPhoneState(status: $status, errorMessage: $errorMessage, savedPhone: $savedPhone)';
}


}

/// @nodoc
abstract mixin class _$EditPhoneStateCopyWith<$Res> implements $EditPhoneStateCopyWith<$Res> {
  factory _$EditPhoneStateCopyWith(_EditPhoneState value, $Res Function(_EditPhoneState) _then) = __$EditPhoneStateCopyWithImpl;
@override @useResult
$Res call({
 EditPhoneStatus status, String errorMessage, ListenerPhone? savedPhone
});




}
/// @nodoc
class __$EditPhoneStateCopyWithImpl<$Res>
    implements _$EditPhoneStateCopyWith<$Res> {
  __$EditPhoneStateCopyWithImpl(this._self, this._then);

  final _EditPhoneState _self;
  final $Res Function(_EditPhoneState) _then;

/// Create a copy of EditPhoneState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = null,Object? savedPhone = freezed,}) {
  return _then(_EditPhoneState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditPhoneStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,savedPhone: freezed == savedPhone ? _self.savedPhone : savedPhone // ignore: cast_nullable_to_non_nullable
as ListenerPhone?,
  ));
}


}

// dart format on
