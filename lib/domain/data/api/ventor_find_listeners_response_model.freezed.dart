// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_find_listeners_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorFindListenersResponseModel {

 String get status; VentorFindListenersData get data;
/// Create a copy of VentorFindListenersResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorFindListenersResponseModelCopyWith<VentorFindListenersResponseModel> get copyWith => _$VentorFindListenersResponseModelCopyWithImpl<VentorFindListenersResponseModel>(this as VentorFindListenersResponseModel, _$identity);

  /// Serializes this VentorFindListenersResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFindListenersResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorFindListenersResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorFindListenersResponseModelCopyWith<$Res>  {
  factory $VentorFindListenersResponseModelCopyWith(VentorFindListenersResponseModel value, $Res Function(VentorFindListenersResponseModel) _then) = _$VentorFindListenersResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorFindListenersData data
});


$VentorFindListenersDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorFindListenersResponseModelCopyWithImpl<$Res>
    implements $VentorFindListenersResponseModelCopyWith<$Res> {
  _$VentorFindListenersResponseModelCopyWithImpl(this._self, this._then);

  final VentorFindListenersResponseModel _self;
  final $Res Function(VentorFindListenersResponseModel) _then;

/// Create a copy of VentorFindListenersResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorFindListenersData,
  ));
}
/// Create a copy of VentorFindListenersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorFindListenersDataCopyWith<$Res> get data {
  
  return $VentorFindListenersDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorFindListenersResponseModel].
extension VentorFindListenersResponseModelPatterns on VentorFindListenersResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorFindListenersResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorFindListenersResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorFindListenersResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenersResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorFindListenersResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenersResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorFindListenersData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorFindListenersResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorFindListenersData data)  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenersResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorFindListenersData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenersResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorFindListenersResponseModel implements VentorFindListenersResponseModel {
  const _VentorFindListenersResponseModel({required this.status, required this.data});
  factory _VentorFindListenersResponseModel.fromJson(Map<String, dynamic> json) => _$VentorFindListenersResponseModelFromJson(json);

@override final  String status;
@override final  VentorFindListenersData data;

/// Create a copy of VentorFindListenersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorFindListenersResponseModelCopyWith<_VentorFindListenersResponseModel> get copyWith => __$VentorFindListenersResponseModelCopyWithImpl<_VentorFindListenersResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorFindListenersResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorFindListenersResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorFindListenersResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorFindListenersResponseModelCopyWith<$Res> implements $VentorFindListenersResponseModelCopyWith<$Res> {
  factory _$VentorFindListenersResponseModelCopyWith(_VentorFindListenersResponseModel value, $Res Function(_VentorFindListenersResponseModel) _then) = __$VentorFindListenersResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorFindListenersData data
});


@override $VentorFindListenersDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorFindListenersResponseModelCopyWithImpl<$Res>
    implements _$VentorFindListenersResponseModelCopyWith<$Res> {
  __$VentorFindListenersResponseModelCopyWithImpl(this._self, this._then);

  final _VentorFindListenersResponseModel _self;
  final $Res Function(_VentorFindListenersResponseModel) _then;

/// Create a copy of VentorFindListenersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorFindListenersResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorFindListenersData,
  ));
}

/// Create a copy of VentorFindListenersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorFindListenersDataCopyWith<$Res> get data {
  
  return $VentorFindListenersDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorFindListenersData {

 List<VentorFindListenerModel> get items; int get total;
/// Create a copy of VentorFindListenersData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorFindListenersDataCopyWith<VentorFindListenersData> get copyWith => _$VentorFindListenersDataCopyWithImpl<VentorFindListenersData>(this as VentorFindListenersData, _$identity);

  /// Serializes this VentorFindListenersData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFindListenersData&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total);

@override
String toString() {
  return 'VentorFindListenersData(items: $items, total: $total)';
}


}

