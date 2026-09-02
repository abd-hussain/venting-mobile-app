// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_sessions_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorSessionsListResponseModel {

 String get status; VentorSessionsListData get data;
/// Create a copy of VentorSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorSessionsListResponseModelCopyWith<VentorSessionsListResponseModel> get copyWith => _$VentorSessionsListResponseModelCopyWithImpl<VentorSessionsListResponseModel>(this as VentorSessionsListResponseModel, _$identity);

  /// Serializes this VentorSessionsListResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorSessionsListResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorSessionsListResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorSessionsListResponseModelCopyWith<$Res>  {
  factory $VentorSessionsListResponseModelCopyWith(VentorSessionsListResponseModel value, $Res Function(VentorSessionsListResponseModel) _then) = _$VentorSessionsListResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorSessionsListData data
});


$VentorSessionsListDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorSessionsListResponseModelCopyWithImpl<$Res>
    implements $VentorSessionsListResponseModelCopyWith<$Res> {
  _$VentorSessionsListResponseModelCopyWithImpl(this._self, this._then);

  final VentorSessionsListResponseModel _self;
  final $Res Function(VentorSessionsListResponseModel) _then;

/// Create a copy of VentorSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorSessionsListData,
  ));
}
/// Create a copy of VentorSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorSessionsListDataCopyWith<$Res> get data {
  
  return $VentorSessionsListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorSessionsListResponseModel].
extension VentorSessionsListResponseModelPatterns on VentorSessionsListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorSessionsListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorSessionsListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorSessionsListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorSessionsListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorSessionsListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorSessionsListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorSessionsListData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorSessionsListResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorSessionsListData data)  $default,) {final _that = this;
switch (_that) {
case _VentorSessionsListResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorSessionsListData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorSessionsListResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorSessionsListResponseModel implements VentorSessionsListResponseModel {
  const _VentorSessionsListResponseModel({required this.status, required this.data});
  factory _VentorSessionsListResponseModel.fromJson(Map<String, dynamic> json) => _$VentorSessionsListResponseModelFromJson(json);

@override final  String status;
@override final  VentorSessionsListData data;

/// Create a copy of VentorSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorSessionsListResponseModelCopyWith<_VentorSessionsListResponseModel> get copyWith => __$VentorSessionsListResponseModelCopyWithImpl<_VentorSessionsListResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorSessionsListResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorSessionsListResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorSessionsListResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorSessionsListResponseModelCopyWith<$Res> implements $VentorSessionsListResponseModelCopyWith<$Res> {
  factory _$VentorSessionsListResponseModelCopyWith(_VentorSessionsListResponseModel value, $Res Function(_VentorSessionsListResponseModel) _then) = __$VentorSessionsListResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorSessionsListData data
});


@override $VentorSessionsListDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorSessionsListResponseModelCopyWithImpl<$Res>
    implements _$VentorSessionsListResponseModelCopyWith<$Res> {
  __$VentorSessionsListResponseModelCopyWithImpl(this._self, this._then);

  final _VentorSessionsListResponseModel _self;
  final $Res Function(_VentorSessionsListResponseModel) _then;

/// Create a copy of VentorSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorSessionsListResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorSessionsListData,
  ));
}

/// Create a copy of VentorSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorSessionsListDataCopyWith<$Res> get data {
  
  return $VentorSessionsListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorSessionsListData {

 List<VentorHomeBookedSessionModel> get items;
/// Create a copy of VentorSessionsListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorSessionsListDataCopyWith<VentorSessionsListData> get copyWith => _$VentorSessionsListDataCopyWithImpl<VentorSessionsListData>(this as VentorSessionsListData, _$identity);

  /// Serializes this VentorSessionsListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorSessionsListData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'VentorSessionsListData(items: $items)';
}


}

