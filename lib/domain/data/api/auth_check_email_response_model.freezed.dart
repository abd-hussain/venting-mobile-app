// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_check_email_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthCheckEmailResponseModel {

 String get status; AuthCheckEmailData get data;
/// Create a copy of AuthCheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCheckEmailResponseModelCopyWith<AuthCheckEmailResponseModel> get copyWith => _$AuthCheckEmailResponseModelCopyWithImpl<AuthCheckEmailResponseModel>(this as AuthCheckEmailResponseModel, _$identity);

  /// Serializes this AuthCheckEmailResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCheckEmailResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthCheckEmailResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $AuthCheckEmailResponseModelCopyWith<$Res>  {
  factory $AuthCheckEmailResponseModelCopyWith(AuthCheckEmailResponseModel value, $Res Function(AuthCheckEmailResponseModel) _then) = _$AuthCheckEmailResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, AuthCheckEmailData data
});


$AuthCheckEmailDataCopyWith<$Res> get data;

}
/// @nodoc
class _$AuthCheckEmailResponseModelCopyWithImpl<$Res>
    implements $AuthCheckEmailResponseModelCopyWith<$Res> {
  _$AuthCheckEmailResponseModelCopyWithImpl(this._self, this._then);

  final AuthCheckEmailResponseModel _self;
  final $Res Function(AuthCheckEmailResponseModel) _then;

/// Create a copy of AuthCheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthCheckEmailData,
  ));
}
/// Create a copy of AuthCheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthCheckEmailDataCopyWith<$Res> get data {
  
  return $AuthCheckEmailDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthCheckEmailResponseModel].
extension AuthCheckEmailResponseModelPatterns on AuthCheckEmailResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthCheckEmailResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthCheckEmailResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthCheckEmailResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthCheckEmailResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthCheckEmailResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthCheckEmailResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  AuthCheckEmailData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthCheckEmailResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  AuthCheckEmailData data)  $default,) {final _that = this;
switch (_that) {
case _AuthCheckEmailResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  AuthCheckEmailData data)?  $default,) {final _that = this;
switch (_that) {
case _AuthCheckEmailResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthCheckEmailResponseModel implements AuthCheckEmailResponseModel {
  const _AuthCheckEmailResponseModel({required this.status, required this.data});
  factory _AuthCheckEmailResponseModel.fromJson(Map<String, dynamic> json) => _$AuthCheckEmailResponseModelFromJson(json);

@override final  String status;
@override final  AuthCheckEmailData data;

/// Create a copy of AuthCheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthCheckEmailResponseModelCopyWith<_AuthCheckEmailResponseModel> get copyWith => __$AuthCheckEmailResponseModelCopyWithImpl<_AuthCheckEmailResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthCheckEmailResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthCheckEmailResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthCheckEmailResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AuthCheckEmailResponseModelCopyWith<$Res> implements $AuthCheckEmailResponseModelCopyWith<$Res> {
  factory _$AuthCheckEmailResponseModelCopyWith(_AuthCheckEmailResponseModel value, $Res Function(_AuthCheckEmailResponseModel) _then) = __$AuthCheckEmailResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, AuthCheckEmailData data
});


@override $AuthCheckEmailDataCopyWith<$Res> get data;

}
/// @nodoc
class __$AuthCheckEmailResponseModelCopyWithImpl<$Res>
    implements _$AuthCheckEmailResponseModelCopyWith<$Res> {
  __$AuthCheckEmailResponseModelCopyWithImpl(this._self, this._then);

  final _AuthCheckEmailResponseModel _self;
  final $Res Function(_AuthCheckEmailResponseModel) _then;

/// Create a copy of AuthCheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_AuthCheckEmailResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthCheckEmailData,
  ));
}

/// Create a copy of AuthCheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthCheckEmailDataCopyWith<$Res> get data {
  
  return $AuthCheckEmailDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AuthCheckEmailData {

 bool get exists; String get email; String? get role; bool? get registration_complete; String? get listener_profile_status;
/// Create a copy of AuthCheckEmailData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCheckEmailDataCopyWith<AuthCheckEmailData> get copyWith => _$AuthCheckEmailDataCopyWithImpl<AuthCheckEmailData>(this as AuthCheckEmailData, _$identity);

  /// Serializes this AuthCheckEmailData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCheckEmailData&&(identical(other.exists, exists) || other.exists == exists)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.registration_complete, registration_complete) || other.registration_complete == registration_complete)&&(identical(other.listener_profile_status, listener_profile_status) || other.listener_profile_status == listener_profile_status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exists,email,role,registration_complete,listener_profile_status);

@override
String toString() {
  return 'AuthCheckEmailData(exists: $exists, email: $email, role: $role, registration_complete: $registration_complete, listener_profile_status: $listener_profile_status)';
}


}