/// @nodoc
abstract mixin class $VentorFindListenersDataCopyWith<$Res>  {
  factory $VentorFindListenersDataCopyWith(VentorFindListenersData value, $Res Function(VentorFindListenersData) _then) = _$VentorFindListenersDataCopyWithImpl;
@useResult
$Res call({
 List<VentorFindListenerModel> items, int total
});




}
/// @nodoc
class _$VentorFindListenersDataCopyWithImpl<$Res>
    implements $VentorFindListenersDataCopyWith<$Res> {
  _$VentorFindListenersDataCopyWithImpl(this._self, this._then);

  final VentorFindListenersData _self;
  final $Res Function(VentorFindListenersData) _then;

/// Create a copy of VentorFindListenersData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<VentorFindListenerModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorFindListenersData].
extension VentorFindListenersDataPatterns on VentorFindListenersData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorFindListenersData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorFindListenersData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorFindListenersData value)  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenersData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorFindListenersData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenersData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VentorFindListenerModel> items,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorFindListenersData() when $default != null:
return $default(_that.items,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VentorFindListenerModel> items,  int total)  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenersData():
return $default(_that.items,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VentorFindListenerModel> items,  int total)?  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenersData() when $default != null:
return $default(_that.items,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorFindListenersData implements VentorFindListenersData {
  const _VentorFindListenersData({final  List<VentorFindListenerModel> items = const <VentorFindListenerModel>[], this.total = 0}): _items = items;
  factory _VentorFindListenersData.fromJson(Map<String, dynamic> json) => _$VentorFindListenersDataFromJson(json);

 final  List<VentorFindListenerModel> _items;
@override@JsonKey() List<VentorFindListenerModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int total;

/// Create a copy of VentorFindListenersData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorFindListenersDataCopyWith<_VentorFindListenersData> get copyWith => __$VentorFindListenersDataCopyWithImpl<_VentorFindListenersData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorFindListenersDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorFindListenersData&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total);

@override
String toString() {
  return 'VentorFindListenersData(items: $items, total: $total)';
}


}

/// @nodoc
abstract mixin class _$VentorFindListenersDataCopyWith<$Res> implements $VentorFindListenersDataCopyWith<$Res> {
  factory _$VentorFindListenersDataCopyWith(_VentorFindListenersData value, $Res Function(_VentorFindListenersData) _then) = __$VentorFindListenersDataCopyWithImpl;
@override @useResult
$Res call({
 List<VentorFindListenerModel> items, int total
});




}
/// @nodoc
class __$VentorFindListenersDataCopyWithImpl<$Res>
    implements _$VentorFindListenersDataCopyWith<$Res> {
  __$VentorFindListenersDataCopyWithImpl(this._self, this._then);

  final _VentorFindListenersData _self;
  final $Res Function(_VentorFindListenersData) _then;

/// Create a copy of VentorFindListenersData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,}) {
  return _then(_VentorFindListenersData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<VentorFindListenerModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$VentorFindListenerResponseModel {

 String get status; VentorFindListenerModel get data;
/// Create a copy of VentorFindListenerResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorFindListenerResponseModelCopyWith<VentorFindListenerResponseModel> get copyWith => _$VentorFindListenerResponseModelCopyWithImpl<VentorFindListenerResponseModel>(this as VentorFindListenerResponseModel, _$identity);

  /// Serializes this VentorFindListenerResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFindListenerResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorFindListenerResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorFindListenerResponseModelCopyWith<$Res>  {
  factory $VentorFindListenerResponseModelCopyWith(VentorFindListenerResponseModel value, $Res Function(VentorFindListenerResponseModel) _then) = _$VentorFindListenerResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorFindListenerModel data
});


$VentorFindListenerModelCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorFindListenerResponseModelCopyWithImpl<$Res>
    implements $VentorFindListenerResponseModelCopyWith<$Res> {
  _$VentorFindListenerResponseModelCopyWithImpl(this._self, this._then);

  final VentorFindListenerResponseModel _self;
  final $Res Function(VentorFindListenerResponseModel) _then;

/// Create a copy of VentorFindListenerResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorFindListenerModel,
  ));
}
/// Create a copy of VentorFindListenerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorFindListenerModelCopyWith<$Res> get data {
  
  return $VentorFindListenerModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorFindListenerResponseModel].
extension VentorFindListenerResponseModelPatterns on VentorFindListenerResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorFindListenerResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorFindListenerResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorFindListenerResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenerResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorFindListenerResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenerResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorFindListenerModel data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorFindListenerResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorFindListenerModel data)  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenerResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorFindListenerModel data)?  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenerResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorFindListenerResponseModel implements VentorFindListenerResponseModel {
  const _VentorFindListenerResponseModel({required this.status, required this.data});
  factory _VentorFindListenerResponseModel.fromJson(Map<String, dynamic> json) => _$VentorFindListenerResponseModelFromJson(json);

@override final  String status;
@override final  VentorFindListenerModel data;

/// Create a copy of VentorFindListenerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorFindListenerResponseModelCopyWith<_VentorFindListenerResponseModel> get copyWith => __$VentorFindListenerResponseModelCopyWithImpl<_VentorFindListenerResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorFindListenerResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorFindListenerResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorFindListenerResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorFindListenerResponseModelCopyWith<$Res> implements $VentorFindListenerResponseModelCopyWith<$Res> {
  factory _$VentorFindListenerResponseModelCopyWith(_VentorFindListenerResponseModel value, $Res Function(_VentorFindListenerResponseModel) _then) = __$VentorFindListenerResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorFindListenerModel data
});


