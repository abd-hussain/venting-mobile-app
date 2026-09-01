// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_boundary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogBoundariesResponseModel {

 String get status; CatalogBoundariesData get data;
/// Create a copy of CatalogBoundariesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogBoundariesResponseModelCopyWith<CatalogBoundariesResponseModel> get copyWith => _$CatalogBoundariesResponseModelCopyWithImpl<CatalogBoundariesResponseModel>(this as CatalogBoundariesResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogBoundariesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'CatalogBoundariesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $CatalogBoundariesResponseModelCopyWith<$Res>  {
  factory $CatalogBoundariesResponseModelCopyWith(CatalogBoundariesResponseModel value, $Res Function(CatalogBoundariesResponseModel) _then) = _$CatalogBoundariesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, CatalogBoundariesData data
});


$CatalogBoundariesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$CatalogBoundariesResponseModelCopyWithImpl<$Res>
    implements $CatalogBoundariesResponseModelCopyWith<$Res> {
  _$CatalogBoundariesResponseModelCopyWithImpl(this._self, this._then);

  final CatalogBoundariesResponseModel _self;
  final $Res Function(CatalogBoundariesResponseModel) _then;

/// Create a copy of CatalogBoundariesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CatalogBoundariesData,
  ));
}
/// Create a copy of CatalogBoundariesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogBoundariesDataCopyWith<$Res> get data {
  
  return $CatalogBoundariesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CatalogBoundariesResponseModel].
extension CatalogBoundariesResponseModelPatterns on CatalogBoundariesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogBoundariesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogBoundariesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogBoundariesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogBoundariesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogBoundariesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogBoundariesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  CatalogBoundariesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogBoundariesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  CatalogBoundariesData data)  $default,) {final _that = this;
switch (_that) {
case _CatalogBoundariesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  CatalogBoundariesData data)?  $default,) {final _that = this;
switch (_that) {
case _CatalogBoundariesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogBoundariesResponseModel implements CatalogBoundariesResponseModel {
  const _CatalogBoundariesResponseModel({required this.status, required this.data});
  

@override final  String status;
@override final  CatalogBoundariesData data;

/// Create a copy of CatalogBoundariesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogBoundariesResponseModelCopyWith<_CatalogBoundariesResponseModel> get copyWith => __$CatalogBoundariesResponseModelCopyWithImpl<_CatalogBoundariesResponseModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogBoundariesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'CatalogBoundariesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CatalogBoundariesResponseModelCopyWith<$Res> implements $CatalogBoundariesResponseModelCopyWith<$Res> {
  factory _$CatalogBoundariesResponseModelCopyWith(_CatalogBoundariesResponseModel value, $Res Function(_CatalogBoundariesResponseModel) _then) = __$CatalogBoundariesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, CatalogBoundariesData data
});


@override $CatalogBoundariesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$CatalogBoundariesResponseModelCopyWithImpl<$Res>
    implements _$CatalogBoundariesResponseModelCopyWith<$Res> {
  __$CatalogBoundariesResponseModelCopyWithImpl(this._self, this._then);

  final _CatalogBoundariesResponseModel _self;
  final $Res Function(_CatalogBoundariesResponseModel) _then;

/// Create a copy of CatalogBoundariesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_CatalogBoundariesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CatalogBoundariesData,
  ));
}

/// Create a copy of CatalogBoundariesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogBoundariesDataCopyWith<$Res> get data {
  
  return $CatalogBoundariesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc
mixin _$CatalogBoundariesData {

 List<CatalogBoundaryModel> get items;
/// Create a copy of CatalogBoundariesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogBoundariesDataCopyWith<CatalogBoundariesData> get copyWith => _$CatalogBoundariesDataCopyWithImpl<CatalogBoundariesData>(this as CatalogBoundariesData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogBoundariesData&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CatalogBoundariesData(items: $items)';
}


}

