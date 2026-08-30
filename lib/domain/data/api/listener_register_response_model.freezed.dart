// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_register_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerRegisterResponseModel {

 String get status; ListenerRegisterData get data;
/// Create a copy of ListenerRegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerRegisterResponseModelCopyWith<ListenerRegisterResponseModel> get copyWith => _$ListenerRegisterResponseModelCopyWithImpl<ListenerRegisterResponseModel>(this as ListenerRegisterResponseModel, _$identity);

  /// Serializes this ListenerRegisterResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerRegisterResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerRegisterResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerRegisterResponseModelCopyWith<$Res>  {
  factory $ListenerRegisterResponseModelCopyWith(ListenerRegisterResponseModel value, $Res Function(ListenerRegisterResponseModel) _then) = _$ListenerRegisterResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerRegisterData data
});


$ListenerRegisterDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerRegisterResponseModelCopyWithImpl<$Res>
    implements $ListenerRegisterResponseModelCopyWith<$Res> {
  _$ListenerRegisterResponseModelCopyWithImpl(this._self, this._then);

  final ListenerRegisterResponseModel _self;
  final $Res Function(ListenerRegisterResponseModel) _then;

/// Create a copy of ListenerRegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerRegisterData,
  ));
}
/// Create a copy of ListenerRegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerRegisterDataCopyWith<$Res> get data {
  
  return $ListenerRegisterDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerRegisterResponseModel].
extension ListenerRegisterResponseModelPatterns on ListenerRegisterResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerRegisterResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerRegisterResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerRegisterResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerRegisterResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerRegisterResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerRegisterResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerRegisterData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerRegisterResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerRegisterData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerRegisterResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerRegisterData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerRegisterResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerRegisterResponseModel implements ListenerRegisterResponseModel {
  const _ListenerRegisterResponseModel({required this.status, required this.data});
  factory _ListenerRegisterResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerRegisterResponseModelFromJson(json);

@override final  String status;
@override final  ListenerRegisterData data;

/// Create a copy of ListenerRegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerRegisterResponseModelCopyWith<_ListenerRegisterResponseModel> get copyWith => __$ListenerRegisterResponseModelCopyWithImpl<_ListenerRegisterResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerRegisterResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerRegisterResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerRegisterResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerRegisterResponseModelCopyWith<$Res> implements $ListenerRegisterResponseModelCopyWith<$Res> {
  factory _$ListenerRegisterResponseModelCopyWith(_ListenerRegisterResponseModel value, $Res Function(_ListenerRegisterResponseModel) _then) = __$ListenerRegisterResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerRegisterData data
});


@override $ListenerRegisterDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerRegisterResponseModelCopyWithImpl<$Res>
    implements _$ListenerRegisterResponseModelCopyWith<$Res> {
  __$ListenerRegisterResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerRegisterResponseModel _self;
  final $Res Function(_ListenerRegisterResponseModel) _then;

/// Create a copy of ListenerRegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerRegisterResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerRegisterData,
  ));
}

/// Create a copy of ListenerRegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerRegisterDataCopyWith<$Res> get data {
  
  return $ListenerRegisterDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerRegisterData {

 String get listener_id; String get profile_status;
/// Create a copy of ListenerRegisterData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerRegisterDataCopyWith<ListenerRegisterData> get copyWith => _$ListenerRegisterDataCopyWithImpl<ListenerRegisterData>(this as ListenerRegisterData, _$identity);

  /// Serializes this ListenerRegisterData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerRegisterData&&(identical(other.listener_id, listener_id) || other.listener_id == listener_id)&&(identical(other.profile_status, profile_status) || other.profile_status == profile_status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,listener_id,profile_status);

@override
String toString() {
  return 'ListenerRegisterData(listener_id: $listener_id, profile_status: $profile_status)';
}


}

/// @nodoc
abstract mixin class $ListenerRegisterDataCopyWith<$Res>  {
  factory $ListenerRegisterDataCopyWith(ListenerRegisterData value, $Res Function(ListenerRegisterData) _then) = _$ListenerRegisterDataCopyWithImpl;
@useResult
$Res call({
 String listener_id, String profile_status
});




}
/// @nodoc
class _$ListenerRegisterDataCopyWithImpl<$Res>
    implements $ListenerRegisterDataCopyWith<$Res> {
  _$ListenerRegisterDataCopyWithImpl(this._self, this._then);

  final ListenerRegisterData _self;
  final $Res Function(ListenerRegisterData) _then;

/// Create a copy of ListenerRegisterData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listener_id = null,Object? profile_status = null,}) {
  return _then(_self.copyWith(
listener_id: null == listener_id ? _self.listener_id : listener_id // ignore: cast_nullable_to_non_nullable
as String,profile_status: null == profile_status ? _self.profile_status : profile_status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerRegisterData].
extension ListenerRegisterDataPatterns on ListenerRegisterData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerRegisterData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerRegisterData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerRegisterData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerRegisterData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerRegisterData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerRegisterData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String listener_id,  String profile_status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerRegisterData() when $default != null:
return $default(_that.listener_id,_that.profile_status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String listener_id,  String profile_status)  $default,) {final _that = this;
switch (_that) {
case _ListenerRegisterData():
return $default(_that.listener_id,_that.profile_status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String listener_id,  String profile_status)?  $default,) {final _that = this;
switch (_that) {
case _ListenerRegisterData() when $default != null:
return $default(_that.listener_id,_that.profile_status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerRegisterData implements ListenerRegisterData {
  const _ListenerRegisterData({required this.listener_id, required this.profile_status});
  factory _ListenerRegisterData.fromJson(Map<String, dynamic> json) => _$ListenerRegisterDataFromJson(json);

@override final  String listener_id;
@override final  String profile_status;

/// Create a copy of ListenerRegisterData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerRegisterDataCopyWith<_ListenerRegisterData> get copyWith => __$ListenerRegisterDataCopyWithImpl<_ListenerRegisterData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerRegisterDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerRegisterData&&(identical(other.listener_id, listener_id) || other.listener_id == listener_id)&&(identical(other.profile_status, profile_status) || other.profile_status == profile_status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,listener_id,profile_status);

@override
String toString() {
  return 'ListenerRegisterData(listener_id: $listener_id, profile_status: $profile_status)';
}


}

/// @nodoc
abstract mixin class _$ListenerRegisterDataCopyWith<$Res> implements $ListenerRegisterDataCopyWith<$Res> {
  factory _$ListenerRegisterDataCopyWith(_ListenerRegisterData value, $Res Function(_ListenerRegisterData) _then) = __$ListenerRegisterDataCopyWithImpl;
@override @useResult
$Res call({
 String listener_id, String profile_status
});




}
/// @nodoc
class __$ListenerRegisterDataCopyWithImpl<$Res>
    implements _$ListenerRegisterDataCopyWith<$Res> {
  __$ListenerRegisterDataCopyWithImpl(this._self, this._then);

  final _ListenerRegisterData _self;
  final $Res Function(_ListenerRegisterData) _then;

/// Create a copy of ListenerRegisterData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listener_id = null,Object? profile_status = null,}) {
  return _then(_ListenerRegisterData(
listener_id: null == listener_id ? _self.listener_id : listener_id // ignore: cast_nullable_to_non_nullable
as String,profile_status: null == profile_status ? _self.profile_status : profile_status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
