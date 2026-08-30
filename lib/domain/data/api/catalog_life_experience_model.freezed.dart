// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_life_experience_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogLifeExperiencesResponseModel {

 String get status; CatalogLifeExperiencesData get data;
/// Create a copy of CatalogLifeExperiencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogLifeExperiencesResponseModelCopyWith<CatalogLifeExperiencesResponseModel> get copyWith => _$CatalogLifeExperiencesResponseModelCopyWithImpl<CatalogLifeExperiencesResponseModel>(this as CatalogLifeExperiencesResponseModel, _$identity);

  /// Serializes this CatalogLifeExperiencesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLifeExperiencesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'CatalogLifeExperiencesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $CatalogLifeExperiencesResponseModelCopyWith<$Res>  {
  factory $CatalogLifeExperiencesResponseModelCopyWith(CatalogLifeExperiencesResponseModel value, $Res Function(CatalogLifeExperiencesResponseModel) _then) = _$CatalogLifeExperiencesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, CatalogLifeExperiencesData data
});


$CatalogLifeExperiencesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$CatalogLifeExperiencesResponseModelCopyWithImpl<$Res>
    implements $CatalogLifeExperiencesResponseModelCopyWith<$Res> {
  _$CatalogLifeExperiencesResponseModelCopyWithImpl(this._self, this._then);

  final CatalogLifeExperiencesResponseModel _self;
  final $Res Function(CatalogLifeExperiencesResponseModel) _then;

/// Create a copy of CatalogLifeExperiencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CatalogLifeExperiencesData,
  ));
}
/// Create a copy of CatalogLifeExperiencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogLifeExperiencesDataCopyWith<$Res> get data {
  
  return $CatalogLifeExperiencesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CatalogLifeExperiencesResponseModel].
extension CatalogLifeExperiencesResponseModelPatterns on CatalogLifeExperiencesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogLifeExperiencesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogLifeExperiencesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogLifeExperiencesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogLifeExperiencesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogLifeExperiencesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogLifeExperiencesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  CatalogLifeExperiencesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogLifeExperiencesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  CatalogLifeExperiencesData data)  $default,) {final _that = this;
switch (_that) {
case _CatalogLifeExperiencesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  CatalogLifeExperiencesData data)?  $default,) {final _that = this;
switch (_that) {
case _CatalogLifeExperiencesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogLifeExperiencesResponseModel implements CatalogLifeExperiencesResponseModel {
  const _CatalogLifeExperiencesResponseModel({required this.status, required this.data});
  factory _CatalogLifeExperiencesResponseModel.fromJson(Map<String, dynamic> json) => _$CatalogLifeExperiencesResponseModelFromJson(json);

@override final  String status;
@override final  CatalogLifeExperiencesData data;

/// Create a copy of CatalogLifeExperiencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogLifeExperiencesResponseModelCopyWith<_CatalogLifeExperiencesResponseModel> get copyWith => __$CatalogLifeExperiencesResponseModelCopyWithImpl<_CatalogLifeExperiencesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogLifeExperiencesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogLifeExperiencesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'CatalogLifeExperiencesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CatalogLifeExperiencesResponseModelCopyWith<$Res> implements $CatalogLifeExperiencesResponseModelCopyWith<$Res> {
  factory _$CatalogLifeExperiencesResponseModelCopyWith(_CatalogLifeExperiencesResponseModel value, $Res Function(_CatalogLifeExperiencesResponseModel) _then) = __$CatalogLifeExperiencesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, CatalogLifeExperiencesData data
});


@override $CatalogLifeExperiencesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$CatalogLifeExperiencesResponseModelCopyWithImpl<$Res>
    implements _$CatalogLifeExperiencesResponseModelCopyWith<$Res> {
  __$CatalogLifeExperiencesResponseModelCopyWithImpl(this._self, this._then);

  final _CatalogLifeExperiencesResponseModel _self;
  final $Res Function(_CatalogLifeExperiencesResponseModel) _then;

/// Create a copy of CatalogLifeExperiencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_CatalogLifeExperiencesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CatalogLifeExperiencesData,
  ));
}

