// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_forgot_password_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthForgotPasswordResponseModel {

 String get status; AuthForgotPasswordData get data;
/// Create a copy of AuthForgotPasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthForgotPasswordResponseModelCopyWith<AuthForgotPasswordResponseModel> get copyWith => _$AuthForgotPasswordResponseModelCopyWithImpl<AuthForgotPasswordResponseModel>(this as AuthForgotPasswordResponseModel, _$identity);

  /// Serializes this AuthForgotPasswordResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthForgotPasswordResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthForgotPasswordResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $AuthForgotPasswordResponseModelCopyWith<$Res>  {
  factory $AuthForgotPasswordResponseModelCopyWith(AuthForgotPasswordResponseModel value, $Res Function(AuthForgotPasswordResponseModel) _then) = _$AuthForgotPasswordResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, AuthForgotPasswordData data
});


$AuthForgotPasswordDataCopyWith<$Res> get data;

}
/// @nodoc
class _$AuthForgotPasswordResponseModelCopyWithImpl<$Res>
    implements $AuthForgotPasswordResponseModelCopyWith<$Res> {
  _$AuthForgotPasswordResponseModelCopyWithImpl(this._self, this._then);

  final AuthForgotPasswordResponseModel _self;
  final $Res Function(AuthForgotPasswordResponseModel) _then;

/// Create a copy of AuthForgotPasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthForgotPasswordData,
  ));
}
/// Create a copy of AuthForgotPasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthForgotPasswordDataCopyWith<$Res> get data {
  
  return $AuthForgotPasswordDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthForgotPasswordResponseModel].
extension AuthForgotPasswordResponseModelPatterns on AuthForgotPasswordResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthForgotPasswordResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthForgotPasswordResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthForgotPasswordResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthForgotPasswordResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthForgotPasswordResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthForgotPasswordResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  AuthForgotPasswordData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthForgotPasswordResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  AuthForgotPasswordData data)  $default,) {final _that = this;
switch (_that) {
case _AuthForgotPasswordResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  AuthForgotPasswordData data)?  $default,) {final _that = this;
switch (_that) {
case _AuthForgotPasswordResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthForgotPasswordResponseModel implements AuthForgotPasswordResponseModel {
  const _AuthForgotPasswordResponseModel({required this.status, required this.data});
  factory _AuthForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) => _$AuthForgotPasswordResponseModelFromJson(json);

@override final  String status;
@override final  AuthForgotPasswordData data;

/// Create a copy of AuthForgotPasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthForgotPasswordResponseModelCopyWith<_AuthForgotPasswordResponseModel> get copyWith => __$AuthForgotPasswordResponseModelCopyWithImpl<_AuthForgotPasswordResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthForgotPasswordResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthForgotPasswordResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthForgotPasswordResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AuthForgotPasswordResponseModelCopyWith<$Res> implements $AuthForgotPasswordResponseModelCopyWith<$Res> {
  factory _$AuthForgotPasswordResponseModelCopyWith(_AuthForgotPasswordResponseModel value, $Res Function(_AuthForgotPasswordResponseModel) _then) = __$AuthForgotPasswordResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, AuthForgotPasswordData data
});


@override $AuthForgotPasswordDataCopyWith<$Res> get data;

}
/// @nodoc
class __$AuthForgotPasswordResponseModelCopyWithImpl<$Res>
    implements _$AuthForgotPasswordResponseModelCopyWith<$Res> {
  __$AuthForgotPasswordResponseModelCopyWithImpl(this._self, this._then);

  final _AuthForgotPasswordResponseModel _self;
  final $Res Function(_AuthForgotPasswordResponseModel) _then;

/// Create a copy of AuthForgotPasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_AuthForgotPasswordResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthForgotPasswordData,
  ));
}

