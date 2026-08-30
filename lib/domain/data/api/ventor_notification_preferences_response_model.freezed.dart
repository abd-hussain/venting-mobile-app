// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_notification_preferences_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorNotificationPreferencesResponseModel {

 String get status; VentorNotificationPreferencesData get data;
/// Create a copy of VentorNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorNotificationPreferencesResponseModelCopyWith<VentorNotificationPreferencesResponseModel> get copyWith => _$VentorNotificationPreferencesResponseModelCopyWithImpl<VentorNotificationPreferencesResponseModel>(this as VentorNotificationPreferencesResponseModel, _$identity);

  /// Serializes this VentorNotificationPreferencesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorNotificationPreferencesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorNotificationPreferencesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorNotificationPreferencesResponseModelCopyWith<$Res>  {
  factory $VentorNotificationPreferencesResponseModelCopyWith(VentorNotificationPreferencesResponseModel value, $Res Function(VentorNotificationPreferencesResponseModel) _then) = _$VentorNotificationPreferencesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorNotificationPreferencesData data
});


$VentorNotificationPreferencesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorNotificationPreferencesResponseModelCopyWithImpl<$Res>
    implements $VentorNotificationPreferencesResponseModelCopyWith<$Res> {
  _$VentorNotificationPreferencesResponseModelCopyWithImpl(this._self, this._then);

  final VentorNotificationPreferencesResponseModel _self;
  final $Res Function(VentorNotificationPreferencesResponseModel) _then;

/// Create a copy of VentorNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorNotificationPreferencesData,
  ));
}
/// Create a copy of VentorNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorNotificationPreferencesDataCopyWith<$Res> get data {
  
  return $VentorNotificationPreferencesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorNotificationPreferencesResponseModel].
extension VentorNotificationPreferencesResponseModelPatterns on VentorNotificationPreferencesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorNotificationPreferencesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorNotificationPreferencesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorNotificationPreferencesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorNotificationPreferencesResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorNotificationPreferencesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorNotificationPreferencesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorNotificationPreferencesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorNotificationPreferencesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorNotificationPreferencesData data)  $default,) {final _that = this;
switch (_that) {
case _VentorNotificationPreferencesResponseModel():
return $default(_that.status,_that.data);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorNotificationPreferencesData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorNotificationPreferencesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorNotificationPreferencesResponseModel implements VentorNotificationPreferencesResponseModel {
  const _VentorNotificationPreferencesResponseModel({required this.status, required this.data});
  factory _VentorNotificationPreferencesResponseModel.fromJson(Map<String, dynamic> json) => _$VentorNotificationPreferencesResponseModelFromJson(json);

@override final  String status;
@override final  VentorNotificationPreferencesData data;

/// Create a copy of VentorNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorNotificationPreferencesResponseModelCopyWith<_VentorNotificationPreferencesResponseModel> get copyWith => __$VentorNotificationPreferencesResponseModelCopyWithImpl<_VentorNotificationPreferencesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorNotificationPreferencesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorNotificationPreferencesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorNotificationPreferencesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorNotificationPreferencesResponseModelCopyWith<$Res> implements $VentorNotificationPreferencesResponseModelCopyWith<$Res> {
  factory _$VentorNotificationPreferencesResponseModelCopyWith(_VentorNotificationPreferencesResponseModel value, $Res Function(_VentorNotificationPreferencesResponseModel) _then) = __$VentorNotificationPreferencesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorNotificationPreferencesData data
});


@override $VentorNotificationPreferencesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorNotificationPreferencesResponseModelCopyWithImpl<$Res>
    implements _$VentorNotificationPreferencesResponseModelCopyWith<$Res> {
  __$VentorNotificationPreferencesResponseModelCopyWithImpl(this._self, this._then);

  final _VentorNotificationPreferencesResponseModel _self;
  final $Res Function(_VentorNotificationPreferencesResponseModel) _then;

/// Create a copy of VentorNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorNotificationPreferencesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorNotificationPreferencesData,
  ));
}

