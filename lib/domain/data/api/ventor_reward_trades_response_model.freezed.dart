// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_reward_trades_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorRewardTradesResponseModel {

 String get status; VentorRewardTradesData get data;
/// Create a copy of VentorRewardTradesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRewardTradesResponseModelCopyWith<VentorRewardTradesResponseModel> get copyWith => _$VentorRewardTradesResponseModelCopyWithImpl<VentorRewardTradesResponseModel>(this as VentorRewardTradesResponseModel, _$identity);

  /// Serializes this VentorRewardTradesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardTradesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorRewardTradesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorRewardTradesResponseModelCopyWith<$Res>  {
  factory $VentorRewardTradesResponseModelCopyWith(VentorRewardTradesResponseModel value, $Res Function(VentorRewardTradesResponseModel) _then) = _$VentorRewardTradesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorRewardTradesData data
});


$VentorRewardTradesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorRewardTradesResponseModelCopyWithImpl<$Res>
    implements $VentorRewardTradesResponseModelCopyWith<$Res> {
  _$VentorRewardTradesResponseModelCopyWithImpl(this._self, this._then);

  final VentorRewardTradesResponseModel _self;
  final $Res Function(VentorRewardTradesResponseModel) _then;

/// Create a copy of VentorRewardTradesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorRewardTradesData,
  ));
}
/// Create a copy of VentorRewardTradesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardTradesDataCopyWith<$Res> get data {
  
  return $VentorRewardTradesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorRewardTradesResponseModel].
extension VentorRewardTradesResponseModelPatterns on VentorRewardTradesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRewardTradesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRewardTradesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRewardTradesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorRewardTradesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRewardTradesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRewardTradesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorRewardTradesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRewardTradesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorRewardTradesData data)  $default,) {final _that = this;
switch (_that) {
case _VentorRewardTradesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorRewardTradesData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorRewardTradesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRewardTradesResponseModel implements VentorRewardTradesResponseModel {
  const _VentorRewardTradesResponseModel({required this.status, required this.data});
  factory _VentorRewardTradesResponseModel.fromJson(Map<String, dynamic> json) => _$VentorRewardTradesResponseModelFromJson(json);

@override final  String status;
@override final  VentorRewardTradesData data;

/// Create a copy of VentorRewardTradesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRewardTradesResponseModelCopyWith<_VentorRewardTradesResponseModel> get copyWith => __$VentorRewardTradesResponseModelCopyWithImpl<_VentorRewardTradesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRewardTradesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRewardTradesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorRewardTradesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorRewardTradesResponseModelCopyWith<$Res> implements $VentorRewardTradesResponseModelCopyWith<$Res> {
  factory _$VentorRewardTradesResponseModelCopyWith(_VentorRewardTradesResponseModel value, $Res Function(_VentorRewardTradesResponseModel) _then) = __$VentorRewardTradesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorRewardTradesData data
});


@override $VentorRewardTradesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorRewardTradesResponseModelCopyWithImpl<$Res>
    implements _$VentorRewardTradesResponseModelCopyWith<$Res> {
  __$VentorRewardTradesResponseModelCopyWithImpl(this._self, this._then);

  final _VentorRewardTradesResponseModel _self;
  final $Res Function(_VentorRewardTradesResponseModel) _then;

/// Create a copy of VentorRewardTradesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorRewardTradesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorRewardTradesData,
  ));
}

/// Create a copy of VentorRewardTradesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardTradesDataCopyWith<$Res> get data {
  
  return $VentorRewardTradesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorRewardTradesData {

 List<VentorRewardTradeItemModel> get items;
/// Create a copy of VentorRewardTradesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRewardTradesDataCopyWith<VentorRewardTradesData> get copyWith => _$VentorRewardTradesDataCopyWithImpl<VentorRewardTradesData>(this as VentorRewardTradesData, _$identity);

  /// Serializes this VentorRewardTradesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardTradesData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'VentorRewardTradesData(items: $items)';
}


}