/// Create a copy of CatalogLifeExperiencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogLifeExperiencesDataCopyWith<$Res> get data {
  
  return $CatalogLifeExperiencesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CatalogLifeExperiencesData {

 List<CatalogLifeExperienceModel> get items;
/// Create a copy of CatalogLifeExperiencesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogLifeExperiencesDataCopyWith<CatalogLifeExperiencesData> get copyWith => _$CatalogLifeExperiencesDataCopyWithImpl<CatalogLifeExperiencesData>(this as CatalogLifeExperiencesData, _$identity);

  /// Serializes this CatalogLifeExperiencesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLifeExperiencesData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CatalogLifeExperiencesData(items: $items)';
}


}

/// @nodoc
abstract mixin class $CatalogLifeExperiencesDataCopyWith<$Res>  {
  factory $CatalogLifeExperiencesDataCopyWith(CatalogLifeExperiencesData value, $Res Function(CatalogLifeExperiencesData) _then) = _$CatalogLifeExperiencesDataCopyWithImpl;
@useResult
$Res call({
 List<CatalogLifeExperienceModel> items
});




}
/// @nodoc
class _$CatalogLifeExperiencesDataCopyWithImpl<$Res>
    implements $CatalogLifeExperiencesDataCopyWith<$Res> {
  _$CatalogLifeExperiencesDataCopyWithImpl(this._self, this._then);

  final CatalogLifeExperiencesData _self;
  final $Res Function(CatalogLifeExperiencesData) _then;

/// Create a copy of CatalogLifeExperiencesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CatalogLifeExperienceModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogLifeExperiencesData].
extension CatalogLifeExperiencesDataPatterns on CatalogLifeExperiencesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogLifeExperiencesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogLifeExperiencesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogLifeExperiencesData value)  $default,){
final _that = this;
switch (_that) {
case _CatalogLifeExperiencesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogLifeExperiencesData value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogLifeExperiencesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CatalogLifeExperienceModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogLifeExperiencesData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CatalogLifeExperienceModel> items)  $default,) {final _that = this;
switch (_that) {
case _CatalogLifeExperiencesData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CatalogLifeExperienceModel> items)?  $default,) {final _that = this;
switch (_that) {
case _CatalogLifeExperiencesData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogLifeExperiencesData implements CatalogLifeExperiencesData {
  const _CatalogLifeExperiencesData({final  List<CatalogLifeExperienceModel> items = const <CatalogLifeExperienceModel>[]}): _items = items;
  factory _CatalogLifeExperiencesData.fromJson(Map<String, dynamic> json) => _$CatalogLifeExperiencesDataFromJson(json);

 final  List<CatalogLifeExperienceModel> _items;
@override@JsonKey() List<CatalogLifeExperienceModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CatalogLifeExperiencesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogLifeExperiencesDataCopyWith<_CatalogLifeExperiencesData> get copyWith => __$CatalogLifeExperiencesDataCopyWithImpl<_CatalogLifeExperiencesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogLifeExperiencesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogLifeExperiencesData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CatalogLifeExperiencesData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$CatalogLifeExperiencesDataCopyWith<$Res> implements $CatalogLifeExperiencesDataCopyWith<$Res> {
  factory _$CatalogLifeExperiencesDataCopyWith(_CatalogLifeExperiencesData value, $Res Function(_CatalogLifeExperiencesData) _then) = __$CatalogLifeExperiencesDataCopyWithImpl;
@override @useResult
$Res call({
 List<CatalogLifeExperienceModel> items
});




}
/// @nodoc
class __$CatalogLifeExperiencesDataCopyWithImpl<$Res>
    implements _$CatalogLifeExperiencesDataCopyWith<$Res> {
  __$CatalogLifeExperiencesDataCopyWithImpl(this._self, this._then);

  final _CatalogLifeExperiencesData _self;
  final $Res Function(_CatalogLifeExperiencesData) _then;

/// Create a copy of CatalogLifeExperiencesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_CatalogLifeExperiencesData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CatalogLifeExperienceModel>,
  ));
}


}


/// @nodoc
mixin _$CatalogLifeExperienceModel {

 String get id; String get name_en; String get name_ar; int get sort_order;
/// Create a copy of CatalogLifeExperienceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogLifeExperienceModelCopyWith<CatalogLifeExperienceModel> get copyWith => _$CatalogLifeExperienceModelCopyWithImpl<CatalogLifeExperienceModel>(this as CatalogLifeExperienceModel, _$identity);

  /// Serializes this CatalogLifeExperienceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLifeExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_ar, name_ar) || other.name_ar == name_ar)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name_en,name_ar,sort_order);

@override
String toString() {
  return 'CatalogLifeExperienceModel(id: $id, name_en: $name_en, name_ar: $name_ar, sort_order: $sort_order)';
}


}

