// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_availability_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerAvailabilityResponseModel {

 String get status; ListenerAvailabilityData get data;
/// Create a copy of ListenerAvailabilityResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerAvailabilityResponseModelCopyWith<ListenerAvailabilityResponseModel> get copyWith => _$ListenerAvailabilityResponseModelCopyWithImpl<ListenerAvailabilityResponseModel>(this as ListenerAvailabilityResponseModel, _$identity);

  /// Serializes this ListenerAvailabilityResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAvailabilityResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerAvailabilityResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerAvailabilityResponseModelCopyWith<$Res>  {
  factory $ListenerAvailabilityResponseModelCopyWith(ListenerAvailabilityResponseModel value, $Res Function(ListenerAvailabilityResponseModel) _then) = _$ListenerAvailabilityResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerAvailabilityData data
});


$ListenerAvailabilityDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerAvailabilityResponseModelCopyWithImpl<$Res>
    implements $ListenerAvailabilityResponseModelCopyWith<$Res> {
  _$ListenerAvailabilityResponseModelCopyWithImpl(this._self, this._then);

  final ListenerAvailabilityResponseModel _self;
  final $Res Function(ListenerAvailabilityResponseModel) _then;

/// Create a copy of ListenerAvailabilityResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilityData,
  ));
}
/// Create a copy of ListenerAvailabilityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerAvailabilityDataCopyWith<$Res> get data {
  
  return $ListenerAvailabilityDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerAvailabilityResponseModel].
extension ListenerAvailabilityResponseModelPatterns on ListenerAvailabilityResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerAvailabilityResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerAvailabilityResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerAvailabilityResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerAvailabilityResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerAvailabilityData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerAvailabilityResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerAvailabilityData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerAvailabilityData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerAvailabilityResponseModel implements ListenerAvailabilityResponseModel {
  const _ListenerAvailabilityResponseModel({required this.status, required this.data});
  factory _ListenerAvailabilityResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerAvailabilityResponseModelFromJson(json);

@override final  String status;
@override final  ListenerAvailabilityData data;

/// Create a copy of ListenerAvailabilityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerAvailabilityResponseModelCopyWith<_ListenerAvailabilityResponseModel> get copyWith => __$ListenerAvailabilityResponseModelCopyWithImpl<_ListenerAvailabilityResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerAvailabilityResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerAvailabilityResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerAvailabilityResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerAvailabilityResponseModelCopyWith<$Res> implements $ListenerAvailabilityResponseModelCopyWith<$Res> {
  factory _$ListenerAvailabilityResponseModelCopyWith(_ListenerAvailabilityResponseModel value, $Res Function(_ListenerAvailabilityResponseModel) _then) = __$ListenerAvailabilityResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerAvailabilityData data
});


@override $ListenerAvailabilityDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerAvailabilityResponseModelCopyWithImpl<$Res>
    implements _$ListenerAvailabilityResponseModelCopyWith<$Res> {
  __$ListenerAvailabilityResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerAvailabilityResponseModel _self;
  final $Res Function(_ListenerAvailabilityResponseModel) _then;

/// Create a copy of ListenerAvailabilityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerAvailabilityResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilityData,
  ));
}

