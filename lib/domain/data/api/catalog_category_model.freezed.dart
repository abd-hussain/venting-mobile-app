// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogCategoriesResponseModel {

 String get status; CatalogCategoriesData get data;
/// Create a copy of CatalogCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogCategoriesResponseModelCopyWith<CatalogCategoriesResponseModel> get copyWith => _$CatalogCategoriesResponseModelCopyWithImpl<CatalogCategoriesResponseModel>(this as CatalogCategoriesResponseModel, _$identity);

  /// Serializes this CatalogCategoriesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogCategoriesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'CatalogCategoriesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $CatalogCategoriesResponseModelCopyWith<$Res>  {
  factory $CatalogCategoriesResponseModelCopyWith(CatalogCategoriesResponseModel value, $Res Function(CatalogCategoriesResponseModel) _then) = _$CatalogCategoriesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, CatalogCategoriesData data
});


$CatalogCategoriesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$CatalogCategoriesResponseModelCopyWithImpl<$Res>
    implements $CatalogCategoriesResponseModelCopyWith<$Res> {
  _$CatalogCategoriesResponseModelCopyWithImpl(this._self, this._then);

  final CatalogCategoriesResponseModel _self;
  final $Res Function(CatalogCategoriesResponseModel) _then;

/// Create a copy of CatalogCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CatalogCategoriesData,
  ));
}
/// Create a copy of CatalogCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogCategoriesDataCopyWith<$Res> get data {
  
  return $CatalogCategoriesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CatalogCategoriesResponseModel].
extension CatalogCategoriesResponseModelPatterns on CatalogCategoriesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogCategoriesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogCategoriesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogCategoriesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogCategoriesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogCategoriesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogCategoriesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  CatalogCategoriesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogCategoriesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  CatalogCategoriesData data)  $default,) {final _that = this;
switch (_that) {
case _CatalogCategoriesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  CatalogCategoriesData data)?  $default,) {final _that = this;
switch (_that) {
case _CatalogCategoriesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogCategoriesResponseModel implements CatalogCategoriesResponseModel {
  const _CatalogCategoriesResponseModel({required this.status, required this.data});
  factory _CatalogCategoriesResponseModel.fromJson(Map<String, dynamic> json) => _$CatalogCategoriesResponseModelFromJson(json);

@override final  String status;
@override final  CatalogCategoriesData data;

/// Create a copy of CatalogCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogCategoriesResponseModelCopyWith<_CatalogCategoriesResponseModel> get copyWith => __$CatalogCategoriesResponseModelCopyWithImpl<_CatalogCategoriesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogCategoriesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogCategoriesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'CatalogCategoriesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CatalogCategoriesResponseModelCopyWith<$Res> implements $CatalogCategoriesResponseModelCopyWith<$Res> {
  factory _$CatalogCategoriesResponseModelCopyWith(_CatalogCategoriesResponseModel value, $Res Function(_CatalogCategoriesResponseModel) _then) = __$CatalogCategoriesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, CatalogCategoriesData data
});


@override $CatalogCategoriesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$CatalogCategoriesResponseModelCopyWithImpl<$Res>
    implements _$CatalogCategoriesResponseModelCopyWith<$Res> {
  __$CatalogCategoriesResponseModelCopyWithImpl(this._self, this._then);

  final _CatalogCategoriesResponseModel _self;
  final $Res Function(_CatalogCategoriesResponseModel) _then;

/// Create a copy of CatalogCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_CatalogCategoriesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CatalogCategoriesData,
  ));
}

/// Create a copy of CatalogCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogCategoriesDataCopyWith<$Res> get data {
  
  return $CatalogCategoriesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CatalogCategoriesData {

 List<CatalogCategoryModel> get items;
/// Create a copy of CatalogCategoriesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogCategoriesDataCopyWith<CatalogCategoriesData> get copyWith => _$CatalogCategoriesDataCopyWithImpl<CatalogCategoriesData>(this as CatalogCategoriesData, _$identity);

  /// Serializes this CatalogCategoriesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogCategoriesData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CatalogCategoriesData(items: $items)';
}


}

