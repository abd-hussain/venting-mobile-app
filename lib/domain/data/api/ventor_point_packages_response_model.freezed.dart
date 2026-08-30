// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_point_packages_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorPointPackagesResponseModel {

 String get status; VentorPointPackagesData get data;
/// Create a copy of VentorPointPackagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorPointPackagesResponseModelCopyWith<VentorPointPackagesResponseModel> get copyWith => _$VentorPointPackagesResponseModelCopyWithImpl<VentorPointPackagesResponseModel>(this as VentorPointPackagesResponseModel, _$identity);

  /// Serializes this VentorPointPackagesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorPointPackagesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorPointPackagesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorPointPackagesResponseModelCopyWith<$Res>  {
  factory $VentorPointPackagesResponseModelCopyWith(VentorPointPackagesResponseModel value, $Res Function(VentorPointPackagesResponseModel) _then) = _$VentorPointPackagesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorPointPackagesData data
});


$VentorPointPackagesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorPointPackagesResponseModelCopyWithImpl<$Res>
    implements $VentorPointPackagesResponseModelCopyWith<$Res> {
  _$VentorPointPackagesResponseModelCopyWithImpl(this._self, this._then);

  final VentorPointPackagesResponseModel _self;
  final $Res Function(VentorPointPackagesResponseModel) _then;

/// Create a copy of VentorPointPackagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorPointPackagesData,
  ));
}
/// Create a copy of VentorPointPackagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorPointPackagesDataCopyWith<$Res> get data {
  
  return $VentorPointPackagesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorPointPackagesResponseModel].
extension VentorPointPackagesResponseModelPatterns on VentorPointPackagesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorPointPackagesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorPointPackagesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorPointPackagesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorPointPackagesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorPointPackagesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorPointPackagesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorPointPackagesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorPointPackagesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorPointPackagesData data)  $default,) {final _that = this;
switch (_that) {
case _VentorPointPackagesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorPointPackagesData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorPointPackagesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorPointPackagesResponseModel implements VentorPointPackagesResponseModel {
  const _VentorPointPackagesResponseModel({required this.status, required this.data});
  factory _VentorPointPackagesResponseModel.fromJson(Map<String, dynamic> json) => _$VentorPointPackagesResponseModelFromJson(json);

@override final  String status;
@override final  VentorPointPackagesData data;

/// Create a copy of VentorPointPackagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorPointPackagesResponseModelCopyWith<_VentorPointPackagesResponseModel> get copyWith => __$VentorPointPackagesResponseModelCopyWithImpl<_VentorPointPackagesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorPointPackagesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorPointPackagesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorPointPackagesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorPointPackagesResponseModelCopyWith<$Res> implements $VentorPointPackagesResponseModelCopyWith<$Res> {
  factory _$VentorPointPackagesResponseModelCopyWith(_VentorPointPackagesResponseModel value, $Res Function(_VentorPointPackagesResponseModel) _then) = __$VentorPointPackagesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorPointPackagesData data
});


@override $VentorPointPackagesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorPointPackagesResponseModelCopyWithImpl<$Res>
    implements _$VentorPointPackagesResponseModelCopyWith<$Res> {
  __$VentorPointPackagesResponseModelCopyWithImpl(this._self, this._then);

  final _VentorPointPackagesResponseModel _self;
  final $Res Function(_VentorPointPackagesResponseModel) _then;

/// Create a copy of VentorPointPackagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorPointPackagesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorPointPackagesData,
  ));
}

/// Create a copy of VentorPointPackagesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorPointPackagesDataCopyWith<$Res> get data {
  
  return $VentorPointPackagesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorPointPackagesData {

 List<VentorPointPackageItemModel> get packages;
/// Create a copy of VentorPointPackagesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorPointPackagesDataCopyWith<VentorPointPackagesData> get copyWith => _$VentorPointPackagesDataCopyWithImpl<VentorPointPackagesData>(this as VentorPointPackagesData, _$identity);

  /// Serializes this VentorPointPackagesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorPointPackagesData&&const DeepCollectionEquality().equals(other.packages, packages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(packages));

@override
String toString() {
  return 'VentorPointPackagesData(packages: $packages)';
}


}

