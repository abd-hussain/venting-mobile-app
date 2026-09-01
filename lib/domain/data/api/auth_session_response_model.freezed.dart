// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthSessionResponseModel {

 String get status; AuthSessionData get data;
/// Create a copy of AuthSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSessionResponseModelCopyWith<AuthSessionResponseModel> get copyWith => _$AuthSessionResponseModelCopyWithImpl<AuthSessionResponseModel>(this as AuthSessionResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthSessionResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $AuthSessionResponseModelCopyWith<$Res>  {
  factory $AuthSessionResponseModelCopyWith(AuthSessionResponseModel value, $Res Function(AuthSessionResponseModel) _then) = _$AuthSessionResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, AuthSessionData data
});


$AuthSessionDataCopyWith<$Res> get data;

}
/// @nodoc
class _$AuthSessionResponseModelCopyWithImpl<$Res>
    implements $AuthSessionResponseModelCopyWith<$Res> {
  _$AuthSessionResponseModelCopyWithImpl(this._self, this._then);

  final AuthSessionResponseModel _self;
  final $Res Function(AuthSessionResponseModel) _then;

/// Create a copy of AuthSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthSessionData,
  ));
}
/// Create a copy of AuthSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthSessionDataCopyWith<$Res> get data {
  
  return $AuthSessionDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthSessionResponseModel].
extension AuthSessionResponseModelPatterns on AuthSessionResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthSessionResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSessionResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthSessionResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthSessionResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthSessionResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthSessionResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  AuthSessionData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthSessionResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  AuthSessionData data)  $default,) {final _that = this;
switch (_that) {
case _AuthSessionResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  AuthSessionData data)?  $default,) {final _that = this;
switch (_that) {
case _AuthSessionResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _AuthSessionResponseModel implements AuthSessionResponseModel {
  const _AuthSessionResponseModel({required this.status, required this.data});
  

@override final  String status;
@override final  AuthSessionData data;

/// Create a copy of AuthSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSessionResponseModelCopyWith<_AuthSessionResponseModel> get copyWith => __$AuthSessionResponseModelCopyWithImpl<_AuthSessionResponseModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSessionResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthSessionResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AuthSessionResponseModelCopyWith<$Res> implements $AuthSessionResponseModelCopyWith<$Res> {
  factory _$AuthSessionResponseModelCopyWith(_AuthSessionResponseModel value, $Res Function(_AuthSessionResponseModel) _then) = __$AuthSessionResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, AuthSessionData data
});


@override $AuthSessionDataCopyWith<$Res> get data;

}
/// @nodoc
class __$AuthSessionResponseModelCopyWithImpl<$Res>
    implements _$AuthSessionResponseModelCopyWith<$Res> {
  __$AuthSessionResponseModelCopyWithImpl(this._self, this._then);

  final _AuthSessionResponseModel _self;
  final $Res Function(_AuthSessionResponseModel) _then;

/// Create a copy of AuthSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_AuthSessionResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthSessionData,
  ));
}

/// Create a copy of AuthSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthSessionDataCopyWith<$Res> get data {
  
  return $AuthSessionDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc
mixin _$AuthSessionData {

 String get access_token; String get refresh_token; AuthUserModel get user;
/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSessionDataCopyWith<AuthSessionData> get copyWith => _$AuthSessionDataCopyWithImpl<AuthSessionData>(this as AuthSessionData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionData&&(identical(other.access_token, access_token) || other.access_token == access_token)&&(identical(other.refresh_token, refresh_token) || other.refresh_token == refresh_token)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,access_token,refresh_token,user);

@override
String toString() {
  return 'AuthSessionData(access_token: $access_token, refresh_token: $refresh_token, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthSessionDataCopyWith<$Res>  {
  factory $AuthSessionDataCopyWith(AuthSessionData value, $Res Function(AuthSessionData) _then) = _$AuthSessionDataCopyWithImpl;
@useResult
$Res call({
 String access_token, String refresh_token, AuthUserModel user
});


$AuthUserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthSessionDataCopyWithImpl<$Res>
    implements $AuthSessionDataCopyWith<$Res> {
  _$AuthSessionDataCopyWithImpl(this._self, this._then);

  final AuthSessionData _self;
  final $Res Function(AuthSessionData) _then;

/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? access_token = null,Object? refresh_token = null,Object? user = null,}) {
  return _then(_self.copyWith(
access_token: null == access_token ? _self.access_token : access_token // ignore: cast_nullable_to_non_nullable
as String,refresh_token: null == refresh_token ? _self.refresh_token : refresh_token // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel,
  ));
}
/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res> get user {
  
  return $AuthUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthSessionData].
extension AuthSessionDataPatterns on AuthSessionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthSessionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSessionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthSessionData value)  $default,){
final _that = this;
switch (_that) {
case _AuthSessionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthSessionData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthSessionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String access_token,  String refresh_token,  AuthUserModel user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthSessionData() when $default != null:
return $default(_that.access_token,_that.refresh_token,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String access_token,  String refresh_token,  AuthUserModel user)  $default,) {final _that = this;
switch (_that) {
case _AuthSessionData():
return $default(_that.access_token,_that.refresh_token,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String access_token,  String refresh_token,  AuthUserModel user)?  $default,) {final _that = this;
switch (_that) {
case _AuthSessionData() when $default != null:
return $default(_that.access_token,_that.refresh_token,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _AuthSessionData implements AuthSessionData {
  const _AuthSessionData({required this.access_token, required this.refresh_token, required this.user});
  

@override final  String access_token;
@override final  String refresh_token;
@override final  AuthUserModel user;

/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSessionDataCopyWith<_AuthSessionData> get copyWith => __$AuthSessionDataCopyWithImpl<_AuthSessionData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSessionData&&(identical(other.access_token, access_token) || other.access_token == access_token)&&(identical(other.refresh_token, refresh_token) || other.refresh_token == refresh_token)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,access_token,refresh_token,user);

@override
String toString() {
  return 'AuthSessionData(access_token: $access_token, refresh_token: $refresh_token, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthSessionDataCopyWith<$Res> implements $AuthSessionDataCopyWith<$Res> {
  factory _$AuthSessionDataCopyWith(_AuthSessionData value, $Res Function(_AuthSessionData) _then) = __$AuthSessionDataCopyWithImpl;
@override @useResult
$Res call({
 String access_token, String refresh_token, AuthUserModel user
});


@override $AuthUserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthSessionDataCopyWithImpl<$Res>
    implements _$AuthSessionDataCopyWith<$Res> {
  __$AuthSessionDataCopyWithImpl(this._self, this._then);

  final _AuthSessionData _self;
  final $Res Function(_AuthSessionData) _then;

/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? access_token = null,Object? refresh_token = null,Object? user = null,}) {
  return _then(_AuthSessionData(
access_token: null == access_token ? _self.access_token : access_token // ignore: cast_nullable_to_non_nullable
as String,refresh_token: null == refresh_token ? _self.refresh_token : refresh_token // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel,
  ));
}

/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res> get user {
  
  return $AuthUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
