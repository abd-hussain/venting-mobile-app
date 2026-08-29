// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_mood_journey_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorMoodJourneyResponseModel {

 String get status; VentorMoodJourneyData get data;
/// Create a copy of VentorMoodJourneyResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorMoodJourneyResponseModelCopyWith<VentorMoodJourneyResponseModel> get copyWith => _$VentorMoodJourneyResponseModelCopyWithImpl<VentorMoodJourneyResponseModel>(this as VentorMoodJourneyResponseModel, _$identity);

  /// Serializes this VentorMoodJourneyResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorMoodJourneyResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorMoodJourneyResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorMoodJourneyResponseModelCopyWith<$Res>  {
  factory $VentorMoodJourneyResponseModelCopyWith(VentorMoodJourneyResponseModel value, $Res Function(VentorMoodJourneyResponseModel) _then) = _$VentorMoodJourneyResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorMoodJourneyData data
});


$VentorMoodJourneyDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorMoodJourneyResponseModelCopyWithImpl<$Res>
    implements $VentorMoodJourneyResponseModelCopyWith<$Res> {
  _$VentorMoodJourneyResponseModelCopyWithImpl(this._self, this._then);

  final VentorMoodJourneyResponseModel _self;
  final $Res Function(VentorMoodJourneyResponseModel) _then;

/// Create a copy of VentorMoodJourneyResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorMoodJourneyData,
  ));
}
/// Create a copy of VentorMoodJourneyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorMoodJourneyDataCopyWith<$Res> get data {
  
  return $VentorMoodJourneyDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorMoodJourneyResponseModel].
extension VentorMoodJourneyResponseModelPatterns on VentorMoodJourneyResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorMoodJourneyResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorMoodJourneyResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorMoodJourneyResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorMoodJourneyResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorMoodJourneyResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorMoodJourneyResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorMoodJourneyData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorMoodJourneyResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorMoodJourneyData data)  $default,) {final _that = this;
switch (_that) {
case _VentorMoodJourneyResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorMoodJourneyData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorMoodJourneyResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorMoodJourneyResponseModel implements VentorMoodJourneyResponseModel {
  const _VentorMoodJourneyResponseModel({required this.status, required this.data});
  factory _VentorMoodJourneyResponseModel.fromJson(Map<String, dynamic> json) => _$VentorMoodJourneyResponseModelFromJson(json);

@override final  String status;
@override final  VentorMoodJourneyData data;

/// Create a copy of VentorMoodJourneyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorMoodJourneyResponseModelCopyWith<_VentorMoodJourneyResponseModel> get copyWith => __$VentorMoodJourneyResponseModelCopyWithImpl<_VentorMoodJourneyResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorMoodJourneyResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorMoodJourneyResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorMoodJourneyResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorMoodJourneyResponseModelCopyWith<$Res> implements $VentorMoodJourneyResponseModelCopyWith<$Res> {
  factory _$VentorMoodJourneyResponseModelCopyWith(_VentorMoodJourneyResponseModel value, $Res Function(_VentorMoodJourneyResponseModel) _then) = __$VentorMoodJourneyResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorMoodJourneyData data
});


@override $VentorMoodJourneyDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorMoodJourneyResponseModelCopyWithImpl<$Res>
    implements _$VentorMoodJourneyResponseModelCopyWith<$Res> {
  __$VentorMoodJourneyResponseModelCopyWithImpl(this._self, this._then);

  final _VentorMoodJourneyResponseModel _self;
  final $Res Function(_VentorMoodJourneyResponseModel) _then;

/// Create a copy of VentorMoodJourneyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorMoodJourneyResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorMoodJourneyData,
  ));
}

/// Create a copy of VentorMoodJourneyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorMoodJourneyDataCopyWith<$Res> get data {
  
  return $VentorMoodJourneyDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorMoodJourneyData {

 List<VentorMoodJourneyPointModel> get points;
/// Create a copy of VentorMoodJourneyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorMoodJourneyDataCopyWith<VentorMoodJourneyData> get copyWith => _$VentorMoodJourneyDataCopyWithImpl<VentorMoodJourneyData>(this as VentorMoodJourneyData, _$identity);

  /// Serializes this VentorMoodJourneyData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorMoodJourneyData&&const DeepCollectionEquality().equals(other.points, points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(points));

@override
String toString() {
  return 'VentorMoodJourneyData(points: $points)';
}


}

