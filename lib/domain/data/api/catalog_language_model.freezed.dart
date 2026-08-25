// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_language_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogLanguagesResponseModel {

 String get status; CatalogLanguagesData get data;
/// Create a copy of CatalogLanguagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogLanguagesResponseModelCopyWith<CatalogLanguagesResponseModel> get copyWith => _$CatalogLanguagesResponseModelCopyWithImpl<CatalogLanguagesResponseModel>(this as CatalogLanguagesResponseModel, _$identity);

  /// Serializes this CatalogLanguagesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLanguagesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'CatalogLanguagesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $CatalogLanguagesResponseModelCopyWith<$Res>  {
  factory $CatalogLanguagesResponseModelCopyWith(CatalogLanguagesResponseModel value, $Res Function(CatalogLanguagesResponseModel) _then) = _$CatalogLanguagesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, CatalogLanguagesData data
});


$CatalogLanguagesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$CatalogLanguagesResponseModelCopyWithImpl<$Res>
    implements $CatalogLanguagesResponseModelCopyWith<$Res> {
  _$CatalogLanguagesResponseModelCopyWithImpl(this._self, this._then);

  final CatalogLanguagesResponseModel _self;
  final $Res Function(CatalogLanguagesResponseModel) _then;

/// Create a copy of CatalogLanguagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CatalogLanguagesData,
  ));
}
/// Create a copy of CatalogLanguagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogLanguagesDataCopyWith<$Res> get data {
  
  return $CatalogLanguagesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CatalogLanguagesResponseModel].
extension CatalogLanguagesResponseModelPatterns on CatalogLanguagesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogLanguagesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogLanguagesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogLanguagesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogLanguagesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogLanguagesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogLanguagesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  CatalogLanguagesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogLanguagesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  CatalogLanguagesData data)  $default,) {final _that = this;
switch (_that) {
case _CatalogLanguagesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  CatalogLanguagesData data)?  $default,) {final _that = this;
switch (_that) {
case _CatalogLanguagesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogLanguagesResponseModel implements CatalogLanguagesResponseModel {
  const _CatalogLanguagesResponseModel({required this.status, required this.data});
  factory _CatalogLanguagesResponseModel.fromJson(Map<String, dynamic> json) => _$CatalogLanguagesResponseModelFromJson(json);

@override final  String status;
@override final  CatalogLanguagesData data;

/// Create a copy of CatalogLanguagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogLanguagesResponseModelCopyWith<_CatalogLanguagesResponseModel> get copyWith => __$CatalogLanguagesResponseModelCopyWithImpl<_CatalogLanguagesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogLanguagesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogLanguagesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'CatalogLanguagesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CatalogLanguagesResponseModelCopyWith<$Res> implements $CatalogLanguagesResponseModelCopyWith<$Res> {
  factory _$CatalogLanguagesResponseModelCopyWith(_CatalogLanguagesResponseModel value, $Res Function(_CatalogLanguagesResponseModel) _then) = __$CatalogLanguagesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, CatalogLanguagesData data
});


@override $CatalogLanguagesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$CatalogLanguagesResponseModelCopyWithImpl<$Res>
    implements _$CatalogLanguagesResponseModelCopyWith<$Res> {
  __$CatalogLanguagesResponseModelCopyWithImpl(this._self, this._then);

  final _CatalogLanguagesResponseModel _self;
  final $Res Function(_CatalogLanguagesResponseModel) _then;

/// Create a copy of CatalogLanguagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_CatalogLanguagesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CatalogLanguagesData,
  ));
}

/// Create a copy of CatalogLanguagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogLanguagesDataCopyWith<$Res> get data {
  
  return $CatalogLanguagesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CatalogLanguagesData {

 List<CatalogLanguageModel> get items;
/// Create a copy of CatalogLanguagesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogLanguagesDataCopyWith<CatalogLanguagesData> get copyWith => _$CatalogLanguagesDataCopyWithImpl<CatalogLanguagesData>(this as CatalogLanguagesData, _$identity);

  /// Serializes this CatalogLanguagesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLanguagesData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CatalogLanguagesData(items: $items)';
}


}