/// @nodoc
abstract mixin class $VentorRewardTradesDataCopyWith<$Res>  {
  factory $VentorRewardTradesDataCopyWith(VentorRewardTradesData value, $Res Function(VentorRewardTradesData) _then) = _$VentorRewardTradesDataCopyWithImpl;
@useResult
$Res call({
 List<VentorRewardTradeItemModel> items
});




}
/// @nodoc
class _$VentorRewardTradesDataCopyWithImpl<$Res>
    implements $VentorRewardTradesDataCopyWith<$Res> {
  _$VentorRewardTradesDataCopyWithImpl(this._self, this._then);

  final VentorRewardTradesData _self;
  final $Res Function(VentorRewardTradesData) _then;

/// Create a copy of VentorRewardTradesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<VentorRewardTradeItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorRewardTradesData].
extension VentorRewardTradesDataPatterns on VentorRewardTradesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRewardTradesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRewardTradesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRewardTradesData value)  $default,){
final _that = this;
switch (_that) {
case _VentorRewardTradesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRewardTradesData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRewardTradesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VentorRewardTradeItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRewardTradesData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VentorRewardTradeItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _VentorRewardTradesData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VentorRewardTradeItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _VentorRewardTradesData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRewardTradesData implements VentorRewardTradesData {
  const _VentorRewardTradesData({final  List<VentorRewardTradeItemModel> items = const <VentorRewardTradeItemModel>[]}): _items = items;
  factory _VentorRewardTradesData.fromJson(Map<String, dynamic> json) => _$VentorRewardTradesDataFromJson(json);

 final  List<VentorRewardTradeItemModel> _items;
@override@JsonKey() List<VentorRewardTradeItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of VentorRewardTradesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRewardTradesDataCopyWith<_VentorRewardTradesData> get copyWith => __$VentorRewardTradesDataCopyWithImpl<_VentorRewardTradesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRewardTradesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRewardTradesData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'VentorRewardTradesData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$VentorRewardTradesDataCopyWith<$Res> implements $VentorRewardTradesDataCopyWith<$Res> {
  factory _$VentorRewardTradesDataCopyWith(_VentorRewardTradesData value, $Res Function(_VentorRewardTradesData) _then) = __$VentorRewardTradesDataCopyWithImpl;
@override @useResult
$Res call({
 List<VentorRewardTradeItemModel> items
});




}
/// @nodoc
class __$VentorRewardTradesDataCopyWithImpl<$Res>
    implements _$VentorRewardTradesDataCopyWith<$Res> {
  __$VentorRewardTradesDataCopyWithImpl(this._self, this._then);

  final _VentorRewardTradesData _self;
  final $Res Function(_VentorRewardTradesData) _then;

/// Create a copy of VentorRewardTradesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_VentorRewardTradesData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<VentorRewardTradeItemModel>,
  ));
}


}


/// @nodoc
mixin _$VentorRewardTradeItemModel {

 String get id; String get offer_id; int get points_spent; String get traded_at; bool get is_welcome_gift;
/// Create a copy of VentorRewardTradeItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRewardTradeItemModelCopyWith<VentorRewardTradeItemModel> get copyWith => _$VentorRewardTradeItemModelCopyWithImpl<VentorRewardTradeItemModel>(this as VentorRewardTradeItemModel, _$identity);

  /// Serializes this VentorRewardTradeItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardTradeItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.offer_id, offer_id) || other.offer_id == offer_id)&&(identical(other.points_spent, points_spent) || other.points_spent == points_spent)&&(identical(other.traded_at, traded_at) || other.traded_at == traded_at)&&(identical(other.is_welcome_gift, is_welcome_gift) || other.is_welcome_gift == is_welcome_gift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,offer_id,points_spent,traded_at,is_welcome_gift);

@override
String toString() {
  return 'VentorRewardTradeItemModel(id: $id, offer_id: $offer_id, points_spent: $points_spent, traded_at: $traded_at, is_welcome_gift: $is_welcome_gift)';
}


}

