// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_me_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthMeResponseModel {

 String get status; AuthMeData get data;
/// Create a copy of AuthMeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthMeResponseModelCopyWith<AuthMeResponseModel> get copyWith => _$AuthMeResponseModelCopyWithImpl<AuthMeResponseModel>(this as AuthMeResponseModel, _$identity);

  /// Serializes this AuthMeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthMeResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthMeResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $AuthMeResponseModelCopyWith<$Res>  {
  factory $AuthMeResponseModelCopyWith(AuthMeResponseModel value, $Res Function(AuthMeResponseModel) _then) = _$AuthMeResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, AuthMeData data
});


$AuthMeDataCopyWith<$Res> get data;

}
/// @nodoc
class _$AuthMeResponseModelCopyWithImpl<$Res>
    implements $AuthMeResponseModelCopyWith<$Res> {
  _$AuthMeResponseModelCopyWithImpl(this._self, this._then);

  final AuthMeResponseModel _self;
  final $Res Function(AuthMeResponseModel) _then;

/// Create a copy of AuthMeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthMeData,
  ));
}
/// Create a copy of AuthMeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthMeDataCopyWith<$Res> get data {
  
  return $AuthMeDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthMeResponseModel].
extension AuthMeResponseModelPatterns on AuthMeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthMeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthMeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthMeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthMeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthMeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthMeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  AuthMeData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthMeResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  AuthMeData data)  $default,) {final _that = this;
switch (_that) {
case _AuthMeResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  AuthMeData data)?  $default,) {final _that = this;
switch (_that) {
case _AuthMeResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthMeResponseModel implements AuthMeResponseModel {
  const _AuthMeResponseModel({required this.status, required this.data});
  factory _AuthMeResponseModel.fromJson(Map<String, dynamic> json) => _$AuthMeResponseModelFromJson(json);

@override final  String status;
@override final  AuthMeData data;

/// Create a copy of AuthMeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthMeResponseModelCopyWith<_AuthMeResponseModel> get copyWith => __$AuthMeResponseModelCopyWithImpl<_AuthMeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthMeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthMeResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'AuthMeResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AuthMeResponseModelCopyWith<$Res> implements $AuthMeResponseModelCopyWith<$Res> {
  factory _$AuthMeResponseModelCopyWith(_AuthMeResponseModel value, $Res Function(_AuthMeResponseModel) _then) = __$AuthMeResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, AuthMeData data
});


@override $AuthMeDataCopyWith<$Res> get data;

}
/// @nodoc
class __$AuthMeResponseModelCopyWithImpl<$Res>
    implements _$AuthMeResponseModelCopyWith<$Res> {
  __$AuthMeResponseModelCopyWithImpl(this._self, this._then);

  final _AuthMeResponseModel _self;
  final $Res Function(_AuthMeResponseModel) _then;

/// Create a copy of AuthMeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_AuthMeResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthMeData,
  ));
}

/// Create a copy of AuthMeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthMeDataCopyWith<$Res> get data {
  
  return $AuthMeDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AuthMeData {

 String get id; String get email; String get role; String? get display_name; String? get avatar_url; bool get registration_complete; String? get listener_profile_status;
/// Create a copy of AuthMeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthMeDataCopyWith<AuthMeData> get copyWith => _$AuthMeDataCopyWithImpl<AuthMeData>(this as AuthMeData, _$identity);

  /// Serializes this AuthMeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthMeData&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.display_name, display_name) || other.display_name == display_name)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.registration_complete, registration_complete) || other.registration_complete == registration_complete)&&(identical(other.listener_profile_status, listener_profile_status) || other.listener_profile_status == listener_profile_status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,display_name,avatar_url,registration_complete,listener_profile_status);

@override
String toString() {
  return 'AuthMeData(id: $id, email: $email, role: $role, display_name: $display_name, avatar_url: $avatar_url, registration_complete: $registration_complete, listener_profile_status: $listener_profile_status)';
}


}

