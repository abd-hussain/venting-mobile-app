// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_favorites_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorFavoritesResponseModel {

 String get status; VentorFavoritesData get data;
/// Create a copy of VentorFavoritesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorFavoritesResponseModelCopyWith<VentorFavoritesResponseModel> get copyWith => _$VentorFavoritesResponseModelCopyWithImpl<VentorFavoritesResponseModel>(this as VentorFavoritesResponseModel, _$identity);

  /// Serializes this VentorFavoritesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFavoritesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorFavoritesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorFavoritesResponseModelCopyWith<$Res>  {
  factory $VentorFavoritesResponseModelCopyWith(VentorFavoritesResponseModel value, $Res Function(VentorFavoritesResponseModel) _then) = _$VentorFavoritesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorFavoritesData data
});


$VentorFavoritesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorFavoritesResponseModelCopyWithImpl<$Res>
    implements $VentorFavoritesResponseModelCopyWith<$Res> {
  _$VentorFavoritesResponseModelCopyWithImpl(this._self, this._then);

  final VentorFavoritesResponseModel _self;
  final $Res Function(VentorFavoritesResponseModel) _then;

/// Create a copy of VentorFavoritesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorFavoritesData,
  ));
}
/// Create a copy of VentorFavoritesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorFavoritesDataCopyWith<$Res> get data {
  
  return $VentorFavoritesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorFavoritesResponseModel].
extension VentorFavoritesResponseModelPatterns on VentorFavoritesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorFavoritesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorFavoritesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorFavoritesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorFavoritesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorFavoritesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorFavoritesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorFavoritesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorFavoritesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorFavoritesData data)  $default,) {final _that = this;
switch (_that) {
case _VentorFavoritesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorFavoritesData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorFavoritesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorFavoritesResponseModel implements VentorFavoritesResponseModel {
  const _VentorFavoritesResponseModel({required this.status, required this.data});
  factory _VentorFavoritesResponseModel.fromJson(Map<String, dynamic> json) => _$VentorFavoritesResponseModelFromJson(json);

@override final  String status;
@override final  VentorFavoritesData data;

/// Create a copy of VentorFavoritesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorFavoritesResponseModelCopyWith<_VentorFavoritesResponseModel> get copyWith => __$VentorFavoritesResponseModelCopyWithImpl<_VentorFavoritesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorFavoritesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorFavoritesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorFavoritesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorFavoritesResponseModelCopyWith<$Res> implements $VentorFavoritesResponseModelCopyWith<$Res> {
  factory _$VentorFavoritesResponseModelCopyWith(_VentorFavoritesResponseModel value, $Res Function(_VentorFavoritesResponseModel) _then) = __$VentorFavoritesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorFavoritesData data
});


@override $VentorFavoritesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorFavoritesResponseModelCopyWithImpl<$Res>
    implements _$VentorFavoritesResponseModelCopyWith<$Res> {
  __$VentorFavoritesResponseModelCopyWithImpl(this._self, this._then);

  final _VentorFavoritesResponseModel _self;
  final $Res Function(_VentorFavoritesResponseModel) _then;

/// Create a copy of VentorFavoritesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorFavoritesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorFavoritesData,
  ));
}

/// Create a copy of VentorFavoritesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorFavoritesDataCopyWith<$Res> get data {
  
  return $VentorFavoritesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorFavoritesData {

 List<VentorFavoriteListenerModel> get items;
/// Create a copy of VentorFavoritesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorFavoritesDataCopyWith<VentorFavoritesData> get copyWith => _$VentorFavoritesDataCopyWithImpl<VentorFavoritesData>(this as VentorFavoritesData, _$identity);

  /// Serializes this VentorFavoritesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFavoritesData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'VentorFavoritesData(items: $items)';
}


}

/// @nodoc
abstract mixin class $VentorFavoritesDataCopyWith<$Res>  {
  factory $VentorFavoritesDataCopyWith(VentorFavoritesData value, $Res Function(VentorFavoritesData) _then) = _$VentorFavoritesDataCopyWithImpl;
@useResult
$Res call({
 List<VentorFavoriteListenerModel> items
});




}
/// @nodoc
class _$VentorFavoritesDataCopyWithImpl<$Res>
    implements $VentorFavoritesDataCopyWith<$Res> {
  _$VentorFavoritesDataCopyWithImpl(this._self, this._then);

  final VentorFavoritesData _self;
  final $Res Function(VentorFavoritesData) _then;

/// Create a copy of VentorFavoritesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<VentorFavoriteListenerModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorFavoritesData].
extension VentorFavoritesDataPatterns on VentorFavoritesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorFavoritesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorFavoritesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorFavoritesData value)  $default,){
final _that = this;
switch (_that) {
case _VentorFavoritesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorFavoritesData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorFavoritesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VentorFavoriteListenerModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorFavoritesData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VentorFavoriteListenerModel> items)  $default,) {final _that = this;
switch (_that) {
case _VentorFavoritesData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VentorFavoriteListenerModel> items)?  $default,) {final _that = this;
switch (_that) {
case _VentorFavoritesData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorFavoritesData implements VentorFavoritesData {
  const _VentorFavoritesData({final  List<VentorFavoriteListenerModel> items = const <VentorFavoriteListenerModel>[]}): _items = items;
  factory _VentorFavoritesData.fromJson(Map<String, dynamic> json) => _$VentorFavoritesDataFromJson(json);

 final  List<VentorFavoriteListenerModel> _items;
@override@JsonKey() List<VentorFavoriteListenerModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of VentorFavoritesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorFavoritesDataCopyWith<_VentorFavoritesData> get copyWith => __$VentorFavoritesDataCopyWithImpl<_VentorFavoritesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorFavoritesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorFavoritesData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'VentorFavoritesData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$VentorFavoritesDataCopyWith<$Res> implements $VentorFavoritesDataCopyWith<$Res> {
  factory _$VentorFavoritesDataCopyWith(_VentorFavoritesData value, $Res Function(_VentorFavoritesData) _then) = __$VentorFavoritesDataCopyWithImpl;
@override @useResult
$Res call({
 List<VentorFavoriteListenerModel> items
});




}
/// @nodoc
class __$VentorFavoritesDataCopyWithImpl<$Res>
    implements _$VentorFavoritesDataCopyWith<$Res> {
  __$VentorFavoritesDataCopyWithImpl(this._self, this._then);

  final _VentorFavoritesData _self;
  final $Res Function(_VentorFavoritesData) _then;

/// Create a copy of VentorFavoritesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_VentorFavoritesData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<VentorFavoriteListenerModel>,
  ));
}


}