/// @nodoc
abstract mixin class $VentorMoodJourneyDataCopyWith<$Res>  {
  factory $VentorMoodJourneyDataCopyWith(VentorMoodJourneyData value, $Res Function(VentorMoodJourneyData) _then) = _$VentorMoodJourneyDataCopyWithImpl;
@useResult
$Res call({
 List<VentorMoodJourneyPointModel> points
});




}
/// @nodoc
class _$VentorMoodJourneyDataCopyWithImpl<$Res>
    implements $VentorMoodJourneyDataCopyWith<$Res> {
  _$VentorMoodJourneyDataCopyWithImpl(this._self, this._then);

  final VentorMoodJourneyData _self;
  final $Res Function(VentorMoodJourneyData) _then;

/// Create a copy of VentorMoodJourneyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<VentorMoodJourneyPointModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorMoodJourneyData].
extension VentorMoodJourneyDataPatterns on VentorMoodJourneyData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorMoodJourneyData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorMoodJourneyData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorMoodJourneyData value)  $default,){
final _that = this;
switch (_that) {
case _VentorMoodJourneyData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorMoodJourneyData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorMoodJourneyData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VentorMoodJourneyPointModel> points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorMoodJourneyData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VentorMoodJourneyPointModel> points)  $default,) {final _that = this;
switch (_that) {
case _VentorMoodJourneyData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VentorMoodJourneyPointModel> points)?  $default,) {final _that = this;
switch (_that) {
case _VentorMoodJourneyData() when $default != null:
return $default(_that.points);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorMoodJourneyData implements VentorMoodJourneyData {
  const _VentorMoodJourneyData({final  List<VentorMoodJourneyPointModel> points = const <VentorMoodJourneyPointModel>[]}): _points = points;
  factory _VentorMoodJourneyData.fromJson(Map<String, dynamic> json) => _$VentorMoodJourneyDataFromJson(json);

 final  List<VentorMoodJourneyPointModel> _points;
@override@JsonKey() List<VentorMoodJourneyPointModel> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}


/// Create a copy of VentorMoodJourneyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorMoodJourneyDataCopyWith<_VentorMoodJourneyData> get copyWith => __$VentorMoodJourneyDataCopyWithImpl<_VentorMoodJourneyData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorMoodJourneyDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorMoodJourneyData&&const DeepCollectionEquality().equals(other._points, _points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_points));

@override
String toString() {
  return 'VentorMoodJourneyData(points: $points)';
}


}

/// @nodoc
abstract mixin class _$VentorMoodJourneyDataCopyWith<$Res> implements $VentorMoodJourneyDataCopyWith<$Res> {
  factory _$VentorMoodJourneyDataCopyWith(_VentorMoodJourneyData value, $Res Function(_VentorMoodJourneyData) _then) = __$VentorMoodJourneyDataCopyWithImpl;
@override @useResult
$Res call({
 List<VentorMoodJourneyPointModel> points
});




}
/// @nodoc
class __$VentorMoodJourneyDataCopyWithImpl<$Res>
    implements _$VentorMoodJourneyDataCopyWith<$Res> {
  __$VentorMoodJourneyDataCopyWithImpl(this._self, this._then);

  final _VentorMoodJourneyData _self;
  final $Res Function(_VentorMoodJourneyData) _then;

/// Create a copy of VentorMoodJourneyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,}) {
  return _then(_VentorMoodJourneyData(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<VentorMoodJourneyPointModel>,
  ));
}


}


/// @nodoc
mixin _$VentorMoodJourneyPointModel {

 int get day_index; num get mood;
/// Create a copy of VentorMoodJourneyPointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorMoodJourneyPointModelCopyWith<VentorMoodJourneyPointModel> get copyWith => _$VentorMoodJourneyPointModelCopyWithImpl<VentorMoodJourneyPointModel>(this as VentorMoodJourneyPointModel, _$identity);

  /// Serializes this VentorMoodJourneyPointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorMoodJourneyPointModel&&(identical(other.day_index, day_index) || other.day_index == day_index)&&(identical(other.mood, mood) || other.mood == mood));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day_index,mood);

@override
String toString() {
  return 'VentorMoodJourneyPointModel(day_index: $day_index, mood: $mood)';
}


}