/// @nodoc
abstract mixin class $CatalogBoundariesDataCopyWith<$Res>  {
  factory $CatalogBoundariesDataCopyWith(CatalogBoundariesData value, $Res Function(CatalogBoundariesData) _then) = _$CatalogBoundariesDataCopyWithImpl;
@useResult
$Res call({
 List<CatalogBoundaryModel> items
});




}
/// @nodoc
class _$CatalogBoundariesDataCopyWithImpl<$Res>
    implements $CatalogBoundariesDataCopyWith<$Res> {
  _$CatalogBoundariesDataCopyWithImpl(this._self, this._then);

  final CatalogBoundariesData _self;
  final $Res Function(CatalogBoundariesData) _then;

/// Create a copy of CatalogBoundariesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CatalogBoundaryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogBoundariesData].
extension CatalogBoundariesDataPatterns on CatalogBoundariesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogBoundariesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogBoundariesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogBoundariesData value)  $default,){
final _that = this;
switch (_that) {
case _CatalogBoundariesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogBoundariesData value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogBoundariesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CatalogBoundaryModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogBoundariesData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CatalogBoundaryModel> items)  $default,) {final _that = this;
switch (_that) {
case _CatalogBoundariesData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CatalogBoundaryModel> items)?  $default,) {final _that = this;
switch (_that) {
case _CatalogBoundariesData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogBoundariesData implements CatalogBoundariesData {
  const _CatalogBoundariesData({final  List<CatalogBoundaryModel> items = const <CatalogBoundaryModel>[]}): _items = items;
  

 final  List<CatalogBoundaryModel> _items;
@override@JsonKey() List<CatalogBoundaryModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CatalogBoundariesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogBoundariesDataCopyWith<_CatalogBoundariesData> get copyWith => __$CatalogBoundariesDataCopyWithImpl<_CatalogBoundariesData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogBoundariesData&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CatalogBoundariesData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$CatalogBoundariesDataCopyWith<$Res> implements $CatalogBoundariesDataCopyWith<$Res> {
  factory _$CatalogBoundariesDataCopyWith(_CatalogBoundariesData value, $Res Function(_CatalogBoundariesData) _then) = __$CatalogBoundariesDataCopyWithImpl;
@override @useResult
$Res call({
 List<CatalogBoundaryModel> items
});




}
/// @nodoc
class __$CatalogBoundariesDataCopyWithImpl<$Res>
    implements _$CatalogBoundariesDataCopyWith<$Res> {
  __$CatalogBoundariesDataCopyWithImpl(this._self, this._then);

  final _CatalogBoundariesData _self;
  final $Res Function(_CatalogBoundariesData) _then;

/// Create a copy of CatalogBoundariesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_CatalogBoundariesData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CatalogBoundaryModel>,
  ));
}


}

/// @nodoc
mixin _$CatalogBoundaryModel {

 String get id; String get name_en; String get name_ar; String get icon_emoji; String get icon_url; int get sort_order; bool get allows_custom_text;
/// Create a copy of CatalogBoundaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogBoundaryModelCopyWith<CatalogBoundaryModel> get copyWith => _$CatalogBoundaryModelCopyWithImpl<CatalogBoundaryModel>(this as CatalogBoundaryModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogBoundaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_ar, name_ar) || other.name_ar == name_ar)&&(identical(other.icon_emoji, icon_emoji) || other.icon_emoji == icon_emoji)&&(identical(other.icon_url, icon_url) || other.icon_url == icon_url)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order)&&(identical(other.allows_custom_text, allows_custom_text) || other.allows_custom_text == allows_custom_text));
}


@override
int get hashCode => Object.hash(runtimeType,id,name_en,name_ar,icon_emoji,icon_url,sort_order,allows_custom_text);

@override
String toString() {
  return 'CatalogBoundaryModel(id: $id, name_en: $name_en, name_ar: $name_ar, icon_emoji: $icon_emoji, icon_url: $icon_url, sort_order: $sort_order, allows_custom_text: $allows_custom_text)';
}


}

