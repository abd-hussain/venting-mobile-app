// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_earnings_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerEarningsResponseModel {

 String get status; ListenerEarningsData get data;
/// Create a copy of ListenerEarningsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerEarningsResponseModelCopyWith<ListenerEarningsResponseModel> get copyWith => _$ListenerEarningsResponseModelCopyWithImpl<ListenerEarningsResponseModel>(this as ListenerEarningsResponseModel, _$identity);

  /// Serializes this ListenerEarningsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerEarningsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerEarningsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerEarningsResponseModelCopyWith<$Res>  {
  factory $ListenerEarningsResponseModelCopyWith(ListenerEarningsResponseModel value, $Res Function(ListenerEarningsResponseModel) _then) = _$ListenerEarningsResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerEarningsData data
});


$ListenerEarningsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerEarningsResponseModelCopyWithImpl<$Res>
    implements $ListenerEarningsResponseModelCopyWith<$Res> {
  _$ListenerEarningsResponseModelCopyWithImpl(this._self, this._then);

  final ListenerEarningsResponseModel _self;
  final $Res Function(ListenerEarningsResponseModel) _then;

/// Create a copy of ListenerEarningsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerEarningsData,
  ));
}
/// Create a copy of ListenerEarningsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerEarningsDataCopyWith<$Res> get data {
  
  return $ListenerEarningsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerEarningsResponseModel].
extension ListenerEarningsResponseModelPatterns on ListenerEarningsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerEarningsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerEarningsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerEarningsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerEarningsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerEarningsData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerEarningsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerEarningsData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerEarningsData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerEarningsResponseModel implements ListenerEarningsResponseModel {
  const _ListenerEarningsResponseModel({required this.status, required this.data});
  factory _ListenerEarningsResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerEarningsResponseModelFromJson(json);

@override final  String status;
@override final  ListenerEarningsData data;

/// Create a copy of ListenerEarningsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerEarningsResponseModelCopyWith<_ListenerEarningsResponseModel> get copyWith => __$ListenerEarningsResponseModelCopyWithImpl<_ListenerEarningsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerEarningsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerEarningsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerEarningsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerEarningsResponseModelCopyWith<$Res> implements $ListenerEarningsResponseModelCopyWith<$Res> {
  factory _$ListenerEarningsResponseModelCopyWith(_ListenerEarningsResponseModel value, $Res Function(_ListenerEarningsResponseModel) _then) = __$ListenerEarningsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerEarningsData data
});


@override $ListenerEarningsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerEarningsResponseModelCopyWithImpl<$Res>
    implements _$ListenerEarningsResponseModelCopyWith<$Res> {
  __$ListenerEarningsResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerEarningsResponseModel _self;
  final $Res Function(_ListenerEarningsResponseModel) _then;

/// Create a copy of ListenerEarningsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerEarningsResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerEarningsData,
  ));
}

/// Create a copy of ListenerEarningsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerEarningsDataCopyWith<$Res> get data {
  
  return $ListenerEarningsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerEarningsData {

 num get total_earnings; int get trend_percent; int get sessions; num get hours; num get rating; ListenerEarningsTierModel? get current_tier; List<ListenerEarningsTierModel> get tiers;
/// Create a copy of ListenerEarningsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerEarningsDataCopyWith<ListenerEarningsData> get copyWith => _$ListenerEarningsDataCopyWithImpl<ListenerEarningsData>(this as ListenerEarningsData, _$identity);

  /// Serializes this ListenerEarningsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerEarningsData&&(identical(other.total_earnings, total_earnings) || other.total_earnings == total_earnings)&&(identical(other.trend_percent, trend_percent) || other.trend_percent == trend_percent)&&(identical(other.sessions, sessions) || other.sessions == sessions)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.current_tier, current_tier) || other.current_tier == current_tier)&&const DeepCollectionEquality().equals(other.tiers, tiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total_earnings,trend_percent,sessions,hours,rating,current_tier,const DeepCollectionEquality().hash(tiers));

@override
String toString() {
  return 'ListenerEarningsData(total_earnings: $total_earnings, trend_percent: $trend_percent, sessions: $sessions, hours: $hours, rating: $rating, current_tier: $current_tier, tiers: $tiers)';
}


}

