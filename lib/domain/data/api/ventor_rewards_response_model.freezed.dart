// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_rewards_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorRewardsResponseModel {

 String get status; VentorRewardsData get data;
/// Create a copy of VentorRewardsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRewardsResponseModelCopyWith<VentorRewardsResponseModel> get copyWith => _$VentorRewardsResponseModelCopyWithImpl<VentorRewardsResponseModel>(this as VentorRewardsResponseModel, _$identity);

  /// Serializes this VentorRewardsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorRewardsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorRewardsResponseModelCopyWith<$Res>  {
  factory $VentorRewardsResponseModelCopyWith(VentorRewardsResponseModel value, $Res Function(VentorRewardsResponseModel) _then) = _$VentorRewardsResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorRewardsData data
});


$VentorRewardsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorRewardsResponseModelCopyWithImpl<$Res>
    implements $VentorRewardsResponseModelCopyWith<$Res> {
  _$VentorRewardsResponseModelCopyWithImpl(this._self, this._then);

  final VentorRewardsResponseModel _self;
  final $Res Function(VentorRewardsResponseModel) _then;

/// Create a copy of VentorRewardsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorRewardsData,
  ));
}
/// Create a copy of VentorRewardsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardsDataCopyWith<$Res> get data {
  
  return $VentorRewardsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorRewardsResponseModel].
extension VentorRewardsResponseModelPatterns on VentorRewardsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRewardsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRewardsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRewardsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorRewardsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRewardsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRewardsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorRewardsData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRewardsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorRewardsData data)  $default,) {final _that = this;
switch (_that) {
case _VentorRewardsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorRewardsData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorRewardsResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRewardsResponseModel implements VentorRewardsResponseModel {
  const _VentorRewardsResponseModel({required this.status, required this.data});
  factory _VentorRewardsResponseModel.fromJson(Map<String, dynamic> json) => _$VentorRewardsResponseModelFromJson(json);

@override final  String status;
@override final  VentorRewardsData data;

/// Create a copy of VentorRewardsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRewardsResponseModelCopyWith<_VentorRewardsResponseModel> get copyWith => __$VentorRewardsResponseModelCopyWithImpl<_VentorRewardsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRewardsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRewardsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorRewardsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorRewardsResponseModelCopyWith<$Res> implements $VentorRewardsResponseModelCopyWith<$Res> {
  factory _$VentorRewardsResponseModelCopyWith(_VentorRewardsResponseModel value, $Res Function(_VentorRewardsResponseModel) _then) = __$VentorRewardsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorRewardsData data
});


@override $VentorRewardsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorRewardsResponseModelCopyWithImpl<$Res>
    implements _$VentorRewardsResponseModelCopyWith<$Res> {
  __$VentorRewardsResponseModelCopyWithImpl(this._self, this._then);

  final _VentorRewardsResponseModel _self;
  final $Res Function(_VentorRewardsResponseModel) _then;

/// Create a copy of VentorRewardsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorRewardsResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorRewardsData,
  ));
}

/// Create a copy of VentorRewardsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardsDataCopyWith<$Res> get data {
  
  return $VentorRewardsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorRewardsData {

 int get points; int get completed_sessions; String? get active_offer_id; bool get welcome_gift_claimed; List<VentorRewardOfferItemModel> get offers; VentorRewardEarnRulesModel? get earn_rules;
/// Create a copy of VentorRewardsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRewardsDataCopyWith<VentorRewardsData> get copyWith => _$VentorRewardsDataCopyWithImpl<VentorRewardsData>(this as VentorRewardsData, _$identity);

  /// Serializes this VentorRewardsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardsData&&(identical(other.points, points) || other.points == points)&&(identical(other.completed_sessions, completed_sessions) || other.completed_sessions == completed_sessions)&&(identical(other.active_offer_id, active_offer_id) || other.active_offer_id == active_offer_id)&&(identical(other.welcome_gift_claimed, welcome_gift_claimed) || other.welcome_gift_claimed == welcome_gift_claimed)&&const DeepCollectionEquality().equals(other.offers, offers)&&(identical(other.earn_rules, earn_rules) || other.earn_rules == earn_rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,completed_sessions,active_offer_id,welcome_gift_claimed,const DeepCollectionEquality().hash(offers),earn_rules);

@override
String toString() {
  return 'VentorRewardsData(points: $points, completed_sessions: $completed_sessions, active_offer_id: $active_offer_id, welcome_gift_claimed: $welcome_gift_claimed, offers: $offers, earn_rules: $earn_rules)';
}


}