/// @nodoc
abstract mixin class $CatalogCategoriesDataCopyWith<$Res>  {
  factory $CatalogCategoriesDataCopyWith(CatalogCategoriesData value, $Res Function(CatalogCategoriesData) _then) = _$CatalogCategoriesDataCopyWithImpl;
@useResult
$Res call({
 List<CatalogCategoryModel> items
});




}
/// @nodoc
class _$CatalogCategoriesDataCopyWithImpl<$Res>
    implements $CatalogCategoriesDataCopyWith<$Res> {
  _$CatalogCategoriesDataCopyWithImpl(this._self, this._then);

  final CatalogCategoriesData _self;
  final $Res Function(CatalogCategoriesData) _then;

/// Create a copy of CatalogCategoriesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CatalogCategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogCategoriesData].
extension CatalogCategoriesDataPatterns on CatalogCategoriesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogCategoriesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogCategoriesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogCategoriesData value)  $default,){
final _that = this;
switch (_that) {
case _CatalogCategoriesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogCategoriesData value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogCategoriesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CatalogCategoryModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogCategoriesData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CatalogCategoryModel> items)  $default,) {final _that = this;
switch (_that) {
case _CatalogCategoriesData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CatalogCategoryModel> items)?  $default,) {final _that = this;
switch (_that) {
case _CatalogCategoriesData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogCategoriesData implements CatalogCategoriesData {
  const _CatalogCategoriesData({final  List<CatalogCategoryModel> items = const <CatalogCategoryModel>[]}): _items = items;
  factory _CatalogCategoriesData.fromJson(Map<String, dynamic> json) => _$CatalogCategoriesDataFromJson(json);

 final  List<CatalogCategoryModel> _items;
@override@JsonKey() List<CatalogCategoryModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CatalogCategoriesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogCategoriesDataCopyWith<_CatalogCategoriesData> get copyWith => __$CatalogCategoriesDataCopyWithImpl<_CatalogCategoriesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogCategoriesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogCategoriesData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CatalogCategoriesData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$CatalogCategoriesDataCopyWith<$Res> implements $CatalogCategoriesDataCopyWith<$Res> {
  factory _$CatalogCategoriesDataCopyWith(_CatalogCategoriesData value, $Res Function(_CatalogCategoriesData) _then) = __$CatalogCategoriesDataCopyWithImpl;
@override @useResult
$Res call({
 List<CatalogCategoryModel> items
});




}
/// @nodoc
class __$CatalogCategoriesDataCopyWithImpl<$Res>
    implements _$CatalogCategoriesDataCopyWith<$Res> {
  __$CatalogCategoriesDataCopyWithImpl(this._self, this._then);

  final _CatalogCategoriesData _self;
  final $Res Function(_CatalogCategoriesData) _then;

/// Create a copy of CatalogCategoriesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_CatalogCategoriesData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CatalogCategoryModel>,
  ));
}


}


/// @nodoc
mixin _$CatalogCategoryModel {

 String get id; String get name_en; String get name_ar; String get icon_url; int get sort_order; bool get allows_custom_text; String? get topic_group;
/// Create a copy of CatalogCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogCategoryModelCopyWith<CatalogCategoryModel> get copyWith => _$CatalogCategoryModelCopyWithImpl<CatalogCategoryModel>(this as CatalogCategoryModel, _$identity);

  /// Serializes this CatalogCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_ar, name_ar) || other.name_ar == name_ar)&&(identical(other.icon_url, icon_url) || other.icon_url == icon_url)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order)&&(identical(other.allows_custom_text, allows_custom_text) || other.allows_custom_text == allows_custom_text)&&(identical(other.topic_group, topic_group) || other.topic_group == topic_group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name_en,name_ar,icon_url,sort_order,allows_custom_text,topic_group);

@override
String toString() {
  return 'CatalogCategoryModel(id: $id, name_en: $name_en, name_ar: $name_ar, icon_url: $icon_url, sort_order: $sort_order, allows_custom_text: $allows_custom_text, topic_group: $topic_group)';
}


}

