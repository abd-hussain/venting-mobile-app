// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_profile_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorProfileResponseModel {

 String get status; VentorProfileData get data;
/// Create a copy of VentorProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorProfileResponseModelCopyWith<VentorProfileResponseModel> get copyWith => _$VentorProfileResponseModelCopyWithImpl<VentorProfileResponseModel>(this as VentorProfileResponseModel, _$identity);

  /// Serializes this VentorProfileResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorProfileResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorProfileResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorProfileResponseModelCopyWith<$Res>  {
  factory $VentorProfileResponseModelCopyWith(VentorProfileResponseModel value, $Res Function(VentorProfileResponseModel) _then) = _$VentorProfileResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorProfileData data
});


$VentorProfileDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorProfileResponseModelCopyWithImpl<$Res>
    implements $VentorProfileResponseModelCopyWith<$Res> {
  _$VentorProfileResponseModelCopyWithImpl(this._self, this._then);

  final VentorProfileResponseModel _self;
  final $Res Function(VentorProfileResponseModel) _then;

/// Create a copy of VentorProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorProfileData,
  ));
}
/// Create a copy of VentorProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorProfileDataCopyWith<$Res> get data {
  
  return $VentorProfileDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorProfileResponseModel].
extension VentorProfileResponseModelPatterns on VentorProfileResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorProfileResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorProfileResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorProfileResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorProfileResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorProfileData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorProfileData data)  $default,) {final _that = this;
switch (_that) {
case _VentorProfileResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorProfileData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorProfileResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorProfileResponseModel implements VentorProfileResponseModel {
  const _VentorProfileResponseModel({required this.status, required this.data});
  factory _VentorProfileResponseModel.fromJson(Map<String, dynamic> json) => _$VentorProfileResponseModelFromJson(json);

@override final  String status;
@override final  VentorProfileData data;

/// Create a copy of VentorProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorProfileResponseModelCopyWith<_VentorProfileResponseModel> get copyWith => __$VentorProfileResponseModelCopyWithImpl<_VentorProfileResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorProfileResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorProfileResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorProfileResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorProfileResponseModelCopyWith<$Res> implements $VentorProfileResponseModelCopyWith<$Res> {
  factory _$VentorProfileResponseModelCopyWith(_VentorProfileResponseModel value, $Res Function(_VentorProfileResponseModel) _then) = __$VentorProfileResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorProfileData data
});


@override $VentorProfileDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorProfileResponseModelCopyWithImpl<$Res>
    implements _$VentorProfileResponseModelCopyWith<$Res> {
  __$VentorProfileResponseModelCopyWithImpl(this._self, this._then);

  final _VentorProfileResponseModel _self;
  final $Res Function(_VentorProfileResponseModel) _then;

/// Create a copy of VentorProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorProfileResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorProfileData,
  ));
}

/// Create a copy of VentorProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorProfileDataCopyWith<$Res> get data {
  
  return $VentorProfileDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorProfileData {

 String get id; String get nickname; String? get email; String? get avatar_url; String? get gender; String? get quote; bool get is_anonymous; VentorProfileStats? get stats; List<String> get language_ids; List<String> get interest_ids; String? get other_interest_text;
/// Create a copy of VentorProfileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorProfileDataCopyWith<VentorProfileData> get copyWith => _$VentorProfileDataCopyWithImpl<VentorProfileData>(this as VentorProfileData, _$identity);

  /// Serializes this VentorProfileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.is_anonymous, is_anonymous) || other.is_anonymous == is_anonymous)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other.language_ids, language_ids)&&const DeepCollectionEquality().equals(other.interest_ids, interest_ids)&&(identical(other.other_interest_text, other_interest_text) || other.other_interest_text == other_interest_text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,email,avatar_url,gender,quote,is_anonymous,stats,const DeepCollectionEquality().hash(language_ids),const DeepCollectionEquality().hash(interest_ids),other_interest_text);

@override
String toString() {
  return 'VentorProfileData(id: $id, nickname: $nickname, email: $email, avatar_url: $avatar_url, gender: $gender, quote: $quote, is_anonymous: $is_anonymous, stats: $stats, language_ids: $language_ids, interest_ids: $interest_ids, other_interest_text: $other_interest_text)';
}


}