/// Create a copy of VentorNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorNotificationPreferencesDataCopyWith<$Res> get data {
  
  return $VentorNotificationPreferencesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorNotificationPreferencesData {

 bool get push_enabled; bool get session_reminder_30_min; bool get session_reminder_15_min; bool get session_reminder_10_min; bool get session_reminder_5_min; bool get rewards_updates; bool get promotions_updates; bool get email_enabled;
/// Create a copy of VentorNotificationPreferencesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorNotificationPreferencesDataCopyWith<VentorNotificationPreferencesData> get copyWith => _$VentorNotificationPreferencesDataCopyWithImpl<VentorNotificationPreferencesData>(this as VentorNotificationPreferencesData, _$identity);

  /// Serializes this VentorNotificationPreferencesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorNotificationPreferencesData&&(identical(other.push_enabled, push_enabled) || other.push_enabled == push_enabled)&&(identical(other.session_reminder_30_min, session_reminder_30_min) || other.session_reminder_30_min == session_reminder_30_min)&&(identical(other.session_reminder_15_min, session_reminder_15_min) || other.session_reminder_15_min == session_reminder_15_min)&&(identical(other.session_reminder_10_min, session_reminder_10_min) || other.session_reminder_10_min == session_reminder_10_min)&&(identical(other.session_reminder_5_min, session_reminder_5_min) || other.session_reminder_5_min == session_reminder_5_min)&&(identical(other.rewards_updates, rewards_updates) || other.rewards_updates == rewards_updates)&&(identical(other.promotions_updates, promotions_updates) || other.promotions_updates == promotions_updates)&&(identical(other.email_enabled, email_enabled) || other.email_enabled == email_enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,push_enabled,session_reminder_30_min,session_reminder_15_min,session_reminder_10_min,session_reminder_5_min,rewards_updates,promotions_updates,email_enabled);

@override
String toString() {
  return 'VentorNotificationPreferencesData(push_enabled: $push_enabled, session_reminder_30_min: $session_reminder_30_min, session_reminder_15_min: $session_reminder_15_min, session_reminder_10_min: $session_reminder_10_min, session_reminder_5_min: $session_reminder_5_min, rewards_updates: $rewards_updates, promotions_updates: $promotions_updates, email_enabled: $email_enabled)';
}


}