/// @nodoc
abstract mixin class $AuthCheckEmailDataCopyWith<$Res>  {
  factory $AuthCheckEmailDataCopyWith(AuthCheckEmailData value, $Res Function(AuthCheckEmailData) _then) = _$AuthCheckEmailDataCopyWithImpl;
@useResult
$Res call({
 bool exists, String email, String? role, bool? registration_complete, String? listener_profile_status
});




}
/// @nodoc
class _$AuthCheckEmailDataCopyWithImpl<$Res>
    implements $AuthCheckEmailDataCopyWith<$Res> {
  _$AuthCheckEmailDataCopyWithImpl(this._self, this._then);

  final AuthCheckEmailData _self;
  final $Res Function(AuthCheckEmailData) _then;

/// Create a copy of AuthCheckEmailData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exists = null,Object? email = null,Object? role = freezed,Object? registration_complete = freezed,Object? listener_profile_status = freezed,}) {
  return _then(_self.copyWith(
exists: null == exists ? _self.exists : exists // ignore: cast_nullable_to_non_nullable
as bool,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,registration_complete: freezed == registration_complete ? _self.registration_complete : registration_complete // ignore: cast_nullable_to_non_nullable
as bool?,listener_profile_status: freezed == listener_profile_status ? _self.listener_profile_status : listener_profile_status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthCheckEmailData].
extension AuthCheckEmailDataPatterns on AuthCheckEmailData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthCheckEmailData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthCheckEmailData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthCheckEmailData value)  $default,){
final _that = this;
switch (_that) {
case _AuthCheckEmailData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthCheckEmailData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthCheckEmailData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool exists,  String email,  String? role,  bool? registration_complete,  String? listener_profile_status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthCheckEmailData() when $default != null:
return $default(_that.exists,_that.email,_that.role,_that.registration_complete,_that.listener_profile_status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool exists,  String email,  String? role,  bool? registration_complete,  String? listener_profile_status)  $default,) {final _that = this;
switch (_that) {
case _AuthCheckEmailData():
return $default(_that.exists,_that.email,_that.role,_that.registration_complete,_that.listener_profile_status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool exists,  String email,  String? role,  bool? registration_complete,  String? listener_profile_status)?  $default,) {final _that = this;
switch (_that) {
case _AuthCheckEmailData() when $default != null:
return $default(_that.exists,_that.email,_that.role,_that.registration_complete,_that.listener_profile_status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthCheckEmailData implements AuthCheckEmailData {
  const _AuthCheckEmailData({required this.exists, required this.email, this.role, this.registration_complete, this.listener_profile_status});
  factory _AuthCheckEmailData.fromJson(Map<String, dynamic> json) => _$AuthCheckEmailDataFromJson(json);

@override final  bool exists;
@override final  String email;
@override final  String? role;
@override final  bool? registration_complete;
@override final  String? listener_profile_status;

/// Create a copy of AuthCheckEmailData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthCheckEmailDataCopyWith<_AuthCheckEmailData> get copyWith => __$AuthCheckEmailDataCopyWithImpl<_AuthCheckEmailData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthCheckEmailDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthCheckEmailData&&(identical(other.exists, exists) || other.exists == exists)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.registration_complete, registration_complete) || other.registration_complete == registration_complete)&&(identical(other.listener_profile_status, listener_profile_status) || other.listener_profile_status == listener_profile_status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exists,email,role,registration_complete,listener_profile_status);

@override
String toString() {
  return 'AuthCheckEmailData(exists: $exists, email: $email, role: $role, registration_complete: $registration_complete, listener_profile_status: $listener_profile_status)';
}


}

/// @nodoc
abstract mixin class _$AuthCheckEmailDataCopyWith<$Res> implements $AuthCheckEmailDataCopyWith<$Res> {
  factory _$AuthCheckEmailDataCopyWith(_AuthCheckEmailData value, $Res Function(_AuthCheckEmailData) _then) = __$AuthCheckEmailDataCopyWithImpl;
@override @useResult
$Res call({
 bool exists, String email, String? role, bool? registration_complete, String? listener_profile_status
});




}
/// @nodoc
class __$AuthCheckEmailDataCopyWithImpl<$Res>
    implements _$AuthCheckEmailDataCopyWith<$Res> {
  __$AuthCheckEmailDataCopyWithImpl(this._self, this._then);

  final _AuthCheckEmailData _self;
  final $Res Function(_AuthCheckEmailData) _then;

/// Create a copy of AuthCheckEmailData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exists = null,Object? email = null,Object? role = freezed,Object? registration_complete = freezed,Object? listener_profile_status = freezed,}) {
  return _then(_AuthCheckEmailData(
exists: null == exists ? _self.exists : exists // ignore: cast_nullable_to_non_nullable
as bool,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,registration_complete: freezed == registration_complete ? _self.registration_complete : registration_complete // ignore: cast_nullable_to_non_nullable
as bool?,listener_profile_status: freezed == listener_profile_status ? _self.listener_profile_status : listener_profile_status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