/// Create a copy of ListenerAvailabilityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerAvailabilityDataCopyWith<$Res> get data {
  
  return $ListenerAvailabilityDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerAvailabilityData {

 int get break_length_minutes; String get time_zone_id; List<String> get language_ids; List<ListenerAvailabilityDayData> get days; Object? get session_minutes; int? get session_length_minutes;
/// Create a copy of ListenerAvailabilityData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerAvailabilityDataCopyWith<ListenerAvailabilityData> get copyWith => _$ListenerAvailabilityDataCopyWithImpl<ListenerAvailabilityData>(this as ListenerAvailabilityData, _$identity);

  /// Serializes this ListenerAvailabilityData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAvailabilityData&&(identical(other.break_length_minutes, break_length_minutes) || other.break_length_minutes == break_length_minutes)&&(identical(other.time_zone_id, time_zone_id) || other.time_zone_id == time_zone_id)&&const DeepCollectionEquality().equals(other.language_ids, language_ids)&&const DeepCollectionEquality().equals(other.days, days)&&const DeepCollectionEquality().equals(other.session_minutes, session_minutes)&&(identical(other.session_length_minutes, session_length_minutes) || other.session_length_minutes == session_length_minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,break_length_minutes,time_zone_id,const DeepCollectionEquality().hash(language_ids),const DeepCollectionEquality().hash(days),const DeepCollectionEquality().hash(session_minutes),session_length_minutes);

@override
String toString() {
  return 'ListenerAvailabilityData(break_length_minutes: $break_length_minutes, time_zone_id: $time_zone_id, language_ids: $language_ids, days: $days, session_minutes: $session_minutes, session_length_minutes: $session_length_minutes)';
}


}