/// @nodoc
abstract mixin class $VentorRewardsDataCopyWith<$Res>  {
  factory $VentorRewardsDataCopyWith(VentorRewardsData value, $Res Function(VentorRewardsData) _then) = _$VentorRewardsDataCopyWithImpl;
@useResult
$Res call({
 int points, int completed_sessions, String? active_offer_id, bool welcome_gift_claimed, List<VentorRewardOfferItemModel> offers, VentorRewardEarnRulesModel? earn_rules
});


$VentorRewardEarnRulesModelCopyWith<$Res>? get earn_rules;

}
/// @nodoc
class _$VentorRewardsDataCopyWithImpl<$Res>
    implements $VentorRewardsDataCopyWith<$Res> {
  _$VentorRewardsDataCopyWithImpl(this._self, this._then);

  final VentorRewardsData _self;
  final $Res Function(VentorRewardsData) _then;

/// Create a copy of VentorRewardsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? completed_sessions = null,Object? active_offer_id = freezed,Object? welcome_gift_claimed = null,Object? offers = null,Object? earn_rules = freezed,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,completed_sessions: null == completed_sessions ? _self.completed_sessions : completed_sessions // ignore: cast_nullable_to_non_nullable
as int,active_offer_id: freezed == active_offer_id ? _self.active_offer_id : active_offer_id // ignore: cast_nullable_to_non_nullable
as String?,welcome_gift_claimed: null == welcome_gift_claimed ? _self.welcome_gift_claimed : welcome_gift_claimed // ignore: cast_nullable_to_non_nullable
as bool,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<VentorRewardOfferItemModel>,earn_rules: freezed == earn_rules ? _self.earn_rules : earn_rules // ignore: cast_nullable_to_non_nullable
as VentorRewardEarnRulesModel?,
  ));
}
/// Create a copy of VentorRewardsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardEarnRulesModelCopyWith<$Res>? get earn_rules {
    if (_self.earn_rules == null) {
    return null;
  }

  return $VentorRewardEarnRulesModelCopyWith<$Res>(_self.earn_rules!, (value) {
    return _then(_self.copyWith(earn_rules: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorRewardsData].
extension VentorRewardsDataPatterns on VentorRewardsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRewardsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRewardsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRewardsData value)  $default,){
final _that = this;
switch (_that) {
case _VentorRewardsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRewardsData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRewardsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  int completed_sessions,  String? active_offer_id,  bool welcome_gift_claimed,  List<VentorRewardOfferItemModel> offers,  VentorRewardEarnRulesModel? earn_rules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRewardsData() when $default != null:
return $default(_that.points,_that.completed_sessions,_that.active_offer_id,_that.welcome_gift_claimed,_that.offers,_that.earn_rules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  int completed_sessions,  String? active_offer_id,  bool welcome_gift_claimed,  List<VentorRewardOfferItemModel> offers,  VentorRewardEarnRulesModel? earn_rules)  $default,) {final _that = this;
switch (_that) {
case _VentorRewardsData():
return $default(_that.points,_that.completed_sessions,_that.active_offer_id,_that.welcome_gift_claimed,_that.offers,_that.earn_rules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  int completed_sessions,  String? active_offer_id,  bool welcome_gift_claimed,  List<VentorRewardOfferItemModel> offers,  VentorRewardEarnRulesModel? earn_rules)?  $default,) {final _that = this;
switch (_that) {
case _VentorRewardsData() when $default != null:
return $default(_that.points,_that.completed_sessions,_that.active_offer_id,_that.welcome_gift_claimed,_that.offers,_that.earn_rules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRewardsData implements VentorRewardsData {
  const _VentorRewardsData({this.points = 0, this.completed_sessions = 0, this.active_offer_id, this.welcome_gift_claimed = false, final  List<VentorRewardOfferItemModel> offers = const <VentorRewardOfferItemModel>[], this.earn_rules}): _offers = offers;
  factory _VentorRewardsData.fromJson(Map<String, dynamic> json) => _$VentorRewardsDataFromJson(json);

@override@JsonKey() final  int points;
@override@JsonKey() final  int completed_sessions;
@override final  String? active_offer_id;
@override@JsonKey() final  bool welcome_gift_claimed;
 final  List<VentorRewardOfferItemModel> _offers;
@override@JsonKey() List<VentorRewardOfferItemModel> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

@override final  VentorRewardEarnRulesModel? earn_rules;

/// Create a copy of VentorRewardsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRewardsDataCopyWith<_VentorRewardsData> get copyWith => __$VentorRewardsDataCopyWithImpl<_VentorRewardsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRewardsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRewardsData&&(identical(other.points, points) || other.points == points)&&(identical(other.completed_sessions, completed_sessions) || other.completed_sessions == completed_sessions)&&(identical(other.active_offer_id, active_offer_id) || other.active_offer_id == active_offer_id)&&(identical(other.welcome_gift_claimed, welcome_gift_claimed) || other.welcome_gift_claimed == welcome_gift_claimed)&&const DeepCollectionEquality().equals(other._offers, _offers)&&(identical(other.earn_rules, earn_rules) || other.earn_rules == earn_rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,completed_sessions,active_offer_id,welcome_gift_claimed,const DeepCollectionEquality().hash(_offers),earn_rules);

@override
String toString() {
  return 'VentorRewardsData(points: $points, completed_sessions: $completed_sessions, active_offer_id: $active_offer_id, welcome_gift_claimed: $welcome_gift_claimed, offers: $offers, earn_rules: $earn_rules)';
}


}

/// @nodoc
abstract mixin class _$VentorRewardsDataCopyWith<$Res> implements $VentorRewardsDataCopyWith<$Res> {
  factory _$VentorRewardsDataCopyWith(_VentorRewardsData value, $Res Function(_VentorRewardsData) _then) = __$VentorRewardsDataCopyWithImpl;
@override @useResult
$Res call({
 int points, int completed_sessions, String? active_offer_id, bool welcome_gift_claimed, List<VentorRewardOfferItemModel> offers, VentorRewardEarnRulesModel? earn_rules
});


@override $VentorRewardEarnRulesModelCopyWith<$Res>? get earn_rules;

}
/// @nodoc
class __$VentorRewardsDataCopyWithImpl<$Res>
    implements _$VentorRewardsDataCopyWith<$Res> {
  __$VentorRewardsDataCopyWithImpl(this._self, this._then);

  final _VentorRewardsData _self;
  final $Res Function(_VentorRewardsData) _then;

/// Create a copy of VentorRewardsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? completed_sessions = null,Object? active_offer_id = freezed,Object? welcome_gift_claimed = null,Object? offers = null,Object? earn_rules = freezed,}) {
  return _then(_VentorRewardsData(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,completed_sessions: null == completed_sessions ? _self.completed_sessions : completed_sessions // ignore: cast_nullable_to_non_nullable
as int,active_offer_id: freezed == active_offer_id ? _self.active_offer_id : active_offer_id // ignore: cast_nullable_to_non_nullable
as String?,welcome_gift_claimed: null == welcome_gift_claimed ? _self.welcome_gift_claimed : welcome_gift_claimed // ignore: cast_nullable_to_non_nullable
as bool,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<VentorRewardOfferItemModel>,earn_rules: freezed == earn_rules ? _self.earn_rules : earn_rules // ignore: cast_nullable_to_non_nullable
as VentorRewardEarnRulesModel?,
  ));
}

/// Create a copy of VentorRewardsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardEarnRulesModelCopyWith<$Res>? get earn_rules {
    if (_self.earn_rules == null) {
    return null;
  }

  return $VentorRewardEarnRulesModelCopyWith<$Res>(_self.earn_rules!, (value) {
    return _then(_self.copyWith(earn_rules: value));
  });
}
}


/// @nodoc
mixin _$VentorRewardOfferItemModel {

 String get id; String get kind; int get points_cost; int? get percent_off; int? get free_minutes; VentorRewardAudienceModel? get audience; bool get is_welcome_gift;
/// Create a copy of VentorRewardOfferItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRewardOfferItemModelCopyWith<VentorRewardOfferItemModel> get copyWith => _$VentorRewardOfferItemModelCopyWithImpl<VentorRewardOfferItemModel>(this as VentorRewardOfferItemModel, _$identity);

  /// Serializes this VentorRewardOfferItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardOfferItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.points_cost, points_cost) || other.points_cost == points_cost)&&(identical(other.percent_off, percent_off) || other.percent_off == percent_off)&&(identical(other.free_minutes, free_minutes) || other.free_minutes == free_minutes)&&(identical(other.audience, audience) || other.audience == audience)&&(identical(other.is_welcome_gift, is_welcome_gift) || other.is_welcome_gift == is_welcome_gift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,points_cost,percent_off,free_minutes,audience,is_welcome_gift);

@override
String toString() {
  return 'VentorRewardOfferItemModel(id: $id, kind: $kind, points_cost: $points_cost, percent_off: $percent_off, free_minutes: $free_minutes, audience: $audience, is_welcome_gift: $is_welcome_gift)';
}


}

/// @nodoc
abstract mixin class $VentorRewardOfferItemModelCopyWith<$Res>  {
  factory $VentorRewardOfferItemModelCopyWith(VentorRewardOfferItemModel value, $Res Function(VentorRewardOfferItemModel) _then) = _$VentorRewardOfferItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String kind, int points_cost, int? percent_off, int? free_minutes, VentorRewardAudienceModel? audience, bool is_welcome_gift
});


$VentorRewardAudienceModelCopyWith<$Res>? get audience;

}
/// @nodoc
class _$VentorRewardOfferItemModelCopyWithImpl<$Res>
    implements $VentorRewardOfferItemModelCopyWith<$Res> {
  _$VentorRewardOfferItemModelCopyWithImpl(this._self, this._then);

  final VentorRewardOfferItemModel _self;
  final $Res Function(VentorRewardOfferItemModel) _then;

/// Create a copy of VentorRewardOfferItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? points_cost = null,Object? percent_off = freezed,Object? free_minutes = freezed,Object? audience = freezed,Object? is_welcome_gift = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,points_cost: null == points_cost ? _self.points_cost : points_cost // ignore: cast_nullable_to_non_nullable
as int,percent_off: freezed == percent_off ? _self.percent_off : percent_off // ignore: cast_nullable_to_non_nullable
as int?,free_minutes: freezed == free_minutes ? _self.free_minutes : free_minutes // ignore: cast_nullable_to_non_nullable
as int?,audience: freezed == audience ? _self.audience : audience // ignore: cast_nullable_to_non_nullable
as VentorRewardAudienceModel?,is_welcome_gift: null == is_welcome_gift ? _self.is_welcome_gift : is_welcome_gift // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of VentorRewardOfferItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardAudienceModelCopyWith<$Res>? get audience {
    if (_self.audience == null) {
    return null;
  }

  return $VentorRewardAudienceModelCopyWith<$Res>(_self.audience!, (value) {
    return _then(_self.copyWith(audience: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorRewardOfferItemModel].
extension VentorRewardOfferItemModelPatterns on VentorRewardOfferItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRewardOfferItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRewardOfferItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRewardOfferItemModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorRewardOfferItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRewardOfferItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRewardOfferItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  int points_cost,  int? percent_off,  int? free_minutes,  VentorRewardAudienceModel? audience,  bool is_welcome_gift)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRewardOfferItemModel() when $default != null:
return $default(_that.id,_that.kind,_that.points_cost,_that.percent_off,_that.free_minutes,_that.audience,_that.is_welcome_gift);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  int points_cost,  int? percent_off,  int? free_minutes,  VentorRewardAudienceModel? audience,  bool is_welcome_gift)  $default,) {final _that = this;
switch (_that) {
case _VentorRewardOfferItemModel():
return $default(_that.id,_that.kind,_that.points_cost,_that.percent_off,_that.free_minutes,_that.audience,_that.is_welcome_gift);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  int points_cost,  int? percent_off,  int? free_minutes,  VentorRewardAudienceModel? audience,  bool is_welcome_gift)?  $default,) {final _that = this;
switch (_that) {
case _VentorRewardOfferItemModel() when $default != null:
return $default(_that.id,_that.kind,_that.points_cost,_that.percent_off,_that.free_minutes,_that.audience,_that.is_welcome_gift);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRewardOfferItemModel implements VentorRewardOfferItemModel {
  const _VentorRewardOfferItemModel({this.id = '', this.kind = '', this.points_cost = 0, this.percent_off, this.free_minutes, this.audience, this.is_welcome_gift = false});
  factory _VentorRewardOfferItemModel.fromJson(Map<String, dynamic> json) => _$VentorRewardOfferItemModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String kind;
@override@JsonKey() final  int points_cost;
@override final  int? percent_off;
@override final  int? free_minutes;
@override final  VentorRewardAudienceModel? audience;
@override@JsonKey() final  bool is_welcome_gift;

/// Create a copy of VentorRewardOfferItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRewardOfferItemModelCopyWith<_VentorRewardOfferItemModel> get copyWith => __$VentorRewardOfferItemModelCopyWithImpl<_VentorRewardOfferItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRewardOfferItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRewardOfferItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.points_cost, points_cost) || other.points_cost == points_cost)&&(identical(other.percent_off, percent_off) || other.percent_off == percent_off)&&(identical(other.free_minutes, free_minutes) || other.free_minutes == free_minutes)&&(identical(other.audience, audience) || other.audience == audience)&&(identical(other.is_welcome_gift, is_welcome_gift) || other.is_welcome_gift == is_welcome_gift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,points_cost,percent_off,free_minutes,audience,is_welcome_gift);

@override
String toString() {
  return 'VentorRewardOfferItemModel(id: $id, kind: $kind, points_cost: $points_cost, percent_off: $percent_off, free_minutes: $free_minutes, audience: $audience, is_welcome_gift: $is_welcome_gift)';
}


}

/// @nodoc
abstract mixin class _$VentorRewardOfferItemModelCopyWith<$Res> implements $VentorRewardOfferItemModelCopyWith<$Res> {
  factory _$VentorRewardOfferItemModelCopyWith(_VentorRewardOfferItemModel value, $Res Function(_VentorRewardOfferItemModel) _then) = __$VentorRewardOfferItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, int points_cost, int? percent_off, int? free_minutes, VentorRewardAudienceModel? audience, bool is_welcome_gift
});


@override $VentorRewardAudienceModelCopyWith<$Res>? get audience;

}
/// @nodoc
class __$VentorRewardOfferItemModelCopyWithImpl<$Res>
    implements _$VentorRewardOfferItemModelCopyWith<$Res> {
  __$VentorRewardOfferItemModelCopyWithImpl(this._self, this._then);

  final _VentorRewardOfferItemModel _self;
  final $Res Function(_VentorRewardOfferItemModel) _then;

/// Create a copy of VentorRewardOfferItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? points_cost = null,Object? percent_off = freezed,Object? free_minutes = freezed,Object? audience = freezed,Object? is_welcome_gift = null,}) {
  return _then(_VentorRewardOfferItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,points_cost: null == points_cost ? _self.points_cost : points_cost // ignore: cast_nullable_to_non_nullable
as int,percent_off: freezed == percent_off ? _self.percent_off : percent_off // ignore: cast_nullable_to_non_nullable
as int?,free_minutes: freezed == free_minutes ? _self.free_minutes : free_minutes // ignore: cast_nullable_to_non_nullable
as int?,audience: freezed == audience ? _self.audience : audience // ignore: cast_nullable_to_non_nullable
as VentorRewardAudienceModel?,is_welcome_gift: null == is_welcome_gift ? _self.is_welcome_gift : is_welcome_gift // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of VentorRewardOfferItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorRewardAudienceModelCopyWith<$Res>? get audience {
    if (_self.audience == null) {
    return null;
  }

  return $VentorRewardAudienceModelCopyWith<$Res>(_self.audience!, (value) {
    return _then(_self.copyWith(audience: value));
  });
}
}


/// @nodoc
mixin _$VentorRewardAudienceModel {

 String? get min_tier; String? get max_tier;
/// Create a copy of VentorRewardAudienceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRewardAudienceModelCopyWith<VentorRewardAudienceModel> get copyWith => _$VentorRewardAudienceModelCopyWithImpl<VentorRewardAudienceModel>(this as VentorRewardAudienceModel, _$identity);

  /// Serializes this VentorRewardAudienceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardAudienceModel&&(identical(other.min_tier, min_tier) || other.min_tier == min_tier)&&(identical(other.max_tier, max_tier) || other.max_tier == max_tier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min_tier,max_tier);

@override
String toString() {
  return 'VentorRewardAudienceModel(min_tier: $min_tier, max_tier: $max_tier)';
}


}

/// @nodoc
abstract mixin class $VentorRewardAudienceModelCopyWith<$Res>  {
  factory $VentorRewardAudienceModelCopyWith(VentorRewardAudienceModel value, $Res Function(VentorRewardAudienceModel) _then) = _$VentorRewardAudienceModelCopyWithImpl;
@useResult
$Res call({
 String? min_tier, String? max_tier
});




}
/// @nodoc
class _$VentorRewardAudienceModelCopyWithImpl<$Res>
    implements $VentorRewardAudienceModelCopyWith<$Res> {
  _$VentorRewardAudienceModelCopyWithImpl(this._self, this._then);

  final VentorRewardAudienceModel _self;
  final $Res Function(VentorRewardAudienceModel) _then;

/// Create a copy of VentorRewardAudienceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min_tier = freezed,Object? max_tier = freezed,}) {
  return _then(_self.copyWith(
min_tier: freezed == min_tier ? _self.min_tier : min_tier // ignore: cast_nullable_to_non_nullable
as String?,max_tier: freezed == max_tier ? _self.max_tier : max_tier // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorRewardAudienceModel].
extension VentorRewardAudienceModelPatterns on VentorRewardAudienceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRewardAudienceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRewardAudienceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRewardAudienceModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorRewardAudienceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRewardAudienceModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRewardAudienceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? min_tier,  String? max_tier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRewardAudienceModel() when $default != null:
return $default(_that.min_tier,_that.max_tier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? min_tier,  String? max_tier)  $default,) {final _that = this;
switch (_that) {
case _VentorRewardAudienceModel():
return $default(_that.min_tier,_that.max_tier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? min_tier,  String? max_tier)?  $default,) {final _that = this;
switch (_that) {
case _VentorRewardAudienceModel() when $default != null:
return $default(_that.min_tier,_that.max_tier);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRewardAudienceModel implements VentorRewardAudienceModel {
  const _VentorRewardAudienceModel({this.min_tier, this.max_tier});
  factory _VentorRewardAudienceModel.fromJson(Map<String, dynamic> json) => _$VentorRewardAudienceModelFromJson(json);

@override final  String? min_tier;
@override final  String? max_tier;

/// Create a copy of VentorRewardAudienceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRewardAudienceModelCopyWith<_VentorRewardAudienceModel> get copyWith => __$VentorRewardAudienceModelCopyWithImpl<_VentorRewardAudienceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRewardAudienceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRewardAudienceModel&&(identical(other.min_tier, min_tier) || other.min_tier == min_tier)&&(identical(other.max_tier, max_tier) || other.max_tier == max_tier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min_tier,max_tier);

@override
String toString() {
  return 'VentorRewardAudienceModel(min_tier: $min_tier, max_tier: $max_tier)';
}


}

/// @nodoc
abstract mixin class _$VentorRewardAudienceModelCopyWith<$Res> implements $VentorRewardAudienceModelCopyWith<$Res> {
  factory _$VentorRewardAudienceModelCopyWith(_VentorRewardAudienceModel value, $Res Function(_VentorRewardAudienceModel) _then) = __$VentorRewardAudienceModelCopyWithImpl;
@override @useResult
$Res call({
 String? min_tier, String? max_tier
});




}
/// @nodoc
class __$VentorRewardAudienceModelCopyWithImpl<$Res>
    implements _$VentorRewardAudienceModelCopyWith<$Res> {
  __$VentorRewardAudienceModelCopyWithImpl(this._self, this._then);

  final _VentorRewardAudienceModel _self;
  final $Res Function(_VentorRewardAudienceModel) _then;

/// Create a copy of VentorRewardAudienceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min_tier = freezed,Object? max_tier = freezed,}) {
  return _then(_VentorRewardAudienceModel(
min_tier: freezed == min_tier ? _self.min_tier : min_tier // ignore: cast_nullable_to_non_nullable
as String?,max_tier: freezed == max_tier ? _self.max_tier : max_tier // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VentorRewardEarnRulesModel {

 int get points_per_session; int get points_per_friend_register; int get points_per_invite_first_session; int get points_per_friend_booking;
/// Create a copy of VentorRewardEarnRulesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRewardEarnRulesModelCopyWith<VentorRewardEarnRulesModel> get copyWith => _$VentorRewardEarnRulesModelCopyWithImpl<VentorRewardEarnRulesModel>(this as VentorRewardEarnRulesModel, _$identity);

  /// Serializes this VentorRewardEarnRulesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardEarnRulesModel&&(identical(other.points_per_session, points_per_session) || other.points_per_session == points_per_session)&&(identical(other.points_per_friend_register, points_per_friend_register) || other.points_per_friend_register == points_per_friend_register)&&(identical(other.points_per_invite_first_session, points_per_invite_first_session) || other.points_per_invite_first_session == points_per_invite_first_session)&&(identical(other.points_per_friend_booking, points_per_friend_booking) || other.points_per_friend_booking == points_per_friend_booking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points_per_session,points_per_friend_register,points_per_invite_first_session,points_per_friend_booking);

@override
String toString() {
  return 'VentorRewardEarnRulesModel(points_per_session: $points_per_session, points_per_friend_register: $points_per_friend_register, points_per_invite_first_session: $points_per_invite_first_session, points_per_friend_booking: $points_per_friend_booking)';
}


}

/// @nodoc
abstract mixin class $VentorRewardEarnRulesModelCopyWith<$Res>  {
  factory $VentorRewardEarnRulesModelCopyWith(VentorRewardEarnRulesModel value, $Res Function(VentorRewardEarnRulesModel) _then) = _$VentorRewardEarnRulesModelCopyWithImpl;
@useResult
$Res call({
 int points_per_session, int points_per_friend_register, int points_per_invite_first_session, int points_per_friend_booking
});




}
/// @nodoc
class _$VentorRewardEarnRulesModelCopyWithImpl<$Res>
    implements $VentorRewardEarnRulesModelCopyWith<$Res> {
  _$VentorRewardEarnRulesModelCopyWithImpl(this._self, this._then);

  final VentorRewardEarnRulesModel _self;
  final $Res Function(VentorRewardEarnRulesModel) _then;

/// Create a copy of VentorRewardEarnRulesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points_per_session = null,Object? points_per_friend_register = null,Object? points_per_invite_first_session = null,Object? points_per_friend_booking = null,}) {
  return _then(_self.copyWith(
points_per_session: null == points_per_session ? _self.points_per_session : points_per_session // ignore: cast_nullable_to_non_nullable
as int,points_per_friend_register: null == points_per_friend_register ? _self.points_per_friend_register : points_per_friend_register // ignore: cast_nullable_to_non_nullable
as int,points_per_invite_first_session: null == points_per_invite_first_session ? _self.points_per_invite_first_session : points_per_invite_first_session // ignore: cast_nullable_to_non_nullable
as int,points_per_friend_booking: null == points_per_friend_booking ? _self.points_per_friend_booking : points_per_friend_booking // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorRewardEarnRulesModel].
extension VentorRewardEarnRulesModelPatterns on VentorRewardEarnRulesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRewardEarnRulesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRewardEarnRulesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRewardEarnRulesModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorRewardEarnRulesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRewardEarnRulesModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRewardEarnRulesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points_per_session,  int points_per_friend_register,  int points_per_invite_first_session,  int points_per_friend_booking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRewardEarnRulesModel() when $default != null:
return $default(_that.points_per_session,_that.points_per_friend_register,_that.points_per_invite_first_session,_that.points_per_friend_booking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points_per_session,  int points_per_friend_register,  int points_per_invite_first_session,  int points_per_friend_booking)  $default,) {final _that = this;
switch (_that) {
case _VentorRewardEarnRulesModel():
return $default(_that.points_per_session,_that.points_per_friend_register,_that.points_per_invite_first_session,_that.points_per_friend_booking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points_per_session,  int points_per_friend_register,  int points_per_invite_first_session,  int points_per_friend_booking)?  $default,) {final _that = this;
switch (_that) {
case _VentorRewardEarnRulesModel() when $default != null:
return $default(_that.points_per_session,_that.points_per_friend_register,_that.points_per_invite_first_session,_that.points_per_friend_booking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorRewardEarnRulesModel implements VentorRewardEarnRulesModel {
  const _VentorRewardEarnRulesModel({this.points_per_session = 0, this.points_per_friend_register = 0, this.points_per_invite_first_session = 0, this.points_per_friend_booking = 0});
  factory _VentorRewardEarnRulesModel.fromJson(Map<String, dynamic> json) => _$VentorRewardEarnRulesModelFromJson(json);

@override@JsonKey() final  int points_per_session;
@override@JsonKey() final  int points_per_friend_register;
@override@JsonKey() final  int points_per_invite_first_session;
@override@JsonKey() final  int points_per_friend_booking;

/// Create a copy of VentorRewardEarnRulesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRewardEarnRulesModelCopyWith<_VentorRewardEarnRulesModel> get copyWith => __$VentorRewardEarnRulesModelCopyWithImpl<_VentorRewardEarnRulesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorRewardEarnRulesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRewardEarnRulesModel&&(identical(other.points_per_session, points_per_session) || other.points_per_session == points_per_session)&&(identical(other.points_per_friend_register, points_per_friend_register) || other.points_per_friend_register == points_per_friend_register)&&(identical(other.points_per_invite_first_session, points_per_invite_first_session) || other.points_per_invite_first_session == points_per_invite_first_session)&&(identical(other.points_per_friend_booking, points_per_friend_booking) || other.points_per_friend_booking == points_per_friend_booking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points_per_session,points_per_friend_register,points_per_invite_first_session,points_per_friend_booking);

@override
String toString() {
  return 'VentorRewardEarnRulesModel(points_per_session: $points_per_session, points_per_friend_register: $points_per_friend_register, points_per_invite_first_session: $points_per_invite_first_session, points_per_friend_booking: $points_per_friend_booking)';
}


}

/// @nodoc
abstract mixin class _$VentorRewardEarnRulesModelCopyWith<$Res> implements $VentorRewardEarnRulesModelCopyWith<$Res> {
  factory _$VentorRewardEarnRulesModelCopyWith(_VentorRewardEarnRulesModel value, $Res Function(_VentorRewardEarnRulesModel) _then) = __$VentorRewardEarnRulesModelCopyWithImpl;
@override @useResult
$Res call({
 int points_per_session, int points_per_friend_register, int points_per_invite_first_session, int points_per_friend_booking
});




}
/// @nodoc
class __$VentorRewardEarnRulesModelCopyWithImpl<$Res>
    implements _$VentorRewardEarnRulesModelCopyWith<$Res> {
  __$VentorRewardEarnRulesModelCopyWithImpl(this._self, this._then);

  final _VentorRewardEarnRulesModel _self;
  final $Res Function(_VentorRewardEarnRulesModel) _then;

/// Create a copy of VentorRewardEarnRulesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points_per_session = null,Object? points_per_friend_register = null,Object? points_per_invite_first_session = null,Object? points_per_friend_booking = null,}) {
  return _then(_VentorRewardEarnRulesModel(
points_per_session: null == points_per_session ? _self.points_per_session : points_per_session // ignore: cast_nullable_to_non_nullable
as int,points_per_friend_register: null == points_per_friend_register ? _self.points_per_friend_register : points_per_friend_register // ignore: cast_nullable_to_non_nullable
as int,points_per_invite_first_session: null == points_per_invite_first_session ? _self.points_per_invite_first_session : points_per_invite_first_session // ignore: cast_nullable_to_non_nullable
as int,points_per_friend_booking: null == points_per_friend_booking ? _self.points_per_friend_booking : points_per_friend_booking // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
