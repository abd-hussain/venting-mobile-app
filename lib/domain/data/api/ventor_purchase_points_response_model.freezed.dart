// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_purchase_points_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorPurchasePointsResponseModel {

 String get status; VentorPurchasePointsData get data;
/// Create a copy of VentorPurchasePointsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorPurchasePointsResponseModelCopyWith<VentorPurchasePointsResponseModel> get copyWith => _$VentorPurchasePointsResponseModelCopyWithImpl<VentorPurchasePointsResponseModel>(this as VentorPurchasePointsResponseModel, _$identity);

  /// Serializes this VentorPurchasePointsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorPurchasePointsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorPurchasePointsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorPurchasePointsResponseModelCopyWith<$Res>  {
  factory $VentorPurchasePointsResponseModelCopyWith(VentorPurchasePointsResponseModel value, $Res Function(VentorPurchasePointsResponseModel) _then) = _$VentorPurchasePointsResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorPurchasePointsData data
});


$VentorPurchasePointsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorPurchasePointsResponseModelCopyWithImpl<$Res>
    implements $VentorPurchasePointsResponseModelCopyWith<$Res> {
  _$VentorPurchasePointsResponseModelCopyWithImpl(this._self, this._then);

  final VentorPurchasePointsResponseModel _self;
  final $Res Function(VentorPurchasePointsResponseModel) _then;

/// Create a copy of VentorPurchasePointsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorPurchasePointsData,
  ));
}
/// Create a copy of VentorPurchasePointsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorPurchasePointsDataCopyWith<$Res> get data {
  
  return $VentorPurchasePointsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorPurchasePointsResponseModel].
extension VentorPurchasePointsResponseModelPatterns on VentorPurchasePointsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorPurchasePointsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorPurchasePointsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorPurchasePointsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorPurchasePointsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorPurchasePointsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorPurchasePointsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorPurchasePointsData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorPurchasePointsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorPurchasePointsData data)  $default,) {final _that = this;
switch (_that) {
case _VentorPurchasePointsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorPurchasePointsData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorPurchasePointsResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorPurchasePointsResponseModel implements VentorPurchasePointsResponseModel {
  const _VentorPurchasePointsResponseModel({required this.status, required this.data});
  factory _VentorPurchasePointsResponseModel.fromJson(Map<String, dynamic> json) => _$VentorPurchasePointsResponseModelFromJson(json);

@override final  String status;
@override final  VentorPurchasePointsData data;

/// Create a copy of VentorPurchasePointsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorPurchasePointsResponseModelCopyWith<_VentorPurchasePointsResponseModel> get copyWith => __$VentorPurchasePointsResponseModelCopyWithImpl<_VentorPurchasePointsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorPurchasePointsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorPurchasePointsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorPurchasePointsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorPurchasePointsResponseModelCopyWith<$Res> implements $VentorPurchasePointsResponseModelCopyWith<$Res> {
  factory _$VentorPurchasePointsResponseModelCopyWith(_VentorPurchasePointsResponseModel value, $Res Function(_VentorPurchasePointsResponseModel) _then) = __$VentorPurchasePointsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorPurchasePointsData data
});


@override $VentorPurchasePointsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorPurchasePointsResponseModelCopyWithImpl<$Res>
    implements _$VentorPurchasePointsResponseModelCopyWith<$Res> {
  __$VentorPurchasePointsResponseModelCopyWithImpl(this._self, this._then);

  final _VentorPurchasePointsResponseModel _self;
  final $Res Function(_VentorPurchasePointsResponseModel) _then;

/// Create a copy of VentorPurchasePointsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorPurchasePointsResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorPurchasePointsData,
  ));
}

/// Create a copy of VentorPurchasePointsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorPurchasePointsDataCopyWith<$Res> get data {
  
  return $VentorPurchasePointsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorPurchasePointsData {

 int get points; VentorPointPurchaseItemModel? get purchase;
/// Create a copy of VentorPurchasePointsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorPurchasePointsDataCopyWith<VentorPurchasePointsData> get copyWith => _$VentorPurchasePointsDataCopyWithImpl<VentorPurchasePointsData>(this as VentorPurchasePointsData, _$identity);

  /// Serializes this VentorPurchasePointsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorPurchasePointsData&&(identical(other.points, points) || other.points == points)&&(identical(other.purchase, purchase) || other.purchase == purchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,purchase);

@override
String toString() {
  return 'VentorPurchasePointsData(points: $points, purchase: $purchase)';
}


}

