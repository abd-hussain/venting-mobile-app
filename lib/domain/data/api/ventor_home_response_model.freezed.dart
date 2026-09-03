// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_home_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorHomeResponseModel {

 String get status; VentorHomeData get data;
/// Create a copy of VentorHomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorHomeResponseModelCopyWith<VentorHomeResponseModel> get copyWith => _$VentorHomeResponseModelCopyWithImpl<VentorHomeResponseModel>(this as VentorHomeResponseModel, _$identity);

  /// Serializes this VentorHomeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorHomeResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorHomeResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorHomeResponseModelCopyWith<$Res>  {
  factory $VentorHomeResponseModelCopyWith(VentorHomeResponseModel value, $Res Function(VentorHomeResponseModel) _then) = _$VentorHomeResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorHomeData data
});


$VentorHomeDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorHomeResponseModelCopyWithImpl<$Res>
    implements $VentorHomeResponseModelCopyWith<$Res> {
  _$VentorHomeResponseModelCopyWithImpl(this._self, this._then);

  final VentorHomeResponseModel _self;
  final $Res Function(VentorHomeResponseModel) _then;

/// Create a copy of VentorHomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorHomeData,
  ));
}
/// Create a copy of VentorHomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeDataCopyWith<$Res> get data {
  
  return $VentorHomeDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorHomeResponseModel].
extension VentorHomeResponseModelPatterns on VentorHomeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorHomeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorHomeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorHomeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorHomeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorHomeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorHomeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorHomeData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorHomeResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorHomeData data)  $default,) {final _that = this;
switch (_that) {
case _VentorHomeResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorHomeData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorHomeResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorHomeResponseModel implements VentorHomeResponseModel {
  const _VentorHomeResponseModel({required this.status, required this.data});
  factory _VentorHomeResponseModel.fromJson(Map<String, dynamic> json) => _$VentorHomeResponseModelFromJson(json);

@override final  String status;
@override final  VentorHomeData data;

/// Create a copy of VentorHomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorHomeResponseModelCopyWith<_VentorHomeResponseModel> get copyWith => __$VentorHomeResponseModelCopyWithImpl<_VentorHomeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorHomeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorHomeResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorHomeResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorHomeResponseModelCopyWith<$Res> implements $VentorHomeResponseModelCopyWith<$Res> {
  factory _$VentorHomeResponseModelCopyWith(_VentorHomeResponseModel value, $Res Function(_VentorHomeResponseModel) _then) = __$VentorHomeResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorHomeData data
});


@override $VentorHomeDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorHomeResponseModelCopyWithImpl<$Res>
    implements _$VentorHomeResponseModelCopyWith<$Res> {
  __$VentorHomeResponseModelCopyWithImpl(this._self, this._then);

  final _VentorHomeResponseModel _self;
  final $Res Function(_VentorHomeResponseModel) _then;

/// Create a copy of VentorHomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorHomeResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorHomeData,
  ));
}

/// Create a copy of VentorHomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeDataCopyWith<$Res> get data {
  
  return $VentorHomeDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorHomeData {

 String get display_name; VentorHomeMoodCheckinModel? get mood_checkin_today; VentorHomeStreakModel? get streak; VentorHomeBookedSessionModel? get upcoming_session; List<VentorHomeRecentSessionModel> get recent_sessions; String? get motivation;
/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorHomeDataCopyWith<VentorHomeData> get copyWith => _$VentorHomeDataCopyWithImpl<VentorHomeData>(this as VentorHomeData, _$identity);

  /// Serializes this VentorHomeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorHomeData&&(identical(other.display_name, display_name) || other.display_name == display_name)&&(identical(other.mood_checkin_today, mood_checkin_today) || other.mood_checkin_today == mood_checkin_today)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.upcoming_session, upcoming_session) || other.upcoming_session == upcoming_session)&&const DeepCollectionEquality().equals(other.recent_sessions, recent_sessions)&&(identical(other.motivation, motivation) || other.motivation == motivation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,display_name,mood_checkin_today,streak,upcoming_session,const DeepCollectionEquality().hash(recent_sessions),motivation);

@override
String toString() {
  return 'VentorHomeData(display_name: $display_name, mood_checkin_today: $mood_checkin_today, streak: $streak, upcoming_session: $upcoming_session, recent_sessions: $recent_sessions, motivation: $motivation)';
}


}