/// @nodoc
abstract mixin class $ListenerEarningsDataCopyWith<$Res>  {
  factory $ListenerEarningsDataCopyWith(ListenerEarningsData value, $Res Function(ListenerEarningsData) _then) = _$ListenerEarningsDataCopyWithImpl;
@useResult
$Res call({
 num total_earnings, int trend_percent, int sessions, num hours, num rating, ListenerEarningsTierModel? current_tier, List<ListenerEarningsTierModel> tiers
});


$ListenerEarningsTierModelCopyWith<$Res>? get current_tier;

}
/// @nodoc
class _$ListenerEarningsDataCopyWithImpl<$Res>
    implements $ListenerEarningsDataCopyWith<$Res> {
  _$ListenerEarningsDataCopyWithImpl(this._self, this._then);

  final ListenerEarningsData _self;
  final $Res Function(ListenerEarningsData) _then;

/// Create a copy of ListenerEarningsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total_earnings = null,Object? trend_percent = null,Object? sessions = null,Object? hours = null,Object? rating = null,Object? current_tier = freezed,Object? tiers = null,}) {
  return _then(_self.copyWith(
total_earnings: null == total_earnings ? _self.total_earnings : total_earnings // ignore: cast_nullable_to_non_nullable
as num,trend_percent: null == trend_percent ? _self.trend_percent : trend_percent // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as int,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as num,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num,current_tier: freezed == current_tier ? _self.current_tier : current_tier // ignore: cast_nullable_to_non_nullable
as ListenerEarningsTierModel?,tiers: null == tiers ? _self.tiers : tiers // ignore: cast_nullable_to_non_nullable
as List<ListenerEarningsTierModel>,
  ));
}
/// Create a copy of ListenerEarningsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerEarningsTierModelCopyWith<$Res>? get current_tier {
    if (_self.current_tier == null) {
    return null;
  }

  return $ListenerEarningsTierModelCopyWith<$Res>(_self.current_tier!, (value) {
    return _then(_self.copyWith(current_tier: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerEarningsData].
extension ListenerEarningsDataPatterns on ListenerEarningsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerEarningsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerEarningsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerEarningsData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerEarningsData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num total_earnings,  int trend_percent,  int sessions,  num hours,  num rating,  ListenerEarningsTierModel? current_tier,  List<ListenerEarningsTierModel> tiers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerEarningsData() when $default != null:
return $default(_that.total_earnings,_that.trend_percent,_that.sessions,_that.hours,_that.rating,_that.current_tier,_that.tiers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num total_earnings,  int trend_percent,  int sessions,  num hours,  num rating,  ListenerEarningsTierModel? current_tier,  List<ListenerEarningsTierModel> tiers)  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsData():
return $default(_that.total_earnings,_that.trend_percent,_that.sessions,_that.hours,_that.rating,_that.current_tier,_that.tiers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num total_earnings,  int trend_percent,  int sessions,  num hours,  num rating,  ListenerEarningsTierModel? current_tier,  List<ListenerEarningsTierModel> tiers)?  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsData() when $default != null:
return $default(_that.total_earnings,_that.trend_percent,_that.sessions,_that.hours,_that.rating,_that.current_tier,_that.tiers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerEarningsData implements ListenerEarningsData {
  const _ListenerEarningsData({this.total_earnings = 0, this.trend_percent = 0, this.sessions = 0, this.hours = 0, this.rating = 0, this.current_tier, final  List<ListenerEarningsTierModel> tiers = const <ListenerEarningsTierModel>[]}): _tiers = tiers;
  factory _ListenerEarningsData.fromJson(Map<String, dynamic> json) => _$ListenerEarningsDataFromJson(json);

@override@JsonKey() final  num total_earnings;
@override@JsonKey() final  int trend_percent;
@override@JsonKey() final  int sessions;
@override@JsonKey() final  num hours;
@override@JsonKey() final  num rating;
@override final  ListenerEarningsTierModel? current_tier;
 final  List<ListenerEarningsTierModel> _tiers;
@override@JsonKey() List<ListenerEarningsTierModel> get tiers {
  if (_tiers is EqualUnmodifiableListView) return _tiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tiers);
}


/// Create a copy of ListenerEarningsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerEarningsDataCopyWith<_ListenerEarningsData> get copyWith => __$ListenerEarningsDataCopyWithImpl<_ListenerEarningsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerEarningsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerEarningsData&&(identical(other.total_earnings, total_earnings) || other.total_earnings == total_earnings)&&(identical(other.trend_percent, trend_percent) || other.trend_percent == trend_percent)&&(identical(other.sessions, sessions) || other.sessions == sessions)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.current_tier, current_tier) || other.current_tier == current_tier)&&const DeepCollectionEquality().equals(other._tiers, _tiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total_earnings,trend_percent,sessions,hours,rating,current_tier,const DeepCollectionEquality().hash(_tiers));

@override
String toString() {
  return 'ListenerEarningsData(total_earnings: $total_earnings, trend_percent: $trend_percent, sessions: $sessions, hours: $hours, rating: $rating, current_tier: $current_tier, tiers: $tiers)';
}


}

/// @nodoc
abstract mixin class _$ListenerEarningsDataCopyWith<$Res> implements $ListenerEarningsDataCopyWith<$Res> {
  factory _$ListenerEarningsDataCopyWith(_ListenerEarningsData value, $Res Function(_ListenerEarningsData) _then) = __$ListenerEarningsDataCopyWithImpl;
@override @useResult
$Res call({
 num total_earnings, int trend_percent, int sessions, num hours, num rating, ListenerEarningsTierModel? current_tier, List<ListenerEarningsTierModel> tiers
});


@override $ListenerEarningsTierModelCopyWith<$Res>? get current_tier;

}
/// @nodoc
class __$ListenerEarningsDataCopyWithImpl<$Res>
    implements _$ListenerEarningsDataCopyWith<$Res> {
  __$ListenerEarningsDataCopyWithImpl(this._self, this._then);

  final _ListenerEarningsData _self;
  final $Res Function(_ListenerEarningsData) _then;

/// Create a copy of ListenerEarningsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total_earnings = null,Object? trend_percent = null,Object? sessions = null,Object? hours = null,Object? rating = null,Object? current_tier = freezed,Object? tiers = null,}) {
  return _then(_ListenerEarningsData(
total_earnings: null == total_earnings ? _self.total_earnings : total_earnings // ignore: cast_nullable_to_non_nullable
as num,trend_percent: null == trend_percent ? _self.trend_percent : trend_percent // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as int,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as num,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num,current_tier: freezed == current_tier ? _self.current_tier : current_tier // ignore: cast_nullable_to_non_nullable
as ListenerEarningsTierModel?,tiers: null == tiers ? _self._tiers : tiers // ignore: cast_nullable_to_non_nullable
as List<ListenerEarningsTierModel>,
  ));
}

/// Create a copy of ListenerEarningsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerEarningsTierModelCopyWith<$Res>? get current_tier {
    if (_self.current_tier == null) {
    return null;
  }

  return $ListenerEarningsTierModelCopyWith<$Res>(_self.current_tier!, (value) {
    return _then(_self.copyWith(current_tier: value));
  });
}
}

/// @nodoc
mixin _$ListenerEarningsTierModel {

 String get id; int get min_sessions; num get min_rating; num get hourly_rate;
/// Create a copy of ListenerEarningsTierModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerEarningsTierModelCopyWith<ListenerEarningsTierModel> get copyWith => _$ListenerEarningsTierModelCopyWithImpl<ListenerEarningsTierModel>(this as ListenerEarningsTierModel, _$identity);

  /// Serializes this ListenerEarningsTierModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerEarningsTierModel&&(identical(other.id, id) || other.id == id)&&(identical(other.min_sessions, min_sessions) || other.min_sessions == min_sessions)&&(identical(other.min_rating, min_rating) || other.min_rating == min_rating)&&(identical(other.hourly_rate, hourly_rate) || other.hourly_rate == hourly_rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,min_sessions,min_rating,hourly_rate);

@override
String toString() {
  return 'ListenerEarningsTierModel(id: $id, min_sessions: $min_sessions, min_rating: $min_rating, hourly_rate: $hourly_rate)';
}


}

/// @nodoc
abstract mixin class $ListenerEarningsTierModelCopyWith<$Res>  {
  factory $ListenerEarningsTierModelCopyWith(ListenerEarningsTierModel value, $Res Function(ListenerEarningsTierModel) _then) = _$ListenerEarningsTierModelCopyWithImpl;
@useResult
$Res call({
 String id, int min_sessions, num min_rating, num hourly_rate
});




}
/// @nodoc
class _$ListenerEarningsTierModelCopyWithImpl<$Res>
    implements $ListenerEarningsTierModelCopyWith<$Res> {
  _$ListenerEarningsTierModelCopyWithImpl(this._self, this._then);

  final ListenerEarningsTierModel _self;
  final $Res Function(ListenerEarningsTierModel) _then;

/// Create a copy of ListenerEarningsTierModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? min_sessions = null,Object? min_rating = null,Object? hourly_rate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,min_sessions: null == min_sessions ? _self.min_sessions : min_sessions // ignore: cast_nullable_to_non_nullable
as int,min_rating: null == min_rating ? _self.min_rating : min_rating // ignore: cast_nullable_to_non_nullable
as num,hourly_rate: null == hourly_rate ? _self.hourly_rate : hourly_rate // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerEarningsTierModel].
extension ListenerEarningsTierModelPatterns on ListenerEarningsTierModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerEarningsTierModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerEarningsTierModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerEarningsTierModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsTierModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerEarningsTierModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsTierModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int min_sessions,  num min_rating,  num hourly_rate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerEarningsTierModel() when $default != null:
return $default(_that.id,_that.min_sessions,_that.min_rating,_that.hourly_rate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int min_sessions,  num min_rating,  num hourly_rate)  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsTierModel():
return $default(_that.id,_that.min_sessions,_that.min_rating,_that.hourly_rate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int min_sessions,  num min_rating,  num hourly_rate)?  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsTierModel() when $default != null:
return $default(_that.id,_that.min_sessions,_that.min_rating,_that.hourly_rate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ListenerEarningsTierModel implements ListenerEarningsTierModel {
  const _ListenerEarningsTierModel({this.id = '', this.min_sessions = 0, this.min_rating = 0, this.hourly_rate = 0});
  

@override@JsonKey() final  String id;
@override@JsonKey() final  int min_sessions;
@override@JsonKey() final  num min_rating;
@override@JsonKey() final  num hourly_rate;

/// Create a copy of ListenerEarningsTierModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerEarningsTierModelCopyWith<_ListenerEarningsTierModel> get copyWith => __$ListenerEarningsTierModelCopyWithImpl<_ListenerEarningsTierModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerEarningsTierModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerEarningsTierModel&&(identical(other.id, id) || other.id == id)&&(identical(other.min_sessions, min_sessions) || other.min_sessions == min_sessions)&&(identical(other.min_rating, min_rating) || other.min_rating == min_rating)&&(identical(other.hourly_rate, hourly_rate) || other.hourly_rate == hourly_rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,min_sessions,min_rating,hourly_rate);

@override
String toString() {
  return 'ListenerEarningsTierModel(id: $id, min_sessions: $min_sessions, min_rating: $min_rating, hourly_rate: $hourly_rate)';
}


}

/// @nodoc
abstract mixin class _$ListenerEarningsTierModelCopyWith<$Res> implements $ListenerEarningsTierModelCopyWith<$Res> {
  factory _$ListenerEarningsTierModelCopyWith(_ListenerEarningsTierModel value, $Res Function(_ListenerEarningsTierModel) _then) = __$ListenerEarningsTierModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int min_sessions, num min_rating, num hourly_rate
});




}
/// @nodoc
class __$ListenerEarningsTierModelCopyWithImpl<$Res>
    implements _$ListenerEarningsTierModelCopyWith<$Res> {
  __$ListenerEarningsTierModelCopyWithImpl(this._self, this._then);

  final _ListenerEarningsTierModel _self;
  final $Res Function(_ListenerEarningsTierModel) _then;

/// Create a copy of ListenerEarningsTierModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? min_sessions = null,Object? min_rating = null,Object? hourly_rate = null,}) {
  return _then(_ListenerEarningsTierModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,min_sessions: null == min_sessions ? _self.min_sessions : min_sessions // ignore: cast_nullable_to_non_nullable
as int,min_rating: null == min_rating ? _self.min_rating : min_rating // ignore: cast_nullable_to_non_nullable
as num,hourly_rate: null == hourly_rate ? _self.hourly_rate : hourly_rate // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$ListenerEarningsChartResponseModel {

 String get status; ListenerEarningsChartData get data;
/// Create a copy of ListenerEarningsChartResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerEarningsChartResponseModelCopyWith<ListenerEarningsChartResponseModel> get copyWith => _$ListenerEarningsChartResponseModelCopyWithImpl<ListenerEarningsChartResponseModel>(this as ListenerEarningsChartResponseModel, _$identity);

  /// Serializes this ListenerEarningsChartResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerEarningsChartResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerEarningsChartResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerEarningsChartResponseModelCopyWith<$Res>  {
  factory $ListenerEarningsChartResponseModelCopyWith(ListenerEarningsChartResponseModel value, $Res Function(ListenerEarningsChartResponseModel) _then) = _$ListenerEarningsChartResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerEarningsChartData data
});


$ListenerEarningsChartDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerEarningsChartResponseModelCopyWithImpl<$Res>
    implements $ListenerEarningsChartResponseModelCopyWith<$Res> {
  _$ListenerEarningsChartResponseModelCopyWithImpl(this._self, this._then);

  final ListenerEarningsChartResponseModel _self;
  final $Res Function(ListenerEarningsChartResponseModel) _then;

/// Create a copy of ListenerEarningsChartResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerEarningsChartData,
  ));
}
/// Create a copy of ListenerEarningsChartResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerEarningsChartDataCopyWith<$Res> get data {
  
  return $ListenerEarningsChartDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerEarningsChartResponseModel].