/// @nodoc
abstract mixin class $VentorSessionsListDataCopyWith<$Res>  {
  factory $VentorSessionsListDataCopyWith(VentorSessionsListData value, $Res Function(VentorSessionsListData) _then) = _$VentorSessionsListDataCopyWithImpl;
@useResult
$Res call({
 List<VentorHomeBookedSessionModel> items
});




}
/// @nodoc
class _$VentorSessionsListDataCopyWithImpl<$Res>
    implements $VentorSessionsListDataCopyWith<$Res> {
  _$VentorSessionsListDataCopyWithImpl(this._self, this._then);

  final VentorSessionsListData _self;
  final $Res Function(VentorSessionsListData) _then;

/// Create a copy of VentorSessionsListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<VentorHomeBookedSessionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorSessionsListData].
extension VentorSessionsListDataPatterns on VentorSessionsListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorSessionsListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorSessionsListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorSessionsListData value)  $default,){
final _that = this;
switch (_that) {
case _VentorSessionsListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorSessionsListData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorSessionsListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VentorHomeBookedSessionModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorSessionsListData() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VentorHomeBookedSessionModel> items)  $default,) {final _that = this;
switch (_that) {
case _VentorSessionsListData():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VentorHomeBookedSessionModel> items)?  $default,) {final _that = this;
switch (_that) {
case _VentorSessionsListData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorSessionsListData implements VentorSessionsListData {
  const _VentorSessionsListData({final  List<VentorHomeBookedSessionModel> items = const <VentorHomeBookedSessionModel>[]}): _items = items;
  factory _VentorSessionsListData.fromJson(Map<String, dynamic> json) => _$VentorSessionsListDataFromJson(json);

 final  List<VentorHomeBookedSessionModel> _items;
@override@JsonKey() List<VentorHomeBookedSessionModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of VentorSessionsListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorSessionsListDataCopyWith<_VentorSessionsListData> get copyWith => __$VentorSessionsListDataCopyWithImpl<_VentorSessionsListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorSessionsListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorSessionsListData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'VentorSessionsListData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$VentorSessionsListDataCopyWith<$Res> implements $VentorSessionsListDataCopyWith<$Res> {
  factory _$VentorSessionsListDataCopyWith(_VentorSessionsListData value, $Res Function(_VentorSessionsListData) _then) = __$VentorSessionsListDataCopyWithImpl;
@override @useResult
$Res call({
 List<VentorHomeBookedSessionModel> items
});




}
/// @nodoc
class __$VentorSessionsListDataCopyWithImpl<$Res>
    implements _$VentorSessionsListDataCopyWith<$Res> {
  __$VentorSessionsListDataCopyWithImpl(this._self, this._then);

  final _VentorSessionsListData _self;
  final $Res Function(_VentorSessionsListData) _then;

/// Create a copy of VentorSessionsListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_VentorSessionsListData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<VentorHomeBookedSessionModel>,
  ));
}


}


/// @nodoc
mixin _$VentorBookedSessionDetailResponseModel {

 String get status; VentorBookedSessionDetailDataModel get data;
/// Create a copy of VentorBookedSessionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorBookedSessionDetailResponseModelCopyWith<VentorBookedSessionDetailResponseModel> get copyWith => _$VentorBookedSessionDetailResponseModelCopyWithImpl<VentorBookedSessionDetailResponseModel>(this as VentorBookedSessionDetailResponseModel, _$identity);

  /// Serializes this VentorBookedSessionDetailResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBookedSessionDetailResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorBookedSessionDetailResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorBookedSessionDetailResponseModelCopyWith<$Res>  {
  factory $VentorBookedSessionDetailResponseModelCopyWith(VentorBookedSessionDetailResponseModel value, $Res Function(VentorBookedSessionDetailResponseModel) _then) = _$VentorBookedSessionDetailResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorBookedSessionDetailDataModel data
});


$VentorBookedSessionDetailDataModelCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorBookedSessionDetailResponseModelCopyWithImpl<$Res>
    implements $VentorBookedSessionDetailResponseModelCopyWith<$Res> {
  _$VentorBookedSessionDetailResponseModelCopyWithImpl(this._self, this._then);

  final VentorBookedSessionDetailResponseModel _self;
  final $Res Function(VentorBookedSessionDetailResponseModel) _then;

/// Create a copy of VentorBookedSessionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionDetailDataModel,
  ));
}
/// Create a copy of VentorBookedSessionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorBookedSessionDetailDataModelCopyWith<$Res> get data {
  
  return $VentorBookedSessionDetailDataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorBookedSessionDetailResponseModel].
extension VentorBookedSessionDetailResponseModelPatterns on VentorBookedSessionDetailResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorBookedSessionDetailResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorBookedSessionDetailResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorBookedSessionDetailResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionDetailResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorBookedSessionDetailResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionDetailResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorBookedSessionDetailDataModel data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorBookedSessionDetailResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorBookedSessionDetailDataModel data)  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionDetailResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorBookedSessionDetailDataModel data)?  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionDetailResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorBookedSessionDetailResponseModel implements VentorBookedSessionDetailResponseModel {
  const _VentorBookedSessionDetailResponseModel({required this.status, required this.data});
  factory _VentorBookedSessionDetailResponseModel.fromJson(Map<String, dynamic> json) => _$VentorBookedSessionDetailResponseModelFromJson(json);

@override final  String status;
@override final  VentorBookedSessionDetailDataModel data;

/// Create a copy of VentorBookedSessionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorBookedSessionDetailResponseModelCopyWith<_VentorBookedSessionDetailResponseModel> get copyWith => __$VentorBookedSessionDetailResponseModelCopyWithImpl<_VentorBookedSessionDetailResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorBookedSessionDetailResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorBookedSessionDetailResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorBookedSessionDetailResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorBookedSessionDetailResponseModelCopyWith<$Res> implements $VentorBookedSessionDetailResponseModelCopyWith<$Res> {
  factory _$VentorBookedSessionDetailResponseModelCopyWith(_VentorBookedSessionDetailResponseModel value, $Res Function(_VentorBookedSessionDetailResponseModel) _then) = __$VentorBookedSessionDetailResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorBookedSessionDetailDataModel data
});


@override $VentorBookedSessionDetailDataModelCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorBookedSessionDetailResponseModelCopyWithImpl<$Res>
    implements _$VentorBookedSessionDetailResponseModelCopyWith<$Res> {
  __$VentorBookedSessionDetailResponseModelCopyWithImpl(this._self, this._then);

  final _VentorBookedSessionDetailResponseModel _self;
  final $Res Function(_VentorBookedSessionDetailResponseModel) _then;

/// Create a copy of VentorBookedSessionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorBookedSessionDetailResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionDetailDataModel,
  ));
}