/// @nodoc
mixin _$VentorFavoriteListenerModel {

 String get id; String get name; num get rating; String? get avatar_url;
/// Create a copy of VentorFavoriteListenerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorFavoriteListenerModelCopyWith<VentorFavoriteListenerModel> get copyWith => _$VentorFavoriteListenerModelCopyWithImpl<VentorFavoriteListenerModel>(this as VentorFavoriteListenerModel, _$identity);

  /// Serializes this VentorFavoriteListenerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFavoriteListenerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rating,avatar_url);

@override
String toString() {
  return 'VentorFavoriteListenerModel(id: $id, name: $name, rating: $rating, avatar_url: $avatar_url)';
}


}

/// @nodoc
abstract mixin class $VentorFavoriteListenerModelCopyWith<$Res>  {
  factory $VentorFavoriteListenerModelCopyWith(VentorFavoriteListenerModel value, $Res Function(VentorFavoriteListenerModel) _then) = _$VentorFavoriteListenerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, num rating, String? avatar_url
});




}
/// @nodoc
class _$VentorFavoriteListenerModelCopyWithImpl<$Res>
    implements $VentorFavoriteListenerModelCopyWith<$Res> {
  _$VentorFavoriteListenerModelCopyWithImpl(this._self, this._then);

  final VentorFavoriteListenerModel _self;
  final $Res Function(VentorFavoriteListenerModel) _then;

/// Create a copy of VentorFavoriteListenerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? rating = null,Object? avatar_url = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num,avatar_url: freezed == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorFavoriteListenerModel].
extension VentorFavoriteListenerModelPatterns on VentorFavoriteListenerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorFavoriteListenerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorFavoriteListenerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorFavoriteListenerModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorFavoriteListenerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorFavoriteListenerModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorFavoriteListenerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  num rating,  String? avatar_url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorFavoriteListenerModel() when $default != null:
return $default(_that.id,_that.name,_that.rating,_that.avatar_url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  num rating,  String? avatar_url)  $default,) {final _that = this;
switch (_that) {
case _VentorFavoriteListenerModel():
return $default(_that.id,_that.name,_that.rating,_that.avatar_url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  num rating,  String? avatar_url)?  $default,) {final _that = this;
switch (_that) {
case _VentorFavoriteListenerModel() when $default != null:
return $default(_that.id,_that.name,_that.rating,_that.avatar_url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorFavoriteListenerModel implements VentorFavoriteListenerModel {
  const _VentorFavoriteListenerModel({this.id = '', this.name = '', this.rating = 0, this.avatar_url});
  factory _VentorFavoriteListenerModel.fromJson(Map<String, dynamic> json) => _$VentorFavoriteListenerModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  num rating;
@override final  String? avatar_url;

/// Create a copy of VentorFavoriteListenerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorFavoriteListenerModelCopyWith<_VentorFavoriteListenerModel> get copyWith => __$VentorFavoriteListenerModelCopyWithImpl<_VentorFavoriteListenerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorFavoriteListenerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorFavoriteListenerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rating,avatar_url);

@override
String toString() {
  return 'VentorFavoriteListenerModel(id: $id, name: $name, rating: $rating, avatar_url: $avatar_url)';
}


}

/// @nodoc
abstract mixin class _$VentorFavoriteListenerModelCopyWith<$Res> implements $VentorFavoriteListenerModelCopyWith<$Res> {
  factory _$VentorFavoriteListenerModelCopyWith(_VentorFavoriteListenerModel value, $Res Function(_VentorFavoriteListenerModel) _then) = __$VentorFavoriteListenerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, num rating, String? avatar_url
});




}
/// @nodoc
class __$VentorFavoriteListenerModelCopyWithImpl<$Res>
    implements _$VentorFavoriteListenerModelCopyWith<$Res> {
  __$VentorFavoriteListenerModelCopyWithImpl(this._self, this._then);

  final _VentorFavoriteListenerModel _self;
  final $Res Function(_VentorFavoriteListenerModel) _then;

/// Create a copy of VentorFavoriteListenerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? rating = null,Object? avatar_url = freezed,}) {
  return _then(_VentorFavoriteListenerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num,avatar_url: freezed == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