/// @nodoc
abstract mixin class $VentorNotificationPreferencesDataCopyWith<$Res>  {
  factory $VentorNotificationPreferencesDataCopyWith(VentorNotificationPreferencesData value, $Res Function(VentorNotificationPreferencesData) _then) = _$VentorNotificationPreferencesDataCopyWithImpl;
@useResult
$Res call({
 bool push_enabled, bool session_reminder_30_min, bool session_reminder_15_min, bool session_reminder_10_min, bool session_reminder_5_min, bool rewards_updates, bool promotions_updates, bool email_enabled
});




}
/// @nodoc
class _$VentorNotificationPreferencesDataCopyWithImpl<$Res>
    implements $VentorNotificationPreferencesDataCopyWith<$Res> {
  _$VentorNotificationPreferencesDataCopyWithImpl(this._self, this._then);

  final VentorNotificationPreferencesData _self;
  final $Res Function(VentorNotificationPreferencesData) _then;

/// Create a copy of VentorNotificationPreferencesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? push_enabled = null,Object? session_reminder_30_min = null,Object? session_reminder_15_min = null,Object? session_reminder_10_min = null,Object? session_reminder_5_min = null,Object? rewards_updates = null,Object? promotions_updates = null,Object? email_enabled = null,}) {
  return _then(_self.copyWith(
push_enabled: null == push_enabled ? _self.push_enabled : push_enabled // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_30_min: null == session_reminder_30_min ? _self.session_reminder_30_min : session_reminder_30_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_15_min: null == session_reminder_15_min ? _self.session_reminder_15_min : session_reminder_15_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_10_min: null == session_reminder_10_min ? _self.session_reminder_10_min : session_reminder_10_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_5_min: null == session_reminder_5_min ? _self.session_reminder_5_min : session_reminder_5_min // ignore: cast_nullable_to_non_nullable
as bool,rewards_updates: null == rewards_updates ? _self.rewards_updates : rewards_updates // ignore: cast_nullable_to_non_nullable
as bool,promotions_updates: null == promotions_updates ? _self.promotions_updates : promotions_updates // ignore: cast_nullable_to_non_nullable
as bool,email_enabled: null == email_enabled ? _self.email_enabled : email_enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorNotificationPreferencesData].
extension VentorNotificationPreferencesDataPatterns on VentorNotificationPreferencesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorNotificationPreferencesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorNotificationPreferencesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorNotificationPreferencesData value)  $default,){
final _that = this;
switch (_that) {
case _VentorNotificationPreferencesData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorNotificationPreferencesData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorNotificationPreferencesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool push_enabled,  bool session_reminder_30_min,  bool session_reminder_15_min,  bool session_reminder_10_min,  bool session_reminder_5_min,  bool rewards_updates,  bool promotions_updates,  bool email_enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorNotificationPreferencesData() when $default != null:
return $default(_that.push_enabled,_that.session_reminder_30_min,_that.session_reminder_15_min,_that.session_reminder_10_min,_that.session_reminder_5_min,_that.rewards_updates,_that.promotions_updates,_that.email_enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool push_enabled,  bool session_reminder_30_min,  bool session_reminder_15_min,  bool session_reminder_10_min,  bool session_reminder_5_min,  bool rewards_updates,  bool promotions_updates,  bool email_enabled)  $default,) {final _that = this;
switch (_that) {
case _VentorNotificationPreferencesData():
return $default(_that.push_enabled,_that.session_reminder_30_min,_that.session_reminder_15_min,_that.session_reminder_10_min,_that.session_reminder_5_min,_that.rewards_updates,_that.promotions_updates,_that.email_enabled);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool push_enabled,  bool session_reminder_30_min,  bool session_reminder_15_min,  bool session_reminder_10_min,  bool session_reminder_5_min,  bool rewards_updates,  bool promotions_updates,  bool email_enabled)?  $default,) {final _that = this;
switch (_that) {
case _VentorNotificationPreferencesData() when $default != null:
return $default(_that.push_enabled,_that.session_reminder_30_min,_that.session_reminder_15_min,_that.session_reminder_10_min,_that.session_reminder_5_min,_that.rewards_updates,_that.promotions_updates,_that.email_enabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorNotificationPreferencesData implements VentorNotificationPreferencesData {
  const _VentorNotificationPreferencesData({this.push_enabled = true, this.session_reminder_30_min = true, this.session_reminder_15_min = true, this.session_reminder_10_min = true, this.session_reminder_5_min = true, this.rewards_updates = true, this.promotions_updates = true, this.email_enabled = true});
  factory _VentorNotificationPreferencesData.fromJson(Map<String, dynamic> json) => _$VentorNotificationPreferencesDataFromJson(json);

@override@JsonKey() final  bool push_enabled;
@override@JsonKey() final  bool session_reminder_30_min;
@override@JsonKey() final  bool session_reminder_15_min;
@override@JsonKey() final  bool session_reminder_10_min;
@override@JsonKey() final  bool session_reminder_5_min;
@override@JsonKey() final  bool rewards_updates;
@override@JsonKey() final  bool promotions_updates;
@override@JsonKey() final  bool email_enabled;

/// Create a copy of VentorNotificationPreferencesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorNotificationPreferencesDataCopyWith<_VentorNotificationPreferencesData> get copyWith => __$VentorNotificationPreferencesDataCopyWithImpl<_VentorNotificationPreferencesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorNotificationPreferencesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorNotificationPreferencesData&&(identical(other.push_enabled, push_enabled) || other.push_enabled == push_enabled)&&(identical(other.session_reminder_30_min, session_reminder_30_min) || other.session_reminder_30_min == session_reminder_30_min)&&(identical(other.session_reminder_15_min, session_reminder_15_min) || other.session_reminder_15_min == session_reminder_15_min)&&(identical(other.session_reminder_10_min, session_reminder_10_min) || other.session_reminder_10_min == session_reminder_10_min)&&(identical(other.session_reminder_5_min, session_reminder_5_min) || other.session_reminder_5_min == session_reminder_5_min)&&(identical(other.rewards_updates, rewards_updates) || other.rewards_updates == rewards_updates)&&(identical(other.promotions_updates, promotions_updates) || other.promotions_updates == promotions_updates)&&(identical(other.email_enabled, email_enabled) || other.email_enabled == email_enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,push_enabled,session_reminder_30_min,session_reminder_15_min,session_reminder_10_min,session_reminder_5_min,rewards_updates,promotions_updates,email_enabled);

@override
String toString() {
  return 'VentorNotificationPreferencesData(push_enabled: $push_enabled, session_reminder_30_min: $session_reminder_30_min, session_reminder_15_min: $session_reminder_15_min, session_reminder_10_min: $session_reminder_10_min, session_reminder_5_min: $session_reminder_5_min, rewards_updates: $rewards_updates, promotions_updates: $promotions_updates, email_enabled: $email_enabled)';
}


}

/// @nodoc
abstract mixin class _$VentorNotificationPreferencesDataCopyWith<$Res> implements $VentorNotificationPreferencesDataCopyWith<$Res> {
  factory _$VentorNotificationPreferencesDataCopyWith(_VentorNotificationPreferencesData value, $Res Function(_VentorNotificationPreferencesData) _then) = __$VentorNotificationPreferencesDataCopyWithImpl;
@override @useResult
$Res call({
 bool push_enabled, bool session_reminder_30_min, bool session_reminder_15_min, bool session_reminder_10_min, bool session_reminder_5_min, bool rewards_updates, bool promotions_updates, bool email_enabled
});




}
/// @nodoc
class __$VentorNotificationPreferencesDataCopyWithImpl<$Res>
    implements _$VentorNotificationPreferencesDataCopyWith<$Res> {
  __$VentorNotificationPreferencesDataCopyWithImpl(this._self, this._then);

  final _VentorNotificationPreferencesData _self;
  final $Res Function(_VentorNotificationPreferencesData) _then;

/// Create a copy of VentorNotificationPreferencesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? push_enabled = null,Object? session_reminder_30_min = null,Object? session_reminder_15_min = null,Object? session_reminder_10_min = null,Object? session_reminder_5_min = null,Object? rewards_updates = null,Object? promotions_updates = null,Object? email_enabled = null,}) {
  return _then(_VentorNotificationPreferencesData(
push_enabled: null == push_enabled ? _self.push_enabled : push_enabled // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_30_min: null == session_reminder_30_min ? _self.session_reminder_30_min : session_reminder_30_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_15_min: null == session_reminder_15_min ? _self.session_reminder_15_min : session_reminder_15_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_10_min: null == session_reminder_10_min ? _self.session_reminder_10_min : session_reminder_10_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_5_min: null == session_reminder_5_min ? _self.session_reminder_5_min : session_reminder_5_min // ignore: cast_nullable_to_non_nullable
as bool,rewards_updates: null == rewards_updates ? _self.rewards_updates : rewards_updates // ignore: cast_nullable_to_non_nullable
as bool,promotions_updates: null == promotions_updates ? _self.promotions_updates : promotions_updates // ignore: cast_nullable_to_non_nullable
as bool,email_enabled: null == email_enabled ? _self.email_enabled : email_enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