/// @nodoc
abstract mixin class $CatalogLanguagesDataCopyWith<$Res>  {
  factory $CatalogLanguagesDataCopyWith(CatalogLanguagesData value, $Res Function(CatalogLanguagesData) _then) = _$CatalogLanguagesDataCopyWithImpl;
@useResult
$Res call({
 List<CatalogLanguageModel> items
});




}
/// @nodoc
class _$CatalogLanguagesDataCopyWithImpl<$Res>
    implements $CatalogLanguagesDataCopyWith<$Res> {
  _$CatalogLanguagesDataCopyWithImpl(this._self, this._then);

  final CatalogLanguagesData _self;
  final $Res Function(CatalogLanguagesData) _then;

/// Create a copy of CatalogLanguagesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CatalogLanguageModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogLanguagesData].
extension CatalogLanguagesDataPatterns on CatalogLanguagesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogLanguagesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogLanguagesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogLanguagesData value)  $default,){
final _that = this;
switch (_that) {
case _CatalogLanguagesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogLanguagesData value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogLanguagesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CatalogLanguageModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogLanguagesData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CatalogLanguageModel> items)  $default,) {final _that = this;
switch (_that) {
case _CatalogLanguagesData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CatalogLanguageModel> items)?  $default,) {final _that = this;
switch (_that) {
case _CatalogLanguagesData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogLanguagesData implements CatalogLanguagesData {
  const _CatalogLanguagesData({final  List<CatalogLanguageModel> items = const <CatalogLanguageModel>[]}): _items = items;
  factory _CatalogLanguagesData.fromJson(Map<String, dynamic> json) => _$CatalogLanguagesDataFromJson(json);

 final  List<CatalogLanguageModel> _items;
@override@JsonKey() List<CatalogLanguageModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CatalogLanguagesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogLanguagesDataCopyWith<_CatalogLanguagesData> get copyWith => __$CatalogLanguagesDataCopyWithImpl<_CatalogLanguagesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogLanguagesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogLanguagesData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CatalogLanguagesData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$CatalogLanguagesDataCopyWith<$Res> implements $CatalogLanguagesDataCopyWith<$Res> {
  factory _$CatalogLanguagesDataCopyWith(_CatalogLanguagesData value, $Res Function(_CatalogLanguagesData) _then) = __$CatalogLanguagesDataCopyWithImpl;
@override @useResult
$Res call({
 List<CatalogLanguageModel> items
});




}
/// @nodoc
class __$CatalogLanguagesDataCopyWithImpl<$Res>
    implements _$CatalogLanguagesDataCopyWith<$Res> {
  __$CatalogLanguagesDataCopyWithImpl(this._self, this._then);

  final _CatalogLanguagesData _self;
  final $Res Function(_CatalogLanguagesData) _then;

/// Create a copy of CatalogLanguagesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_CatalogLanguagesData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CatalogLanguageModel>,
  ));
}


}


/// @nodoc
mixin _$CatalogLanguageModel {

 String get id; String get name_en; String get name_native; String get name_ar; String get flag_url; String get flag_emoji; int get sort_order;
/// Create a copy of CatalogLanguageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogLanguageModelCopyWith<CatalogLanguageModel> get copyWith => _$CatalogLanguageModelCopyWithImpl<CatalogLanguageModel>(this as CatalogLanguageModel, _$identity);

  /// Serializes this CatalogLanguageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLanguageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_native, name_native) || other.name_native == name_native)&&(identical(other.name_ar, name_ar) || other.name_ar == name_ar)&&(identical(other.flag_url, flag_url) || other.flag_url == flag_url)&&(identical(other.flag_emoji, flag_emoji) || other.flag_emoji == flag_emoji)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name_en,name_native,name_ar,flag_url,flag_emoji,sort_order);

@override
String toString() {
  return 'CatalogLanguageModel(id: $id, name_en: $name_en, name_native: $name_native, name_ar: $name_ar, flag_url: $flag_url, flag_emoji: $flag_emoji, sort_order: $sort_order)';
}


}