/// @nodoc
abstract mixin class $VentorPurchasePointsDataCopyWith<$Res>  {
  factory $VentorPurchasePointsDataCopyWith(VentorPurchasePointsData value, $Res Function(VentorPurchasePointsData) _then) = _$VentorPurchasePointsDataCopyWithImpl;
@useResult
$Res call({
 int points, VentorPointPurchaseItemModel? purchase
});


$VentorPointPurchaseItemModelCopyWith<$Res>? get purchase;

}
/// @nodoc
class _$VentorPurchasePointsDataCopyWithImpl<$Res>
    implements $VentorPurchasePointsDataCopyWith<$Res> {
  _$VentorPurchasePointsDataCopyWithImpl(this._self, this._then);

  final VentorPurchasePointsData _self;
  final $Res Function(VentorPurchasePointsData) _then;

/// Create a copy of VentorPurchasePointsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? purchase = freezed,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,purchase: freezed == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as VentorPointPurchaseItemModel?,
  ));
}
/// Create a copy of VentorPurchasePointsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorPointPurchaseItemModelCopyWith<$Res>? get purchase {
    if (_self.purchase == null) {
    return null;
  }

  return $VentorPointPurchaseItemModelCopyWith<$Res>(_self.purchase!, (value) {
    return _then(_self.copyWith(purchase: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorPurchasePointsData].
extension VentorPurchasePointsDataPatterns on VentorPurchasePointsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorPurchasePointsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorPurchasePointsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorPurchasePointsData value)  $default,){
final _that = this;
switch (_that) {
case _VentorPurchasePointsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorPurchasePointsData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorPurchasePointsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  VentorPointPurchaseItemModel? purchase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorPurchasePointsData() when $default != null:
return $default(_that.points,_that.purchase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  VentorPointPurchaseItemModel? purchase)  $default,) {final _that = this;
switch (_that) {
case _VentorPurchasePointsData():
return $default(_that.points,_that.purchase);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  VentorPointPurchaseItemModel? purchase)?  $default,) {final _that = this;
switch (_that) {
case _VentorPurchasePointsData() when $default != null:
return $default(_that.points,_that.purchase);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorPurchasePointsData implements VentorPurchasePointsData {
  const _VentorPurchasePointsData({this.points = 0, this.purchase});
  factory _VentorPurchasePointsData.fromJson(Map<String, dynamic> json) => _$VentorPurchasePointsDataFromJson(json);

@override@JsonKey() final  int points;
@override final  VentorPointPurchaseItemModel? purchase;

/// Create a copy of VentorPurchasePointsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorPurchasePointsDataCopyWith<_VentorPurchasePointsData> get copyWith => __$VentorPurchasePointsDataCopyWithImpl<_VentorPurchasePointsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorPurchasePointsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorPurchasePointsData&&(identical(other.points, points) || other.points == points)&&(identical(other.purchase, purchase) || other.purchase == purchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,purchase);

@override
String toString() {
  return 'VentorPurchasePointsData(points: $points, purchase: $purchase)';
}


}

/// @nodoc
abstract mixin class _$VentorPurchasePointsDataCopyWith<$Res> implements $VentorPurchasePointsDataCopyWith<$Res> {
  factory _$VentorPurchasePointsDataCopyWith(_VentorPurchasePointsData value, $Res Function(_VentorPurchasePointsData) _then) = __$VentorPurchasePointsDataCopyWithImpl;
@override @useResult
$Res call({
 int points, VentorPointPurchaseItemModel? purchase
});


@override $VentorPointPurchaseItemModelCopyWith<$Res>? get purchase;

}
/// @nodoc
class __$VentorPurchasePointsDataCopyWithImpl<$Res>
    implements _$VentorPurchasePointsDataCopyWith<$Res> {
  __$VentorPurchasePointsDataCopyWithImpl(this._self, this._then);

  final _VentorPurchasePointsData _self;
  final $Res Function(_VentorPurchasePointsData) _then;

/// Create a copy of VentorPurchasePointsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? purchase = freezed,}) {
  return _then(_VentorPurchasePointsData(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,purchase: freezed == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as VentorPointPurchaseItemModel?,
  ));
}

/// Create a copy of VentorPurchasePointsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorPointPurchaseItemModelCopyWith<$Res>? get purchase {
    if (_self.purchase == null) {
    return null;
  }

  return $VentorPointPurchaseItemModelCopyWith<$Res>(_self.purchase!, (value) {
    return _then(_self.copyWith(purchase: value));
  });
}
}


/// @nodoc
mixin _$VentorPointPurchaseItemModel {

 String get id; String get package_id; int get points_added; double get price_usd; String get purchased_at;
/// Create a copy of VentorPointPurchaseItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorPointPurchaseItemModelCopyWith<VentorPointPurchaseItemModel> get copyWith => _$VentorPointPurchaseItemModelCopyWithImpl<VentorPointPurchaseItemModel>(this as VentorPointPurchaseItemModel, _$identity);

  /// Serializes this VentorPointPurchaseItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorPointPurchaseItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.package_id, package_id) || other.package_id == package_id)&&(identical(other.points_added, points_added) || other.points_added == points_added)&&(identical(other.price_usd, price_usd) || other.price_usd == price_usd)&&(identical(other.purchased_at, purchased_at) || other.purchased_at == purchased_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,package_id,points_added,price_usd,purchased_at);

@override
String toString() {
  return 'VentorPointPurchaseItemModel(id: $id, package_id: $package_id, points_added: $points_added, price_usd: $price_usd, purchased_at: $purchased_at)';
}


}

/// @nodoc
abstract mixin class $VentorPointPurchaseItemModelCopyWith<$Res>  {
  factory $VentorPointPurchaseItemModelCopyWith(VentorPointPurchaseItemModel value, $Res Function(VentorPointPurchaseItemModel) _then) = _$VentorPointPurchaseItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String package_id, int points_added, double price_usd, String purchased_at
});




}
/// @nodoc
class _$VentorPointPurchaseItemModelCopyWithImpl<$Res>
    implements $VentorPointPurchaseItemModelCopyWith<$Res> {
  _$VentorPointPurchaseItemModelCopyWithImpl(this._self, this._then);

  final VentorPointPurchaseItemModel _self;
  final $Res Function(VentorPointPurchaseItemModel) _then;

/// Create a copy of VentorPointPurchaseItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? package_id = null,Object? points_added = null,Object? price_usd = null,Object? purchased_at = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,package_id: null == package_id ? _self.package_id : package_id // ignore: cast_nullable_to_non_nullable
as String,points_added: null == points_added ? _self.points_added : points_added // ignore: cast_nullable_to_non_nullable
as int,price_usd: null == price_usd ? _self.price_usd : price_usd // ignore: cast_nullable_to_non_nullable
as double,purchased_at: null == purchased_at ? _self.purchased_at : purchased_at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorPointPurchaseItemModel].
extension VentorPointPurchaseItemModelPatterns on VentorPointPurchaseItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorPointPurchaseItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorPointPurchaseItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorPointPurchaseItemModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorPointPurchaseItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorPointPurchaseItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorPointPurchaseItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String package_id,  int points_added,  double price_usd,  String purchased_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorPointPurchaseItemModel() when $default != null:
return $default(_that.id,_that.package_id,_that.points_added,_that.price_usd,_that.purchased_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String package_id,  int points_added,  double price_usd,  String purchased_at)  $default,) {final _that = this;
switch (_that) {
case _VentorPointPurchaseItemModel():
return $default(_that.id,_that.package_id,_that.points_added,_that.price_usd,_that.purchased_at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String package_id,  int points_added,  double price_usd,  String purchased_at)?  $default,) {final _that = this;
switch (_that) {
case _VentorPointPurchaseItemModel() when $default != null:
return $default(_that.id,_that.package_id,_that.points_added,_that.price_usd,_that.purchased_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorPointPurchaseItemModel implements VentorPointPurchaseItemModel {
  const _VentorPointPurchaseItemModel({this.id = '', this.package_id = '', this.points_added = 0, this.price_usd = 0, this.purchased_at = ''});
  factory _VentorPointPurchaseItemModel.fromJson(Map<String, dynamic> json) => _$VentorPointPurchaseItemModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String package_id;
@override@JsonKey() final  int points_added;
@override@JsonKey() final  double price_usd;
@override@JsonKey() final  String purchased_at;

/// Create a copy of VentorPointPurchaseItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorPointPurchaseItemModelCopyWith<_VentorPointPurchaseItemModel> get copyWith => __$VentorPointPurchaseItemModelCopyWithImpl<_VentorPointPurchaseItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorPointPurchaseItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorPointPurchaseItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.package_id, package_id) || other.package_id == package_id)&&(identical(other.points_added, points_added) || other.points_added == points_added)&&(identical(other.price_usd, price_usd) || other.price_usd == price_usd)&&(identical(other.purchased_at, purchased_at) || other.purchased_at == purchased_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,package_id,points_added,price_usd,purchased_at);

@override
String toString() {
  return 'VentorPointPurchaseItemModel(id: $id, package_id: $package_id, points_added: $points_added, price_usd: $price_usd, purchased_at: $purchased_at)';
}


}

/// @nodoc
abstract mixin class _$VentorPointPurchaseItemModelCopyWith<$Res> implements $VentorPointPurchaseItemModelCopyWith<$Res> {
  factory _$VentorPointPurchaseItemModelCopyWith(_VentorPointPurchaseItemModel value, $Res Function(_VentorPointPurchaseItemModel) _then) = __$VentorPointPurchaseItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String package_id, int points_added, double price_usd, String purchased_at
});




}
/// @nodoc
class __$VentorPointPurchaseItemModelCopyWithImpl<$Res>
    implements _$VentorPointPurchaseItemModelCopyWith<$Res> {
  __$VentorPointPurchaseItemModelCopyWithImpl(this._self, this._then);

  final _VentorPointPurchaseItemModel _self;
  final $Res Function(_VentorPointPurchaseItemModel) _then;

/// Create a copy of VentorPointPurchaseItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? package_id = null,Object? points_added = null,Object? price_usd = null,Object? purchased_at = null,}) {
  return _then(_VentorPointPurchaseItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,package_id: null == package_id ? _self.package_id : package_id // ignore: cast_nullable_to_non_nullable
as String,points_added: null == points_added ? _self.points_added : points_added // ignore: cast_nullable_to_non_nullable
as int,price_usd: null == price_usd ? _self.price_usd : price_usd // ignore: cast_nullable_to_non_nullable
as double,purchased_at: null == purchased_at ? _self.purchased_at : purchased_at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
