// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_ok_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthOkResponseModel {

 String get status; AuthOkData get data;
/// Create a copy of AuthOkResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthOkResponseModelCopyWith<AuthOkResponseModel> get copyWith => _$AuthOkResponseModelCopyWithImpl<AuthOkResponseModel>(this as AuthOkResponseModel, _$identity);

  /// Serializes this AuthOkResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthOkResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthOkResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $AuthOkResponseModelCopyWith<$Res>  {
  factory $AuthOkResponseModelCopyWith(AuthOkResponseModel value, $Res Function(AuthOkResponseModel) _then) = _$AuthOkResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, AuthOkData data
});


$AuthOkDataCopyWith<$Res> get data;

}
/// @nodoc
class _$AuthOkResponseModelCopyWithImpl<$Res>
    implements $AuthOkResponseModelCopyWith<$Res> {
  _$AuthOkResponseModelCopyWithImpl(this._self, this._then);

  final AuthOkResponseModel _self;
  final $Res Function(AuthOkResponseModel) _then;

/// Create a copy of AuthOkResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthOkData,
  ));
}
/// Create a copy of AuthOkResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthOkDataCopyWith<$Res> get data {
  
  return $AuthOkDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthOkResponseModel].
extension AuthOkResponseModelPatterns on AuthOkResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthOkResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthOkResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthOkResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthOkResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthOkResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthOkResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  AuthOkData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthOkResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  AuthOkData data)  $default,) {final _that = this;
switch (_that) {
case _AuthOkResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  AuthOkData data)?  $default,) {final _that = this;
switch (_that) {
case _AuthOkResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthOkResponseModel implements AuthOkResponseModel {
  const _AuthOkResponseModel({required this.status, required this.data});
  factory _AuthOkResponseModel.fromJson(Map<String, dynamic> json) => _$AuthOkResponseModelFromJson(json);

@override final  String status;
@override final  AuthOkData data;

/// Create a copy of AuthOkResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthOkResponseModelCopyWith<_AuthOkResponseModel> get copyWith => __$AuthOkResponseModelCopyWithImpl<_AuthOkResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthOkResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthOkResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthOkResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AuthOkResponseModelCopyWith<$Res> implements $AuthOkResponseModelCopyWith<$Res> {
  factory _$AuthOkResponseModelCopyWith(_AuthOkResponseModel value, $Res Function(_AuthOkResponseModel) _then) = __$AuthOkResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, AuthOkData data
});


@override $AuthOkDataCopyWith<$Res> get data;

}
/// @nodoc
class __$AuthOkResponseModelCopyWithImpl<$Res>
    implements _$AuthOkResponseModelCopyWith<$Res> {
  __$AuthOkResponseModelCopyWithImpl(this._self, this._then);

  final _AuthOkResponseModel _self;
  final $Res Function(_AuthOkResponseModel) _then;

/// Create a copy of AuthOkResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_AuthOkResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthOkData,
  ));
}

/// Create a copy of AuthOkResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthOkDataCopyWith<$Res> get data {
  
  return $AuthOkDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AuthOkData {

 bool get ok;
/// Create a copy of AuthOkData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthOkDataCopyWith<AuthOkData> get copyWith => _$AuthOkDataCopyWithImpl<AuthOkData>(this as AuthOkData, _$identity);

  /// Serializes this AuthOkData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthOkData&&(identical(other.ok, ok) || other.ok == ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok);

@override
String toString() {
  return 'AuthOkData(ok: $ok)';
}


}

/// @nodoc
abstract mixin class $AuthOkDataCopyWith<$Res>  {
  factory $AuthOkDataCopyWith(AuthOkData value, $Res Function(AuthOkData) _then) = _$AuthOkDataCopyWithImpl;
@useResult
$Res call({
 bool ok
});




}
/// @nodoc
class _$AuthOkDataCopyWithImpl<$Res>
    implements $AuthOkDataCopyWith<$Res> {
  _$AuthOkDataCopyWithImpl(this._self, this._then);

  final AuthOkData _self;
  final $Res Function(AuthOkData) _then;

/// Create a copy of AuthOkData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ok = null,}) {
  return _then(_self.copyWith(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthOkData].
extension AuthOkDataPatterns on AuthOkData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthOkData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthOkData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthOkData value)  $default,){
final _that = this;
switch (_that) {
case _AuthOkData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthOkData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthOkData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ok)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthOkData() when $default != null:
return $default(_that.ok);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ok)  $default,) {final _that = this;
switch (_that) {
case _AuthOkData():
return $default(_that.ok);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ok)?  $default,) {final _that = this;
switch (_that) {
case _AuthOkData() when $default != null:
return $default(_that.ok);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthOkData implements AuthOkData {
  const _AuthOkData({this.ok = true});
  factory _AuthOkData.fromJson(Map<String, dynamic> json) => _$AuthOkDataFromJson(json);

@override@JsonKey() final  bool ok;

/// Create a copy of AuthOkData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthOkDataCopyWith<_AuthOkData> get copyWith => __$AuthOkDataCopyWithImpl<_AuthOkData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthOkDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthOkData&&(identical(other.ok, ok) || other.ok == ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok);

@override
String toString() {
  return 'AuthOkData(ok: $ok)';
}


}

/// @nodoc
abstract mixin class _$AuthOkDataCopyWith<$Res> implements $AuthOkDataCopyWith<$Res> {
  factory _$AuthOkDataCopyWith(_AuthOkData value, $Res Function(_AuthOkData) _then) = __$AuthOkDataCopyWithImpl;
@override @useResult
$Res call({
 bool ok
});




}
/// @nodoc
class __$AuthOkDataCopyWithImpl<$Res>
    implements _$AuthOkDataCopyWith<$Res> {
  __$AuthOkDataCopyWithImpl(this._self, this._then);

  final _AuthOkData _self;
  final $Res Function(_AuthOkData) _then;

/// Create a copy of AuthOkData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,}) {
  return _then(_AuthOkData(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