/// @nodoc
abstract mixin class $VentorRewardTradeItemModelCopyWith<$Res>  {
  factory $VentorRewardTradeItemModelCopyWith(VentorRewardTradeItemModel value, $Res Function(VentorRewardTradeItemModel) _then) = _$VentorRewardTradeItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String offer_id, int points_spent, String traded_at, bool is_welcome_gift
});




}
/// @nodoc
class _$VentorRewardTradeItemModelCopyWithImpl<$Res>
    implements $VentorRewardTradeItemModelCopyWith<$Res> {
  _$VentorRewardTradeItemModelCopyWithImpl(this._self, this._then);

  final VentorRewardTradeItemModel _self;
  final $Res Function(VentorRewardTradeItemModel) _then;

/// Create a copy of VentorRewardTradeItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? offer_id = null,Object? points_spent = null,Object? traded_at = null,Object? is_welcome_gift = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,offer_id: null == offer_id ? _self.offer_id : offer_id // ignore: cast_nullable_to_non_nullable
as String,points_spent: null == points_spent ? _self.points_spent : points_spent // ignore: cast_nullable_to_non_nullable
as int,traded_at: null == traded_at ? _self.traded_at : traded_at // ignore: cast_nullable_to_non_nullable
as String,is_welcome_gift: null == is_welcome_gift ? _self.is_welcome_gift : is_welcome_gift // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorRewardTradeItemModel].
extension VentorRewardTradeItemModelPatterns on VentorRewardTradeItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRewardTradeItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRewardTradeItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRewardTradeItemModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorRewardTradeItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRewardTradeItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRewardTradeItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String offer_id,  int points_spent,  String traded_at,  bool is_welcome_gift)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRewardTradeItemModel() when $default != null:
return $default(_that.id,_that.offer_id,_that.points_spent,_that.traded_at,_that.is_welcome_gift);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String offer_id,  int points_spent,  String traded_at,  bool is_welcome_gift)  $default,) {final _that = this;
switch (_that) {
case _VentorRewardTradeItemModel():
return $default(_that.id,_that.offer_id,_that.points_spent,_that.traded_at,_that.is_welcome_gift);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String offer_id,  int points_spent,  String traded_at,  bool is_welcome_gift)?  $default,) {final _that = this;
switch (_that) {
case _VentorRewardTradeItemModel() when $default != null:
return $default(_that.id,_that.offer_id,_that.points_spent,_that.traded_at,_that.is_welcome_gift);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRewardTradeItemModel implements VentorRewardTradeItemModel {
  const _VentorRewardTradeItemModel({this.id = '', this.offer_id = '', this.points_spent = 0, this.traded_at = '', this.is_welcome_gift = false});
  factory _VentorRewardTradeItemModel.fromJson(Map<String, dynamic> json) => _$VentorRewardTradeItemModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String offer_id;
@override@JsonKey() final  int points_spent;
@override@JsonKey() final  String traded_at;
@override@JsonKey() final  bool is_welcome_gift;

/// Create a copy of VentorRewardTradeItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRewardTradeItemModelCopyWith<_VentorRewardTradeItemModel> get copyWith => __$VentorRewardTradeItemModelCopyWithImpl<_VentorRewardTradeItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRewardTradeItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRewardTradeItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.offer_id, offer_id) || other.offer_id == offer_id)&&(identical(other.points_spent, points_spent) || other.points_spent == points_spent)&&(identical(other.traded_at, traded_at) || other.traded_at == traded_at)&&(identical(other.is_welcome_gift, is_welcome_gift) || other.is_welcome_gift == is_welcome_gift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,offer_id,points_spent,traded_at,is_welcome_gift);

@override
String toString() {
  return 'VentorRewardTradeItemModel(id: $id, offer_id: $offer_id, points_spent: $points_spent, traded_at: $traded_at, is_welcome_gift: $is_welcome_gift)';
}


}

/// @nodoc
abstract mixin class _$VentorRewardTradeItemModelCopyWith<$Res> implements $VentorRewardTradeItemModelCopyWith<$Res> {
  factory _$VentorRewardTradeItemModelCopyWith(_VentorRewardTradeItemModel value, $Res Function(_VentorRewardTradeItemModel) _then) = __$VentorRewardTradeItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String offer_id, int points_spent, String traded_at, bool is_welcome_gift
});




}
/// @nodoc
class __$VentorRewardTradeItemModelCopyWithImpl<$Res>
    implements _$VentorRewardTradeItemModelCopyWith<$Res> {
  __$VentorRewardTradeItemModelCopyWithImpl(this._self, this._then);

  final _VentorRewardTradeItemModel _self;
  final $Res Function(_VentorRewardTradeItemModel) _then;

/// Create a copy of VentorRewardTradeItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? offer_id = null,Object? points_spent = null,Object? traded_at = null,Object? is_welcome_gift = null,}) {
  return _then(_VentorRewardTradeItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,offer_id: null == offer_id ? _self.offer_id : offer_id // ignore: cast_nullable_to_non_nullable
as String,points_spent: null == points_spent ? _self.points_spent : points_spent // ignore: cast_nullable_to_non_nullable
as int,traded_at: null == traded_at ? _self.traded_at : traded_at // ignore: cast_nullable_to_non_nullable
as String,is_welcome_gift: null == is_welcome_gift ? _self.is_welcome_gift : is_welcome_gift // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
