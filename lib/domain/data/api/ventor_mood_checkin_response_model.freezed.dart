// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_mood_checkin_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorMoodCheckinResponseModel {

 String get status; VentorMoodCheckinData get data;
/// Create a copy of VentorMoodCheckinResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorMoodCheckinResponseModelCopyWith<VentorMoodCheckinResponseModel> get copyWith => _$VentorMoodCheckinResponseModelCopyWithImpl<VentorMoodCheckinResponseModel>(this as VentorMoodCheckinResponseModel, _$identity);

  /// Serializes this VentorMoodCheckinResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorMoodCheckinResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorMoodCheckinResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorMoodCheckinResponseModelCopyWith<$Res>  {
  factory $VentorMoodCheckinResponseModelCopyWith(VentorMoodCheckinResponseModel value, $Res Function(VentorMoodCheckinResponseModel) _then) = _$VentorMoodCheckinResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorMoodCheckinData data
});


$VentorMoodCheckinDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorMoodCheckinResponseModelCopyWithImpl<$Res>
    implements $VentorMoodCheckinResponseModelCopyWith<$Res> {
  _$VentorMoodCheckinResponseModelCopyWithImpl(this._self, this._then);

  final VentorMoodCheckinResponseModel _self;
  final $Res Function(VentorMoodCheckinResponseModel) _then;

/// Create a copy of VentorMoodCheckinResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorMoodCheckinData,
  ));
}
/// Create a copy of VentorMoodCheckinResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorMoodCheckinDataCopyWith<$Res> get data {
  
  return $VentorMoodCheckinDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorMoodCheckinResponseModel].
extension VentorMoodCheckinResponseModelPatterns on VentorMoodCheckinResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorMoodCheckinResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorMoodCheckinResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorMoodCheckinResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorMoodCheckinResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorMoodCheckinResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorMoodCheckinResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorMoodCheckinData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorMoodCheckinResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorMoodCheckinData data)  $default,) {final _that = this;
switch (_that) {
case _VentorMoodCheckinResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorMoodCheckinData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorMoodCheckinResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorMoodCheckinResponseModel implements VentorMoodCheckinResponseModel {
  const _VentorMoodCheckinResponseModel({required this.status, required this.data});
  factory _VentorMoodCheckinResponseModel.fromJson(Map<String, dynamic> json) => _$VentorMoodCheckinResponseModelFromJson(json);

@override final  String status;
@override final  VentorMoodCheckinData data;

/// Create a copy of VentorMoodCheckinResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorMoodCheckinResponseModelCopyWith<_VentorMoodCheckinResponseModel> get copyWith => __$VentorMoodCheckinResponseModelCopyWithImpl<_VentorMoodCheckinResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorMoodCheckinResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorMoodCheckinResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorMoodCheckinResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorMoodCheckinResponseModelCopyWith<$Res> implements $VentorMoodCheckinResponseModelCopyWith<$Res> {
  factory _$VentorMoodCheckinResponseModelCopyWith(_VentorMoodCheckinResponseModel value, $Res Function(_VentorMoodCheckinResponseModel) _then) = __$VentorMoodCheckinResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorMoodCheckinData data
});


@override $VentorMoodCheckinDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorMoodCheckinResponseModelCopyWithImpl<$Res>
    implements _$VentorMoodCheckinResponseModelCopyWith<$Res> {
  __$VentorMoodCheckinResponseModelCopyWithImpl(this._self, this._then);

  final _VentorMoodCheckinResponseModel _self;
  final $Res Function(_VentorMoodCheckinResponseModel) _then;

/// Create a copy of VentorMoodCheckinResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorMoodCheckinResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorMoodCheckinData,
  ));
}

/// Create a copy of VentorMoodCheckinResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorMoodCheckinDataCopyWith<$Res> get data {
  
  return $VentorMoodCheckinDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorMoodCheckinData {

 String get id; String get mood; String? get note; String get at; VentorMoodCheckinStreakModel? get streak;
/// Create a copy of VentorMoodCheckinData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorMoodCheckinDataCopyWith<VentorMoodCheckinData> get copyWith => _$VentorMoodCheckinDataCopyWithImpl<VentorMoodCheckinData>(this as VentorMoodCheckinData, _$identity);

  /// Serializes this VentorMoodCheckinData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorMoodCheckinData&&(identical(other.id, id) || other.id == id)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.note, note) || other.note == note)&&(identical(other.at, at) || other.at == at)&&(identical(other.streak, streak) || other.streak == streak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mood,note,at,streak);

@override
String toString() {
  return 'VentorMoodCheckinData(id: $id, mood: $mood, note: $note, at: $at, streak: $streak)';
}


}