/// @nodoc
abstract mixin class $VentorProfileDataCopyWith<$Res>  {
  factory $VentorProfileDataCopyWith(VentorProfileData value, $Res Function(VentorProfileData) _then) = _$VentorProfileDataCopyWithImpl;
@useResult
$Res call({
 String id, String nickname, String? email, String? avatar_url, String? gender, String? quote, bool is_anonymous, VentorProfileStats? stats, List<String> language_ids, List<String> interest_ids, String? other_interest_text
});


$VentorProfileStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class _$VentorProfileDataCopyWithImpl<$Res>
    implements $VentorProfileDataCopyWith<$Res> {
  _$VentorProfileDataCopyWithImpl(this._self, this._then);

  final VentorProfileData _self;
  final $Res Function(VentorProfileData) _then;

/// Create a copy of VentorProfileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nickname = null,Object? email = freezed,Object? avatar_url = freezed,Object? gender = freezed,Object? quote = freezed,Object? is_anonymous = null,Object? stats = freezed,Object? language_ids = null,Object? interest_ids = null,Object? other_interest_text = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatar_url: freezed == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,is_anonymous: null == is_anonymous ? _self.is_anonymous : is_anonymous // ignore: cast_nullable_to_non_nullable
as bool,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as VentorProfileStats?,language_ids: null == language_ids ? _self.language_ids : language_ids // ignore: cast_nullable_to_non_nullable
as List<String>,interest_ids: null == interest_ids ? _self.interest_ids : interest_ids // ignore: cast_nullable_to_non_nullable
as List<String>,other_interest_text: freezed == other_interest_text ? _self.other_interest_text : other_interest_text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VentorProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorProfileStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $VentorProfileStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorProfileData].
extension VentorProfileDataPatterns on VentorProfileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorProfileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorProfileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorProfileData value)  $default,){
final _that = this;
switch (_that) {
case _VentorProfileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorProfileData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorProfileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nickname,  String? email,  String? avatar_url,  String? gender,  String? quote,  bool is_anonymous,  VentorProfileStats? stats,  List<String> language_ids,  List<String> interest_ids,  String? other_interest_text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorProfileData() when $default != null:
return $default(_that.id,_that.nickname,_that.email,_that.avatar_url,_that.gender,_that.quote,_that.is_anonymous,_that.stats,_that.language_ids,_that.interest_ids,_that.other_interest_text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nickname,  String? email,  String? avatar_url,  String? gender,  String? quote,  bool is_anonymous,  VentorProfileStats? stats,  List<String> language_ids,  List<String> interest_ids,  String? other_interest_text)  $default,) {final _that = this;
switch (_that) {
case _VentorProfileData():
return $default(_that.id,_that.nickname,_that.email,_that.avatar_url,_that.gender,_that.quote,_that.is_anonymous,_that.stats,_that.language_ids,_that.interest_ids,_that.other_interest_text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nickname,  String? email,  String? avatar_url,  String? gender,  String? quote,  bool is_anonymous,  VentorProfileStats? stats,  List<String> language_ids,  List<String> interest_ids,  String? other_interest_text)?  $default,) {final _that = this;
switch (_that) {
case _VentorProfileData() when $default != null:
return $default(_that.id,_that.nickname,_that.email,_that.avatar_url,_that.gender,_that.quote,_that.is_anonymous,_that.stats,_that.language_ids,_that.interest_ids,_that.other_interest_text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorProfileData implements VentorProfileData {
  const _VentorProfileData({required this.id, required this.nickname, this.email, this.avatar_url, this.gender, this.quote, this.is_anonymous = true, this.stats, final  List<String> language_ids = const <String>[], final  List<String> interest_ids = const <String>[], this.other_interest_text}): _language_ids = language_ids,_interest_ids = interest_ids;
  factory _VentorProfileData.fromJson(Map<String, dynamic> json) => _$VentorProfileDataFromJson(json);

@override final  String id;
@override final  String nickname;
@override final  String? email;
@override final  String? avatar_url;
@override final  String? gender;
@override final  String? quote;
@override@JsonKey() final  bool is_anonymous;
@override final  VentorProfileStats? stats;
 final  List<String> _language_ids;
@override@JsonKey() List<String> get language_ids {
  if (_language_ids is EqualUnmodifiableListView) return _language_ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_language_ids);
}

 final  List<String> _interest_ids;
@override@JsonKey() List<String> get interest_ids {
  if (_interest_ids is EqualUnmodifiableListView) return _interest_ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interest_ids);
}

@override final  String? other_interest_text;

/// Create a copy of VentorProfileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorProfileDataCopyWith<_VentorProfileData> get copyWith => __$VentorProfileDataCopyWithImpl<_VentorProfileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorProfileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.is_anonymous, is_anonymous) || other.is_anonymous == is_anonymous)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._language_ids, _language_ids)&&const DeepCollectionEquality().equals(other._interest_ids, _interest_ids)&&(identical(other.other_interest_text, other_interest_text) || other.other_interest_text == other_interest_text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,email,avatar_url,gender,quote,is_anonymous,stats,const DeepCollectionEquality().hash(_language_ids),const DeepCollectionEquality().hash(_interest_ids),other_interest_text);

@override
String toString() {
  return 'VentorProfileData(id: $id, nickname: $nickname, email: $email, avatar_url: $avatar_url, gender: $gender, quote: $quote, is_anonymous: $is_anonymous, stats: $stats, language_ids: $language_ids, interest_ids: $interest_ids, other_interest_text: $other_interest_text)';
}


}

/// @nodoc
abstract mixin class _$VentorProfileDataCopyWith<$Res> implements $VentorProfileDataCopyWith<$Res> {
  factory _$VentorProfileDataCopyWith(_VentorProfileData value, $Res Function(_VentorProfileData) _then) = __$VentorProfileDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String nickname, String? email, String? avatar_url, String? gender, String? quote, bool is_anonymous, VentorProfileStats? stats, List<String> language_ids, List<String> interest_ids, String? other_interest_text
});


@override $VentorProfileStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class __$VentorProfileDataCopyWithImpl<$Res>
    implements _$VentorProfileDataCopyWith<$Res> {
  __$VentorProfileDataCopyWithImpl(this._self, this._then);

  final _VentorProfileData _self;
  final $Res Function(_VentorProfileData) _then;

/// Create a copy of VentorProfileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nickname = null,Object? email = freezed,Object? avatar_url = freezed,Object? gender = freezed,Object? quote = freezed,Object? is_anonymous = null,Object? stats = freezed,Object? language_ids = null,Object? interest_ids = null,Object? other_interest_text = freezed,}) {
  return _then(_VentorProfileData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatar_url: freezed == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,is_anonymous: null == is_anonymous ? _self.is_anonymous : is_anonymous // ignore: cast_nullable_to_non_nullable
as bool,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as VentorProfileStats?,language_ids: null == language_ids ? _self._language_ids : language_ids // ignore: cast_nullable_to_non_nullable
as List<String>,interest_ids: null == interest_ids ? _self._interest_ids : interest_ids // ignore: cast_nullable_to_non_nullable
as List<String>,other_interest_text: freezed == other_interest_text ? _self.other_interest_text : other_interest_text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VentorProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorProfileStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $VentorProfileStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$VentorProfileStats {

 int get sessions_count; int get points; int get streak_days;
/// Create a copy of VentorProfileStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorProfileStatsCopyWith<VentorProfileStats> get copyWith => _$VentorProfileStatsCopyWithImpl<VentorProfileStats>(this as VentorProfileStats, _$identity);

  /// Serializes this VentorProfileStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorProfileStats&&(identical(other.sessions_count, sessions_count) || other.sessions_count == sessions_count)&&(identical(other.points, points) || other.points == points)&&(identical(other.streak_days, streak_days) || other.streak_days == streak_days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessions_count,points,streak_days);

@override
String toString() {
  return 'VentorProfileStats(sessions_count: $sessions_count, points: $points, streak_days: $streak_days)';
}


}

/// @nodoc
abstract mixin class $VentorProfileStatsCopyWith<$Res>  {
  factory $VentorProfileStatsCopyWith(VentorProfileStats value, $Res Function(VentorProfileStats) _then) = _$VentorProfileStatsCopyWithImpl;
@useResult
$Res call({
 int sessions_count, int points, int streak_days
});




}
/// @nodoc
class _$VentorProfileStatsCopyWithImpl<$Res>
    implements $VentorProfileStatsCopyWith<$Res> {
  _$VentorProfileStatsCopyWithImpl(this._self, this._then);

  final VentorProfileStats _self;
  final $Res Function(VentorProfileStats) _then;

/// Create a copy of VentorProfileStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions_count = null,Object? points = null,Object? streak_days = null,}) {
  return _then(_self.copyWith(
sessions_count: null == sessions_count ? _self.sessions_count : sessions_count // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,streak_days: null == streak_days ? _self.streak_days : streak_days // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorProfileStats].
extension VentorProfileStatsPatterns on VentorProfileStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorProfileStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorProfileStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorProfileStats value)  $default,){
final _that = this;
switch (_that) {
case _VentorProfileStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorProfileStats value)?  $default,){
final _that = this;
switch (_that) {
case _VentorProfileStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sessions_count,  int points,  int streak_days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorProfileStats() when $default != null:
return $default(_that.sessions_count,_that.points,_that.streak_days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sessions_count,  int points,  int streak_days)  $default,) {final _that = this;
switch (_that) {
case _VentorProfileStats():
return $default(_that.sessions_count,_that.points,_that.streak_days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sessions_count,  int points,  int streak_days)?  $default,) {final _that = this;
switch (_that) {
case _VentorProfileStats() when $default != null:
return $default(_that.sessions_count,_that.points,_that.streak_days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorProfileStats implements VentorProfileStats {
  const _VentorProfileStats({this.sessions_count = 0, this.points = 0, this.streak_days = 0});
  factory _VentorProfileStats.fromJson(Map<String, dynamic> json) => _$VentorProfileStatsFromJson(json);

@override@JsonKey() final  int sessions_count;
@override@JsonKey() final  int points;
@override@JsonKey() final  int streak_days;

/// Create a copy of VentorProfileStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorProfileStatsCopyWith<_VentorProfileStats> get copyWith => __$VentorProfileStatsCopyWithImpl<_VentorProfileStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorProfileStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorProfileStats&&(identical(other.sessions_count, sessions_count) || other.sessions_count == sessions_count)&&(identical(other.points, points) || other.points == points)&&(identical(other.streak_days, streak_days) || other.streak_days == streak_days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessions_count,points,streak_days);

@override
String toString() {
  return 'VentorProfileStats(sessions_count: $sessions_count, points: $points, streak_days: $streak_days)';
}


}

/// @nodoc
abstract mixin class _$VentorProfileStatsCopyWith<$Res> implements $VentorProfileStatsCopyWith<$Res> {
  factory _$VentorProfileStatsCopyWith(_VentorProfileStats value, $Res Function(_VentorProfileStats) _then) = __$VentorProfileStatsCopyWithImpl;
@override @useResult
$Res call({
 int sessions_count, int points, int streak_days
});




}
/// @nodoc
class __$VentorProfileStatsCopyWithImpl<$Res>
    implements _$VentorProfileStatsCopyWith<$Res> {
  __$VentorProfileStatsCopyWithImpl(this._self, this._then);

  final _VentorProfileStats _self;
  final $Res Function(_VentorProfileStats) _then;

/// Create a copy of VentorProfileStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions_count = null,Object? points = null,Object? streak_days = null,}) {
  return _then(_VentorProfileStats(
sessions_count: null == sessions_count ? _self.sessions_count : sessions_count // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,streak_days: null == streak_days ? _self.streak_days : streak_days // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