/// Create a copy of AuthForgotPasswordResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthForgotPasswordDataCopyWith<$Res> get data {
  
  return $AuthForgotPasswordDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AuthForgotPasswordData {

 String get email; bool get sent;
/// Create a copy of AuthForgotPasswordData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthForgotPasswordDataCopyWith<AuthForgotPasswordData> get copyWith => _$AuthForgotPasswordDataCopyWithImpl<AuthForgotPasswordData>(this as AuthForgotPasswordData, _$identity);

  /// Serializes this AuthForgotPasswordData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthForgotPasswordData&&(identical(other.email, email) || other.email == email)&&(identical(other.sent, sent) || other.sent == sent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,sent);

@override
String toString() {
  return 'AuthForgotPasswordData(email: $email, sent: $sent)';
}


}

/// @nodoc
abstract mixin class $AuthForgotPasswordDataCopyWith<$Res>  {
  factory $AuthForgotPasswordDataCopyWith(AuthForgotPasswordData value, $Res Function(AuthForgotPasswordData) _then) = _$AuthForgotPasswordDataCopyWithImpl;
@useResult
$Res call({
 String email, bool sent
});




}
/// @nodoc
class _$AuthForgotPasswordDataCopyWithImpl<$Res>
    implements $AuthForgotPasswordDataCopyWith<$Res> {
  _$AuthForgotPasswordDataCopyWithImpl(this._self, this._then);

  final AuthForgotPasswordData _self;
  final $Res Function(AuthForgotPasswordData) _then;

/// Create a copy of AuthForgotPasswordData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? sent = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,sent: null == sent ? _self.sent : sent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthForgotPasswordData].
extension AuthForgotPasswordDataPatterns on AuthForgotPasswordData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthForgotPasswordData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthForgotPasswordData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthForgotPasswordData value)  $default,){
final _that = this;
switch (_that) {
case _AuthForgotPasswordData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthForgotPasswordData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthForgotPasswordData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  bool sent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthForgotPasswordData() when $default != null:
return $default(_that.email,_that.sent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  bool sent)  $default,) {final _that = this;
switch (_that) {
case _AuthForgotPasswordData():
return $default(_that.email,_that.sent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  bool sent)?  $default,) {final _that = this;
switch (_that) {
case _AuthForgotPasswordData() when $default != null:
return $default(_that.email,_that.sent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthForgotPasswordData implements AuthForgotPasswordData {
  const _AuthForgotPasswordData({required this.email, this.sent = true});
  factory _AuthForgotPasswordData.fromJson(Map<String, dynamic> json) => _$AuthForgotPasswordDataFromJson(json);

@override final  String email;
@override@JsonKey() final  bool sent;

/// Create a copy of AuthForgotPasswordData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthForgotPasswordDataCopyWith<_AuthForgotPasswordData> get copyWith => __$AuthForgotPasswordDataCopyWithImpl<_AuthForgotPasswordData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthForgotPasswordDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthForgotPasswordData&&(identical(other.email, email) || other.email == email)&&(identical(other.sent, sent) || other.sent == sent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,sent);

@override
String toString() {
  return 'AuthForgotPasswordData(email: $email, sent: $sent)';
}


}

/// @nodoc
abstract mixin class _$AuthForgotPasswordDataCopyWith<$Res> implements $AuthForgotPasswordDataCopyWith<$Res> {
  factory _$AuthForgotPasswordDataCopyWith(_AuthForgotPasswordData value, $Res Function(_AuthForgotPasswordData) _then) = __$AuthForgotPasswordDataCopyWithImpl;
@override @useResult
$Res call({
 String email, bool sent
});




}
/// @nodoc
class __$AuthForgotPasswordDataCopyWithImpl<$Res>
    implements _$AuthForgotPasswordDataCopyWith<$Res> {
  __$AuthForgotPasswordDataCopyWithImpl(this._self, this._then);

  final _AuthForgotPasswordData _self;
  final $Res Function(_AuthForgotPasswordData) _then;

/// Create a copy of AuthForgotPasswordData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? sent = null,}) {
  return _then(_AuthForgotPasswordData(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,sent: null == sent ? _self.sent : sent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