extension ListenerEarningsChartResponseModelPatterns on ListenerEarningsChartResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerEarningsChartResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerEarningsChartResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerEarningsChartResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsChartResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerEarningsChartResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsChartResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerEarningsChartData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerEarningsChartResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerEarningsChartData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsChartResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerEarningsChartData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsChartResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerEarningsChartResponseModel implements ListenerEarningsChartResponseModel {
  const _ListenerEarningsChartResponseModel({required this.status, required this.data});
  factory _ListenerEarningsChartResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerEarningsChartResponseModelFromJson(json);

@override final  String status;
@override final  ListenerEarningsChartData data;

/// Create a copy of ListenerEarningsChartResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerEarningsChartResponseModelCopyWith<_ListenerEarningsChartResponseModel> get copyWith => __$ListenerEarningsChartResponseModelCopyWithImpl<_ListenerEarningsChartResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerEarningsChartResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerEarningsChartResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerEarningsChartResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerEarningsChartResponseModelCopyWith<$Res> implements $ListenerEarningsChartResponseModelCopyWith<$Res> {
  factory _$ListenerEarningsChartResponseModelCopyWith(_ListenerEarningsChartResponseModel value, $Res Function(_ListenerEarningsChartResponseModel) _then) = __$ListenerEarningsChartResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerEarningsChartData data
});