/// @nodoc
abstract mixin class $VentorHomeDataCopyWith<$Res>  {
  factory $VentorHomeDataCopyWith(VentorHomeData value, $Res Function(VentorHomeData) _then) = _$VentorHomeDataCopyWithImpl;
@useResult
$Res call({
 String display_name, VentorHomeMoodCheckinModel? mood_checkin_today, VentorHomeStreakModel? streak, VentorHomeBookedSessionModel? upcoming_session, List<VentorHomeRecentSessionModel> recent_sessions, String? motivation
});


$VentorHomeMoodCheckinModelCopyWith<$Res>? get mood_checkin_today;$VentorHomeStreakModelCopyWith<$Res>? get streak;$VentorHomeBookedSessionModelCopyWith<$Res>? get upcoming_session;

}
/// @nodoc
class _$VentorHomeDataCopyWithImpl<$Res>
    implements $VentorHomeDataCopyWith<$Res> {
  _$VentorHomeDataCopyWithImpl(this._self, this._then);

  final VentorHomeData _self;
  final $Res Function(VentorHomeData) _then;

/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? display_name = null,Object? mood_checkin_today = freezed,Object? streak = freezed,Object? upcoming_session = freezed,Object? recent_sessions = null,Object? motivation = freezed,}) {
  return _then(_self.copyWith(
display_name: null == display_name ? _self.display_name : display_name // ignore: cast_nullable_to_non_nullable
as String,mood_checkin_today: freezed == mood_checkin_today ? _self.mood_checkin_today : mood_checkin_today // ignore: cast_nullable_to_non_nullable
as VentorHomeMoodCheckinModel?,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as VentorHomeStreakModel?,upcoming_session: freezed == upcoming_session ? _self.upcoming_session : upcoming_session // ignore: cast_nullable_to_non_nullable
as VentorHomeBookedSessionModel?,recent_sessions: null == recent_sessions ? _self.recent_sessions : recent_sessions // ignore: cast_nullable_to_non_nullable
as List<VentorHomeRecentSessionModel>,motivation: freezed == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeMoodCheckinModelCopyWith<$Res>? get mood_checkin_today {
    if (_self.mood_checkin_today == null) {
    return null;
  }

  return $VentorHomeMoodCheckinModelCopyWith<$Res>(_self.mood_checkin_today!, (value) {
    return _then(_self.copyWith(mood_checkin_today: value));
  });
}/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeStreakModelCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $VentorHomeStreakModelCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeBookedSessionModelCopyWith<$Res>? get upcoming_session {
    if (_self.upcoming_session == null) {
    return null;
  }

  return $VentorHomeBookedSessionModelCopyWith<$Res>(_self.upcoming_session!, (value) {
    return _then(_self.copyWith(upcoming_session: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorHomeData].
extension VentorHomeDataPatterns on VentorHomeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorHomeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorHomeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorHomeData value)  $default,){
final _that = this;
switch (_that) {
case _VentorHomeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorHomeData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorHomeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String display_name,  VentorHomeMoodCheckinModel? mood_checkin_today,  VentorHomeStreakModel? streak,  VentorHomeBookedSessionModel? upcoming_session,  List<VentorHomeRecentSessionModel> recent_sessions,  String? motivation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorHomeData() when $default != null:
return $default(_that.display_name,_that.mood_checkin_today,_that.streak,_that.upcoming_session,_that.recent_sessions,_that.motivation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String display_name,  VentorHomeMoodCheckinModel? mood_checkin_today,  VentorHomeStreakModel? streak,  VentorHomeBookedSessionModel? upcoming_session,  List<VentorHomeRecentSessionModel> recent_sessions,  String? motivation)  $default,) {final _that = this;
switch (_that) {
case _VentorHomeData():
return $default(_that.display_name,_that.mood_checkin_today,_that.streak,_that.upcoming_session,_that.recent_sessions,_that.motivation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String display_name,  VentorHomeMoodCheckinModel? mood_checkin_today,  VentorHomeStreakModel? streak,  VentorHomeBookedSessionModel? upcoming_session,  List<VentorHomeRecentSessionModel> recent_sessions,  String? motivation)?  $default,) {final _that = this;
switch (_that) {
case _VentorHomeData() when $default != null:
return $default(_that.display_name,_that.mood_checkin_today,_that.streak,_that.upcoming_session,_that.recent_sessions,_that.motivation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorHomeData implements VentorHomeData {
  const _VentorHomeData({this.display_name = '', this.mood_checkin_today, this.streak, this.upcoming_session, final  List<VentorHomeRecentSessionModel> recent_sessions = const <VentorHomeRecentSessionModel>[], this.motivation}): _recent_sessions = recent_sessions;
  factory _VentorHomeData.fromJson(Map<String, dynamic> json) => _$VentorHomeDataFromJson(json);

@override@JsonKey() final  String display_name;
@override final  VentorHomeMoodCheckinModel? mood_checkin_today;
@override final  VentorHomeStreakModel? streak;
@override final  VentorHomeBookedSessionModel? upcoming_session;
 final  List<VentorHomeRecentSessionModel> _recent_sessions;
@override@JsonKey() List<VentorHomeRecentSessionModel> get recent_sessions {
  if (_recent_sessions is EqualUnmodifiableListView) return _recent_sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recent_sessions);
}

@override final  String? motivation;

/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorHomeDataCopyWith<_VentorHomeData> get copyWith => __$VentorHomeDataCopyWithImpl<_VentorHomeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorHomeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorHomeData&&(identical(other.display_name, display_name) || other.display_name == display_name)&&(identical(other.mood_checkin_today, mood_checkin_today) || other.mood_checkin_today == mood_checkin_today)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.upcoming_session, upcoming_session) || other.upcoming_session == upcoming_session)&&const DeepCollectionEquality().equals(other._recent_sessions, _recent_sessions)&&(identical(other.motivation, motivation) || other.motivation == motivation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,display_name,mood_checkin_today,streak,upcoming_session,const DeepCollectionEquality().hash(_recent_sessions),motivation);

@override
String toString() {
  return 'VentorHomeData(display_name: $display_name, mood_checkin_today: $mood_checkin_today, streak: $streak, upcoming_session: $upcoming_session, recent_sessions: $recent_sessions, motivation: $motivation)';
}


}

/// @nodoc
abstract mixin class _$VentorHomeDataCopyWith<$Res> implements $VentorHomeDataCopyWith<$Res> {
  factory _$VentorHomeDataCopyWith(_VentorHomeData value, $Res Function(_VentorHomeData) _then) = __$VentorHomeDataCopyWithImpl;
@override @useResult
$Res call({
 String display_name, VentorHomeMoodCheckinModel? mood_checkin_today, VentorHomeStreakModel? streak, VentorHomeBookedSessionModel? upcoming_session, List<VentorHomeRecentSessionModel> recent_sessions, String? motivation
});


@override $VentorHomeMoodCheckinModelCopyWith<$Res>? get mood_checkin_today;@override $VentorHomeStreakModelCopyWith<$Res>? get streak;@override $VentorHomeBookedSessionModelCopyWith<$Res>? get upcoming_session;

}
/// @nodoc
class __$VentorHomeDataCopyWithImpl<$Res>
    implements _$VentorHomeDataCopyWith<$Res> {
  __$VentorHomeDataCopyWithImpl(this._self, this._then);

  final _VentorHomeData _self;
  final $Res Function(_VentorHomeData) _then;

/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? display_name = null,Object? mood_checkin_today = freezed,Object? streak = freezed,Object? upcoming_session = freezed,Object? recent_sessions = null,Object? motivation = freezed,}) {
  return _then(_VentorHomeData(
display_name: null == display_name ? _self.display_name : display_name // ignore: cast_nullable_to_non_nullable
as String,mood_checkin_today: freezed == mood_checkin_today ? _self.mood_checkin_today : mood_checkin_today // ignore: cast_nullable_to_non_nullable
as VentorHomeMoodCheckinModel?,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as VentorHomeStreakModel?,upcoming_session: freezed == upcoming_session ? _self.upcoming_session : upcoming_session // ignore: cast_nullable_to_non_nullable
as VentorHomeBookedSessionModel?,recent_sessions: null == recent_sessions ? _self._recent_sessions : recent_sessions // ignore: cast_nullable_to_non_nullable
as List<VentorHomeRecentSessionModel>,motivation: freezed == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeMoodCheckinModelCopyWith<$Res>? get mood_checkin_today {
    if (_self.mood_checkin_today == null) {
    return null;
  }

  return $VentorHomeMoodCheckinModelCopyWith<$Res>(_self.mood_checkin_today!, (value) {
    return _then(_self.copyWith(mood_checkin_today: value));
  });
}/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeStreakModelCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $VentorHomeStreakModelCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}/// Create a copy of VentorHomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorHomeBookedSessionModelCopyWith<$Res>? get upcoming_session {
    if (_self.upcoming_session == null) {
    return null;
  }

  return $VentorHomeBookedSessionModelCopyWith<$Res>(_self.upcoming_session!, (value) {
    return _then(_self.copyWith(upcoming_session: value));
  });
}
}


/// @nodoc
mixin _$VentorHomeMoodCheckinModel {

 String get mood; String? get note;
/// Create a copy of VentorHomeMoodCheckinModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorHomeMoodCheckinModelCopyWith<VentorHomeMoodCheckinModel> get copyWith => _$VentorHomeMoodCheckinModelCopyWithImpl<VentorHomeMoodCheckinModel>(this as VentorHomeMoodCheckinModel, _$identity);

  /// Serializes this VentorHomeMoodCheckinModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorHomeMoodCheckinModel&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mood,note);

@override
String toString() {
  return 'VentorHomeMoodCheckinModel(mood: $mood, note: $note)';
}


}

/// @nodoc
abstract mixin class $VentorHomeMoodCheckinModelCopyWith<$Res>  {
  factory $VentorHomeMoodCheckinModelCopyWith(VentorHomeMoodCheckinModel value, $Res Function(VentorHomeMoodCheckinModel) _then) = _$VentorHomeMoodCheckinModelCopyWithImpl;
@useResult
$Res call({
 String mood, String? note
});




}
/// @nodoc
class _$VentorHomeMoodCheckinModelCopyWithImpl<$Res>
    implements $VentorHomeMoodCheckinModelCopyWith<$Res> {
  _$VentorHomeMoodCheckinModelCopyWithImpl(this._self, this._then);

  final VentorHomeMoodCheckinModel _self;
  final $Res Function(VentorHomeMoodCheckinModel) _then;

/// Create a copy of VentorHomeMoodCheckinModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mood = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorHomeMoodCheckinModel].
extension VentorHomeMoodCheckinModelPatterns on VentorHomeMoodCheckinModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorHomeMoodCheckinModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorHomeMoodCheckinModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorHomeMoodCheckinModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorHomeMoodCheckinModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorHomeMoodCheckinModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorHomeMoodCheckinModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String mood,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorHomeMoodCheckinModel() when $default != null:
return $default(_that.mood,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String mood,  String? note)  $default,) {final _that = this;
switch (_that) {
case _VentorHomeMoodCheckinModel():
return $default(_that.mood,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String mood,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _VentorHomeMoodCheckinModel() when $default != null:
return $default(_that.mood,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorHomeMoodCheckinModel implements VentorHomeMoodCheckinModel {
  const _VentorHomeMoodCheckinModel({this.mood = '', this.note});
  factory _VentorHomeMoodCheckinModel.fromJson(Map<String, dynamic> json) => _$VentorHomeMoodCheckinModelFromJson(json);

@override@JsonKey() final  String mood;
@override final  String? note;

/// Create a copy of VentorHomeMoodCheckinModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorHomeMoodCheckinModelCopyWith<_VentorHomeMoodCheckinModel> get copyWith => __$VentorHomeMoodCheckinModelCopyWithImpl<_VentorHomeMoodCheckinModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorHomeMoodCheckinModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorHomeMoodCheckinModel&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mood,note);

@override
String toString() {
  return 'VentorHomeMoodCheckinModel(mood: $mood, note: $note)';
}


}

/// @nodoc
abstract mixin class _$VentorHomeMoodCheckinModelCopyWith<$Res> implements $VentorHomeMoodCheckinModelCopyWith<$Res> {
  factory _$VentorHomeMoodCheckinModelCopyWith(_VentorHomeMoodCheckinModel value, $Res Function(_VentorHomeMoodCheckinModel) _then) = __$VentorHomeMoodCheckinModelCopyWithImpl;
@override @useResult
$Res call({
 String mood, String? note
});




}
/// @nodoc
class __$VentorHomeMoodCheckinModelCopyWithImpl<$Res>
    implements _$VentorHomeMoodCheckinModelCopyWith<$Res> {
  __$VentorHomeMoodCheckinModelCopyWithImpl(this._self, this._then);

  final _VentorHomeMoodCheckinModel _self;
  final $Res Function(_VentorHomeMoodCheckinModel) _then;

/// Create a copy of VentorHomeMoodCheckinModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mood = null,Object? note = freezed,}) {
  return _then(_VentorHomeMoodCheckinModel(
mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VentorHomeStreakModel {

 int get current_days; int get target_days; String? get reward_offer_id; int get discount_percent;
/// Create a copy of VentorHomeStreakModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorHomeStreakModelCopyWith<VentorHomeStreakModel> get copyWith => _$VentorHomeStreakModelCopyWithImpl<VentorHomeStreakModel>(this as VentorHomeStreakModel, _$identity);

  /// Serializes this VentorHomeStreakModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorHomeStreakModel&&(identical(other.current_days, current_days) || other.current_days == current_days)&&(identical(other.target_days, target_days) || other.target_days == target_days)&&(identical(other.reward_offer_id, reward_offer_id) || other.reward_offer_id == reward_offer_id)&&(identical(other.discount_percent, discount_percent) || other.discount_percent == discount_percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current_days,target_days,reward_offer_id,discount_percent);

@override
String toString() {
  return 'VentorHomeStreakModel(current_days: $current_days, target_days: $target_days, reward_offer_id: $reward_offer_id, discount_percent: $discount_percent)';
}


}

/// @nodoc
abstract mixin class $VentorHomeStreakModelCopyWith<$Res>  {
  factory $VentorHomeStreakModelCopyWith(VentorHomeStreakModel value, $Res Function(VentorHomeStreakModel) _then) = _$VentorHomeStreakModelCopyWithImpl;
@useResult
$Res call({
 int current_days, int target_days, String? reward_offer_id, int discount_percent
});




}
/// @nodoc
class _$VentorHomeStreakModelCopyWithImpl<$Res>
    implements $VentorHomeStreakModelCopyWith<$Res> {
  _$VentorHomeStreakModelCopyWithImpl(this._self, this._then);

  final VentorHomeStreakModel _self;
  final $Res Function(VentorHomeStreakModel) _then;

/// Create a copy of VentorHomeStreakModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current_days = null,Object? target_days = null,Object? reward_offer_id = freezed,Object? discount_percent = null,}) {
  return _then(_self.copyWith(
current_days: null == current_days ? _self.current_days : current_days // ignore: cast_nullable_to_non_nullable
as int,target_days: null == target_days ? _self.target_days : target_days // ignore: cast_nullable_to_non_nullable
as int,reward_offer_id: freezed == reward_offer_id ? _self.reward_offer_id : reward_offer_id // ignore: cast_nullable_to_non_nullable
as String?,discount_percent: null == discount_percent ? _self.discount_percent : discount_percent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorHomeStreakModel].
extension VentorHomeStreakModelPatterns on VentorHomeStreakModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorHomeStreakModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorHomeStreakModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorHomeStreakModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorHomeStreakModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorHomeStreakModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorHomeStreakModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int current_days,  int target_days,  String? reward_offer_id,  int discount_percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorHomeStreakModel() when $default != null:
return $default(_that.current_days,_that.target_days,_that.reward_offer_id,_that.discount_percent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int current_days,  int target_days,  String? reward_offer_id,  int discount_percent)  $default,) {final _that = this;
switch (_that) {
case _VentorHomeStreakModel():
return $default(_that.current_days,_that.target_days,_that.reward_offer_id,_that.discount_percent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int current_days,  int target_days,  String? reward_offer_id,  int discount_percent)?  $default,) {final _that = this;
switch (_that) {
case _VentorHomeStreakModel() when $default != null:
return $default(_that.current_days,_that.target_days,_that.reward_offer_id,_that.discount_percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorHomeStreakModel implements VentorHomeStreakModel {
  const _VentorHomeStreakModel({this.current_days = 0, this.target_days = 7, this.reward_offer_id, this.discount_percent = 0});
  factory _VentorHomeStreakModel.fromJson(Map<String, dynamic> json) => _$VentorHomeStreakModelFromJson(json);

@override@JsonKey() final  int current_days;
@override@JsonKey() final  int target_days;
@override final  String? reward_offer_id;
@override@JsonKey() final  int discount_percent;

/// Create a copy of VentorHomeStreakModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorHomeStreakModelCopyWith<_VentorHomeStreakModel> get copyWith => __$VentorHomeStreakModelCopyWithImpl<_VentorHomeStreakModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorHomeStreakModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorHomeStreakModel&&(identical(other.current_days, current_days) || other.current_days == current_days)&&(identical(other.target_days, target_days) || other.target_days == target_days)&&(identical(other.reward_offer_id, reward_offer_id) || other.reward_offer_id == reward_offer_id)&&(identical(other.discount_percent, discount_percent) || other.discount_percent == discount_percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current_days,target_days,reward_offer_id,discount_percent);

@override
String toString() {
  return 'VentorHomeStreakModel(current_days: $current_days, target_days: $target_days, reward_offer_id: $reward_offer_id, discount_percent: $discount_percent)';
}


}

/// @nodoc
abstract mixin class _$VentorHomeStreakModelCopyWith<$Res> implements $VentorHomeStreakModelCopyWith<$Res> {
  factory _$VentorHomeStreakModelCopyWith(_VentorHomeStreakModel value, $Res Function(_VentorHomeStreakModel) _then) = __$VentorHomeStreakModelCopyWithImpl;
@override @useResult
$Res call({
 int current_days, int target_days, String? reward_offer_id, int discount_percent
});




}
/// @nodoc
class __$VentorHomeStreakModelCopyWithImpl<$Res>
    implements _$VentorHomeStreakModelCopyWith<$Res> {
  __$VentorHomeStreakModelCopyWithImpl(this._self, this._then);

  final _VentorHomeStreakModel _self;
  final $Res Function(_VentorHomeStreakModel) _then;

/// Create a copy of VentorHomeStreakModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current_days = null,Object? target_days = null,Object? reward_offer_id = freezed,Object? discount_percent = null,}) {
  return _then(_VentorHomeStreakModel(
current_days: null == current_days ? _self.current_days : current_days // ignore: cast_nullable_to_non_nullable
as int,target_days: null == target_days ? _self.target_days : target_days // ignore: cast_nullable_to_non_nullable
as int,reward_offer_id: freezed == reward_offer_id ? _self.reward_offer_id : reward_offer_id // ignore: cast_nullable_to_non_nullable
as String?,discount_percent: null == discount_percent ? _self.discount_percent : discount_percent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$VentorHomeBookedSessionModel {

 String get id; String get listener_id; String get listener_name; String get listener_avatar_url; int get duration_minutes; String get status; String get call_mode; String get speech_language; num get amount_paid; bool get voice_change_enabled; String? get scheduled_at; num? get refunded_to_balance;
/// Create a copy of VentorHomeBookedSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorHomeBookedSessionModelCopyWith<VentorHomeBookedSessionModel> get copyWith => _$VentorHomeBookedSessionModelCopyWithImpl<VentorHomeBookedSessionModel>(this as VentorHomeBookedSessionModel, _$identity);

  /// Serializes this VentorHomeBookedSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorHomeBookedSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.listener_id, listener_id) || other.listener_id == listener_id)&&(identical(other.listener_name, listener_name) || other.listener_name == listener_name)&&(identical(other.listener_avatar_url, listener_avatar_url) || other.listener_avatar_url == listener_avatar_url)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.call_mode, call_mode) || other.call_mode == call_mode)&&(identical(other.speech_language, speech_language) || other.speech_language == speech_language)&&(identical(other.amount_paid, amount_paid) || other.amount_paid == amount_paid)&&(identical(other.voice_change_enabled, voice_change_enabled) || other.voice_change_enabled == voice_change_enabled)&&(identical(other.scheduled_at, scheduled_at) || other.scheduled_at == scheduled_at)&&(identical(other.refunded_to_balance, refunded_to_balance) || other.refunded_to_balance == refunded_to_balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listener_id,listener_name,listener_avatar_url,duration_minutes,status,call_mode,speech_language,amount_paid,voice_change_enabled,scheduled_at,refunded_to_balance);

@override
String toString() {
  return 'VentorHomeBookedSessionModel(id: $id, listener_id: $listener_id, listener_name: $listener_name, listener_avatar_url: $listener_avatar_url, duration_minutes: $duration_minutes, status: $status, call_mode: $call_mode, speech_language: $speech_language, amount_paid: $amount_paid, voice_change_enabled: $voice_change_enabled, scheduled_at: $scheduled_at, refunded_to_balance: $refunded_to_balance)';
}


}

/// @nodoc
abstract mixin class $VentorHomeBookedSessionModelCopyWith<$Res>  {
  factory $VentorHomeBookedSessionModelCopyWith(VentorHomeBookedSessionModel value, $Res Function(VentorHomeBookedSessionModel) _then) = _$VentorHomeBookedSessionModelCopyWithImpl;
@useResult
$Res call({
 String id, String listener_id, String listener_name, String listener_avatar_url, int duration_minutes, String status, String call_mode, String speech_language, num amount_paid, bool voice_change_enabled, String? scheduled_at, num? refunded_to_balance
});




}
/// @nodoc
class _$VentorHomeBookedSessionModelCopyWithImpl<$Res>
    implements $VentorHomeBookedSessionModelCopyWith<$Res> {
  _$VentorHomeBookedSessionModelCopyWithImpl(this._self, this._then);

  final VentorHomeBookedSessionModel _self;
  final $Res Function(VentorHomeBookedSessionModel) _then;

/// Create a copy of VentorHomeBookedSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? listener_id = null,Object? listener_name = null,Object? listener_avatar_url = null,Object? duration_minutes = null,Object? status = null,Object? call_mode = null,Object? speech_language = null,Object? amount_paid = null,Object? voice_change_enabled = null,Object? scheduled_at = freezed,Object? refunded_to_balance = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listener_id: null == listener_id ? _self.listener_id : listener_id // ignore: cast_nullable_to_non_nullable
as String,listener_name: null == listener_name ? _self.listener_name : listener_name // ignore: cast_nullable_to_non_nullable
as String,listener_avatar_url: null == listener_avatar_url ? _self.listener_avatar_url : listener_avatar_url // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,call_mode: null == call_mode ? _self.call_mode : call_mode // ignore: cast_nullable_to_non_nullable
as String,speech_language: null == speech_language ? _self.speech_language : speech_language // ignore: cast_nullable_to_non_nullable
as String,amount_paid: null == amount_paid ? _self.amount_paid : amount_paid // ignore: cast_nullable_to_non_nullable
as num,voice_change_enabled: null == voice_change_enabled ? _self.voice_change_enabled : voice_change_enabled // ignore: cast_nullable_to_non_nullable
as bool,scheduled_at: freezed == scheduled_at ? _self.scheduled_at : scheduled_at // ignore: cast_nullable_to_non_nullable
as String?,refunded_to_balance: freezed == refunded_to_balance ? _self.refunded_to_balance : refunded_to_balance // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorHomeBookedSessionModel].
extension VentorHomeBookedSessionModelPatterns on VentorHomeBookedSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorHomeBookedSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorHomeBookedSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorHomeBookedSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorHomeBookedSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorHomeBookedSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorHomeBookedSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String listener_id,  String listener_name,  String listener_avatar_url,  int duration_minutes,  String status,  String call_mode,  String speech_language,  num amount_paid,  bool voice_change_enabled,  String? scheduled_at,  num? refunded_to_balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorHomeBookedSessionModel() when $default != null:
return $default(_that.id,_that.listener_id,_that.listener_name,_that.listener_avatar_url,_that.duration_minutes,_that.status,_that.call_mode,_that.speech_language,_that.amount_paid,_that.voice_change_enabled,_that.scheduled_at,_that.refunded_to_balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String listener_id,  String listener_name,  String listener_avatar_url,  int duration_minutes,  String status,  String call_mode,  String speech_language,  num amount_paid,  bool voice_change_enabled,  String? scheduled_at,  num? refunded_to_balance)  $default,) {final _that = this;
switch (_that) {
case _VentorHomeBookedSessionModel():
return $default(_that.id,_that.listener_id,_that.listener_name,_that.listener_avatar_url,_that.duration_minutes,_that.status,_that.call_mode,_that.speech_language,_that.amount_paid,_that.voice_change_enabled,_that.scheduled_at,_that.refunded_to_balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String listener_id,  String listener_name,  String listener_avatar_url,  int duration_minutes,  String status,  String call_mode,  String speech_language,  num amount_paid,  bool voice_change_enabled,  String? scheduled_at,  num? refunded_to_balance)?  $default,) {final _that = this;
switch (_that) {
case _VentorHomeBookedSessionModel() when $default != null:
return $default(_that.id,_that.listener_id,_that.listener_name,_that.listener_avatar_url,_that.duration_minutes,_that.status,_that.call_mode,_that.speech_language,_that.amount_paid,_that.voice_change_enabled,_that.scheduled_at,_that.refunded_to_balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorHomeBookedSessionModel implements VentorHomeBookedSessionModel {
  const _VentorHomeBookedSessionModel({this.id = '', this.listener_id = '', this.listener_name = '', this.listener_avatar_url = '', this.duration_minutes = 0, this.status = 'upcoming', this.call_mode = 'voice', this.speech_language = '', this.amount_paid = 0, this.voice_change_enabled = false, this.scheduled_at, this.refunded_to_balance});
  factory _VentorHomeBookedSessionModel.fromJson(Map<String, dynamic> json) => _$VentorHomeBookedSessionModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String listener_id;
@override@JsonKey() final  String listener_name;
@override@JsonKey() final  String listener_avatar_url;
@override@JsonKey() final  int duration_minutes;
@override@JsonKey() final  String status;
@override@JsonKey() final  String call_mode;
@override@JsonKey() final  String speech_language;
@override@JsonKey() final  num amount_paid;
@override@JsonKey() final  bool voice_change_enabled;
@override final  String? scheduled_at;
@override final  num? refunded_to_balance;

/// Create a copy of VentorHomeBookedSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorHomeBookedSessionModelCopyWith<_VentorHomeBookedSessionModel> get copyWith => __$VentorHomeBookedSessionModelCopyWithImpl<_VentorHomeBookedSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorHomeBookedSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorHomeBookedSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.listener_id, listener_id) || other.listener_id == listener_id)&&(identical(other.listener_name, listener_name) || other.listener_name == listener_name)&&(identical(other.listener_avatar_url, listener_avatar_url) || other.listener_avatar_url == listener_avatar_url)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.call_mode, call_mode) || other.call_mode == call_mode)&&(identical(other.speech_language, speech_language) || other.speech_language == speech_language)&&(identical(other.amount_paid, amount_paid) || other.amount_paid == amount_paid)&&(identical(other.voice_change_enabled, voice_change_enabled) || other.voice_change_enabled == voice_change_enabled)&&(identical(other.scheduled_at, scheduled_at) || other.scheduled_at == scheduled_at)&&(identical(other.refunded_to_balance, refunded_to_balance) || other.refunded_to_balance == refunded_to_balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listener_id,listener_name,listener_avatar_url,duration_minutes,status,call_mode,speech_language,amount_paid,voice_change_enabled,scheduled_at,refunded_to_balance);

@override
String toString() {
  return 'VentorHomeBookedSessionModel(id: $id, listener_id: $listener_id, listener_name: $listener_name, listener_avatar_url: $listener_avatar_url, duration_minutes: $duration_minutes, status: $status, call_mode: $call_mode, speech_language: $speech_language, amount_paid: $amount_paid, voice_change_enabled: $voice_change_enabled, scheduled_at: $scheduled_at, refunded_to_balance: $refunded_to_balance)';
}


}

/// @nodoc
abstract mixin class _$VentorHomeBookedSessionModelCopyWith<$Res> implements $VentorHomeBookedSessionModelCopyWith<$Res> {
  factory _$VentorHomeBookedSessionModelCopyWith(_VentorHomeBookedSessionModel value, $Res Function(_VentorHomeBookedSessionModel) _then) = __$VentorHomeBookedSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String listener_id, String listener_name, String listener_avatar_url, int duration_minutes, String status, String call_mode, String speech_language, num amount_paid, bool voice_change_enabled, String? scheduled_at, num? refunded_to_balance
});




}
/// @nodoc
class __$VentorHomeBookedSessionModelCopyWithImpl<$Res>
    implements _$VentorHomeBookedSessionModelCopyWith<$Res> {
  __$VentorHomeBookedSessionModelCopyWithImpl(this._self, this._then);

  final _VentorHomeBookedSessionModel _self;
  final $Res Function(_VentorHomeBookedSessionModel) _then;

/// Create a copy of VentorHomeBookedSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? listener_id = null,Object? listener_name = null,Object? listener_avatar_url = null,Object? duration_minutes = null,Object? status = null,Object? call_mode = null,Object? speech_language = null,Object? amount_paid = null,Object? voice_change_enabled = null,Object? scheduled_at = freezed,Object? refunded_to_balance = freezed,}) {
  return _then(_VentorHomeBookedSessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listener_id: null == listener_id ? _self.listener_id : listener_id // ignore: cast_nullable_to_non_nullable
as String,listener_name: null == listener_name ? _self.listener_name : listener_name // ignore: cast_nullable_to_non_nullable
as String,listener_avatar_url: null == listener_avatar_url ? _self.listener_avatar_url : listener_avatar_url // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,call_mode: null == call_mode ? _self.call_mode : call_mode // ignore: cast_nullable_to_non_nullable
as String,speech_language: null == speech_language ? _self.speech_language : speech_language // ignore: cast_nullable_to_non_nullable
as String,amount_paid: null == amount_paid ? _self.amount_paid : amount_paid // ignore: cast_nullable_to_non_nullable
as num,voice_change_enabled: null == voice_change_enabled ? _self.voice_change_enabled : voice_change_enabled // ignore: cast_nullable_to_non_nullable
as bool,scheduled_at: freezed == scheduled_at ? _self.scheduled_at : scheduled_at // ignore: cast_nullable_to_non_nullable
as String?,refunded_to_balance: freezed == refunded_to_balance ? _self.refunded_to_balance : refunded_to_balance // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}


}


/// @nodoc
mixin _$VentorHomeRecentSessionModel {

 String get id; String get listener_name; String get listener_avatar_url; String get when_label; int get duration_minutes; bool get is_favorite;
/// Create a copy of VentorHomeRecentSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorHomeRecentSessionModelCopyWith<VentorHomeRecentSessionModel> get copyWith => _$VentorHomeRecentSessionModelCopyWithImpl<VentorHomeRecentSessionModel>(this as VentorHomeRecentSessionModel, _$identity);

  /// Serializes this VentorHomeRecentSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorHomeRecentSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.listener_name, listener_name) || other.listener_name == listener_name)&&(identical(other.listener_avatar_url, listener_avatar_url) || other.listener_avatar_url == listener_avatar_url)&&(identical(other.when_label, when_label) || other.when_label == when_label)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&(identical(other.is_favorite, is_favorite) || other.is_favorite == is_favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listener_name,listener_avatar_url,when_label,duration_minutes,is_favorite);

@override
String toString() {
  return 'VentorHomeRecentSessionModel(id: $id, listener_name: $listener_name, listener_avatar_url: $listener_avatar_url, when_label: $when_label, duration_minutes: $duration_minutes, is_favorite: $is_favorite)';
}


}

/// @nodoc
abstract mixin class $VentorHomeRecentSessionModelCopyWith<$Res>  {
  factory $VentorHomeRecentSessionModelCopyWith(VentorHomeRecentSessionModel value, $Res Function(VentorHomeRecentSessionModel) _then) = _$VentorHomeRecentSessionModelCopyWithImpl;
@useResult
$Res call({
 String id, String listener_name, String listener_avatar_url, String when_label, int duration_minutes, bool is_favorite
});




}
/// @nodoc
class _$VentorHomeRecentSessionModelCopyWithImpl<$Res>
    implements $VentorHomeRecentSessionModelCopyWith<$Res> {
  _$VentorHomeRecentSessionModelCopyWithImpl(this._self, this._then);

  final VentorHomeRecentSessionModel _self;
  final $Res Function(VentorHomeRecentSessionModel) _then;

/// Create a copy of VentorHomeRecentSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? listener_name = null,Object? listener_avatar_url = null,Object? when_label = null,Object? duration_minutes = null,Object? is_favorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listener_name: null == listener_name ? _self.listener_name : listener_name // ignore: cast_nullable_to_non_nullable
as String,listener_avatar_url: null == listener_avatar_url ? _self.listener_avatar_url : listener_avatar_url // ignore: cast_nullable_to_non_nullable
as String,when_label: null == when_label ? _self.when_label : when_label // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,is_favorite: null == is_favorite ? _self.is_favorite : is_favorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorHomeRecentSessionModel].
extension VentorHomeRecentSessionModelPatterns on VentorHomeRecentSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorHomeRecentSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorHomeRecentSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorHomeRecentSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorHomeRecentSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorHomeRecentSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorHomeRecentSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String listener_name,  String listener_avatar_url,  String when_label,  int duration_minutes,  bool is_favorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorHomeRecentSessionModel() when $default != null:
return $default(_that.id,_that.listener_name,_that.listener_avatar_url,_that.when_label,_that.duration_minutes,_that.is_favorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String listener_name,  String listener_avatar_url,  String when_label,  int duration_minutes,  bool is_favorite)  $default,) {final _that = this;
switch (_that) {
case _VentorHomeRecentSessionModel():
return $default(_that.id,_that.listener_name,_that.listener_avatar_url,_that.when_label,_that.duration_minutes,_that.is_favorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String listener_name,  String listener_avatar_url,  String when_label,  int duration_minutes,  bool is_favorite)?  $default,) {final _that = this;
switch (_that) {
case _VentorHomeRecentSessionModel() when $default != null:
return $default(_that.id,_that.listener_name,_that.listener_avatar_url,_that.when_label,_that.duration_minutes,_that.is_favorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorHomeRecentSessionModel implements VentorHomeRecentSessionModel {
  const _VentorHomeRecentSessionModel({this.id = '', this.listener_name = '', this.listener_avatar_url = '', this.when_label = '', this.duration_minutes = 0, this.is_favorite = false});
  factory _VentorHomeRecentSessionModel.fromJson(Map<String, dynamic> json) => _$VentorHomeRecentSessionModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String listener_name;
@override@JsonKey() final  String listener_avatar_url;
@override@JsonKey() final  String when_label;
@override@JsonKey() final  int duration_minutes;
@override@JsonKey() final  bool is_favorite;

/// Create a copy of VentorHomeRecentSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorHomeRecentSessionModelCopyWith<_VentorHomeRecentSessionModel> get copyWith => __$VentorHomeRecentSessionModelCopyWithImpl<_VentorHomeRecentSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorHomeRecentSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorHomeRecentSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.listener_name, listener_name) || other.listener_name == listener_name)&&(identical(other.listener_avatar_url, listener_avatar_url) || other.listener_avatar_url == listener_avatar_url)&&(identical(other.when_label, when_label) || other.when_label == when_label)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&(identical(other.is_favorite, is_favorite) || other.is_favorite == is_favorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listener_name,listener_avatar_url,when_label,duration_minutes,is_favorite);

@override
String toString() {
  return 'VentorHomeRecentSessionModel(id: $id, listener_name: $listener_name, listener_avatar_url: $listener_avatar_url, when_label: $when_label, duration_minutes: $duration_minutes, is_favorite: $is_favorite)';
}


}

/// @nodoc
abstract mixin class _$VentorHomeRecentSessionModelCopyWith<$Res> implements $VentorHomeRecentSessionModelCopyWith<$Res> {
  factory _$VentorHomeRecentSessionModelCopyWith(_VentorHomeRecentSessionModel value, $Res Function(_VentorHomeRecentSessionModel) _then) = __$VentorHomeRecentSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String listener_name, String listener_avatar_url, String when_label, int duration_minutes, bool is_favorite
});




}
/// @nodoc
class __$VentorHomeRecentSessionModelCopyWithImpl<$Res>
    implements _$VentorHomeRecentSessionModelCopyWith<$Res> {
  __$VentorHomeRecentSessionModelCopyWithImpl(this._self, this._then);

  final _VentorHomeRecentSessionModel _self;
  final $Res Function(_VentorHomeRecentSessionModel) _then;

/// Create a copy of VentorHomeRecentSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? listener_name = null,Object? listener_avatar_url = null,Object? when_label = null,Object? duration_minutes = null,Object? is_favorite = null,}) {
  return _then(_VentorHomeRecentSessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listener_name: null == listener_name ? _self.listener_name : listener_name // ignore: cast_nullable_to_non_nullable
as String,listener_avatar_url: null == listener_avatar_url ? _self.listener_avatar_url : listener_avatar_url // ignore: cast_nullable_to_non_nullable
as String,when_label: null == when_label ? _self.when_label : when_label // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,is_favorite: null == is_favorite ? _self.is_favorite : is_favorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
