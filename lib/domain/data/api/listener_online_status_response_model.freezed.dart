// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_online_status_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerOnlineStatusResponseModel {

 String get status; ListenerOnlineStatusData get data;
/// Create a copy of ListenerOnlineStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerOnlineStatusResponseModelCopyWith<ListenerOnlineStatusResponseModel> get copyWith => _$ListenerOnlineStatusResponseModelCopyWithImpl<ListenerOnlineStatusResponseModel>(this as ListenerOnlineStatusResponseModel, _$identity);

  /// Serializes this ListenerOnlineStatusResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerOnlineStatusResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerOnlineStatusResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerOnlineStatusResponseModelCopyWith<$Res>  {
  factory $ListenerOnlineStatusResponseModelCopyWith(ListenerOnlineStatusResponseModel value, $Res Function(ListenerOnlineStatusResponseModel) _then) = _$ListenerOnlineStatusResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerOnlineStatusData data
});


$ListenerOnlineStatusDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerOnlineStatusResponseModelCopyWithImpl<$Res>
    implements $ListenerOnlineStatusResponseModelCopyWith<$Res> {
  _$ListenerOnlineStatusResponseModelCopyWithImpl(this._self, this._then);

  final ListenerOnlineStatusResponseModel _self;
  final $Res Function(ListenerOnlineStatusResponseModel) _then;

/// Create a copy of ListenerOnlineStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerOnlineStatusData,
  ));
}
/// Create a copy of ListenerOnlineStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerOnlineStatusDataCopyWith<$Res> get data {
  
  return $ListenerOnlineStatusDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerOnlineStatusResponseModel].
extension ListenerOnlineStatusResponseModelPatterns on ListenerOnlineStatusResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerOnlineStatusResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerOnlineStatusResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerOnlineStatusResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerOnlineStatusResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerOnlineStatusResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerOnlineStatusResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerOnlineStatusData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerOnlineStatusResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerOnlineStatusData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerOnlineStatusResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerOnlineStatusData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerOnlineStatusResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerOnlineStatusResponseModel implements ListenerOnlineStatusResponseModel {
  const _ListenerOnlineStatusResponseModel({required this.status, required this.data});
  factory _ListenerOnlineStatusResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerOnlineStatusResponseModelFromJson(json);

@override final  String status;
@override final  ListenerOnlineStatusData data;

/// Create a copy of ListenerOnlineStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerOnlineStatusResponseModelCopyWith<_ListenerOnlineStatusResponseModel> get copyWith => __$ListenerOnlineStatusResponseModelCopyWithImpl<_ListenerOnlineStatusResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerOnlineStatusResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerOnlineStatusResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerOnlineStatusResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerOnlineStatusResponseModelCopyWith<$Res> implements $ListenerOnlineStatusResponseModelCopyWith<$Res> {
  factory _$ListenerOnlineStatusResponseModelCopyWith(_ListenerOnlineStatusResponseModel value, $Res Function(_ListenerOnlineStatusResponseModel) _then) = __$ListenerOnlineStatusResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerOnlineStatusData data
});


@override $ListenerOnlineStatusDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerOnlineStatusResponseModelCopyWithImpl<$Res>
    implements _$ListenerOnlineStatusResponseModelCopyWith<$Res> {
  __$ListenerOnlineStatusResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerOnlineStatusResponseModel _self;
  final $Res Function(_ListenerOnlineStatusResponseModel) _then;

/// Create a copy of ListenerOnlineStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerOnlineStatusResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerOnlineStatusData,
  ));
}

/// Create a copy of ListenerOnlineStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerOnlineStatusDataCopyWith<$Res> get data {
  
  return $ListenerOnlineStatusDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerOnlineStatusData {

 bool get is_online;
/// Create a copy of ListenerOnlineStatusData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerOnlineStatusDataCopyWith<ListenerOnlineStatusData> get copyWith => _$ListenerOnlineStatusDataCopyWithImpl<ListenerOnlineStatusData>(this as ListenerOnlineStatusData, _$identity);

  /// Serializes this ListenerOnlineStatusData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerOnlineStatusData&&(identical(other.is_online, is_online) || other.is_online == is_online));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,is_online);

@override
String toString() {
  return 'ListenerOnlineStatusData(is_online: $is_online)';
}


}

/// @nodoc
abstract mixin class $ListenerOnlineStatusDataCopyWith<$Res>  {
  factory $ListenerOnlineStatusDataCopyWith(ListenerOnlineStatusData value, $Res Function(ListenerOnlineStatusData) _then) = _$ListenerOnlineStatusDataCopyWithImpl;
@useResult
$Res call({
 bool is_online
});




}
/// @nodoc
class _$ListenerOnlineStatusDataCopyWithImpl<$Res>
    implements $ListenerOnlineStatusDataCopyWith<$Res> {
  _$ListenerOnlineStatusDataCopyWithImpl(this._self, this._then);

  final ListenerOnlineStatusData _self;
  final $Res Function(ListenerOnlineStatusData) _then;

/// Create a copy of ListenerOnlineStatusData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? is_online = null,}) {
  return _then(_self.copyWith(
is_online: null == is_online ? _self.is_online : is_online // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerOnlineStatusData].
extension ListenerOnlineStatusDataPatterns on ListenerOnlineStatusData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerOnlineStatusData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerOnlineStatusData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerOnlineStatusData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerOnlineStatusData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerOnlineStatusData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerOnlineStatusData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool is_online)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerOnlineStatusData() when $default != null:
return $default(_that.is_online);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool is_online)  $default,) {final _that = this;
switch (_that) {
case _ListenerOnlineStatusData():
return $default(_that.is_online);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool is_online)?  $default,) {final _that = this;
switch (_that) {
case _ListenerOnlineStatusData() when $default != null:
return $default(_that.is_online);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerOnlineStatusData implements ListenerOnlineStatusData {
  const _ListenerOnlineStatusData({this.is_online = false});
  factory _ListenerOnlineStatusData.fromJson(Map<String, dynamic> json) => _$ListenerOnlineStatusDataFromJson(json);

@override@JsonKey() final  bool is_online;

/// Create a copy of ListenerOnlineStatusData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerOnlineStatusDataCopyWith<_ListenerOnlineStatusData> get copyWith => __$ListenerOnlineStatusDataCopyWithImpl<_ListenerOnlineStatusData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerOnlineStatusDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerOnlineStatusData&&(identical(other.is_online, is_online) || other.is_online == is_online));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,is_online);

@override
String toString() {
  return 'ListenerOnlineStatusData(is_online: $is_online)';
}


}

/// @nodoc
abstract mixin class _$ListenerOnlineStatusDataCopyWith<$Res> implements $ListenerOnlineStatusDataCopyWith<$Res> {
  factory _$ListenerOnlineStatusDataCopyWith(_ListenerOnlineStatusData value, $Res Function(_ListenerOnlineStatusData) _then) = __$ListenerOnlineStatusDataCopyWithImpl;
@override @useResult
$Res call({
 bool is_online
});




}
/// @nodoc
class __$ListenerOnlineStatusDataCopyWithImpl<$Res>
    implements _$ListenerOnlineStatusDataCopyWith<$Res> {
  __$ListenerOnlineStatusDataCopyWithImpl(this._self, this._then);

  final _ListenerOnlineStatusData _self;
  final $Res Function(_ListenerOnlineStatusData) _then;

/// Create a copy of ListenerOnlineStatusData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? is_online = null,}) {
  return _then(_ListenerOnlineStatusData(
is_online: null == is_online ? _self.is_online : is_online // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