@override $ListenerEarningsChartDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerEarningsChartResponseModelCopyWithImpl<$Res>
    implements _$ListenerEarningsChartResponseModelCopyWith<$Res> {
  __$ListenerEarningsChartResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerEarningsChartResponseModel _self;
  final $Res Function(_ListenerEarningsChartResponseModel) _then;

/// Create a copy of ListenerEarningsChartResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerEarningsChartResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerEarningsChartData,
  ));
}

/// Create a copy of ListenerEarningsChartResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerEarningsChartDataCopyWith<$Res> get data {
  
  return $ListenerEarningsChartDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerEarningsChartData {

 List<ListenerEarningsChartPointModel> get points;
/// Create a copy of ListenerEarningsChartData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerEarningsChartDataCopyWith<ListenerEarningsChartData> get copyWith => _$ListenerEarningsChartDataCopyWithImpl<ListenerEarningsChartData>(this as ListenerEarningsChartData, _$identity);

  /// Serializes this ListenerEarningsChartData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerEarningsChartData&&const DeepCollectionEquality().equals(other.points, points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(points));

@override
String toString() {
  return 'ListenerEarningsChartData(points: $points)';
}


}

/// @nodoc
abstract mixin class $ListenerEarningsChartDataCopyWith<$Res>  {
  factory $ListenerEarningsChartDataCopyWith(ListenerEarningsChartData value, $Res Function(ListenerEarningsChartData) _then) = _$ListenerEarningsChartDataCopyWithImpl;
@useResult
$Res call({
 List<ListenerEarningsChartPointModel> points
});




}
/// @nodoc
class _$ListenerEarningsChartDataCopyWithImpl<$Res>
    implements $ListenerEarningsChartDataCopyWith<$Res> {
  _$ListenerEarningsChartDataCopyWithImpl(this._self, this._then);

  final ListenerEarningsChartData _self;
  final $Res Function(ListenerEarningsChartData) _then;

/// Create a copy of ListenerEarningsChartData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<ListenerEarningsChartPointModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerEarningsChartData].
extension ListenerEarningsChartDataPatterns on ListenerEarningsChartData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerEarningsChartData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerEarningsChartData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerEarningsChartData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsChartData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerEarningsChartData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsChartData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListenerEarningsChartPointModel> points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerEarningsChartData() when $default != null:
return $default(_that.points);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListenerEarningsChartPointModel> points)  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsChartData():
return $default(_that.points);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListenerEarningsChartPointModel> points)?  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsChartData() when $default != null:
return $default(_that.points);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerEarningsChartData implements ListenerEarningsChartData {
  const _ListenerEarningsChartData({final  List<ListenerEarningsChartPointModel> points = const <ListenerEarningsChartPointModel>[]}): _points = points;
  factory _ListenerEarningsChartData.fromJson(Map<String, dynamic> json) => _$ListenerEarningsChartDataFromJson(json);

 final  List<ListenerEarningsChartPointModel> _points;
@override@JsonKey() List<ListenerEarningsChartPointModel> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}


