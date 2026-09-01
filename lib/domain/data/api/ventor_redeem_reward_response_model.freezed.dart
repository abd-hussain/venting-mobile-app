// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_redeem_reward_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorRedeemRewardResponseModel {

 String get status; VentorRedeemRewardData get data;
/// Create a copy of VentorRedeemRewardResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRedeemRewardResponseModelCopyWith<VentorRedeemRewardResponseModel> get copyWith => _$VentorRedeemRewardResponseModelCopyWithImpl<VentorRedeemRewardResponseModel>(this as VentorRedeemRewardResponseModel, _$identity);

  /// Serializes this VentorRedeemRewardResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRedeemRewardResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorRedeemRewardResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorRedeemRewardResponseModelCopyWith<$Res>  {
  factory $VentorRedeemRewardResponseModelCopyWith(VentorRedeemRewardResponseModel value, $Res Function(VentorRedeemRewardResponseModel) _then) = _$VentorRedeemRewardResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorRedeemRewardData data
});


$VentorRedeemRewardDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorRedeemRewardResponseModelCopyWithImpl<$Res>
    implements $VentorRedeemRewardResponseModelCopyWith<$Res> {
  _$VentorRedeemRewardResponseModelCopyWithImpl(this._self, this._then);

  final VentorRedeemRewardResponseModel _self;
  final $Res Function(VentorRedeemRewardResponseModel) _then;

/// Create a copy of VentorRedeemRewardResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorRedeemRewardData,
  ));
}
/// Create a copy of VentorRedeemRewardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRedeemRewardDataCopyWith<$Res> get data {
  
  return $VentorRedeemRewardDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorRedeemRewardResponseModel].
extension VentorRedeemRewardResponseModelPatterns on VentorRedeemRewardResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRedeemRewardResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRedeemRewardResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRedeemRewardResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorRedeemRewardResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRedeemRewardResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRedeemRewardResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorRedeemRewardData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRedeemRewardResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorRedeemRewardData data)  $default,) {final _that = this;
switch (_that) {
case _VentorRedeemRewardResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorRedeemRewardData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorRedeemRewardResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRedeemRewardResponseModel implements VentorRedeemRewardResponseModel {
  const _VentorRedeemRewardResponseModel({required this.status, required this.data});
  factory _VentorRedeemRewardResponseModel.fromJson(Map<String, dynamic> json) => _$VentorRedeemRewardResponseModelFromJson(json);

@override final  String status;
@override final  VentorRedeemRewardData data;

/// Create a copy of VentorRedeemRewardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRedeemRewardResponseModelCopyWith<_VentorRedeemRewardResponseModel> get copyWith => __$VentorRedeemRewardResponseModelCopyWithImpl<_VentorRedeemRewardResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRedeemRewardResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRedeemRewardResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorRedeemRewardResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorRedeemRewardResponseModelCopyWith<$Res> implements $VentorRedeemRewardResponseModelCopyWith<$Res> {
  factory _$VentorRedeemRewardResponseModelCopyWith(_VentorRedeemRewardResponseModel value, $Res Function(_VentorRedeemRewardResponseModel) _then) = __$VentorRedeemRewardResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorRedeemRewardData data
});


@override $VentorRedeemRewardDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorRedeemRewardResponseModelCopyWithImpl<$Res>
    implements _$VentorRedeemRewardResponseModelCopyWith<$Res> {
  __$VentorRedeemRewardResponseModelCopyWithImpl(this._self, this._then);

  final _VentorRedeemRewardResponseModel _self;
  final $Res Function(_VentorRedeemRewardResponseModel) _then;

/// Create a copy of VentorRedeemRewardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorRedeemRewardResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorRedeemRewardData,
  ));
}

/// Create a copy of VentorRedeemRewardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRedeemRewardDataCopyWith<$Res> get data {
  
  return $VentorRedeemRewardDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorRedeemRewardData {

 int get points_remaining; VentorRewardTradeItemModel? get trade; String? get active_offer_id;
/// Create a copy of VentorRedeemRewardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRedeemRewardDataCopyWith<VentorRedeemRewardData> get copyWith => _$VentorRedeemRewardDataCopyWithImpl<VentorRedeemRewardData>(this as VentorRedeemRewardData, _$identity);

  /// Serializes this VentorRedeemRewardData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRedeemRewardData&&(identical(other.points_remaining, points_remaining) || other.points_remaining == points_remaining)&&(identical(other.trade, trade) || other.trade == trade)&&(identical(other.active_offer_id, active_offer_id) || other.active_offer_id == active_offer_id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points_remaining,trade,active_offer_id);

@override
String toString() {
  return 'VentorRedeemRewardData(points_remaining: $points_remaining, trade: $trade, active_offer_id: $active_offer_id)';
}


}