/// @nodoc
abstract mixin class $CatalogLanguageModelCopyWith<$Res>  {
  factory $CatalogLanguageModelCopyWith(CatalogLanguageModel value, $Res Function(CatalogLanguageModel) _then) = _$CatalogLanguageModelCopyWithImpl;
@useResult
$Res call({
 String id, String name_en, String name_native, String name_ar, String flag_url, String flag_emoji, int sort_order
});




}
/// @nodoc
class _$CatalogLanguageModelCopyWithImpl<$Res>
    implements $CatalogLanguageModelCopyWith<$Res> {
  _$CatalogLanguageModelCopyWithImpl(this._self, this._then);

  final CatalogLanguageModel _self;
  final $Res Function(CatalogLanguageModel) _then;

/// Create a copy of CatalogLanguageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name_en = null,Object? name_native = null,Object? name_ar = null,Object? flag_url = null,Object? flag_emoji = null,Object? sort_order = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name_en: null == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String,name_native: null == name_native ? _self.name_native : name_native // ignore: cast_nullable_to_non_nullable
as String,name_ar: null == name_ar ? _self.name_ar : name_ar // ignore: cast_nullable_to_non_nullable
as String,flag_url: null == flag_url ? _self.flag_url : flag_url // ignore: cast_nullable_to_non_nullable
as String,flag_emoji: null == flag_emoji ? _self.flag_emoji : flag_emoji // ignore: cast_nullable_to_non_nullable
as String,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogLanguageModel].
extension CatalogLanguageModelPatterns on CatalogLanguageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogLanguageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogLanguageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogLanguageModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogLanguageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogLanguageModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogLanguageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name_en,  String name_native,  String name_ar,  String flag_url,  String flag_emoji,  int sort_order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogLanguageModel() when $default != null:
return $default(_that.id,_that.name_en,_that.name_native,_that.name_ar,_that.flag_url,_that.flag_emoji,_that.sort_order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name_en,  String name_native,  String name_ar,  String flag_url,  String flag_emoji,  int sort_order)  $default,) {final _that = this;
switch (_that) {
case _CatalogLanguageModel():
return $default(_that.id,_that.name_en,_that.name_native,_that.name_ar,_that.flag_url,_that.flag_emoji,_that.sort_order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name_en,  String name_native,  String name_ar,  String flag_url,  String flag_emoji,  int sort_order)?  $default,) {final _that = this;
switch (_that) {
case _CatalogLanguageModel() when $default != null:
return $default(_that.id,_that.name_en,_that.name_native,_that.name_ar,_that.flag_url,_that.flag_emoji,_that.sort_order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogLanguageModel implements CatalogLanguageModel {
  const _CatalogLanguageModel({required this.id, required this.name_en, required this.name_native, required this.name_ar, required this.flag_url, this.flag_emoji = '', this.sort_order = 0});
  factory _CatalogLanguageModel.fromJson(Map<String, dynamic> json) => _$CatalogLanguageModelFromJson(json);

@override final  String id;
@override final  String name_en;
@override final  String name_native;
@override final  String name_ar;
@override final  String flag_url;
@override@JsonKey() final  String flag_emoji;
@override@JsonKey() final  int sort_order;

/// Create a copy of CatalogLanguageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogLanguageModelCopyWith<_CatalogLanguageModel> get copyWith => __$CatalogLanguageModelCopyWithImpl<_CatalogLanguageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogLanguageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogLanguageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_native, name_native) || other.name_native == name_native)&&(identical(other.name_ar, name_ar) || other.name_ar == name_ar)&&(identical(other.flag_url, flag_url) || other.flag_url == flag_url)&&(identical(other.flag_emoji, flag_emoji) || other.flag_emoji == flag_emoji)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name_en,name_native,name_ar,flag_url,flag_emoji,sort_order);

@override
String toString() {
  return 'CatalogLanguageModel(id: $id, name_en: $name_en, name_native: $name_native, name_ar: $name_ar, flag_url: $flag_url, flag_emoji: $flag_emoji, sort_order: $sort_order)';
}


}

/// @nodoc
abstract mixin class _$CatalogLanguageModelCopyWith<$Res> implements $CatalogLanguageModelCopyWith<$Res> {
  factory _$CatalogLanguageModelCopyWith(_CatalogLanguageModel value, $Res Function(_CatalogLanguageModel) _then) = __$CatalogLanguageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name_en, String name_native, String name_ar, String flag_url, String flag_emoji, int sort_order
});




}
/// @nodoc
class __$CatalogLanguageModelCopyWithImpl<$Res>
    implements _$CatalogLanguageModelCopyWith<$Res> {
  __$CatalogLanguageModelCopyWithImpl(this._self, this._then);

  final _CatalogLanguageModel _self;
  final $Res Function(_CatalogLanguageModel) _then;

/// Create a copy of CatalogLanguageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name_en = null,Object? name_native = null,Object? name_ar = null,Object? flag_url = null,Object? flag_emoji = null,Object? sort_order = null,}) {
  return _then(_CatalogLanguageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name_en: null == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String,name_native: null == name_native ? _self.name_native : name_native // ignore: cast_nullable_to_non_nullable
as String,name_ar: null == name_ar ? _self.name_ar : name_ar // ignore: cast_nullable_to_non_nullable
as String,flag_url: null == flag_url ? _self.flag_url : flag_url // ignore: cast_nullable_to_non_nullable
as String,flag_emoji: null == flag_emoji ? _self.flag_emoji : flag_emoji // ignore: cast_nullable_to_non_nullable
as String,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