/// Create a copy of VentorBookedSessionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorBookedSessionDetailDataModelCopyWith<$Res> get data {
  
  return $VentorBookedSessionDetailDataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorBookedSessionDetailDataModel {

 VentorHomeBookedSessionModel get session; VentorBookedSessionListenerSummaryModel? get listener; VentorBookedSessionPaymentModel? get payment;
/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorBookedSessionDetailDataModelCopyWith<VentorBookedSessionDetailDataModel> get copyWith => _$VentorBookedSessionDetailDataModelCopyWithImpl<VentorBookedSessionDetailDataModel>(this as VentorBookedSessionDetailDataModel, _$identity);

  /// Serializes this VentorBookedSessionDetailDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBookedSessionDetailDataModel&&(identical(other.session, session) || other.session == session)&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.payment, payment) || other.payment == payment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,listener,payment);

@override
String toString() {
  return 'VentorBookedSessionDetailDataModel(session: $session, listener: $listener, payment: $payment)';
}


}

/// @nodoc
abstract mixin class $VentorBookedSessionDetailDataModelCopyWith<$Res>  {
  factory $VentorBookedSessionDetailDataModelCopyWith(VentorBookedSessionDetailDataModel value, $Res Function(VentorBookedSessionDetailDataModel) _then) = _$VentorBookedSessionDetailDataModelCopyWithImpl;
@useResult
$Res call({
 VentorHomeBookedSessionModel session, VentorBookedSessionListenerSummaryModel? listener, VentorBookedSessionPaymentModel? payment
});


$VentorHomeBookedSessionModelCopyWith<$Res> get session;$VentorBookedSessionListenerSummaryModelCopyWith<$Res>? get listener;$VentorBookedSessionPaymentModelCopyWith<$Res>? get payment;

}
/// @nodoc
class _$VentorBookedSessionDetailDataModelCopyWithImpl<$Res>
    implements $VentorBookedSessionDetailDataModelCopyWith<$Res> {
  _$VentorBookedSessionDetailDataModelCopyWithImpl(this._self, this._then);

  final VentorBookedSessionDetailDataModel _self;
  final $Res Function(VentorBookedSessionDetailDataModel) _then;

/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? listener = freezed,Object? payment = freezed,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as VentorHomeBookedSessionModel,listener: freezed == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionListenerSummaryModel?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionPaymentModel?,
  ));
}
/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeBookedSessionModelCopyWith<$Res> get session {
  
  return $VentorHomeBookedSessionModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorBookedSessionListenerSummaryModelCopyWith<$Res>? get listener {
    if (_self.listener == null) {
    return null;
  }

  return $VentorBookedSessionListenerSummaryModelCopyWith<$Res>(_self.listener!, (value) {
    return _then(_self.copyWith(listener: value));
  });
}/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorBookedSessionPaymentModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $VentorBookedSessionPaymentModelCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorBookedSessionDetailDataModel].
extension VentorBookedSessionDetailDataModelPatterns on VentorBookedSessionDetailDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorBookedSessionDetailDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorBookedSessionDetailDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorBookedSessionDetailDataModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionDetailDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorBookedSessionDetailDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionDetailDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorHomeBookedSessionModel session,  VentorBookedSessionListenerSummaryModel? listener,  VentorBookedSessionPaymentModel? payment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorBookedSessionDetailDataModel() when $default != null:
return $default(_that.session,_that.listener,_that.payment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorHomeBookedSessionModel session,  VentorBookedSessionListenerSummaryModel? listener,  VentorBookedSessionPaymentModel? payment)  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionDetailDataModel():
return $default(_that.session,_that.listener,_that.payment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorHomeBookedSessionModel session,  VentorBookedSessionListenerSummaryModel? listener,  VentorBookedSessionPaymentModel? payment)?  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionDetailDataModel() when $default != null:
return $default(_that.session,_that.listener,_that.payment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorBookedSessionDetailDataModel implements VentorBookedSessionDetailDataModel {
  const _VentorBookedSessionDetailDataModel({required this.session, this.listener, this.payment});
  factory _VentorBookedSessionDetailDataModel.fromJson(Map<String, dynamic> json) => _$VentorBookedSessionDetailDataModelFromJson(json);

@override final  VentorHomeBookedSessionModel session;
@override final  VentorBookedSessionListenerSummaryModel? listener;
@override final  VentorBookedSessionPaymentModel? payment;

/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorBookedSessionDetailDataModelCopyWith<_VentorBookedSessionDetailDataModel> get copyWith => __$VentorBookedSessionDetailDataModelCopyWithImpl<_VentorBookedSessionDetailDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorBookedSessionDetailDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorBookedSessionDetailDataModel&&(identical(other.session, session) || other.session == session)&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.payment, payment) || other.payment == payment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,listener,payment);

@override
String toString() {
  return 'VentorBookedSessionDetailDataModel(session: $session, listener: $listener, payment: $payment)';
}


}