/// @nodoc
abstract mixin class $CatalogCategoryModelCopyWith<$Res>  {
  factory $CatalogCategoryModelCopyWith(CatalogCategoryModel value, $Res Function(CatalogCategoryModel) _then) = _$CatalogCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name_en, String name_ar, String icon_url, int sort_order, bool allows_custom_text, String? topic_group
});




}
/// @nodoc
class _$CatalogCategoryModelCopyWithImpl<$Res>
    implements $CatalogCategoryModelCopyWith<$Res> {
  _$CatalogCategoryModelCopyWithImpl(this._self, this._then);

  final CatalogCategoryModel _self;
  final $Res Function(CatalogCategoryModel) _then;

/// Create a copy of CatalogCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name_en = null,Object? name_ar = null,Object? icon_url = null,Object? sort_order = null,Object? allows_custom_text = null,Object? topic_group = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name_en: null == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String,name_ar: null == name_ar ? _self.name_ar : name_ar // ignore: cast_nullable_to_non_nullable
as String,icon_url: null == icon_url ? _self.icon_url : icon_url // ignore: cast_nullable_to_non_nullable
as String,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,allows_custom_text: null == allows_custom_text ? _self.allows_custom_text : allows_custom_text // ignore: cast_nullable_to_non_nullable
as bool,topic_group: freezed == topic_group ? _self.topic_group : topic_group // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogCategoryModel].
extension CatalogCategoryModelPatterns on CatalogCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name_en,  String name_ar,  String icon_url,  int sort_order,  bool allows_custom_text,  String? topic_group)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogCategoryModel() when $default != null:
return $default(_that.id,_that.name_en,_that.name_ar,_that.icon_url,_that.sort_order,_that.allows_custom_text,_that.topic_group);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name_en,  String name_ar,  String icon_url,  int sort_order,  bool allows_custom_text,  String? topic_group)  $default,) {final _that = this;
switch (_that) {
case _CatalogCategoryModel():
return $default(_that.id,_that.name_en,_that.name_ar,_that.icon_url,_that.sort_order,_that.allows_custom_text,_that.topic_group);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name_en,  String name_ar,  String icon_url,  int sort_order,  bool allows_custom_text,  String? topic_group)?  $default,) {final _that = this;
switch (_that) {
case _CatalogCategoryModel() when $default != null:
return $default(_that.id,_that.name_en,_that.name_ar,_that.icon_url,_that.sort_order,_that.allows_custom_text,_that.topic_group);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogCategoryModel implements CatalogCategoryModel {
  const _CatalogCategoryModel({required this.id, required this.name_en, required this.name_ar, required this.icon_url, this.sort_order = 0, this.allows_custom_text = false, this.topic_group});
  factory _CatalogCategoryModel.fromJson(Map<String, dynamic> json) => _$CatalogCategoryModelFromJson(json);

@override final  String id;
@override final  String name_en;
@override final  String name_ar;
@override final  String icon_url;
@override@JsonKey() final  int sort_order;
@override@JsonKey() final  bool allows_custom_text;
@override final  String? topic_group;

/// Create a copy of CatalogCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogCategoryModelCopyWith<_CatalogCategoryModel> get copyWith => __$CatalogCategoryModelCopyWithImpl<_CatalogCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_ar, name_ar) || other.name_ar == name_ar)&&(identical(other.icon_url, icon_url) || other.icon_url == icon_url)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order)&&(identical(other.allows_custom_text, allows_custom_text) || other.allows_custom_text == allows_custom_text)&&(identical(other.topic_group, topic_group) || other.topic_group == topic_group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name_en,name_ar,icon_url,sort_order,allows_custom_text,topic_group);

@override
String toString() {
  return 'CatalogCategoryModel(id: $id, name_en: $name_en, name_ar: $name_ar, icon_url: $icon_url, sort_order: $sort_order, allows_custom_text: $allows_custom_text, topic_group: $topic_group)';
}


}

/// @nodoc
abstract mixin class _$CatalogCategoryModelCopyWith<$Res> implements $CatalogCategoryModelCopyWith<$Res> {
  factory _$CatalogCategoryModelCopyWith(_CatalogCategoryModel value, $Res Function(_CatalogCategoryModel) _then) = __$CatalogCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name_en, String name_ar, String icon_url, int sort_order, bool allows_custom_text, String? topic_group
});




}
/// @nodoc
class __$CatalogCategoryModelCopyWithImpl<$Res>
    implements _$CatalogCategoryModelCopyWith<$Res> {
  __$CatalogCategoryModelCopyWithImpl(this._self, this._then);

  final _CatalogCategoryModel _self;
  final $Res Function(_CatalogCategoryModel) _then;

/// Create a copy of CatalogCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name_en = null,Object? name_ar = null,Object? icon_url = null,Object? sort_order = null,Object? allows_custom_text = null,Object? topic_group = freezed,}) {
  return _then(_CatalogCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name_en: null == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String,name_ar: null == name_ar ? _self.name_ar : name_ar // ignore: cast_nullable_to_non_nullable
as String,icon_url: null == icon_url ? _self.icon_url : icon_url // ignore: cast_nullable_to_non_nullable
as String,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,allows_custom_text: null == allows_custom_text ? _self.allows_custom_text : allows_custom_text // ignore: cast_nullable_to_non_nullable
as bool,topic_group: freezed == topic_group ? _self.topic_group : topic_group // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