/// @nodoc
abstract mixin class $CatalogBoundaryModelCopyWith<$Res>  {
  factory $CatalogBoundaryModelCopyWith(CatalogBoundaryModel value, $Res Function(CatalogBoundaryModel) _then) = _$CatalogBoundaryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name_en, String name_ar, String icon_emoji, String icon_url, int sort_order, bool allows_custom_text
});




}
/// @nodoc
class _$CatalogBoundaryModelCopyWithImpl<$Res>
    implements $CatalogBoundaryModelCopyWith<$Res> {
  _$CatalogBoundaryModelCopyWithImpl(this._self, this._then);

  final CatalogBoundaryModel _self;
  final $Res Function(CatalogBoundaryModel) _then;

/// Create a copy of CatalogBoundaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name_en = null,Object? name_ar = null,Object? icon_emoji = null,Object? icon_url = null,Object? sort_order = null,Object? allows_custom_text = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name_en: null == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String,name_ar: null == name_ar ? _self.name_ar : name_ar // ignore: cast_nullable_to_non_nullable
as String,icon_emoji: null == icon_emoji ? _self.icon_emoji : icon_emoji // ignore: cast_nullable_to_non_nullable
as String,icon_url: null == icon_url ? _self.icon_url : icon_url // ignore: cast_nullable_to_non_nullable
as String,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,allows_custom_text: null == allows_custom_text ? _self.allows_custom_text : allows_custom_text // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogBoundaryModel].
extension CatalogBoundaryModelPatterns on CatalogBoundaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogBoundaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogBoundaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogBoundaryModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogBoundaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogBoundaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogBoundaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name_en,  String name_ar,  String icon_emoji,  String icon_url,  int sort_order,  bool allows_custom_text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogBoundaryModel() when $default != null:
return $default(_that.id,_that.name_en,_that.name_ar,_that.icon_emoji,_that.icon_url,_that.sort_order,_that.allows_custom_text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name_en,  String name_ar,  String icon_emoji,  String icon_url,  int sort_order,  bool allows_custom_text)  $default,) {final _that = this;
switch (_that) {
case _CatalogBoundaryModel():
return $default(_that.id,_that.name_en,_that.name_ar,_that.icon_emoji,_that.icon_url,_that.sort_order,_that.allows_custom_text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name_en,  String name_ar,  String icon_emoji,  String icon_url,  int sort_order,  bool allows_custom_text)?  $default,) {final _that = this;
switch (_that) {
case _CatalogBoundaryModel() when $default != null:
return $default(_that.id,_that.name_en,_that.name_ar,_that.icon_emoji,_that.icon_url,_that.sort_order,_that.allows_custom_text);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogBoundaryModel implements CatalogBoundaryModel {
  const _CatalogBoundaryModel({required this.id, required this.name_en, required this.name_ar, this.icon_emoji = '', this.icon_url = '', this.sort_order = 0, this.allows_custom_text = false});
  

@override final  String id;
@override final  String name_en;
@override final  String name_ar;
@override@JsonKey() final  String icon_emoji;
@override@JsonKey() final  String icon_url;
@override@JsonKey() final  int sort_order;
@override@JsonKey() final  bool allows_custom_text;

/// Create a copy of CatalogBoundaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogBoundaryModelCopyWith<_CatalogBoundaryModel> get copyWith => __$CatalogBoundaryModelCopyWithImpl<_CatalogBoundaryModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogBoundaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_ar, name_ar) || other.name_ar == name_ar)&&(identical(other.icon_emoji, icon_emoji) || other.icon_emoji == icon_emoji)&&(identical(other.icon_url, icon_url) || other.icon_url == icon_url)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order)&&(identical(other.allows_custom_text, allows_custom_text) || other.allows_custom_text == allows_custom_text));
}


@override
int get hashCode => Object.hash(runtimeType,id,name_en,name_ar,icon_emoji,icon_url,sort_order,allows_custom_text);

@override
String toString() {
  return 'CatalogBoundaryModel(id: $id, name_en: $name_en, name_ar: $name_ar, icon_emoji: $icon_emoji, icon_url: $icon_url, sort_order: $sort_order, allows_custom_text: $allows_custom_text)';
}


}

/// @nodoc
abstract mixin class _$CatalogBoundaryModelCopyWith<$Res> implements $CatalogBoundaryModelCopyWith<$Res> {
  factory _$CatalogBoundaryModelCopyWith(_CatalogBoundaryModel value, $Res Function(_CatalogBoundaryModel) _then) = __$CatalogBoundaryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name_en, String name_ar, String icon_emoji, String icon_url, int sort_order, bool allows_custom_text
});




}
/// @nodoc
class __$CatalogBoundaryModelCopyWithImpl<$Res>
    implements _$CatalogBoundaryModelCopyWith<$Res> {
  __$CatalogBoundaryModelCopyWithImpl(this._self, this._then);

  final _CatalogBoundaryModel _self;
  final $Res Function(_CatalogBoundaryModel) _then;

/// Create a copy of CatalogBoundaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name_en = null,Object? name_ar = null,Object? icon_emoji = null,Object? icon_url = null,Object? sort_order = null,Object? allows_custom_text = null,}) {
  return _then(_CatalogBoundaryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name_en: null == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String,name_ar: null == name_ar ? _self.name_ar : name_ar // ignore: cast_nullable_to_non_nullable
as String,icon_emoji: null == icon_emoji ? _self.icon_emoji : icon_emoji // ignore: cast_nullable_to_non_nullable
as String,icon_url: null == icon_url ? _self.icon_url : icon_url // ignore: cast_nullable_to_non_nullable
as String,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,allows_custom_text: null == allows_custom_text ? _self.allows_custom_text : allows_custom_text // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