/// @nodoc
abstract mixin class _$VentorBookedSessionDetailDataModelCopyWith<$Res> implements $VentorBookedSessionDetailDataModelCopyWith<$Res> {
  factory _$VentorBookedSessionDetailDataModelCopyWith(_VentorBookedSessionDetailDataModel value, $Res Function(_VentorBookedSessionDetailDataModel) _then) = __$VentorBookedSessionDetailDataModelCopyWithImpl;
@override @useResult
$Res call({
 VentorHomeBookedSessionModel session, VentorBookedSessionListenerSummaryModel? listener, VentorBookedSessionPaymentModel? payment
});


@override $VentorHomeBookedSessionModelCopyWith<$Res> get session;@override $VentorBookedSessionListenerSummaryModelCopyWith<$Res>? get listener;@override $VentorBookedSessionPaymentModelCopyWith<$Res>? get payment;

}
/// @nodoc
class __$VentorBookedSessionDetailDataModelCopyWithImpl<$Res>
    implements _$VentorBookedSessionDetailDataModelCopyWith<$Res> {
  __$VentorBookedSessionDetailDataModelCopyWithImpl(this._self, this._then);

  final _VentorBookedSessionDetailDataModel _self;
  final $Res Function(_VentorBookedSessionDetailDataModel) _then;

/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? listener = freezed,Object? payment = freezed,}) {
  return _then(_VentorBookedSessionDetailDataModel(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as VentorHomeBookedSessionModel,listener: freezed == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionListenerSummaryModel?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionPaymentModel?,
  ));
}

