// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefreshTokenResponseModel {

 String get status; RefreshTokenData get data;
/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenResponseModelCopyWith<RefreshTokenResponseModel> get copyWith => _$RefreshTokenResponseModelCopyWithImpl<RefreshTokenResponseModel>(this as RefreshTokenResponseModel, _$identity);

  /// Serializes this RefreshTokenResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'RefreshTokenResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenResponseModelCopyWith<$Res>  {
  factory $RefreshTokenResponseModelCopyWith(RefreshTokenResponseModel value, $Res Function(RefreshTokenResponseModel) _then) = _$RefreshTokenResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, RefreshTokenData data
});


$RefreshTokenDataCopyWith<$Res> get data;

}
/// @nodoc
class _$RefreshTokenResponseModelCopyWithImpl<$Res>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  _$RefreshTokenResponseModelCopyWithImpl(this._self, this._then);

  final RefreshTokenResponseModel _self;
  final $Res Function(RefreshTokenResponseModel) _then;

/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RefreshTokenData,
  ));
}
/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefreshTokenDataCopyWith<$Res> get data {
  
  return $RefreshTokenDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [RefreshTokenResponseModel].
extension RefreshTokenResponseModelPatterns on RefreshTokenResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  RefreshTokenData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  RefreshTokenData data)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  RefreshTokenData data)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenResponseModel implements RefreshTokenResponseModel {
  const _RefreshTokenResponseModel({required this.status, required this.data});
  factory _RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseModelFromJson(json);

@override final  String status;
@override final  RefreshTokenData data;

/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenResponseModelCopyWith<_RefreshTokenResponseModel> get copyWith => __$RefreshTokenResponseModelCopyWithImpl<_RefreshTokenResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'RefreshTokenResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenResponseModelCopyWith<$Res> implements $RefreshTokenResponseModelCopyWith<$Res> {
  factory _$RefreshTokenResponseModelCopyWith(_RefreshTokenResponseModel value, $Res Function(_RefreshTokenResponseModel) _then) = __$RefreshTokenResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, RefreshTokenData data
});


@override $RefreshTokenDataCopyWith<$Res> get data;

}
/// @nodoc
class __$RefreshTokenResponseModelCopyWithImpl<$Res>
    implements _$RefreshTokenResponseModelCopyWith<$Res> {
  __$RefreshTokenResponseModelCopyWithImpl(this._self, this._then);

  final _RefreshTokenResponseModel _self;
  final $Res Function(_RefreshTokenResponseModel) _then;

/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_RefreshTokenResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RefreshTokenData,
  ));
}

/// Create a copy of RefreshTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefreshTokenDataCopyWith<$Res> get data {
  
  return $RefreshTokenDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$RefreshTokenData {

 String get access_token; String get refresh_token;
/// Create a copy of RefreshTokenData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenDataCopyWith<RefreshTokenData> get copyWith => _$RefreshTokenDataCopyWithImpl<RefreshTokenData>(this as RefreshTokenData, _$identity);

  /// Serializes this RefreshTokenData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenData&&(identical(other.access_token, access_token) || other.access_token == access_token)&&(identical(other.refresh_token, refresh_token) || other.refresh_token == refresh_token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,access_token,refresh_token);

@override
String toString() {
  return 'RefreshTokenData(access_token: $access_token, refresh_token: $refresh_token)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenDataCopyWith<$Res>  {
  factory $RefreshTokenDataCopyWith(RefreshTokenData value, $Res Function(RefreshTokenData) _then) = _$RefreshTokenDataCopyWithImpl;
@useResult
$Res call({
 String access_token, String refresh_token
});




}
/// @nodoc
class _$RefreshTokenDataCopyWithImpl<$Res>
    implements $RefreshTokenDataCopyWith<$Res> {
  _$RefreshTokenDataCopyWithImpl(this._self, this._then);

  final RefreshTokenData _self;
  final $Res Function(RefreshTokenData) _then;

/// Create a copy of RefreshTokenData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? access_token = null,Object? refresh_token = null,}) {
  return _then(_self.copyWith(
access_token: null == access_token ? _self.access_token : access_token // ignore: cast_nullable_to_non_nullable
as String,refresh_token: null == refresh_token ? _self.refresh_token : refresh_token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshTokenData].
extension RefreshTokenDataPatterns on RefreshTokenData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenData value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenData value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String access_token,  String refresh_token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenData() when $default != null:
return $default(_that.access_token,_that.refresh_token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String access_token,  String refresh_token)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenData():
return $default(_that.access_token,_that.refresh_token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String access_token,  String refresh_token)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenData() when $default != null:
return $default(_that.access_token,_that.refresh_token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenData implements RefreshTokenData {
  const _RefreshTokenData({required this.access_token, required this.refresh_token});
  factory _RefreshTokenData.fromJson(Map<String, dynamic> json) => _$RefreshTokenDataFromJson(json);

@override final  String access_token;
@override final  String refresh_token;

/// Create a copy of RefreshTokenData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenDataCopyWith<_RefreshTokenData> get copyWith => __$RefreshTokenDataCopyWithImpl<_RefreshTokenData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenData&&(identical(other.access_token, access_token) || other.access_token == access_token)&&(identical(other.refresh_token, refresh_token) || other.refresh_token == refresh_token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,access_token,refresh_token);

@override
String toString() {
  return 'RefreshTokenData(access_token: $access_token, refresh_token: $refresh_token)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenDataCopyWith<$Res> implements $RefreshTokenDataCopyWith<$Res> {
  factory _$RefreshTokenDataCopyWith(_RefreshTokenData value, $Res Function(_RefreshTokenData) _then) = __$RefreshTokenDataCopyWithImpl;
@override @useResult
$Res call({
 String access_token, String refresh_token
});




}
/// @nodoc
class __$RefreshTokenDataCopyWithImpl<$Res>
    implements _$RefreshTokenDataCopyWith<$Res> {
  __$RefreshTokenDataCopyWithImpl(this._self, this._then);

  final _RefreshTokenData _self;
  final $Res Function(_RefreshTokenData) _then;

/// Create a copy of RefreshTokenData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? access_token = null,Object? refresh_token = null,}) {
  return _then(_RefreshTokenData(
access_token: null == access_token ? _self.access_token : access_token // ignore: cast_nullable_to_non_nullable
as String,refresh_token: null == refresh_token ? _self.refresh_token : refresh_token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