/// @nodoc
abstract mixin class $CatalogLifeExperienceModelCopyWith<$Res>  {
  factory $CatalogLifeExperienceModelCopyWith(CatalogLifeExperienceModel value, $Res Function(CatalogLifeExperienceModel) _then) = _$CatalogLifeExperienceModelCopyWithImpl;
@useResult
$Res call({
 String id, String name_en, String name_ar, int sort_order
});




}
/// @nodoc
class _$CatalogLifeExperienceModelCopyWithImpl<$Res>
    implements $CatalogLifeExperienceModelCopyWith<$Res> {
  _$CatalogLifeExperienceModelCopyWithImpl(this._self, this._then);

  final CatalogLifeExperienceModel _self;
  final $Res Function(CatalogLifeExperienceModel) _then;

/// Create a copy of CatalogLifeExperienceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name_en = null,Object? name_ar = null,Object? sort_order = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name_en: null == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String,name_ar: null == name_ar ? _self.name_ar : name_ar // ignore: cast_nullable_to_non_nullable
as String,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogLifeExperienceModel].
extension CatalogLifeExperienceModelPatterns on CatalogLifeExperienceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogLifeExperienceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogLifeExperienceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogLifeExperienceModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogLifeExperienceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogLifeExperienceModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogLifeExperienceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name_en,  String name_ar,  int sort_order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogLifeExperienceModel() when $default != null:
return $default(_that.id,_that.name_en,_that.name_ar,_that.sort_order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name_en,  String name_ar,  int sort_order)  $default,) {final _that = this;
switch (_that) {
case _CatalogLifeExperienceModel():
return $default(_that.id,_that.name_en,_that.name_ar,_that.sort_order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name_en,  String name_ar,  int sort_order)?  $default,) {final _that = this;
switch (_that) {
case _CatalogLifeExperienceModel() when $default != null:
return $default(_that.id,_that.name_en,_that.name_ar,_that.sort_order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogLifeExperienceModel implements CatalogLifeExperienceModel {
  const _CatalogLifeExperienceModel({required this.id, required this.name_en, required this.name_ar, this.sort_order = 0});
  factory _CatalogLifeExperienceModel.fromJson(Map<String, dynamic> json) => _$CatalogLifeExperienceModelFromJson(json);

@override final  String id;
@override final  String name_en;
@override final  String name_ar;
@override@JsonKey() final  int sort_order;

/// Create a copy of CatalogLifeExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogLifeExperienceModelCopyWith<_CatalogLifeExperienceModel> get copyWith => __$CatalogLifeExperienceModelCopyWithImpl<_CatalogLifeExperienceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogLifeExperienceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogLifeExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_ar, name_ar) || other.name_ar == name_ar)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name_en,name_ar,sort_order);

@override
String toString() {
  return 'CatalogLifeExperienceModel(id: $id, name_en: $name_en, name_ar: $name_ar, sort_order: $sort_order)';
}


}

/// @nodoc
abstract mixin class _$CatalogLifeExperienceModelCopyWith<$Res> implements $CatalogLifeExperienceModelCopyWith<$Res> {
  factory _$CatalogLifeExperienceModelCopyWith(_CatalogLifeExperienceModel value, $Res Function(_CatalogLifeExperienceModel) _then) = __$CatalogLifeExperienceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name_en, String name_ar, int sort_order
});




}
/// @nodoc
class __$CatalogLifeExperienceModelCopyWithImpl<$Res>
    implements _$CatalogLifeExperienceModelCopyWith<$Res> {
  __$CatalogLifeExperienceModelCopyWithImpl(this._self, this._then);

  final _CatalogLifeExperienceModel _self;
  final $Res Function(_CatalogLifeExperienceModel) _then;

/// Create a copy of CatalogLifeExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name_en = null,Object? name_ar = null,Object? sort_order = null,}) {
  return _then(_CatalogLifeExperienceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name_en: null == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String,name_ar: null == name_ar ? _self.name_ar : name_ar // ignore: cast_nullable_to_non_nullable
as String,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