/// Create a copy of ListenerEarningsChartData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerEarningsChartDataCopyWith<_ListenerEarningsChartData> get copyWith => __$ListenerEarningsChartDataCopyWithImpl<_ListenerEarningsChartData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerEarningsChartDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerEarningsChartData&&const DeepCollectionEquality().equals(other._points, _points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_points));

@override
String toString() {
  return 'ListenerEarningsChartData(points: $points)';
}


}

/// @nodoc
abstract mixin class _$ListenerEarningsChartDataCopyWith<$Res> implements $ListenerEarningsChartDataCopyWith<$Res> {
  factory _$ListenerEarningsChartDataCopyWith(_ListenerEarningsChartData value, $Res Function(_ListenerEarningsChartData) _then) = __$ListenerEarningsChartDataCopyWithImpl;
@override @useResult
$Res call({
 List<ListenerEarningsChartPointModel> points
});




}
/// @nodoc
class __$ListenerEarningsChartDataCopyWithImpl<$Res>
    implements _$ListenerEarningsChartDataCopyWith<$Res> {
  __$ListenerEarningsChartDataCopyWithImpl(this._self, this._then);

  final _ListenerEarningsChartData _self;
  final $Res Function(_ListenerEarningsChartData) _then;

/// Create a copy of ListenerEarningsChartData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,}) {
  return _then(_ListenerEarningsChartData(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<ListenerEarningsChartPointModel>,
  ));
}


}

/// @nodoc
mixin _$ListenerEarningsChartPointModel {

 String get label; num get amount;
/// Create a copy of ListenerEarningsChartPointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerEarningsChartPointModelCopyWith<ListenerEarningsChartPointModel> get copyWith => _$ListenerEarningsChartPointModelCopyWithImpl<ListenerEarningsChartPointModel>(this as ListenerEarningsChartPointModel, _$identity);

  /// Serializes this ListenerEarningsChartPointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerEarningsChartPointModel&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'ListenerEarningsChartPointModel(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $ListenerEarningsChartPointModelCopyWith<$Res>  {
  factory $ListenerEarningsChartPointModelCopyWith(ListenerEarningsChartPointModel value, $Res Function(ListenerEarningsChartPointModel) _then) = _$ListenerEarningsChartPointModelCopyWithImpl;
@useResult
$Res call({
 String label, num amount
});




}
/// @nodoc
class _$ListenerEarningsChartPointModelCopyWithImpl<$Res>
    implements $ListenerEarningsChartPointModelCopyWith<$Res> {
  _$ListenerEarningsChartPointModelCopyWithImpl(this._self, this._then);

  final ListenerEarningsChartPointModel _self;
  final $Res Function(ListenerEarningsChartPointModel) _then;

/// Create a copy of ListenerEarningsChartPointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerEarningsChartPointModel].
extension ListenerEarningsChartPointModelPatterns on ListenerEarningsChartPointModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerEarningsChartPointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerEarningsChartPointModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerEarningsChartPointModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsChartPointModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerEarningsChartPointModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsChartPointModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  num amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerEarningsChartPointModel() when $default != null:
return $default(_that.label,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  num amount)  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsChartPointModel():
return $default(_that.label,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  num amount)?  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsChartPointModel() when $default != null:
return $default(_that.label,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ListenerEarningsChartPointModel implements ListenerEarningsChartPointModel {
  const _ListenerEarningsChartPointModel({this.label = '', this.amount = 0});
  

@override@JsonKey() final  String label;
@override@JsonKey() final  num amount;

/// Create a copy of ListenerEarningsChartPointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerEarningsChartPointModelCopyWith<_ListenerEarningsChartPointModel> get copyWith => __$ListenerEarningsChartPointModelCopyWithImpl<_ListenerEarningsChartPointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerEarningsChartPointModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerEarningsChartPointModel&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'ListenerEarningsChartPointModel(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$ListenerEarningsChartPointModelCopyWith<$Res> implements $ListenerEarningsChartPointModelCopyWith<$Res> {
  factory _$ListenerEarningsChartPointModelCopyWith(_ListenerEarningsChartPointModel value, $Res Function(_ListenerEarningsChartPointModel) _then) = __$ListenerEarningsChartPointModelCopyWithImpl;
@override @useResult
$Res call({
 String label, num amount
});




}
/// @nodoc
class __$ListenerEarningsChartPointModelCopyWithImpl<$Res>
    implements _$ListenerEarningsChartPointModelCopyWith<$Res> {
  __$ListenerEarningsChartPointModelCopyWithImpl(this._self, this._then);

  final _ListenerEarningsChartPointModel _self;
  final $Res Function(_ListenerEarningsChartPointModel) _then;

/// Create a copy of ListenerEarningsChartPointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_ListenerEarningsChartPointModel(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$ListenerPayoutMethodsResponseModel {

 String get status; ListenerPayoutMethodsData get data;
/// Create a copy of ListenerPayoutMethodsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutMethodsResponseModelCopyWith<ListenerPayoutMethodsResponseModel> get copyWith => _$ListenerPayoutMethodsResponseModelCopyWithImpl<ListenerPayoutMethodsResponseModel>(this as ListenerPayoutMethodsResponseModel, _$identity);

  /// Serializes this ListenerPayoutMethodsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutMethodsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutMethodsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutMethodsResponseModelCopyWith<$Res>  {
  factory $ListenerPayoutMethodsResponseModelCopyWith(ListenerPayoutMethodsResponseModel value, $Res Function(ListenerPayoutMethodsResponseModel) _then) = _$ListenerPayoutMethodsResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerPayoutMethodsData data
});


$ListenerPayoutMethodsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerPayoutMethodsResponseModelCopyWithImpl<$Res>
    implements $ListenerPayoutMethodsResponseModelCopyWith<$Res> {
  _$ListenerPayoutMethodsResponseModelCopyWithImpl(this._self, this._then);

  final ListenerPayoutMethodsResponseModel _self;
  final $Res Function(ListenerPayoutMethodsResponseModel) _then;

/// Create a copy of ListenerPayoutMethodsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutMethodsData,
  ));
}
/// Create a copy of ListenerPayoutMethodsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutMethodsDataCopyWith<$Res> get data {
  
  return $ListenerPayoutMethodsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerPayoutMethodsResponseModel].
extension ListenerPayoutMethodsResponseModelPatterns on ListenerPayoutMethodsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutMethodsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutMethodsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutMethodsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerPayoutMethodsData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerPayoutMethodsData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerPayoutMethodsData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodsResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPayoutMethodsResponseModel implements ListenerPayoutMethodsResponseModel {
  const _ListenerPayoutMethodsResponseModel({required this.status, required this.data});
  factory _ListenerPayoutMethodsResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerPayoutMethodsResponseModelFromJson(json);

@override final  String status;
@override final  ListenerPayoutMethodsData data;

/// Create a copy of ListenerPayoutMethodsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutMethodsResponseModelCopyWith<_ListenerPayoutMethodsResponseModel> get copyWith => __$ListenerPayoutMethodsResponseModelCopyWithImpl<_ListenerPayoutMethodsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutMethodsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutMethodsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutMethodsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutMethodsResponseModelCopyWith<$Res> implements $ListenerPayoutMethodsResponseModelCopyWith<$Res> {
  factory _$ListenerPayoutMethodsResponseModelCopyWith(_ListenerPayoutMethodsResponseModel value, $Res Function(_ListenerPayoutMethodsResponseModel) _then) = __$ListenerPayoutMethodsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerPayoutMethodsData data
});


@override $ListenerPayoutMethodsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerPayoutMethodsResponseModelCopyWithImpl<$Res>
    implements _$ListenerPayoutMethodsResponseModelCopyWith<$Res> {
  __$ListenerPayoutMethodsResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerPayoutMethodsResponseModel _self;
  final $Res Function(_ListenerPayoutMethodsResponseModel) _then;

/// Create a copy of ListenerPayoutMethodsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerPayoutMethodsResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutMethodsData,
  ));
}

/// Create a copy of ListenerPayoutMethodsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutMethodsDataCopyWith<$Res> get data {
  
  return $ListenerPayoutMethodsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc
mixin _$ListenerPayoutMethodsData {

 String? get default_method; List<ListenerPayoutMethodModel> get methods;
/// Create a copy of ListenerPayoutMethodsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutMethodsDataCopyWith<ListenerPayoutMethodsData> get copyWith => _$ListenerPayoutMethodsDataCopyWithImpl<ListenerPayoutMethodsData>(this as ListenerPayoutMethodsData, _$identity);

  /// Serializes this ListenerPayoutMethodsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutMethodsData&&(identical(other.default_method, default_method) || other.default_method == default_method)&&const DeepCollectionEquality().equals(other.methods, methods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,default_method,const DeepCollectionEquality().hash(methods));

@override
String toString() {
  return 'ListenerPayoutMethodsData(default_method: $default_method, methods: $methods)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutMethodsDataCopyWith<$Res>  {
  factory $ListenerPayoutMethodsDataCopyWith(ListenerPayoutMethodsData value, $Res Function(ListenerPayoutMethodsData) _then) = _$ListenerPayoutMethodsDataCopyWithImpl;
@useResult
$Res call({
 String? default_method, List<ListenerPayoutMethodModel> methods
});




}
/// @nodoc
class _$ListenerPayoutMethodsDataCopyWithImpl<$Res>
    implements $ListenerPayoutMethodsDataCopyWith<$Res> {
  _$ListenerPayoutMethodsDataCopyWithImpl(this._self, this._then);

  final ListenerPayoutMethodsData _self;
  final $Res Function(ListenerPayoutMethodsData) _then;

/// Create a copy of ListenerPayoutMethodsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? default_method = freezed,Object? methods = null,}) {
  return _then(_self.copyWith(
default_method: freezed == default_method ? _self.default_method : default_method // ignore: cast_nullable_to_non_nullable
as String?,methods: null == methods ? _self.methods : methods // ignore: cast_nullable_to_non_nullable
as List<ListenerPayoutMethodModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerPayoutMethodsData].
extension ListenerPayoutMethodsDataPatterns on ListenerPayoutMethodsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutMethodsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutMethodsData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutMethodsData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? default_method,  List<ListenerPayoutMethodModel> methods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodsData() when $default != null:
return $default(_that.default_method,_that.methods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? default_method,  List<ListenerPayoutMethodModel> methods)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodsData():
return $default(_that.default_method,_that.methods);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? default_method,  List<ListenerPayoutMethodModel> methods)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodsData() when $default != null:
return $default(_that.default_method,_that.methods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ListenerPayoutMethodsData implements ListenerPayoutMethodsData {
  const _ListenerPayoutMethodsData({this.default_method, final  List<ListenerPayoutMethodModel> methods = const <ListenerPayoutMethodModel>[]}): _methods = methods;
  

@override final  String? default_method;
 final  List<ListenerPayoutMethodModel> _methods;
@override@JsonKey() List<ListenerPayoutMethodModel> get methods {
  if (_methods is EqualUnmodifiableListView) return _methods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_methods);
}


/// Create a copy of ListenerPayoutMethodsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutMethodsDataCopyWith<_ListenerPayoutMethodsData> get copyWith => __$ListenerPayoutMethodsDataCopyWithImpl<_ListenerPayoutMethodsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutMethodsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutMethodsData&&(identical(other.default_method, default_method) || other.default_method == default_method)&&const DeepCollectionEquality().equals(other._methods, _methods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,default_method,const DeepCollectionEquality().hash(_methods));

@override
String toString() {
  return 'ListenerPayoutMethodsData(default_method: $default_method, methods: $methods)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutMethodsDataCopyWith<$Res> implements $ListenerPayoutMethodsDataCopyWith<$Res> {
  factory _$ListenerPayoutMethodsDataCopyWith(_ListenerPayoutMethodsData value, $Res Function(_ListenerPayoutMethodsData) _then) = __$ListenerPayoutMethodsDataCopyWithImpl;
@override @useResult
$Res call({
 String? default_method, List<ListenerPayoutMethodModel> methods
});




}
/// @nodoc
class __$ListenerPayoutMethodsDataCopyWithImpl<$Res>
    implements _$ListenerPayoutMethodsDataCopyWith<$Res> {
  __$ListenerPayoutMethodsDataCopyWithImpl(this._self, this._then);

  final _ListenerPayoutMethodsData _self;
  final $Res Function(_ListenerPayoutMethodsData) _then;

/// Create a copy of ListenerPayoutMethodsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? default_method = freezed,Object? methods = null,}) {
  return _then(_ListenerPayoutMethodsData(
default_method: freezed == default_method ? _self.default_method : default_method // ignore: cast_nullable_to_non_nullable
as String?,methods: null == methods ? _self._methods : methods // ignore: cast_nullable_to_non_nullable
as List<ListenerPayoutMethodModel>,
  ));
}


}

/// @nodoc
mixin _$ListenerPayoutMethodModel {

 String get id; String get type; String get label; String? get account_holder_name; String? get bank_name; String? get iban_or_account; String? get swift_code; String? get paypal_email;
/// Create a copy of ListenerPayoutMethodModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutMethodModelCopyWith<ListenerPayoutMethodModel> get copyWith => _$ListenerPayoutMethodModelCopyWithImpl<ListenerPayoutMethodModel>(this as ListenerPayoutMethodModel, _$identity);

  /// Serializes this ListenerPayoutMethodModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutMethodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.account_holder_name, account_holder_name) || other.account_holder_name == account_holder_name)&&(identical(other.bank_name, bank_name) || other.bank_name == bank_name)&&(identical(other.iban_or_account, iban_or_account) || other.iban_or_account == iban_or_account)&&(identical(other.swift_code, swift_code) || other.swift_code == swift_code)&&(identical(other.paypal_email, paypal_email) || other.paypal_email == paypal_email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,label,account_holder_name,bank_name,iban_or_account,swift_code,paypal_email);

@override
String toString() {
  return 'ListenerPayoutMethodModel(id: $id, type: $type, label: $label, account_holder_name: $account_holder_name, bank_name: $bank_name, iban_or_account: $iban_or_account, swift_code: $swift_code, paypal_email: $paypal_email)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutMethodModelCopyWith<$Res>  {
  factory $ListenerPayoutMethodModelCopyWith(ListenerPayoutMethodModel value, $Res Function(ListenerPayoutMethodModel) _then) = _$ListenerPayoutMethodModelCopyWithImpl;
@useResult
$Res call({
 String id, String type, String label, String? account_holder_name, String? bank_name, String? iban_or_account, String? swift_code, String? paypal_email
});




}
/// @nodoc
class _$ListenerPayoutMethodModelCopyWithImpl<$Res>
    implements $ListenerPayoutMethodModelCopyWith<$Res> {
  _$ListenerPayoutMethodModelCopyWithImpl(this._self, this._then);

  final ListenerPayoutMethodModel _self;
  final $Res Function(ListenerPayoutMethodModel) _then;

/// Create a copy of ListenerPayoutMethodModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? label = null,Object? account_holder_name = freezed,Object? bank_name = freezed,Object? iban_or_account = freezed,Object? swift_code = freezed,Object? paypal_email = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,account_holder_name: freezed == account_holder_name ? _self.account_holder_name : account_holder_name // ignore: cast_nullable_to_non_nullable
as String?,bank_name: freezed == bank_name ? _self.bank_name : bank_name // ignore: cast_nullable_to_non_nullable
as String?,iban_or_account: freezed == iban_or_account ? _self.iban_or_account : iban_or_account // ignore: cast_nullable_to_non_nullable
as String?,swift_code: freezed == swift_code ? _self.swift_code : swift_code // ignore: cast_nullable_to_non_nullable
as String?,paypal_email: freezed == paypal_email ? _self.paypal_email : paypal_email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerPayoutMethodModel].
extension ListenerPayoutMethodModelPatterns on ListenerPayoutMethodModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutMethodModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutMethodModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutMethodModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String label,  String? account_holder_name,  String? bank_name,  String? iban_or_account,  String? swift_code,  String? paypal_email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodModel() when $default != null:
return $default(_that.id,_that.type,_that.label,_that.account_holder_name,_that.bank_name,_that.iban_or_account,_that.swift_code,_that.paypal_email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String label,  String? account_holder_name,  String? bank_name,  String? iban_or_account,  String? swift_code,  String? paypal_email)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodModel():
return $default(_that.id,_that.type,_that.label,_that.account_holder_name,_that.bank_name,_that.iban_or_account,_that.swift_code,_that.paypal_email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String label,  String? account_holder_name,  String? bank_name,  String? iban_or_account,  String? swift_code,  String? paypal_email)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodModel() when $default != null:
return $default(_that.id,_that.type,_that.label,_that.account_holder_name,_that.bank_name,_that.iban_or_account,_that.swift_code,_that.paypal_email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ListenerPayoutMethodModel implements ListenerPayoutMethodModel {
  const _ListenerPayoutMethodModel({this.id = '', this.type = '', this.label = '', this.account_holder_name, this.bank_name, this.iban_or_account, this.swift_code, this.paypal_email});
  

@override@JsonKey() final  String id;
@override@JsonKey() final  String type;
@override@JsonKey() final  String label;
@override final  String? account_holder_name;
@override final  String? bank_name;
@override final  String? iban_or_account;
@override final  String? swift_code;
@override final  String? paypal_email;

/// Create a copy of ListenerPayoutMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutMethodModelCopyWith<_ListenerPayoutMethodModel> get copyWith => __$ListenerPayoutMethodModelCopyWithImpl<_ListenerPayoutMethodModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutMethodModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutMethodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.account_holder_name, account_holder_name) || other.account_holder_name == account_holder_name)&&(identical(other.bank_name, bank_name) || other.bank_name == bank_name)&&(identical(other.iban_or_account, iban_or_account) || other.iban_or_account == iban_or_account)&&(identical(other.swift_code, swift_code) || other.swift_code == swift_code)&&(identical(other.paypal_email, paypal_email) || other.paypal_email == paypal_email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,label,account_holder_name,bank_name,iban_or_account,swift_code,paypal_email);

@override
String toString() {
  return 'ListenerPayoutMethodModel(id: $id, type: $type, label: $label, account_holder_name: $account_holder_name, bank_name: $bank_name, iban_or_account: $iban_or_account, swift_code: $swift_code, paypal_email: $paypal_email)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutMethodModelCopyWith<$Res> implements $ListenerPayoutMethodModelCopyWith<$Res> {
  factory _$ListenerPayoutMethodModelCopyWith(_ListenerPayoutMethodModel value, $Res Function(_ListenerPayoutMethodModel) _then) = __$ListenerPayoutMethodModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String label, String? account_holder_name, String? bank_name, String? iban_or_account, String? swift_code, String? paypal_email
});




}
/// @nodoc
class __$ListenerPayoutMethodModelCopyWithImpl<$Res>
    implements _$ListenerPayoutMethodModelCopyWith<$Res> {
  __$ListenerPayoutMethodModelCopyWithImpl(this._self, this._then);

  final _ListenerPayoutMethodModel _self;
  final $Res Function(_ListenerPayoutMethodModel) _then;

/// Create a copy of ListenerPayoutMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? label = null,Object? account_holder_name = freezed,Object? bank_name = freezed,Object? iban_or_account = freezed,Object? swift_code = freezed,Object? paypal_email = freezed,}) {
  return _then(_ListenerPayoutMethodModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,account_holder_name: freezed == account_holder_name ? _self.account_holder_name : account_holder_name // ignore: cast_nullable_to_non_nullable
as String?,bank_name: freezed == bank_name ? _self.bank_name : bank_name // ignore: cast_nullable_to_non_nullable
as String?,iban_or_account: freezed == iban_or_account ? _self.iban_or_account : iban_or_account // ignore: cast_nullable_to_non_nullable
as String?,swift_code: freezed == swift_code ? _self.swift_code : swift_code // ignore: cast_nullable_to_non_nullable
as String?,paypal_email: freezed == paypal_email ? _self.paypal_email : paypal_email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