/// @nodoc
abstract mixin class $VentorMoodJourneyPointModelCopyWith<$Res>  {
  factory $VentorMoodJourneyPointModelCopyWith(VentorMoodJourneyPointModel value, $Res Function(VentorMoodJourneyPointModel) _then) = _$VentorMoodJourneyPointModelCopyWithImpl;
@useResult
$Res call({
 int day_index, num mood
});




}
/// @nodoc
class _$VentorMoodJourneyPointModelCopyWithImpl<$Res>
    implements $VentorMoodJourneyPointModelCopyWith<$Res> {
  _$VentorMoodJourneyPointModelCopyWithImpl(this._self, this._then);

  final VentorMoodJourneyPointModel _self;
  final $Res Function(VentorMoodJourneyPointModel) _then;

/// Create a copy of VentorMoodJourneyPointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day_index = null,Object? mood = null,}) {
  return _then(_self.copyWith(
day_index: null == day_index ? _self.day_index : day_index // ignore: cast_nullable_to_non_nullable
as int,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorMoodJourneyPointModel].
extension VentorMoodJourneyPointModelPatterns on VentorMoodJourneyPointModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorMoodJourneyPointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorMoodJourneyPointModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorMoodJourneyPointModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorMoodJourneyPointModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorMoodJourneyPointModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorMoodJourneyPointModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int day_index,  num mood)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorMoodJourneyPointModel() when $default != null:
return $default(_that.day_index,_that.mood);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int day_index,  num mood)  $default,) {final _that = this;
switch (_that) {
case _VentorMoodJourneyPointModel():
return $default(_that.day_index,_that.mood);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int day_index,  num mood)?  $default,) {final _that = this;
switch (_that) {
case _VentorMoodJourneyPointModel() when $default != null:
return $default(_that.day_index,_that.mood);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorMoodJourneyPointModel implements VentorMoodJourneyPointModel {
  const _VentorMoodJourneyPointModel({this.day_index = 0, this.mood = 0});
  factory _VentorMoodJourneyPointModel.fromJson(Map<String, dynamic> json) => _$VentorMoodJourneyPointModelFromJson(json);

@override@JsonKey() final  int day_index;
@override@JsonKey() final  num mood;

/// Create a copy of VentorMoodJourneyPointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorMoodJourneyPointModelCopyWith<_VentorMoodJourneyPointModel> get copyWith => __$VentorMoodJourneyPointModelCopyWithImpl<_VentorMoodJourneyPointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorMoodJourneyPointModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorMoodJourneyPointModel&&(identical(other.day_index, day_index) || other.day_index == day_index)&&(identical(other.mood, mood) || other.mood == mood));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day_index,mood);

@override
String toString() {
  return 'VentorMoodJourneyPointModel(day_index: $day_index, mood: $mood)';
}


}

/// @nodoc
abstract mixin class _$VentorMoodJourneyPointModelCopyWith<$Res> implements $VentorMoodJourneyPointModelCopyWith<$Res> {
  factory _$VentorMoodJourneyPointModelCopyWith(_VentorMoodJourneyPointModel value, $Res Function(_VentorMoodJourneyPointModel) _then) = __$VentorMoodJourneyPointModelCopyWithImpl;
@override @useResult
$Res call({
 int day_index, num mood
});




}
/// @nodoc
class __$VentorMoodJourneyPointModelCopyWithImpl<$Res>
    implements _$VentorMoodJourneyPointModelCopyWith<$Res> {
  __$VentorMoodJourneyPointModelCopyWithImpl(this._self, this._then);

  final _VentorMoodJourneyPointModel _self;
  final $Res Function(_VentorMoodJourneyPointModel) _then;

/// Create a copy of VentorMoodJourneyPointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day_index = null,Object? mood = null,}) {
  return _then(_VentorMoodJourneyPointModel(
day_index: null == day_index ? _self.day_index : day_index // ignore: cast_nullable_to_non_nullable
as int,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