/// @nodoc
abstract mixin class $ListenerAvailabilityDataCopyWith<$Res>  {
  factory $ListenerAvailabilityDataCopyWith(ListenerAvailabilityData value, $Res Function(ListenerAvailabilityData) _then) = _$ListenerAvailabilityDataCopyWithImpl;
@useResult
$Res call({
 int break_length_minutes, String time_zone_id, List<String> language_ids, List<ListenerAvailabilityDayData> days, Object? session_minutes, int? session_length_minutes
});




}
/// @nodoc
class _$ListenerAvailabilityDataCopyWithImpl<$Res>
    implements $ListenerAvailabilityDataCopyWith<$Res> {
  _$ListenerAvailabilityDataCopyWithImpl(this._self, this._then);

  final ListenerAvailabilityData _self;
  final $Res Function(ListenerAvailabilityData) _then;

/// Create a copy of ListenerAvailabilityData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? break_length_minutes = null,Object? time_zone_id = null,Object? language_ids = null,Object? days = null,Object? session_minutes = freezed,Object? session_length_minutes = freezed,}) {
  return _then(_self.copyWith(
break_length_minutes: null == break_length_minutes ? _self.break_length_minutes : break_length_minutes // ignore: cast_nullable_to_non_nullable
as int,time_zone_id: null == time_zone_id ? _self.time_zone_id : time_zone_id // ignore: cast_nullable_to_non_nullable
as String,language_ids: null == language_ids ? _self.language_ids : language_ids // ignore: cast_nullable_to_non_nullable
as List<String>,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<ListenerAvailabilityDayData>,session_minutes: freezed == session_minutes ? _self.session_minutes : session_minutes ,session_length_minutes: freezed == session_length_minutes ? _self.session_length_minutes : session_length_minutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerAvailabilityData].
extension ListenerAvailabilityDataPatterns on ListenerAvailabilityData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerAvailabilityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerAvailabilityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerAvailabilityData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerAvailabilityData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int break_length_minutes,  String time_zone_id,  List<String> language_ids,  List<ListenerAvailabilityDayData> days,  Object? session_minutes,  int? session_length_minutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerAvailabilityData() when $default != null:
return $default(_that.break_length_minutes,_that.time_zone_id,_that.language_ids,_that.days,_that.session_minutes,_that.session_length_minutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int break_length_minutes,  String time_zone_id,  List<String> language_ids,  List<ListenerAvailabilityDayData> days,  Object? session_minutes,  int? session_length_minutes)  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityData():
return $default(_that.break_length_minutes,_that.time_zone_id,_that.language_ids,_that.days,_that.session_minutes,_that.session_length_minutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int break_length_minutes,  String time_zone_id,  List<String> language_ids,  List<ListenerAvailabilityDayData> days,  Object? session_minutes,  int? session_length_minutes)?  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityData() when $default != null:
return $default(_that.break_length_minutes,_that.time_zone_id,_that.language_ids,_that.days,_that.session_minutes,_that.session_length_minutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerAvailabilityData implements ListenerAvailabilityData {
  const _ListenerAvailabilityData({this.break_length_minutes = 30, this.time_zone_id = '', final  List<String> language_ids = const <String>[], final  List<ListenerAvailabilityDayData> days = const <ListenerAvailabilityDayData>[], this.session_minutes, this.session_length_minutes}): _language_ids = language_ids,_days = days;
  factory _ListenerAvailabilityData.fromJson(Map<String, dynamic> json) => _$ListenerAvailabilityDataFromJson(json);

@override@JsonKey() final  int break_length_minutes;
@override@JsonKey() final  String time_zone_id;
 final  List<String> _language_ids;
@override@JsonKey() List<String> get language_ids {
  if (_language_ids is EqualUnmodifiableListView) return _language_ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_language_ids);
}

 final  List<ListenerAvailabilityDayData> _days;
@override@JsonKey() List<ListenerAvailabilityDayData> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

@override final  Object? session_minutes;
@override final  int? session_length_minutes;

/// Create a copy of ListenerAvailabilityData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerAvailabilityDataCopyWith<_ListenerAvailabilityData> get copyWith => __$ListenerAvailabilityDataCopyWithImpl<_ListenerAvailabilityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerAvailabilityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerAvailabilityData&&(identical(other.break_length_minutes, break_length_minutes) || other.break_length_minutes == break_length_minutes)&&(identical(other.time_zone_id, time_zone_id) || other.time_zone_id == time_zone_id)&&const DeepCollectionEquality().equals(other._language_ids, _language_ids)&&const DeepCollectionEquality().equals(other._days, _days)&&const DeepCollectionEquality().equals(other.session_minutes, session_minutes)&&(identical(other.session_length_minutes, session_length_minutes) || other.session_length_minutes == session_length_minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,break_length_minutes,time_zone_id,const DeepCollectionEquality().hash(_language_ids),const DeepCollectionEquality().hash(_days),const DeepCollectionEquality().hash(session_minutes),session_length_minutes);

@override
String toString() {
  return 'ListenerAvailabilityData(break_length_minutes: $break_length_minutes, time_zone_id: $time_zone_id, language_ids: $language_ids, days: $days, session_minutes: $session_minutes, session_length_minutes: $session_length_minutes)';
}


}

/// @nodoc
abstract mixin class _$ListenerAvailabilityDataCopyWith<$Res> implements $ListenerAvailabilityDataCopyWith<$Res> {
  factory _$ListenerAvailabilityDataCopyWith(_ListenerAvailabilityData value, $Res Function(_ListenerAvailabilityData) _then) = __$ListenerAvailabilityDataCopyWithImpl;
@override @useResult
$Res call({
 int break_length_minutes, String time_zone_id, List<String> language_ids, List<ListenerAvailabilityDayData> days, Object? session_minutes, int? session_length_minutes
});




}
/// @nodoc
class __$ListenerAvailabilityDataCopyWithImpl<$Res>
    implements _$ListenerAvailabilityDataCopyWith<$Res> {
  __$ListenerAvailabilityDataCopyWithImpl(this._self, this._then);

  final _ListenerAvailabilityData _self;
  final $Res Function(_ListenerAvailabilityData) _then;

/// Create a copy of ListenerAvailabilityData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? break_length_minutes = null,Object? time_zone_id = null,Object? language_ids = null,Object? days = null,Object? session_minutes = freezed,Object? session_length_minutes = freezed,}) {
  return _then(_ListenerAvailabilityData(
break_length_minutes: null == break_length_minutes ? _self.break_length_minutes : break_length_minutes // ignore: cast_nullable_to_non_nullable
as int,time_zone_id: null == time_zone_id ? _self.time_zone_id : time_zone_id // ignore: cast_nullable_to_non_nullable
as String,language_ids: null == language_ids ? _self._language_ids : language_ids // ignore: cast_nullable_to_non_nullable
as List<String>,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<ListenerAvailabilityDayData>,session_minutes: freezed == session_minutes ? _self.session_minutes : session_minutes ,session_length_minutes: freezed == session_length_minutes ? _self.session_length_minutes : session_length_minutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ListenerAvailabilityDayData {

 String get day; List<ListenerAvailabilitySlotData> get slots;
/// Create a copy of ListenerAvailabilityDayData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerAvailabilityDayDataCopyWith<ListenerAvailabilityDayData> get copyWith => _$ListenerAvailabilityDayDataCopyWithImpl<ListenerAvailabilityDayData>(this as ListenerAvailabilityDayData, _$identity);

  /// Serializes this ListenerAvailabilityDayData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAvailabilityDayData&&(identical(other.day, day) || other.day == day)&&const DeepCollectionEquality().equals(other.slots, slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'ListenerAvailabilityDayData(day: $day, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $ListenerAvailabilityDayDataCopyWith<$Res>  {
  factory $ListenerAvailabilityDayDataCopyWith(ListenerAvailabilityDayData value, $Res Function(ListenerAvailabilityDayData) _then) = _$ListenerAvailabilityDayDataCopyWithImpl;
@useResult
$Res call({
 String day, List<ListenerAvailabilitySlotData> slots
});




}
/// @nodoc
class _$ListenerAvailabilityDayDataCopyWithImpl<$Res>
    implements $ListenerAvailabilityDayDataCopyWith<$Res> {
  _$ListenerAvailabilityDayDataCopyWithImpl(this._self, this._then);

  final ListenerAvailabilityDayData _self;
  final $Res Function(ListenerAvailabilityDayData) _then;

/// Create a copy of ListenerAvailabilityDayData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? slots = null,}) {
  return _then(_self.copyWith(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<ListenerAvailabilitySlotData>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerAvailabilityDayData].
extension ListenerAvailabilityDayDataPatterns on ListenerAvailabilityDayData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerAvailabilityDayData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerAvailabilityDayData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerAvailabilityDayData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityDayData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerAvailabilityDayData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityDayData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String day,  List<ListenerAvailabilitySlotData> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerAvailabilityDayData() when $default != null:
return $default(_that.day,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String day,  List<ListenerAvailabilitySlotData> slots)  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityDayData():
return $default(_that.day,_that.slots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String day,  List<ListenerAvailabilitySlotData> slots)?  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityDayData() when $default != null:
return $default(_that.day,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerAvailabilityDayData implements ListenerAvailabilityDayData {
  const _ListenerAvailabilityDayData({this.day = '', final  List<ListenerAvailabilitySlotData> slots = const <ListenerAvailabilitySlotData>[]}): _slots = slots;
  factory _ListenerAvailabilityDayData.fromJson(Map<String, dynamic> json) => _$ListenerAvailabilityDayDataFromJson(json);

@override@JsonKey() final  String day;
 final  List<ListenerAvailabilitySlotData> _slots;
@override@JsonKey() List<ListenerAvailabilitySlotData> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of ListenerAvailabilityDayData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerAvailabilityDayDataCopyWith<_ListenerAvailabilityDayData> get copyWith => __$ListenerAvailabilityDayDataCopyWithImpl<_ListenerAvailabilityDayData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerAvailabilityDayDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerAvailabilityDayData&&(identical(other.day, day) || other.day == day)&&const DeepCollectionEquality().equals(other._slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'ListenerAvailabilityDayData(day: $day, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$ListenerAvailabilityDayDataCopyWith<$Res> implements $ListenerAvailabilityDayDataCopyWith<$Res> {
  factory _$ListenerAvailabilityDayDataCopyWith(_ListenerAvailabilityDayData value, $Res Function(_ListenerAvailabilityDayData) _then) = __$ListenerAvailabilityDayDataCopyWithImpl;
@override @useResult
$Res call({
 String day, List<ListenerAvailabilitySlotData> slots
});




}
/// @nodoc
class __$ListenerAvailabilityDayDataCopyWithImpl<$Res>
    implements _$ListenerAvailabilityDayDataCopyWith<$Res> {
  __$ListenerAvailabilityDayDataCopyWithImpl(this._self, this._then);

  final _ListenerAvailabilityDayData _self;
  final $Res Function(_ListenerAvailabilityDayData) _then;

/// Create a copy of ListenerAvailabilityDayData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? slots = null,}) {
  return _then(_ListenerAvailabilityDayData(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<ListenerAvailabilitySlotData>,
  ));
}


}


/// @nodoc
mixin _$ListenerAvailabilitySlotData {

 String get start; String get end;
/// Create a copy of ListenerAvailabilitySlotData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerAvailabilitySlotDataCopyWith<ListenerAvailabilitySlotData> get copyWith => _$ListenerAvailabilitySlotDataCopyWithImpl<ListenerAvailabilitySlotData>(this as ListenerAvailabilitySlotData, _$identity);

  /// Serializes this ListenerAvailabilitySlotData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAvailabilitySlotData&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'ListenerAvailabilitySlotData(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $ListenerAvailabilitySlotDataCopyWith<$Res>  {
  factory $ListenerAvailabilitySlotDataCopyWith(ListenerAvailabilitySlotData value, $Res Function(ListenerAvailabilitySlotData) _then) = _$ListenerAvailabilitySlotDataCopyWithImpl;
@useResult
$Res call({
 String start, String end
});




}
/// @nodoc
class _$ListenerAvailabilitySlotDataCopyWithImpl<$Res>
    implements $ListenerAvailabilitySlotDataCopyWith<$Res> {
  _$ListenerAvailabilitySlotDataCopyWithImpl(this._self, this._then);

  final ListenerAvailabilitySlotData _self;
  final $Res Function(ListenerAvailabilitySlotData) _then;

/// Create a copy of ListenerAvailabilitySlotData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerAvailabilitySlotData].
extension ListenerAvailabilitySlotDataPatterns on ListenerAvailabilitySlotData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerAvailabilitySlotData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerAvailabilitySlotData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerAvailabilitySlotData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilitySlotData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerAvailabilitySlotData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilitySlotData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String start,  String end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerAvailabilitySlotData() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String start,  String end)  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilitySlotData():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String start,  String end)?  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilitySlotData() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerAvailabilitySlotData implements ListenerAvailabilitySlotData {
  const _ListenerAvailabilitySlotData({this.start = '', this.end = ''});
  factory _ListenerAvailabilitySlotData.fromJson(Map<String, dynamic> json) => _$ListenerAvailabilitySlotDataFromJson(json);

@override@JsonKey() final  String start;
@override@JsonKey() final  String end;

/// Create a copy of ListenerAvailabilitySlotData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerAvailabilitySlotDataCopyWith<_ListenerAvailabilitySlotData> get copyWith => __$ListenerAvailabilitySlotDataCopyWithImpl<_ListenerAvailabilitySlotData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerAvailabilitySlotDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerAvailabilitySlotData&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'ListenerAvailabilitySlotData(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$ListenerAvailabilitySlotDataCopyWith<$Res> implements $ListenerAvailabilitySlotDataCopyWith<$Res> {
  factory _$ListenerAvailabilitySlotDataCopyWith(_ListenerAvailabilitySlotData value, $Res Function(_ListenerAvailabilitySlotData) _then) = __$ListenerAvailabilitySlotDataCopyWithImpl;
@override @useResult
$Res call({
 String start, String end
});




}
/// @nodoc
class __$ListenerAvailabilitySlotDataCopyWithImpl<$Res>
    implements _$ListenerAvailabilitySlotDataCopyWith<$Res> {
  __$ListenerAvailabilitySlotDataCopyWithImpl(this._self, this._then);

  final _ListenerAvailabilitySlotData _self;
  final $Res Function(_ListenerAvailabilitySlotData) _then;

/// Create a copy of ListenerAvailabilitySlotData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_ListenerAvailabilitySlotData(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