@override $VentorFindListenerModelCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorFindListenerResponseModelCopyWithImpl<$Res>
    implements _$VentorFindListenerResponseModelCopyWith<$Res> {
  __$VentorFindListenerResponseModelCopyWithImpl(this._self, this._then);

  final _VentorFindListenerResponseModel _self;
  final $Res Function(_VentorFindListenerResponseModel) _then;

/// Create a copy of VentorFindListenerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorFindListenerResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorFindListenerModel,
  ));
}

/// Create a copy of VentorFindListenerResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorFindListenerModelCopyWith<$Res> get data {
  
  return $VentorFindListenerModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorFindListenerModel {

 String get id; String get name; String get avatar_url; double get rating; int get review_count; int get session_count; List<String> get topics; List<String> get languages; String get gender; double get rate_per_minute; String get bio; List<String> get help_with; int get voice_preview_seconds; bool get is_online; bool get is_verified; Map<String, dynamic>? get rating_breakdown; String get country; String get city; String get country_iso; Object? get life_experiences; Object? get boundaries; VentorFindListenerAvailabilityModel? get availability; bool get is_favorite;
/// Create a copy of VentorFindListenerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorFindListenerModelCopyWith<VentorFindListenerModel> get copyWith => _$VentorFindListenerModelCopyWithImpl<VentorFindListenerModel>(this as VentorFindListenerModel, _$identity);

  /// Serializes this VentorFindListenerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFindListenerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.review_count, review_count) || other.review_count == review_count)&&(identical(other.session_count, session_count) || other.session_count == session_count)&&const DeepCollectionEquality().equals(other.topics, topics)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.rate_per_minute, rate_per_minute) || other.rate_per_minute == rate_per_minute)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.help_with, help_with)&&(identical(other.voice_preview_seconds, voice_preview_seconds) || other.voice_preview_seconds == voice_preview_seconds)&&(identical(other.is_online, is_online) || other.is_online == is_online)&&(identical(other.is_verified, is_verified) || other.is_verified == is_verified)&&const DeepCollectionEquality().equals(other.rating_breakdown, rating_breakdown)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.country_iso, country_iso) || other.country_iso == country_iso)&&const DeepCollectionEquality().equals(other.life_experiences, life_experiences)&&const DeepCollectionEquality().equals(other.boundaries, boundaries)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.is_favorite, is_favorite) || other.is_favorite == is_favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,avatar_url,rating,review_count,session_count,const DeepCollectionEquality().hash(topics),const DeepCollectionEquality().hash(languages),gender,rate_per_minute,bio,const DeepCollectionEquality().hash(help_with),voice_preview_seconds,is_online,is_verified,const DeepCollectionEquality().hash(rating_breakdown),country,city,country_iso,const DeepCollectionEquality().hash(life_experiences),const DeepCollectionEquality().hash(boundaries),availability,is_favorite]);

@override
String toString() {
  return 'VentorFindListenerModel(id: $id, name: $name, avatar_url: $avatar_url, rating: $rating, review_count: $review_count, session_count: $session_count, topics: $topics, languages: $languages, gender: $gender, rate_per_minute: $rate_per_minute, bio: $bio, help_with: $help_with, voice_preview_seconds: $voice_preview_seconds, is_online: $is_online, is_verified: $is_verified, rating_breakdown: $rating_breakdown, country: $country, city: $city, country_iso: $country_iso, life_experiences: $life_experiences, boundaries: $boundaries, availability: $availability, is_favorite: $is_favorite)';
}


}

/// @nodoc
abstract mixin class $VentorFindListenerModelCopyWith<$Res>  {
  factory $VentorFindListenerModelCopyWith(VentorFindListenerModel value, $Res Function(VentorFindListenerModel) _then) = _$VentorFindListenerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String avatar_url, double rating, int review_count, int session_count, List<String> topics, List<String> languages, String gender, double rate_per_minute, String bio, List<String> help_with, int voice_preview_seconds, bool is_online, bool is_verified, Map<String, dynamic>? rating_breakdown, String country, String city, String country_iso, Object? life_experiences, Object? boundaries, VentorFindListenerAvailabilityModel? availability, bool is_favorite
});