/// @nodoc
abstract mixin class $VentorPointPackagesDataCopyWith<$Res>  {
  factory $VentorPointPackagesDataCopyWith(VentorPointPackagesData value, $Res Function(VentorPointPackagesData) _then) = _$VentorPointPackagesDataCopyWithImpl;
@useResult
$Res call({
 List<VentorPointPackageItemModel> packages
});




}
/// @nodoc
class _$VentorPointPackagesDataCopyWithImpl<$Res>
    implements $VentorPointPackagesDataCopyWith<$Res> {
  _$VentorPointPackagesDataCopyWithImpl(this._self, this._then);

  final VentorPointPackagesData _self;
  final $Res Function(VentorPointPackagesData) _then;

/// Create a copy of VentorPointPackagesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packages = null,}) {
  return _then(_self.copyWith(
packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<VentorPointPackageItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorPointPackagesData].
extension VentorPointPackagesDataPatterns on VentorPointPackagesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorPointPackagesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorPointPackagesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorPointPackagesData value)  $default,){
final _that = this;
switch (_that) {
case _VentorPointPackagesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorPointPackagesData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorPointPackagesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VentorPointPackageItemModel> packages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorPointPackagesData() when $default != null:
return $default(_that.packages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VentorPointPackageItemModel> packages)  $default,) {final _that = this;
switch (_that) {
case _VentorPointPackagesData():
return $default(_that.packages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VentorPointPackageItemModel> packages)?  $default,) {final _that = this;
switch (_that) {
case _VentorPointPackagesData() when $default != null:
return $default(_that.packages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorPointPackagesData implements VentorPointPackagesData {
  const _VentorPointPackagesData({final  List<VentorPointPackageItemModel> packages = const <VentorPointPackageItemModel>[]}): _packages = packages;
  factory _VentorPointPackagesData.fromJson(Map<String, dynamic> json) => _$VentorPointPackagesDataFromJson(json);

 final  List<VentorPointPackageItemModel> _packages;
@override@JsonKey() List<VentorPointPackageItemModel> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}


/// Create a copy of VentorPointPackagesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorPointPackagesDataCopyWith<_VentorPointPackagesData> get copyWith => __$VentorPointPackagesDataCopyWithImpl<_VentorPointPackagesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorPointPackagesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorPointPackagesData&&const DeepCollectionEquality().equals(other._packages, _packages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_packages));

@override
String toString() {
  return 'VentorPointPackagesData(packages: $packages)';
}


}

/// @nodoc
abstract mixin class _$VentorPointPackagesDataCopyWith<$Res> implements $VentorPointPackagesDataCopyWith<$Res> {
  factory _$VentorPointPackagesDataCopyWith(_VentorPointPackagesData value, $Res Function(_VentorPointPackagesData) _then) = __$VentorPointPackagesDataCopyWithImpl;
@override @useResult
$Res call({
 List<VentorPointPackageItemModel> packages
});




}
/// @nodoc
class __$VentorPointPackagesDataCopyWithImpl<$Res>
    implements _$VentorPointPackagesDataCopyWith<$Res> {
  __$VentorPointPackagesDataCopyWithImpl(this._self, this._then);

  final _VentorPointPackagesData _self;
  final $Res Function(_VentorPointPackagesData) _then;

/// Create a copy of VentorPointPackagesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packages = null,}) {
  return _then(_VentorPointPackagesData(
packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<VentorPointPackageItemModel>,
  ));
}


}


/// @nodoc
mixin _$VentorPointPackageItemModel {

 String get id; int get points; double get price_usd; int? get bonus_percent; int get sort_order;
/// Create a copy of VentorPointPackageItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorPointPackageItemModelCopyWith<VentorPointPackageItemModel> get copyWith => _$VentorPointPackageItemModelCopyWithImpl<VentorPointPackageItemModel>(this as VentorPointPackageItemModel, _$identity);

  /// Serializes this VentorPointPackageItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorPointPackageItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.points, points) || other.points == points)&&(identical(other.price_usd, price_usd) || other.price_usd == price_usd)&&(identical(other.bonus_percent, bonus_percent) || other.bonus_percent == bonus_percent)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,points,price_usd,bonus_percent,sort_order);

@override
String toString() {
  return 'VentorPointPackageItemModel(id: $id, points: $points, price_usd: $price_usd, bonus_percent: $bonus_percent, sort_order: $sort_order)';
}


}

/// @nodoc
abstract mixin class $VentorPointPackageItemModelCopyWith<$Res>  {
  factory $VentorPointPackageItemModelCopyWith(VentorPointPackageItemModel value, $Res Function(VentorPointPackageItemModel) _then) = _$VentorPointPackageItemModelCopyWithImpl;
@useResult
$Res call({
 String id, int points, double price_usd, int? bonus_percent, int sort_order
});




}
/// @nodoc
class _$VentorPointPackageItemModelCopyWithImpl<$Res>
    implements $VentorPointPackageItemModelCopyWith<$Res> {
  _$VentorPointPackageItemModelCopyWithImpl(this._self, this._then);

  final VentorPointPackageItemModel _self;
  final $Res Function(VentorPointPackageItemModel) _then;

/// Create a copy of VentorPointPackageItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? points = null,Object? price_usd = null,Object? bonus_percent = freezed,Object? sort_order = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,price_usd: null == price_usd ? _self.price_usd : price_usd // ignore: cast_nullable_to_non_nullable
as double,bonus_percent: freezed == bonus_percent ? _self.bonus_percent : bonus_percent // ignore: cast_nullable_to_non_nullable
as int?,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorPointPackageItemModel].
extension VentorPointPackageItemModelPatterns on VentorPointPackageItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorPointPackageItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorPointPackageItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorPointPackageItemModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorPointPackageItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorPointPackageItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorPointPackageItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int points,  double price_usd,  int? bonus_percent,  int sort_order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorPointPackageItemModel() when $default != null:
return $default(_that.id,_that.points,_that.price_usd,_that.bonus_percent,_that.sort_order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int points,  double price_usd,  int? bonus_percent,  int sort_order)  $default,) {final _that = this;
switch (_that) {
case _VentorPointPackageItemModel():
return $default(_that.id,_that.points,_that.price_usd,_that.bonus_percent,_that.sort_order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int points,  double price_usd,  int? bonus_percent,  int sort_order)?  $default,) {final _that = this;
switch (_that) {
case _VentorPointPackageItemModel() when $default != null:
return $default(_that.id,_that.points,_that.price_usd,_that.bonus_percent,_that.sort_order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorPointPackageItemModel implements VentorPointPackageItemModel {
  const _VentorPointPackageItemModel({this.id = '', this.points = 0, this.price_usd = 0, this.bonus_percent, this.sort_order = 0});
  factory _VentorPointPackageItemModel.fromJson(Map<String, dynamic> json) => _$VentorPointPackageItemModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  int points;
@override@JsonKey() final  double price_usd;
@override final  int? bonus_percent;
@override@JsonKey() final  int sort_order;

/// Create a copy of VentorPointPackageItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorPointPackageItemModelCopyWith<_VentorPointPackageItemModel> get copyWith => __$VentorPointPackageItemModelCopyWithImpl<_VentorPointPackageItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorPointPackageItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorPointPackageItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.points, points) || other.points == points)&&(identical(other.price_usd, price_usd) || other.price_usd == price_usd)&&(identical(other.bonus_percent, bonus_percent) || other.bonus_percent == bonus_percent)&&(identical(other.sort_order, sort_order) || other.sort_order == sort_order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,points,price_usd,bonus_percent,sort_order);

@override
String toString() {
  return 'VentorPointPackageItemModel(id: $id, points: $points, price_usd: $price_usd, bonus_percent: $bonus_percent, sort_order: $sort_order)';
}


}

/// @nodoc
abstract mixin class _$VentorPointPackageItemModelCopyWith<$Res> implements $VentorPointPackageItemModelCopyWith<$Res> {
  factory _$VentorPointPackageItemModelCopyWith(_VentorPointPackageItemModel value, $Res Function(_VentorPointPackageItemModel) _then) = __$VentorPointPackageItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int points, double price_usd, int? bonus_percent, int sort_order
});




}
/// @nodoc
class __$VentorPointPackageItemModelCopyWithImpl<$Res>
    implements _$VentorPointPackageItemModelCopyWith<$Res> {
  __$VentorPointPackageItemModelCopyWithImpl(this._self, this._then);

  final _VentorPointPackageItemModel _self;
  final $Res Function(_VentorPointPackageItemModel) _then;

/// Create a copy of VentorPointPackageItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? points = null,Object? price_usd = null,Object? bonus_percent = freezed,Object? sort_order = null,}) {
  return _then(_VentorPointPackageItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,price_usd: null == price_usd ? _self.price_usd : price_usd // ignore: cast_nullable_to_non_nullable
as double,bonus_percent: freezed == bonus_percent ? _self.bonus_percent : bonus_percent // ignore: cast_nullable_to_non_nullable
as int?,sort_order: null == sort_order ? _self.sort_order : sort_order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
