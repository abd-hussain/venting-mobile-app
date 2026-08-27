// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_profile_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerProfileResponseModel {

 String get status; ListenerProfileData get data;
/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerProfileResponseModelCopyWith<ListenerProfileResponseModel> get copyWith => _$ListenerProfileResponseModelCopyWithImpl<ListenerProfileResponseModel>(this as ListenerProfileResponseModel, _$identity);

  /// Serializes this ListenerProfileResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerProfileResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerProfileResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerProfileResponseModelCopyWith<$Res>  {
  factory $ListenerProfileResponseModelCopyWith(ListenerProfileResponseModel value, $Res Function(ListenerProfileResponseModel) _then) = _$ListenerProfileResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerProfileData data
});


$ListenerProfileDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerProfileResponseModelCopyWithImpl<$Res>
    implements $ListenerProfileResponseModelCopyWith<$Res> {
  _$ListenerProfileResponseModelCopyWithImpl(this._self, this._then);

  final ListenerProfileResponseModel _self;
  final $Res Function(ListenerProfileResponseModel) _then;

/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerProfileData,
  ));
}
/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerProfileDataCopyWith<$Res> get data {
  
  return $ListenerProfileDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerProfileResponseModel].
extension ListenerProfileResponseModelPatterns on ListenerProfileResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerProfileResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerProfileResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerProfileResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerProfileData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerProfileData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerProfileData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerProfileResponseModel implements ListenerProfileResponseModel {
  const _ListenerProfileResponseModel({required this.status, required this.data});
  factory _ListenerProfileResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerProfileResponseModelFromJson(json);

@override final  String status;
@override final  ListenerProfileData data;

/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerProfileResponseModelCopyWith<_ListenerProfileResponseModel> get copyWith => __$ListenerProfileResponseModelCopyWithImpl<_ListenerProfileResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerProfileResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerProfileResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerProfileResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerProfileResponseModelCopyWith<$Res> implements $ListenerProfileResponseModelCopyWith<$Res> {
  factory _$ListenerProfileResponseModelCopyWith(_ListenerProfileResponseModel value, $Res Function(_ListenerProfileResponseModel) _then) = __$ListenerProfileResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerProfileData data
});


@override $ListenerProfileDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerProfileResponseModelCopyWithImpl<$Res>
    implements _$ListenerProfileResponseModelCopyWith<$Res> {
  __$ListenerProfileResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerProfileResponseModel _self;
  final $Res Function(_ListenerProfileResponseModel) _then;

/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerProfileResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerProfileData,
  ));
}

/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerProfileDataCopyWith<$Res> get data {
  
  return $ListenerProfileDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerProfileData {

 String get phone; String get phone_country;
/// Create a copy of ListenerProfileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerProfileDataCopyWith<ListenerProfileData> get copyWith => _$ListenerProfileDataCopyWithImpl<ListenerProfileData>(this as ListenerProfileData, _$identity);

  /// Serializes this ListenerProfileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerProfileData&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phone_country, phone_country) || other.phone_country == phone_country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,phone_country);

@override
String toString() {
  return 'ListenerProfileData(phone: $phone, phone_country: $phone_country)';
}


}

/// @nodoc
abstract mixin class $ListenerProfileDataCopyWith<$Res>  {
  factory $ListenerProfileDataCopyWith(ListenerProfileData value, $Res Function(ListenerProfileData) _then) = _$ListenerProfileDataCopyWithImpl;
@useResult
$Res call({
 String phone, String phone_country
});




}
/// @nodoc
class _$ListenerProfileDataCopyWithImpl<$Res>
    implements $ListenerProfileDataCopyWith<$Res> {
  _$ListenerProfileDataCopyWithImpl(this._self, this._then);

  final ListenerProfileData _self;
  final $Res Function(ListenerProfileData) _then;

/// Create a copy of ListenerProfileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? phone_country = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phone_country: null == phone_country ? _self.phone_country : phone_country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerProfileData].
extension ListenerProfileDataPatterns on ListenerProfileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerProfileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerProfileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerProfileData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerProfileData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String phone_country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerProfileData() when $default != null:
return $default(_that.phone,_that.phone_country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String phone_country)  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileData():
return $default(_that.phone,_that.phone_country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String phone_country)?  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileData() when $default != null:
return $default(_that.phone,_that.phone_country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerProfileData implements ListenerProfileData {
  const _ListenerProfileData({this.phone = '', this.phone_country = ''});
  factory _ListenerProfileData.fromJson(Map<String, dynamic> json) => _$ListenerProfileDataFromJson(json);

@override@JsonKey() final  String phone;
@override@JsonKey() final  String phone_country;

/// Create a copy of ListenerProfileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerProfileDataCopyWith<_ListenerProfileData> get copyWith => __$ListenerProfileDataCopyWithImpl<_ListenerProfileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerProfileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerProfileData&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phone_country, phone_country) || other.phone_country == phone_country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,phone_country);

@override
String toString() {
  return 'ListenerProfileData(phone: $phone, phone_country: $phone_country)';
}


}

/// @nodoc
abstract mixin class _$ListenerProfileDataCopyWith<$Res> implements $ListenerProfileDataCopyWith<$Res> {
  factory _$ListenerProfileDataCopyWith(_ListenerProfileData value, $Res Function(_ListenerProfileData) _then) = __$ListenerProfileDataCopyWithImpl;
@override @useResult
$Res call({
 String phone, String phone_country
});




}
/// @nodoc
class __$ListenerProfileDataCopyWithImpl<$Res>
    implements _$ListenerProfileDataCopyWith<$Res> {
  __$ListenerProfileDataCopyWithImpl(this._self, this._then);

  final _ListenerProfileData _self;
  final $Res Function(_ListenerProfileData) _then;

/// Create a copy of ListenerProfileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? phone_country = null,}) {
  return _then(_ListenerProfileData(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phone_country: null == phone_country ? _self.phone_country : phone_country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