/// @nodoc
abstract mixin class $VentorRedeemRewardDataCopyWith<$Res>  {
  factory $VentorRedeemRewardDataCopyWith(VentorRedeemRewardData value, $Res Function(VentorRedeemRewardData) _then) = _$VentorRedeemRewardDataCopyWithImpl;
@useResult
$Res call({
 int points_remaining, VentorRewardTradeItemModel? trade, String? active_offer_id
});


$VentorRewardTradeItemModelCopyWith<$Res>? get trade;

}
/// @nodoc
class _$VentorRedeemRewardDataCopyWithImpl<$Res>
    implements $VentorRedeemRewardDataCopyWith<$Res> {
  _$VentorRedeemRewardDataCopyWithImpl(this._self, this._then);

  final VentorRedeemRewardData _self;
  final $Res Function(VentorRedeemRewardData) _then;

/// Create a copy of VentorRedeemRewardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points_remaining = null,Object? trade = freezed,Object? active_offer_id = freezed,}) {
  return _then(_self.copyWith(
points_remaining: null == points_remaining ? _self.points_remaining : points_remaining // ignore: cast_nullable_to_non_nullable
as int,trade: freezed == trade ? _self.trade : trade // ignore: cast_nullable_to_non_nullable
as VentorRewardTradeItemModel?,active_offer_id: freezed == active_offer_id ? _self.active_offer_id : active_offer_id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VentorRedeemRewardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardTradeItemModelCopyWith<$Res>? get trade {
    if (_self.trade == null) {
    return null;
  }

  return $VentorRewardTradeItemModelCopyWith<$Res>(_self.trade!, (value) {
    return _then(_self.copyWith(trade: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorRedeemRewardData].
extension VentorRedeemRewardDataPatterns on VentorRedeemRewardData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRedeemRewardData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRedeemRewardData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRedeemRewardData value)  $default,){
final _that = this;
switch (_that) {
case _VentorRedeemRewardData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRedeemRewardData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRedeemRewardData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points_remaining,  VentorRewardTradeItemModel? trade,  String? active_offer_id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRedeemRewardData() when $default != null:
return $default(_that.points_remaining,_that.trade,_that.active_offer_id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points_remaining,  VentorRewardTradeItemModel? trade,  String? active_offer_id)  $default,) {final _that = this;
switch (_that) {
case _VentorRedeemRewardData():
return $default(_that.points_remaining,_that.trade,_that.active_offer_id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points_remaining,  VentorRewardTradeItemModel? trade,  String? active_offer_id)?  $default,) {final _that = this;
switch (_that) {
case _VentorRedeemRewardData() when $default != null:
return $default(_that.points_remaining,_that.trade,_that.active_offer_id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRedeemRewardData implements VentorRedeemRewardData {
  const _VentorRedeemRewardData({this.points_remaining = 0, this.trade, this.active_offer_id});
  factory _VentorRedeemRewardData.fromJson(Map<String, dynamic> json) => _$VentorRedeemRewardDataFromJson(json);

@override@JsonKey() final  int points_remaining;
@override final  VentorRewardTradeItemModel? trade;
@override final  String? active_offer_id;

/// Create a copy of VentorRedeemRewardData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRedeemRewardDataCopyWith<_VentorRedeemRewardData> get copyWith => __$VentorRedeemRewardDataCopyWithImpl<_VentorRedeemRewardData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRedeemRewardDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRedeemRewardData&&(identical(other.points_remaining, points_remaining) || other.points_remaining == points_remaining)&&(identical(other.trade, trade) || other.trade == trade)&&(identical(other.active_offer_id, active_offer_id) || other.active_offer_id == active_offer_id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points_remaining,trade,active_offer_id);

@override
String toString() {
  return 'VentorRedeemRewardData(points_remaining: $points_remaining, trade: $trade, active_offer_id: $active_offer_id)';
}


}

/// @nodoc
abstract mixin class _$VentorRedeemRewardDataCopyWith<$Res> implements $VentorRedeemRewardDataCopyWith<$Res> {
  factory _$VentorRedeemRewardDataCopyWith(_VentorRedeemRewardData value, $Res Function(_VentorRedeemRewardData) _then) = __$VentorRedeemRewardDataCopyWithImpl;
@override @useResult
$Res call({
 int points_remaining, VentorRewardTradeItemModel? trade, String? active_offer_id
});


@override $VentorRewardTradeItemModelCopyWith<$Res>? get trade;

}
/// @nodoc
class __$VentorRedeemRewardDataCopyWithImpl<$Res>
    implements _$VentorRedeemRewardDataCopyWith<$Res> {
  __$VentorRedeemRewardDataCopyWithImpl(this._self, this._then);

  final _VentorRedeemRewardData _self;
  final $Res Function(_VentorRedeemRewardData) _then;

/// Create a copy of VentorRedeemRewardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points_remaining = null,Object? trade = freezed,Object? active_offer_id = freezed,}) {
  return _then(_VentorRedeemRewardData(
points_remaining: null == points_remaining ? _self.points_remaining : points_remaining // ignore: cast_nullable_to_non_nullable
as int,trade: freezed == trade ? _self.trade : trade // ignore: cast_nullable_to_non_nullable
as VentorRewardTradeItemModel?,active_offer_id: freezed == active_offer_id ? _self.active_offer_id : active_offer_id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VentorRedeemRewardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardTradeItemModelCopyWith<$Res>? get trade {
    if (_self.trade == null) {
    return null;
  }

  return $VentorRewardTradeItemModelCopyWith<$Res>(_self.trade!, (value) {
    return _then(_self.copyWith(trade: value));
  });
}
}

// dart format on