/// @nodoc
abstract mixin class $VentorMoodCheckinDataCopyWith<$Res>  {
  factory $VentorMoodCheckinDataCopyWith(VentorMoodCheckinData value, $Res Function(VentorMoodCheckinData) _then) = _$VentorMoodCheckinDataCopyWithImpl;
@useResult
$Res call({
 String id, String mood, String? note, String at, VentorMoodCheckinStreakModel? streak
});


$VentorMoodCheckinStreakModelCopyWith<$Res>? get streak;

}
/// @nodoc
class _$VentorMoodCheckinDataCopyWithImpl<$Res>
    implements $VentorMoodCheckinDataCopyWith<$Res> {
  _$VentorMoodCheckinDataCopyWithImpl(this._self, this._then);

  final VentorMoodCheckinData _self;
  final $Res Function(VentorMoodCheckinData) _then;

/// Create a copy of VentorMoodCheckinData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mood = null,Object? note = freezed,Object? at = null,Object? streak = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as VentorMoodCheckinStreakModel?,
  ));
}
/// Create a copy of VentorMoodCheckinData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorMoodCheckinStreakModelCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $VentorMoodCheckinStreakModelCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorMoodCheckinData].
extension VentorMoodCheckinDataPatterns on VentorMoodCheckinData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorMoodCheckinData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorMoodCheckinData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorMoodCheckinData value)  $default,){
final _that = this;
switch (_that) {
case _VentorMoodCheckinData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorMoodCheckinData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorMoodCheckinData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String mood,  String? note,  String at,  VentorMoodCheckinStreakModel? streak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorMoodCheckinData() when $default != null:
return $default(_that.id,_that.mood,_that.note,_that.at,_that.streak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String mood,  String? note,  String at,  VentorMoodCheckinStreakModel? streak)  $default,) {final _that = this;
switch (_that) {
case _VentorMoodCheckinData():
return $default(_that.id,_that.mood,_that.note,_that.at,_that.streak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String mood,  String? note,  String at,  VentorMoodCheckinStreakModel? streak)?  $default,) {final _that = this;
switch (_that) {
case _VentorMoodCheckinData() when $default != null:
return $default(_that.id,_that.mood,_that.note,_that.at,_that.streak);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorMoodCheckinData implements VentorMoodCheckinData {
  const _VentorMoodCheckinData({this.id = '', this.mood = '', this.note, this.at = '', this.streak});
  factory _VentorMoodCheckinData.fromJson(Map<String, dynamic> json) => _$VentorMoodCheckinDataFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String mood;
@override final  String? note;
@override@JsonKey() final  String at;
@override final  VentorMoodCheckinStreakModel? streak;

/// Create a copy of VentorMoodCheckinData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorMoodCheckinDataCopyWith<_VentorMoodCheckinData> get copyWith => __$VentorMoodCheckinDataCopyWithImpl<_VentorMoodCheckinData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorMoodCheckinDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorMoodCheckinData&&(identical(other.id, id) || other.id == id)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.note, note) || other.note == note)&&(identical(other.at, at) || other.at == at)&&(identical(other.streak, streak) || other.streak == streak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mood,note,at,streak);

@override
String toString() {
  return 'VentorMoodCheckinData(id: $id, mood: $mood, note: $note, at: $at, streak: $streak)';
}


}

/// @nodoc
abstract mixin class _$VentorMoodCheckinDataCopyWith<$Res> implements $VentorMoodCheckinDataCopyWith<$Res> {
  factory _$VentorMoodCheckinDataCopyWith(_VentorMoodCheckinData value, $Res Function(_VentorMoodCheckinData) _then) = __$VentorMoodCheckinDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String mood, String? note, String at, VentorMoodCheckinStreakModel? streak
});


@override $VentorMoodCheckinStreakModelCopyWith<$Res>? get streak;

}
/// @nodoc
class __$VentorMoodCheckinDataCopyWithImpl<$Res>
    implements _$VentorMoodCheckinDataCopyWith<$Res> {
  __$VentorMoodCheckinDataCopyWithImpl(this._self, this._then);

  final _VentorMoodCheckinData _self;
  final $Res Function(_VentorMoodCheckinData) _then;

/// Create a copy of VentorMoodCheckinData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mood = null,Object? note = freezed,Object? at = null,Object? streak = freezed,}) {
  return _then(_VentorMoodCheckinData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as VentorMoodCheckinStreakModel?,
  ));
}

/// Create a copy of VentorMoodCheckinData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorMoodCheckinStreakModelCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $VentorMoodCheckinStreakModelCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// @nodoc
mixin _$VentorMoodCheckinStreakModel {

 int get current_days; bool get reward_unlocked;
/// Create a copy of VentorMoodCheckinStreakModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorMoodCheckinStreakModelCopyWith<VentorMoodCheckinStreakModel> get copyWith => _$VentorMoodCheckinStreakModelCopyWithImpl<VentorMoodCheckinStreakModel>(this as VentorMoodCheckinStreakModel, _$identity);

  /// Serializes this VentorMoodCheckinStreakModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorMoodCheckinStreakModel&&(identical(other.current_days, current_days) || other.current_days == current_days)&&(identical(other.reward_unlocked, reward_unlocked) || other.reward_unlocked == reward_unlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current_days,reward_unlocked);

@override
String toString() {
  return 'VentorMoodCheckinStreakModel(current_days: $current_days, reward_unlocked: $reward_unlocked)';
}


}

/// @nodoc
abstract mixin class $VentorMoodCheckinStreakModelCopyWith<$Res>  {
  factory $VentorMoodCheckinStreakModelCopyWith(VentorMoodCheckinStreakModel value, $Res Function(VentorMoodCheckinStreakModel) _then) = _$VentorMoodCheckinStreakModelCopyWithImpl;
@useResult
$Res call({
 int current_days, bool reward_unlocked
});




}
/// @nodoc
class _$VentorMoodCheckinStreakModelCopyWithImpl<$Res>
    implements $VentorMoodCheckinStreakModelCopyWith<$Res> {
  _$VentorMoodCheckinStreakModelCopyWithImpl(this._self, this._then);

  final VentorMoodCheckinStreakModel _self;
  final $Res Function(VentorMoodCheckinStreakModel) _then;

/// Create a copy of VentorMoodCheckinStreakModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current_days = null,Object? reward_unlocked = null,}) {
  return _then(_self.copyWith(
current_days: null == current_days ? _self.current_days : current_days // ignore: cast_nullable_to_non_nullable
as int,reward_unlocked: null == reward_unlocked ? _self.reward_unlocked : reward_unlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorMoodCheckinStreakModel].
extension VentorMoodCheckinStreakModelPatterns on VentorMoodCheckinStreakModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorMoodCheckinStreakModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorMoodCheckinStreakModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorMoodCheckinStreakModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorMoodCheckinStreakModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorMoodCheckinStreakModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorMoodCheckinStreakModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int current_days,  bool reward_unlocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorMoodCheckinStreakModel() when $default != null:
return $default(_that.current_days,_that.reward_unlocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int current_days,  bool reward_unlocked)  $default,) {final _that = this;
switch (_that) {
case _VentorMoodCheckinStreakModel():
return $default(_that.current_days,_that.reward_unlocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int current_days,  bool reward_unlocked)?  $default,) {final _that = this;
switch (_that) {
case _VentorMoodCheckinStreakModel() when $default != null:
return $default(_that.current_days,_that.reward_unlocked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorMoodCheckinStreakModel implements VentorMoodCheckinStreakModel {
  const _VentorMoodCheckinStreakModel({this.current_days = 0, this.reward_unlocked = false});
  factory _VentorMoodCheckinStreakModel.fromJson(Map<String, dynamic> json) => _$VentorMoodCheckinStreakModelFromJson(json);

@override@JsonKey() final  int current_days;
@override@JsonKey() final  bool reward_unlocked;

/// Create a copy of VentorMoodCheckinStreakModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorMoodCheckinStreakModelCopyWith<_VentorMoodCheckinStreakModel> get copyWith => __$VentorMoodCheckinStreakModelCopyWithImpl<_VentorMoodCheckinStreakModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorMoodCheckinStreakModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorMoodCheckinStreakModel&&(identical(other.current_days, current_days) || other.current_days == current_days)&&(identical(other.reward_unlocked, reward_unlocked) || other.reward_unlocked == reward_unlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current_days,reward_unlocked);

@override
String toString() {
  return 'VentorMoodCheckinStreakModel(current_days: $current_days, reward_unlocked: $reward_unlocked)';
}


}

/// @nodoc
abstract mixin class _$VentorMoodCheckinStreakModelCopyWith<$Res> implements $VentorMoodCheckinStreakModelCopyWith<$Res> {
  factory _$VentorMoodCheckinStreakModelCopyWith(_VentorMoodCheckinStreakModel value, $Res Function(_VentorMoodCheckinStreakModel) _then) = __$VentorMoodCheckinStreakModelCopyWithImpl;
@override @useResult
$Res call({
 int current_days, bool reward_unlocked
});




}
/// @nodoc
class __$VentorMoodCheckinStreakModelCopyWithImpl<$Res>
    implements _$VentorMoodCheckinStreakModelCopyWith<$Res> {
  __$VentorMoodCheckinStreakModelCopyWithImpl(this._self, this._then);

  final _VentorMoodCheckinStreakModel _self;
  final $Res Function(_VentorMoodCheckinStreakModel) _then;

/// Create a copy of VentorMoodCheckinStreakModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current_days = null,Object? reward_unlocked = null,}) {
  return _then(_VentorMoodCheckinStreakModel(
current_days: null == current_days ? _self.current_days : current_days // ignore: cast_nullable_to_non_nullable
as int,reward_unlocked: null == reward_unlocked ? _self.reward_unlocked : reward_unlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