$VentorFindListenerAvailabilityModelCopyWith<$Res>? get availability;

}
/// @nodoc
class _$VentorFindListenerModelCopyWithImpl<$Res>
    implements $VentorFindListenerModelCopyWith<$Res> {
  _$VentorFindListenerModelCopyWithImpl(this._self, this._then);

  final VentorFindListenerModel _self;
  final $Res Function(VentorFindListenerModel) _then;

/// Create a copy of VentorFindListenerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar_url = null,Object? rating = null,Object? review_count = null,Object? session_count = null,Object? topics = null,Object? languages = null,Object? gender = null,Object? rate_per_minute = null,Object? bio = null,Object? help_with = null,Object? voice_preview_seconds = null,Object? is_online = null,Object? is_verified = null,Object? rating_breakdown = freezed,Object? country = null,Object? city = null,Object? country_iso = null,Object? life_experiences = freezed,Object? boundaries = freezed,Object? availability = freezed,Object? is_favorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar_url: null == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,review_count: null == review_count ? _self.review_count : review_count // ignore: cast_nullable_to_non_nullable
as int,session_count: null == session_count ? _self.session_count : session_count // ignore: cast_nullable_to_non_nullable
as int,topics: null == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,rate_per_minute: null == rate_per_minute ? _self.rate_per_minute : rate_per_minute // ignore: cast_nullable_to_non_nullable
as double,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,help_with: null == help_with ? _self.help_with : help_with // ignore: cast_nullable_to_non_nullable
as List<String>,voice_preview_seconds: null == voice_preview_seconds ? _self.voice_preview_seconds : voice_preview_seconds // ignore: cast_nullable_to_non_nullable
as int,is_online: null == is_online ? _self.is_online : is_online // ignore: cast_nullable_to_non_nullable
as bool,is_verified: null == is_verified ? _self.is_verified : is_verified // ignore: cast_nullable_to_non_nullable
as bool,rating_breakdown: freezed == rating_breakdown ? _self.rating_breakdown : rating_breakdown // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country_iso: null == country_iso ? _self.country_iso : country_iso // ignore: cast_nullable_to_non_nullable
as String,life_experiences: freezed == life_experiences ? _self.life_experiences : life_experiences ,boundaries: freezed == boundaries ? _self.boundaries : boundaries ,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as VentorFindListenerAvailabilityModel?,is_favorite: null == is_favorite ? _self.is_favorite : is_favorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of VentorFindListenerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorFindListenerAvailabilityModelCopyWith<$Res>? get availability {
    if (_self.availability == null) {
    return null;
  }

  return $VentorFindListenerAvailabilityModelCopyWith<$Res>(_self.availability!, (value) {
    return _then(_self.copyWith(availability: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorFindListenerModel].
extension VentorFindListenerModelPatterns on VentorFindListenerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorFindListenerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorFindListenerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorFindListenerModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorFindListenerModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String avatar_url,  double rating,  int review_count,  int session_count,  List<String> topics,  List<String> languages,  String gender,  double rate_per_minute,  String bio,  List<String> help_with,  int voice_preview_seconds,  bool is_online,  bool is_verified,  Map<String, dynamic>? rating_breakdown,  String country,  String city,  String country_iso,  Object? life_experiences,  Object? boundaries,  VentorFindListenerAvailabilityModel? availability,  bool is_favorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorFindListenerModel() when $default != null:
return $default(_that.id,_that.name,_that.avatar_url,_that.rating,_that.review_count,_that.session_count,_that.topics,_that.languages,_that.gender,_that.rate_per_minute,_that.bio,_that.help_with,_that.voice_preview_seconds,_that.is_online,_that.is_verified,_that.rating_breakdown,_that.country,_that.city,_that.country_iso,_that.life_experiences,_that.boundaries,_that.availability,_that.is_favorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String avatar_url,  double rating,  int review_count,  int session_count,  List<String> topics,  List<String> languages,  String gender,  double rate_per_minute,  String bio,  List<String> help_with,  int voice_preview_seconds,  bool is_online,  bool is_verified,  Map<String, dynamic>? rating_breakdown,  String country,  String city,  String country_iso,  Object? life_experiences,  Object? boundaries,  VentorFindListenerAvailabilityModel? availability,  bool is_favorite)  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenerModel():
return $default(_that.id,_that.name,_that.avatar_url,_that.rating,_that.review_count,_that.session_count,_that.topics,_that.languages,_that.gender,_that.rate_per_minute,_that.bio,_that.help_with,_that.voice_preview_seconds,_that.is_online,_that.is_verified,_that.rating_breakdown,_that.country,_that.city,_that.country_iso,_that.life_experiences,_that.boundaries,_that.availability,_that.is_favorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String avatar_url,  double rating,  int review_count,  int session_count,  List<String> topics,  List<String> languages,  String gender,  double rate_per_minute,  String bio,  List<String> help_with,  int voice_preview_seconds,  bool is_online,  bool is_verified,  Map<String, dynamic>? rating_breakdown,  String country,  String city,  String country_iso,  Object? life_experiences,  Object? boundaries,  VentorFindListenerAvailabilityModel? availability,  bool is_favorite)?  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenerModel() when $default != null:
return $default(_that.id,_that.name,_that.avatar_url,_that.rating,_that.review_count,_that.session_count,_that.topics,_that.languages,_that.gender,_that.rate_per_minute,_that.bio,_that.help_with,_that.voice_preview_seconds,_that.is_online,_that.is_verified,_that.rating_breakdown,_that.country,_that.city,_that.country_iso,_that.life_experiences,_that.boundaries,_that.availability,_that.is_favorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorFindListenerModel implements VentorFindListenerModel {
  const _VentorFindListenerModel({this.id = '', this.name = '', this.avatar_url = '', this.rating = 0, this.review_count = 0, this.session_count = 0, final  List<String> topics = const <String>[], final  List<String> languages = const <String>[], this.gender = '', this.rate_per_minute = 0, this.bio = '', final  List<String> help_with = const <String>[], this.voice_preview_seconds = 0, this.is_online = false, this.is_verified = false, final  Map<String, dynamic>? rating_breakdown, this.country = '', this.city = '', this.country_iso = '', this.life_experiences, this.boundaries, this.availability, this.is_favorite = false}): _topics = topics,_languages = languages,_help_with = help_with,_rating_breakdown = rating_breakdown;
  factory _VentorFindListenerModel.fromJson(Map<String, dynamic> json) => _$VentorFindListenerModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String avatar_url;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int review_count;
@override@JsonKey() final  int session_count;
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

@override@JsonKey() final  String gender;
@override@JsonKey() final  double rate_per_minute;
@override@JsonKey() final  String bio;
 final  List<String> _help_with;
@override@JsonKey() List<String> get help_with {
  if (_help_with is EqualUnmodifiableListView) return _help_with;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_help_with);
}

@override@JsonKey() final  int voice_preview_seconds;
@override@JsonKey() final  bool is_online;
@override@JsonKey() final  bool is_verified;
 final  Map<String, dynamic>? _rating_breakdown;
@override Map<String, dynamic>? get rating_breakdown {
  final value = _rating_breakdown;
  if (value == null) return null;
  if (_rating_breakdown is EqualUnmodifiableMapView) return _rating_breakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  String country;
@override@JsonKey() final  String city;
@override@JsonKey() final  String country_iso;
@override final  Object? life_experiences;
@override final  Object? boundaries;
@override final  VentorFindListenerAvailabilityModel? availability;
@override@JsonKey() final  bool is_favorite;

/// Create a copy of VentorFindListenerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorFindListenerModelCopyWith<_VentorFindListenerModel> get copyWith => __$VentorFindListenerModelCopyWithImpl<_VentorFindListenerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorFindListenerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorFindListenerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.review_count, review_count) || other.review_count == review_count)&&(identical(other.session_count, session_count) || other.session_count == session_count)&&const DeepCollectionEquality().equals(other._topics, _topics)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.rate_per_minute, rate_per_minute) || other.rate_per_minute == rate_per_minute)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._help_with, _help_with)&&(identical(other.voice_preview_seconds, voice_preview_seconds) || other.voice_preview_seconds == voice_preview_seconds)&&(identical(other.is_online, is_online) || other.is_online == is_online)&&(identical(other.is_verified, is_verified) || other.is_verified == is_verified)&&const DeepCollectionEquality().equals(other._rating_breakdown, _rating_breakdown)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.country_iso, country_iso) || other.country_iso == country_iso)&&const DeepCollectionEquality().equals(other.life_experiences, life_experiences)&&const DeepCollectionEquality().equals(other.boundaries, boundaries)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.is_favorite, is_favorite) || other.is_favorite == is_favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,avatar_url,rating,review_count,session_count,const DeepCollectionEquality().hash(_topics),const DeepCollectionEquality().hash(_languages),gender,rate_per_minute,bio,const DeepCollectionEquality().hash(_help_with),voice_preview_seconds,is_online,is_verified,const DeepCollectionEquality().hash(_rating_breakdown),country,city,country_iso,const DeepCollectionEquality().hash(life_experiences),const DeepCollectionEquality().hash(boundaries),availability,is_favorite]);

@override
String toString() {
  return 'VentorFindListenerModel(id: $id, name: $name, avatar_url: $avatar_url, rating: $rating, review_count: $review_count, session_count: $session_count, topics: $topics, languages: $languages, gender: $gender, rate_per_minute: $rate_per_minute, bio: $bio, help_with: $help_with, voice_preview_seconds: $voice_preview_seconds, is_online: $is_online, is_verified: $is_verified, rating_breakdown: $rating_breakdown, country: $country, city: $city, country_iso: $country_iso, life_experiences: $life_experiences, boundaries: $boundaries, availability: $availability, is_favorite: $is_favorite)';
}


}

/// @nodoc
abstract mixin class _$VentorFindListenerModelCopyWith<$Res> implements $VentorFindListenerModelCopyWith<$Res> {
  factory _$VentorFindListenerModelCopyWith(_VentorFindListenerModel value, $Res Function(_VentorFindListenerModel) _then) = __$VentorFindListenerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String avatar_url, double rating, int review_count, int session_count, List<String> topics, List<String> languages, String gender, double rate_per_minute, String bio, List<String> help_with, int voice_preview_seconds, bool is_online, bool is_verified, Map<String, dynamic>? rating_breakdown, String country, String city, String country_iso, Object? life_experiences, Object? boundaries, VentorFindListenerAvailabilityModel? availability, bool is_favorite
});


@override $VentorFindListenerAvailabilityModelCopyWith<$Res>? get availability;

}
/// @nodoc
class __$VentorFindListenerModelCopyWithImpl<$Res>
    implements _$VentorFindListenerModelCopyWith<$Res> {
  __$VentorFindListenerModelCopyWithImpl(this._self, this._then);

  final _VentorFindListenerModel _self;
  final $Res Function(_VentorFindListenerModel) _then;

/// Create a copy of VentorFindListenerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar_url = null,Object? rating = null,Object? review_count = null,Object? session_count = null,Object? topics = null,Object? languages = null,Object? gender = null,Object? rate_per_minute = null,Object? bio = null,Object? help_with = null,Object? voice_preview_seconds = null,Object? is_online = null,Object? is_verified = null,Object? rating_breakdown = freezed,Object? country = null,Object? city = null,Object? country_iso = null,Object? life_experiences = freezed,Object? boundaries = freezed,Object? availability = freezed,Object? is_favorite = null,}) {
  return _then(_VentorFindListenerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar_url: null == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,review_count: null == review_count ? _self.review_count : review_count // ignore: cast_nullable_to_non_nullable
as int,session_count: null == session_count ? _self.session_count : session_count // ignore: cast_nullable_to_non_nullable
as int,topics: null == topics ? _self._topics : topics // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,rate_per_minute: null == rate_per_minute ? _self.rate_per_minute : rate_per_minute // ignore: cast_nullable_to_non_nullable
as double,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,help_with: null == help_with ? _self._help_with : help_with // ignore: cast_nullable_to_non_nullable
as List<String>,voice_preview_seconds: null == voice_preview_seconds ? _self.voice_preview_seconds : voice_preview_seconds // ignore: cast_nullable_to_non_nullable
as int,is_online: null == is_online ? _self.is_online : is_online // ignore: cast_nullable_to_non_nullable
as bool,is_verified: null == is_verified ? _self.is_verified : is_verified // ignore: cast_nullable_to_non_nullable
as bool,rating_breakdown: freezed == rating_breakdown ? _self._rating_breakdown : rating_breakdown // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country_iso: null == country_iso ? _self.country_iso : country_iso // ignore: cast_nullable_to_non_nullable
as String,life_experiences: freezed == life_experiences ? _self.life_experiences : life_experiences ,boundaries: freezed == boundaries ? _self.boundaries : boundaries ,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as VentorFindListenerAvailabilityModel?,is_favorite: null == is_favorite ? _self.is_favorite : is_favorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of VentorFindListenerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorFindListenerAvailabilityModelCopyWith<$Res>? get availability {
    if (_self.availability == null) {
    return null;
  }

  return $VentorFindListenerAvailabilityModelCopyWith<$Res>(_self.availability!, (value) {
    return _then(_self.copyWith(availability: value));
  });
}
}


/// @nodoc
mixin _$VentorFindListenerAvailabilityModel {

 List<String> get days; String get from_hour; String get to_hour; String get time_zone_id; bool get accept_instant_call; List<int> get session_minutes;
/// Create a copy of VentorFindListenerAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorFindListenerAvailabilityModelCopyWith<VentorFindListenerAvailabilityModel> get copyWith => _$VentorFindListenerAvailabilityModelCopyWithImpl<VentorFindListenerAvailabilityModel>(this as VentorFindListenerAvailabilityModel, _$identity);

  /// Serializes this VentorFindListenerAvailabilityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFindListenerAvailabilityModel&&const DeepCollectionEquality().equals(other.days, days)&&(identical(other.from_hour, from_hour) || other.from_hour == from_hour)&&(identical(other.to_hour, to_hour) || other.to_hour == to_hour)&&(identical(other.time_zone_id, time_zone_id) || other.time_zone_id == time_zone_id)&&(identical(other.accept_instant_call, accept_instant_call) || other.accept_instant_call == accept_instant_call)&&const DeepCollectionEquality().equals(other.session_minutes, session_minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(days),from_hour,to_hour,time_zone_id,accept_instant_call,const DeepCollectionEquality().hash(session_minutes));

@override
String toString() {
  return 'VentorFindListenerAvailabilityModel(days: $days, from_hour: $from_hour, to_hour: $to_hour, time_zone_id: $time_zone_id, accept_instant_call: $accept_instant_call, session_minutes: $session_minutes)';
}


}

/// @nodoc
abstract mixin class $VentorFindListenerAvailabilityModelCopyWith<$Res>  {
  factory $VentorFindListenerAvailabilityModelCopyWith(VentorFindListenerAvailabilityModel value, $Res Function(VentorFindListenerAvailabilityModel) _then) = _$VentorFindListenerAvailabilityModelCopyWithImpl;
@useResult
$Res call({
 List<String> days, String from_hour, String to_hour, String time_zone_id, bool accept_instant_call, List<int> session_minutes
});




}
/// @nodoc
class _$VentorFindListenerAvailabilityModelCopyWithImpl<$Res>
    implements $VentorFindListenerAvailabilityModelCopyWith<$Res> {
  _$VentorFindListenerAvailabilityModelCopyWithImpl(this._self, this._then);

  final VentorFindListenerAvailabilityModel _self;
  final $Res Function(VentorFindListenerAvailabilityModel) _then;

/// Create a copy of VentorFindListenerAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? days = null,Object? from_hour = null,Object? to_hour = null,Object? time_zone_id = null,Object? accept_instant_call = null,Object? session_minutes = null,}) {
  return _then(_self.copyWith(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<String>,from_hour: null == from_hour ? _self.from_hour : from_hour // ignore: cast_nullable_to_non_nullable
as String,to_hour: null == to_hour ? _self.to_hour : to_hour // ignore: cast_nullable_to_non_nullable
as String,time_zone_id: null == time_zone_id ? _self.time_zone_id : time_zone_id // ignore: cast_nullable_to_non_nullable
as String,accept_instant_call: null == accept_instant_call ? _self.accept_instant_call : accept_instant_call // ignore: cast_nullable_to_non_nullable
as bool,session_minutes: null == session_minutes ? _self.session_minutes : session_minutes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorFindListenerAvailabilityModel].
extension VentorFindListenerAvailabilityModelPatterns on VentorFindListenerAvailabilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorFindListenerAvailabilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorFindListenerAvailabilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorFindListenerAvailabilityModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenerAvailabilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorFindListenerAvailabilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenerAvailabilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> days,  String from_hour,  String to_hour,  String time_zone_id,  bool accept_instant_call,  List<int> session_minutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorFindListenerAvailabilityModel() when $default != null:
return $default(_that.days,_that.from_hour,_that.to_hour,_that.time_zone_id,_that.accept_instant_call,_that.session_minutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> days,  String from_hour,  String to_hour,  String time_zone_id,  bool accept_instant_call,  List<int> session_minutes)  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenerAvailabilityModel():
return $default(_that.days,_that.from_hour,_that.to_hour,_that.time_zone_id,_that.accept_instant_call,_that.session_minutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> days,  String from_hour,  String to_hour,  String time_zone_id,  bool accept_instant_call,  List<int> session_minutes)?  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenerAvailabilityModel() when $default != null:
return $default(_that.days,_that.from_hour,_that.to_hour,_that.time_zone_id,_that.accept_instant_call,_that.session_minutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorFindListenerAvailabilityModel implements VentorFindListenerAvailabilityModel {
  const _VentorFindListenerAvailabilityModel({final  List<String> days = const <String>[], this.from_hour = '', this.to_hour = '', this.time_zone_id = '', this.accept_instant_call = false, final  List<int> session_minutes = const <int>[]}): _days = days,_session_minutes = session_minutes;
  factory _VentorFindListenerAvailabilityModel.fromJson(Map<String, dynamic> json) => _$VentorFindListenerAvailabilityModelFromJson(json);

 final  List<String> _days;
@override@JsonKey() List<String> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

@override@JsonKey() final  String from_hour;
@override@JsonKey() final  String to_hour;
@override@JsonKey() final  String time_zone_id;
@override@JsonKey() final  bool accept_instant_call;
 final  List<int> _session_minutes;
@override@JsonKey() List<int> get session_minutes {
  if (_session_minutes is EqualUnmodifiableListView) return _session_minutes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_session_minutes);
}


/// Create a copy of VentorFindListenerAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorFindListenerAvailabilityModelCopyWith<_VentorFindListenerAvailabilityModel> get copyWith => __$VentorFindListenerAvailabilityModelCopyWithImpl<_VentorFindListenerAvailabilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorFindListenerAvailabilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorFindListenerAvailabilityModel&&const DeepCollectionEquality().equals(other._days, _days)&&(identical(other.from_hour, from_hour) || other.from_hour == from_hour)&&(identical(other.to_hour, to_hour) || other.to_hour == to_hour)&&(identical(other.time_zone_id, time_zone_id) || other.time_zone_id == time_zone_id)&&(identical(other.accept_instant_call, accept_instant_call) || other.accept_instant_call == accept_instant_call)&&const DeepCollectionEquality().equals(other._session_minutes, _session_minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_days),from_hour,to_hour,time_zone_id,accept_instant_call,const DeepCollectionEquality().hash(_session_minutes));

@override
String toString() {
  return 'VentorFindListenerAvailabilityModel(days: $days, from_hour: $from_hour, to_hour: $to_hour, time_zone_id: $time_zone_id, accept_instant_call: $accept_instant_call, session_minutes: $session_minutes)';
}


}

/// @nodoc
abstract mixin class _$VentorFindListenerAvailabilityModelCopyWith<$Res> implements $VentorFindListenerAvailabilityModelCopyWith<$Res> {
  factory _$VentorFindListenerAvailabilityModelCopyWith(_VentorFindListenerAvailabilityModel value, $Res Function(_VentorFindListenerAvailabilityModel) _then) = __$VentorFindListenerAvailabilityModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> days, String from_hour, String to_hour, String time_zone_id, bool accept_instant_call, List<int> session_minutes
});




}
/// @nodoc
class __$VentorFindListenerAvailabilityModelCopyWithImpl<$Res>
    implements _$VentorFindListenerAvailabilityModelCopyWith<$Res> {
  __$VentorFindListenerAvailabilityModelCopyWithImpl(this._self, this._then);

  final _VentorFindListenerAvailabilityModel _self;
  final $Res Function(_VentorFindListenerAvailabilityModel) _then;

/// Create a copy of VentorFindListenerAvailabilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? days = null,Object? from_hour = null,Object? to_hour = null,Object? time_zone_id = null,Object? accept_instant_call = null,Object? session_minutes = null,}) {
  return _then(_VentorFindListenerAvailabilityModel(
days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<String>,from_hour: null == from_hour ? _self.from_hour : from_hour // ignore: cast_nullable_to_non_nullable
as String,to_hour: null == to_hour ? _self.to_hour : to_hour // ignore: cast_nullable_to_non_nullable
as String,time_zone_id: null == time_zone_id ? _self.time_zone_id : time_zone_id // ignore: cast_nullable_to_non_nullable
as String,accept_instant_call: null == accept_instant_call ? _self.accept_instant_call : accept_instant_call // ignore: cast_nullable_to_non_nullable
as bool,session_minutes: null == session_minutes ? _self._session_minutes : session_minutes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