/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeBookedSessionModelCopyWith<$Res> get session {
  
  return $VentorHomeBookedSessionModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorBookedSessionListenerSummaryModelCopyWith<$Res>? get listener {
    if (_self.listener == null) {
    return null;
  }

  return $VentorBookedSessionListenerSummaryModelCopyWith<$Res>(_self.listener!, (value) {
    return _then(_self.copyWith(listener: value));
  });
}/// Create a copy of VentorBookedSessionDetailDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorBookedSessionPaymentModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $VentorBookedSessionPaymentModelCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// @nodoc
mixin _$VentorBookedSessionListenerSummaryModel {

 String get id; String get name; String get avatar_url; double get rating; bool get is_verified; List<String> get topics; List<String> get languages; String get country; String get city; String get country_iso; double get rate_per_minute;
/// Create a copy of VentorBookedSessionListenerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorBookedSessionListenerSummaryModelCopyWith<VentorBookedSessionListenerSummaryModel> get copyWith => _$VentorBookedSessionListenerSummaryModelCopyWithImpl<VentorBookedSessionListenerSummaryModel>(this as VentorBookedSessionListenerSummaryModel, _$identity);

  /// Serializes this VentorBookedSessionListenerSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBookedSessionListenerSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.is_verified, is_verified) || other.is_verified == is_verified)&&const DeepCollectionEquality().equals(other.topics, topics)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.country_iso, country_iso) || other.country_iso == country_iso)&&(identical(other.rate_per_minute, rate_per_minute) || other.rate_per_minute == rate_per_minute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar_url,rating,is_verified,const DeepCollectionEquality().hash(topics),const DeepCollectionEquality().hash(languages),country,city,country_iso,rate_per_minute);

@override
String toString() {
  return 'VentorBookedSessionListenerSummaryModel(id: $id, name: $name, avatar_url: $avatar_url, rating: $rating, is_verified: $is_verified, topics: $topics, languages: $languages, country: $country, city: $city, country_iso: $country_iso, rate_per_minute: $rate_per_minute)';
}


}

/// @nodoc
abstract mixin class $VentorBookedSessionListenerSummaryModelCopyWith<$Res>  {
  factory $VentorBookedSessionListenerSummaryModelCopyWith(VentorBookedSessionListenerSummaryModel value, $Res Function(VentorBookedSessionListenerSummaryModel) _then) = _$VentorBookedSessionListenerSummaryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String avatar_url, double rating, bool is_verified, List<String> topics, List<String> languages, String country, String city, String country_iso, double rate_per_minute
});




}
/// @nodoc
class _$VentorBookedSessionListenerSummaryModelCopyWithImpl<$Res>
    implements $VentorBookedSessionListenerSummaryModelCopyWith<$Res> {
  _$VentorBookedSessionListenerSummaryModelCopyWithImpl(this._self, this._then);

  final VentorBookedSessionListenerSummaryModel _self;
  final $Res Function(VentorBookedSessionListenerSummaryModel) _then;

/// Create a copy of VentorBookedSessionListenerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar_url = null,Object? rating = null,Object? is_verified = null,Object? topics = null,Object? languages = null,Object? country = null,Object? city = null,Object? country_iso = null,Object? rate_per_minute = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar_url: null == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,is_verified: null == is_verified ? _self.is_verified : is_verified // ignore: cast_nullable_to_non_nullable
as bool,topics: null == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country_iso: null == country_iso ? _self.country_iso : country_iso // ignore: cast_nullable_to_non_nullable
as String,rate_per_minute: null == rate_per_minute ? _self.rate_per_minute : rate_per_minute // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorBookedSessionListenerSummaryModel].
extension VentorBookedSessionListenerSummaryModelPatterns on VentorBookedSessionListenerSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorBookedSessionListenerSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorBookedSessionListenerSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorBookedSessionListenerSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionListenerSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorBookedSessionListenerSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionListenerSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String avatar_url,  double rating,  bool is_verified,  List<String> topics,  List<String> languages,  String country,  String city,  String country_iso,  double rate_per_minute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorBookedSessionListenerSummaryModel() when $default != null:
return $default(_that.id,_that.name,_that.avatar_url,_that.rating,_that.is_verified,_that.topics,_that.languages,_that.country,_that.city,_that.country_iso,_that.rate_per_minute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String avatar_url,  double rating,  bool is_verified,  List<String> topics,  List<String> languages,  String country,  String city,  String country_iso,  double rate_per_minute)  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionListenerSummaryModel():
return $default(_that.id,_that.name,_that.avatar_url,_that.rating,_that.is_verified,_that.topics,_that.languages,_that.country,_that.city,_that.country_iso,_that.rate_per_minute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String avatar_url,  double rating,  bool is_verified,  List<String> topics,  List<String> languages,  String country,  String city,  String country_iso,  double rate_per_minute)?  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionListenerSummaryModel() when $default != null:
return $default(_that.id,_that.name,_that.avatar_url,_that.rating,_that.is_verified,_that.topics,_that.languages,_that.country,_that.city,_that.country_iso,_that.rate_per_minute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorBookedSessionListenerSummaryModel implements VentorBookedSessionListenerSummaryModel {
  const _VentorBookedSessionListenerSummaryModel({this.id = '', this.name = '', this.avatar_url = '', this.rating = 0, this.is_verified = false, final  List<String> topics = const <String>[], final  List<String> languages = const <String>[], this.country = '', this.city = '', this.country_iso = '', this.rate_per_minute = 0}): _topics = topics,_languages = languages;
  factory _VentorBookedSessionListenerSummaryModel.fromJson(Map<String, dynamic> json) => _$VentorBookedSessionListenerSummaryModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String avatar_url;
@override@JsonKey() final  double rating;
@override@JsonKey() final  bool is_verified;
 final  List<String> _topics;
@override@JsonKey() List<String> get topics {
  if (_topics is EqualUnmodifiableListView) return _topics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topics);
}

 final  List<String> _languages;
@override@JsonKey() List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

@override@JsonKey() final  String country;
@override@JsonKey() final  String city;
@override@JsonKey() final  String country_iso;
@override@JsonKey() final  double rate_per_minute;

/// Create a copy of VentorBookedSessionListenerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorBookedSessionListenerSummaryModelCopyWith<_VentorBookedSessionListenerSummaryModel> get copyWith => __$VentorBookedSessionListenerSummaryModelCopyWithImpl<_VentorBookedSessionListenerSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorBookedSessionListenerSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorBookedSessionListenerSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.is_verified, is_verified) || other.is_verified == is_verified)&&const DeepCollectionEquality().equals(other._topics, _topics)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.country_iso, country_iso) || other.country_iso == country_iso)&&(identical(other.rate_per_minute, rate_per_minute) || other.rate_per_minute == rate_per_minute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar_url,rating,is_verified,const DeepCollectionEquality().hash(_topics),const DeepCollectionEquality().hash(_languages),country,city,country_iso,rate_per_minute);

@override
String toString() {
  return 'VentorBookedSessionListenerSummaryModel(id: $id, name: $name, avatar_url: $avatar_url, rating: $rating, is_verified: $is_verified, topics: $topics, languages: $languages, country: $country, city: $city, country_iso: $country_iso, rate_per_minute: $rate_per_minute)';
}


}

/// @nodoc
abstract mixin class _$VentorBookedSessionListenerSummaryModelCopyWith<$Res> implements $VentorBookedSessionListenerSummaryModelCopyWith<$Res> {
  factory _$VentorBookedSessionListenerSummaryModelCopyWith(_VentorBookedSessionListenerSummaryModel value, $Res Function(_VentorBookedSessionListenerSummaryModel) _then) = __$VentorBookedSessionListenerSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String avatar_url, double rating, bool is_verified, List<String> topics, List<String> languages, String country, String city, String country_iso, double rate_per_minute
});




}
/// @nodoc
class __$VentorBookedSessionListenerSummaryModelCopyWithImpl<$Res>
    implements _$VentorBookedSessionListenerSummaryModelCopyWith<$Res> {
  __$VentorBookedSessionListenerSummaryModelCopyWithImpl(this._self, this._then);

  final _VentorBookedSessionListenerSummaryModel _self;
  final $Res Function(_VentorBookedSessionListenerSummaryModel) _then;

/// Create a copy of VentorBookedSessionListenerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar_url = null,Object? rating = null,Object? is_verified = null,Object? topics = null,Object? languages = null,Object? country = null,Object? city = null,Object? country_iso = null,Object? rate_per_minute = null,}) {
  return _then(_VentorBookedSessionListenerSummaryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar_url: null == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,is_verified: null == is_verified ? _self.is_verified : is_verified // ignore: cast_nullable_to_non_nullable
as bool,topics: null == topics ? _self._topics : topics // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country_iso: null == country_iso ? _self.country_iso : country_iso // ignore: cast_nullable_to_non_nullable
as String,rate_per_minute: null == rate_per_minute ? _self.rate_per_minute : rate_per_minute // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$VentorBookedSessionPaymentModel {

 num get amount_paid; String get currency; num get voice_change_fee; num get discount_amount; num? get session_price;
/// Create a copy of VentorBookedSessionPaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorBookedSessionPaymentModelCopyWith<VentorBookedSessionPaymentModel> get copyWith => _$VentorBookedSessionPaymentModelCopyWithImpl<VentorBookedSessionPaymentModel>(this as VentorBookedSessionPaymentModel, _$identity);

  /// Serializes this VentorBookedSessionPaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBookedSessionPaymentModel&&(identical(other.amount_paid, amount_paid) || other.amount_paid == amount_paid)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.voice_change_fee, voice_change_fee) || other.voice_change_fee == voice_change_fee)&&(identical(other.discount_amount, discount_amount) || other.discount_amount == discount_amount)&&(identical(other.session_price, session_price) || other.session_price == session_price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount_paid,currency,voice_change_fee,discount_amount,session_price);

@override
String toString() {
  return 'VentorBookedSessionPaymentModel(amount_paid: $amount_paid, currency: $currency, voice_change_fee: $voice_change_fee, discount_amount: $discount_amount, session_price: $session_price)';
}


}

/// @nodoc
abstract mixin class $VentorBookedSessionPaymentModelCopyWith<$Res>  {
  factory $VentorBookedSessionPaymentModelCopyWith(VentorBookedSessionPaymentModel value, $Res Function(VentorBookedSessionPaymentModel) _then) = _$VentorBookedSessionPaymentModelCopyWithImpl;
@useResult
$Res call({
 num amount_paid, String currency, num voice_change_fee, num discount_amount, num? session_price
});




}
/// @nodoc
class _$VentorBookedSessionPaymentModelCopyWithImpl<$Res>
    implements $VentorBookedSessionPaymentModelCopyWith<$Res> {
  _$VentorBookedSessionPaymentModelCopyWithImpl(this._self, this._then);

  final VentorBookedSessionPaymentModel _self;
  final $Res Function(VentorBookedSessionPaymentModel) _then;

/// Create a copy of VentorBookedSessionPaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount_paid = null,Object? currency = null,Object? voice_change_fee = null,Object? discount_amount = null,Object? session_price = freezed,}) {
  return _then(_self.copyWith(
amount_paid: null == amount_paid ? _self.amount_paid : amount_paid // ignore: cast_nullable_to_non_nullable
as num,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,voice_change_fee: null == voice_change_fee ? _self.voice_change_fee : voice_change_fee // ignore: cast_nullable_to_non_nullable
as num,discount_amount: null == discount_amount ? _self.discount_amount : discount_amount // ignore: cast_nullable_to_non_nullable
as num,session_price: freezed == session_price ? _self.session_price : session_price // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorBookedSessionPaymentModel].
extension VentorBookedSessionPaymentModelPatterns on VentorBookedSessionPaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorBookedSessionPaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorBookedSessionPaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorBookedSessionPaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionPaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorBookedSessionPaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionPaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num amount_paid,  String currency,  num voice_change_fee,  num discount_amount,  num? session_price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorBookedSessionPaymentModel() when $default != null:
return $default(_that.amount_paid,_that.currency,_that.voice_change_fee,_that.discount_amount,_that.session_price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num amount_paid,  String currency,  num voice_change_fee,  num discount_amount,  num? session_price)  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionPaymentModel():
return $default(_that.amount_paid,_that.currency,_that.voice_change_fee,_that.discount_amount,_that.session_price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num amount_paid,  String currency,  num voice_change_fee,  num discount_amount,  num? session_price)?  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionPaymentModel() when $default != null:
return $default(_that.amount_paid,_that.currency,_that.voice_change_fee,_that.discount_amount,_that.session_price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorBookedSessionPaymentModel implements VentorBookedSessionPaymentModel {
  const _VentorBookedSessionPaymentModel({this.amount_paid = 0, this.currency = 'USD', this.voice_change_fee = 0, this.discount_amount = 0, this.session_price});
  factory _VentorBookedSessionPaymentModel.fromJson(Map<String, dynamic> json) => _$VentorBookedSessionPaymentModelFromJson(json);

@override@JsonKey() final  num amount_paid;
@override@JsonKey() final  String currency;
@override@JsonKey() final  num voice_change_fee;
@override@JsonKey() final  num discount_amount;
@override final  num? session_price;

/// Create a copy of VentorBookedSessionPaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorBookedSessionPaymentModelCopyWith<_VentorBookedSessionPaymentModel> get copyWith => __$VentorBookedSessionPaymentModelCopyWithImpl<_VentorBookedSessionPaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorBookedSessionPaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorBookedSessionPaymentModel&&(identical(other.amount_paid, amount_paid) || other.amount_paid == amount_paid)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.voice_change_fee, voice_change_fee) || other.voice_change_fee == voice_change_fee)&&(identical(other.discount_amount, discount_amount) || other.discount_amount == discount_amount)&&(identical(other.session_price, session_price) || other.session_price == session_price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount_paid,currency,voice_change_fee,discount_amount,session_price);

@override
String toString() {
  return 'VentorBookedSessionPaymentModel(amount_paid: $amount_paid, currency: $currency, voice_change_fee: $voice_change_fee, discount_amount: $discount_amount, session_price: $session_price)';
}


}

/// @nodoc
abstract mixin class _$VentorBookedSessionPaymentModelCopyWith<$Res> implements $VentorBookedSessionPaymentModelCopyWith<$Res> {
  factory _$VentorBookedSessionPaymentModelCopyWith(_VentorBookedSessionPaymentModel value, $Res Function(_VentorBookedSessionPaymentModel) _then) = __$VentorBookedSessionPaymentModelCopyWithImpl;
@override @useResult
$Res call({
 num amount_paid, String currency, num voice_change_fee, num discount_amount, num? session_price
});




}
/// @nodoc
class __$VentorBookedSessionPaymentModelCopyWithImpl<$Res>
    implements _$VentorBookedSessionPaymentModelCopyWith<$Res> {
  __$VentorBookedSessionPaymentModelCopyWithImpl(this._self, this._then);

  final _VentorBookedSessionPaymentModel _self;
  final $Res Function(_VentorBookedSessionPaymentModel) _then;

/// Create a copy of VentorBookedSessionPaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount_paid = null,Object? currency = null,Object? voice_change_fee = null,Object? discount_amount = null,Object? session_price = freezed,}) {
  return _then(_VentorBookedSessionPaymentModel(
amount_paid: null == amount_paid ? _self.amount_paid : amount_paid // ignore: cast_nullable_to_non_nullable
as num,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,voice_change_fee: null == voice_change_fee ? _self.voice_change_fee : voice_change_fee // ignore: cast_nullable_to_non_nullable
as num,discount_amount: null == discount_amount ? _self.discount_amount : discount_amount // ignore: cast_nullable_to_non_nullable
as num,session_price: freezed == session_price ? _self.session_price : session_price // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}


}


/// @nodoc
mixin _$VentorCancelSessionResponseModel {

 String get status; VentorCancelSessionData get data;
/// Create a copy of VentorCancelSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorCancelSessionResponseModelCopyWith<VentorCancelSessionResponseModel> get copyWith => _$VentorCancelSessionResponseModelCopyWithImpl<VentorCancelSessionResponseModel>(this as VentorCancelSessionResponseModel, _$identity);

  /// Serializes this VentorCancelSessionResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorCancelSessionResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorCancelSessionResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorCancelSessionResponseModelCopyWith<$Res>  {
  factory $VentorCancelSessionResponseModelCopyWith(VentorCancelSessionResponseModel value, $Res Function(VentorCancelSessionResponseModel) _then) = _$VentorCancelSessionResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorCancelSessionData data
});


$VentorCancelSessionDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorCancelSessionResponseModelCopyWithImpl<$Res>
    implements $VentorCancelSessionResponseModelCopyWith<$Res> {
  _$VentorCancelSessionResponseModelCopyWithImpl(this._self, this._then);

  final VentorCancelSessionResponseModel _self;
  final $Res Function(VentorCancelSessionResponseModel) _then;

/// Create a copy of VentorCancelSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorCancelSessionData,
  ));
}
/// Create a copy of VentorCancelSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorCancelSessionDataCopyWith<$Res> get data {
  
  return $VentorCancelSessionDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorCancelSessionResponseModel].
extension VentorCancelSessionResponseModelPatterns on VentorCancelSessionResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorCancelSessionResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorCancelSessionResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorCancelSessionResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorCancelSessionResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorCancelSessionResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorCancelSessionResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorCancelSessionData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorCancelSessionResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorCancelSessionData data)  $default,) {final _that = this;
switch (_that) {
case _VentorCancelSessionResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorCancelSessionData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorCancelSessionResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorCancelSessionResponseModel implements VentorCancelSessionResponseModel {
  const _VentorCancelSessionResponseModel({required this.status, required this.data});
  factory _VentorCancelSessionResponseModel.fromJson(Map<String, dynamic> json) => _$VentorCancelSessionResponseModelFromJson(json);

@override final  String status;
@override final  VentorCancelSessionData data;

/// Create a copy of VentorCancelSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorCancelSessionResponseModelCopyWith<_VentorCancelSessionResponseModel> get copyWith => __$VentorCancelSessionResponseModelCopyWithImpl<_VentorCancelSessionResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorCancelSessionResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorCancelSessionResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorCancelSessionResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorCancelSessionResponseModelCopyWith<$Res> implements $VentorCancelSessionResponseModelCopyWith<$Res> {
  factory _$VentorCancelSessionResponseModelCopyWith(_VentorCancelSessionResponseModel value, $Res Function(_VentorCancelSessionResponseModel) _then) = __$VentorCancelSessionResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorCancelSessionData data
});


@override $VentorCancelSessionDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorCancelSessionResponseModelCopyWithImpl<$Res>
    implements _$VentorCancelSessionResponseModelCopyWith<$Res> {
  __$VentorCancelSessionResponseModelCopyWithImpl(this._self, this._then);

  final _VentorCancelSessionResponseModel _self;
  final $Res Function(_VentorCancelSessionResponseModel) _then;

/// Create a copy of VentorCancelSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorCancelSessionResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorCancelSessionData,
  ));
}