/// @nodoc
abstract mixin class $AuthMeDataCopyWith<$Res>  {
  factory $AuthMeDataCopyWith(AuthMeData value, $Res Function(AuthMeData) _then) = _$AuthMeDataCopyWithImpl;
@useResult
$Res call({
 String id, String email, String role, String? display_name, String? avatar_url, bool registration_complete, String? listener_profile_status
});




}
/// @nodoc
class _$AuthMeDataCopyWithImpl<$Res>
    implements $AuthMeDataCopyWith<$Res> {
  _$AuthMeDataCopyWithImpl(this._self, this._then);

  final AuthMeData _self;
  final $Res Function(AuthMeData) _then;

/// Create a copy of AuthMeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? role = null,Object? display_name = freezed,Object? avatar_url = freezed,Object? registration_complete = null,Object? listener_profile_status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,display_name: freezed == display_name ? _self.display_name : display_name // ignore: cast_nullable_to_non_nullable
as String?,avatar_url: freezed == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String?,registration_complete: null == registration_complete ? _self.registration_complete : registration_complete // ignore: cast_nullable_to_non_nullable
as bool,listener_profile_status: freezed == listener_profile_status ? _self.listener_profile_status : listener_profile_status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthMeData].
extension AuthMeDataPatterns on AuthMeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthMeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthMeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthMeData value)  $default,){
final _that = this;
switch (_that) {
case _AuthMeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthMeData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthMeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String role,  String? display_name,  String? avatar_url,  bool registration_complete,  String? listener_profile_status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthMeData() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.display_name,_that.avatar_url,_that.registration_complete,_that.listener_profile_status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String role,  String? display_name,  String? avatar_url,  bool registration_complete,  String? listener_profile_status)  $default,) {final _that = this;
switch (_that) {
case _AuthMeData():
return $default(_that.id,_that.email,_that.role,_that.display_name,_that.avatar_url,_that.registration_complete,_that.listener_profile_status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String role,  String? display_name,  String? avatar_url,  bool registration_complete,  String? listener_profile_status)?  $default,) {final _that = this;
switch (_that) {
case _AuthMeData() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.display_name,_that.avatar_url,_that.registration_complete,_that.listener_profile_status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthMeData implements AuthMeData {
  const _AuthMeData({required this.id, required this.email, required this.role, this.display_name, this.avatar_url, this.registration_complete = false, this.listener_profile_status});
  factory _AuthMeData.fromJson(Map<String, dynamic> json) => _$AuthMeDataFromJson(json);

@override final  String id;
@override final  String email;
@override final  String role;
@override final  String? display_name;
@override final  String? avatar_url;
@override@JsonKey() final  bool registration_complete;
@override final  String? listener_profile_status;

/// Create a copy of AuthMeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthMeDataCopyWith<_AuthMeData> get copyWith => __$AuthMeDataCopyWithImpl<_AuthMeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthMeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthMeData&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.display_name, display_name) || other.display_name == display_name)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.registration_complete, registration_complete) || other.registration_complete == registration_complete)&&(identical(other.listener_profile_status, listener_profile_status) || other.listener_profile_status == listener_profile_status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,display_name,avatar_url,registration_complete,listener_profile_status);

@override
String toString() {
  return 'AuthMeData(id: $id, email: $email, role: $role, display_name: $display_name, avatar_url: $avatar_url, registration_complete: $registration_complete, listener_profile_status: $listener_profile_status)';
}


}

/// @nodoc
abstract mixin class _$AuthMeDataCopyWith<$Res> implements $AuthMeDataCopyWith<$Res> {
  factory _$AuthMeDataCopyWith(_AuthMeData value, $Res Function(_AuthMeData) _then) = __$AuthMeDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String role, String? display_name, String? avatar_url, bool registration_complete, String? listener_profile_status
});




}
/// @nodoc
class __$AuthMeDataCopyWithImpl<$Res>
    implements _$AuthMeDataCopyWith<$Res> {
  __$AuthMeDataCopyWithImpl(this._self, this._then);

  final _AuthMeData _self;
  final $Res Function(_AuthMeData) _then;

/// Create a copy of AuthMeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? role = null,Object? display_name = freezed,Object? avatar_url = freezed,Object? registration_complete = null,Object? listener_profile_status = freezed,}) {
  return _then(_AuthMeData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,display_name: freezed == display_name ? _self.display_name : display_name // ignore: cast_nullable_to_non_nullable
as String?,avatar_url: freezed == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String?,registration_complete: null == registration_complete ? _self.registration_complete : registration_complete // ignore: cast_nullable_to_non_nullable
as bool,listener_profile_status: freezed == listener_profile_status ? _self.listener_profile_status : listener_profile_status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