/// Create a copy of VentorCancelSessionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorCancelSessionDataCopyWith<$Res> get data {
  
  return $VentorCancelSessionDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorCancelSessionData {

 VentorHomeBookedSessionModel get session; num? get refunded_to_balance;
/// Create a copy of VentorCancelSessionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorCancelSessionDataCopyWith<VentorCancelSessionData> get copyWith => _$VentorCancelSessionDataCopyWithImpl<VentorCancelSessionData>(this as VentorCancelSessionData, _$identity);

  /// Serializes this VentorCancelSessionData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorCancelSessionData&&(identical(other.session, session) || other.session == session)&&(identical(other.refunded_to_balance, refunded_to_balance) || other.refunded_to_balance == refunded_to_balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,refunded_to_balance);

@override
String toString() {
  return 'VentorCancelSessionData(session: $session, refunded_to_balance: $refunded_to_balance)';
}


}

/// @nodoc
abstract mixin class $VentorCancelSessionDataCopyWith<$Res>  {
  factory $VentorCancelSessionDataCopyWith(VentorCancelSessionData value, $Res Function(VentorCancelSessionData) _then) = _$VentorCancelSessionDataCopyWithImpl;
@useResult
$Res call({
 VentorHomeBookedSessionModel session, num? refunded_to_balance
});


$VentorHomeBookedSessionModelCopyWith<$Res> get session;

}
/// @nodoc
class _$VentorCancelSessionDataCopyWithImpl<$Res>
    implements $VentorCancelSessionDataCopyWith<$Res> {
  _$VentorCancelSessionDataCopyWithImpl(this._self, this._then);

  final VentorCancelSessionData _self;
  final $Res Function(VentorCancelSessionData) _then;

/// Create a copy of VentorCancelSessionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? refunded_to_balance = freezed,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as VentorHomeBookedSessionModel,refunded_to_balance: freezed == refunded_to_balance ? _self.refunded_to_balance : refunded_to_balance // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}
/// Create a copy of VentorCancelSessionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeBookedSessionModelCopyWith<$Res> get session {
  
  return $VentorHomeBookedSessionModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorCancelSessionData].
extension VentorCancelSessionDataPatterns on VentorCancelSessionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorCancelSessionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorCancelSessionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorCancelSessionData value)  $default,){
final _that = this;
switch (_that) {
case _VentorCancelSessionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorCancelSessionData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorCancelSessionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorHomeBookedSessionModel session,  num? refunded_to_balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorCancelSessionData() when $default != null:
return $default(_that.session,_that.refunded_to_balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorHomeBookedSessionModel session,  num? refunded_to_balance)  $default,) {final _that = this;
switch (_that) {
case _VentorCancelSessionData():
return $default(_that.session,_that.refunded_to_balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorHomeBookedSessionModel session,  num? refunded_to_balance)?  $default,) {final _that = this;
switch (_that) {
case _VentorCancelSessionData() when $default != null:
return $default(_that.session,_that.refunded_to_balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorCancelSessionData implements VentorCancelSessionData {
  const _VentorCancelSessionData({required this.session, this.refunded_to_balance});
  factory _VentorCancelSessionData.fromJson(Map<String, dynamic> json) => _$VentorCancelSessionDataFromJson(json);

@override final  VentorHomeBookedSessionModel session;
@override final  num? refunded_to_balance;

/// Create a copy of VentorCancelSessionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorCancelSessionDataCopyWith<_VentorCancelSessionData> get copyWith => __$VentorCancelSessionDataCopyWithImpl<_VentorCancelSessionData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorCancelSessionDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorCancelSessionData&&(identical(other.session, session) || other.session == session)&&(identical(other.refunded_to_balance, refunded_to_balance) || other.refunded_to_balance == refunded_to_balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,refunded_to_balance);

@override
String toString() {
  return 'VentorCancelSessionData(session: $session, refunded_to_balance: $refunded_to_balance)';
}


}

/// @nodoc
abstract mixin class _$VentorCancelSessionDataCopyWith<$Res> implements $VentorCancelSessionDataCopyWith<$Res> {
  factory _$VentorCancelSessionDataCopyWith(_VentorCancelSessionData value, $Res Function(_VentorCancelSessionData) _then) = __$VentorCancelSessionDataCopyWithImpl;
@override @useResult
$Res call({
 VentorHomeBookedSessionModel session, num? refunded_to_balance
});


@override $VentorHomeBookedSessionModelCopyWith<$Res> get session;

}
/// @nodoc
class __$VentorCancelSessionDataCopyWithImpl<$Res>
    implements _$VentorCancelSessionDataCopyWith<$Res> {
  __$VentorCancelSessionDataCopyWithImpl(this._self, this._then);

  final _VentorCancelSessionData _self;
  final $Res Function(_VentorCancelSessionData) _then;

/// Create a copy of VentorCancelSessionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? refunded_to_balance = freezed,}) {
  return _then(_VentorCancelSessionData(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as VentorHomeBookedSessionModel,refunded_to_balance: freezed == refunded_to_balance ? _self.refunded_to_balance : refunded_to_balance // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

/// Create a copy of VentorCancelSessionData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeBookedSessionModelCopyWith<$Res> get session {
  
  return $VentorHomeBookedSessionModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
