// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_profile_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerProfileResponseModel {

 String get status; ListenerProfileData get data;
/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerProfileResponseModelCopyWith<ListenerProfileResponseModel> get copyWith => _$ListenerProfileResponseModelCopyWithImpl<ListenerProfileResponseModel>(this as ListenerProfileResponseModel, _$identity);

  /// Serializes this ListenerProfileResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerProfileResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerProfileResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerProfileResponseModelCopyWith<$Res>  {
  factory $ListenerProfileResponseModelCopyWith(ListenerProfileResponseModel value, $Res Function(ListenerProfileResponseModel) _then) = _$ListenerProfileResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerProfileData data
});


$ListenerProfileDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerProfileResponseModelCopyWithImpl<$Res>
    implements $ListenerProfileResponseModelCopyWith<$Res> {
  _$ListenerProfileResponseModelCopyWithImpl(this._self, this._then);

  final ListenerProfileResponseModel _self;
  final $Res Function(ListenerProfileResponseModel) _then;

/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerProfileData,
  ));
}
/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerProfileDataCopyWith<$Res> get data {
  
  return $ListenerProfileDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerProfileResponseModel].
extension ListenerProfileResponseModelPatterns on ListenerProfileResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerProfileResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerProfileResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerProfileResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerProfileData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerProfileData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerProfileData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerProfileResponseModel implements ListenerProfileResponseModel {
  const _ListenerProfileResponseModel({required this.status, required this.data});
  factory _ListenerProfileResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerProfileResponseModelFromJson(json);

@override final  String status;
@override final  ListenerProfileData data;

/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerProfileResponseModelCopyWith<_ListenerProfileResponseModel> get copyWith => __$ListenerProfileResponseModelCopyWithImpl<_ListenerProfileResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerProfileResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerProfileResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerProfileResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerProfileResponseModelCopyWith<$Res> implements $ListenerProfileResponseModelCopyWith<$Res> {
  factory _$ListenerProfileResponseModelCopyWith(_ListenerProfileResponseModel value, $Res Function(_ListenerProfileResponseModel) _then) = __$ListenerProfileResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerProfileData data
});


@override $ListenerProfileDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerProfileResponseModelCopyWithImpl<$Res>
    implements _$ListenerProfileResponseModelCopyWith<$Res> {
  __$ListenerProfileResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerProfileResponseModel _self;
  final $Res Function(_ListenerProfileResponseModel) _then;

/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerProfileResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerProfileData,
  ));
}

/// Create a copy of ListenerProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerProfileDataCopyWith<$Res> get data {
  
  return $ListenerProfileDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerProfileData {

 String get id; String get full_name; String get email; String get phone; String get phone_country; String? get avatar_url; String? get about_me; String? get country; String get country_iso; String get city; List<String> get language_ids; Object? get life_experiences; Object? get comfort_areas; Object? get boundaries; String? get voice_intro_url; int get voice_intro_seconds; double get rating; int get review_count; int get session_count; bool get is_online; String get profile_status; double get rate_per_minute; String? get date_of_birth; Map<String, dynamic>? get rating_breakdown;
/// Create a copy of ListenerProfileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerProfileDataCopyWith<ListenerProfileData> get copyWith => _$ListenerProfileDataCopyWithImpl<ListenerProfileData>(this as ListenerProfileData, _$identity);

  /// Serializes this ListenerProfileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.full_name, full_name) || other.full_name == full_name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phone_country, phone_country) || other.phone_country == phone_country)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.about_me, about_me) || other.about_me == about_me)&&(identical(other.country, country) || other.country == country)&&(identical(other.country_iso, country_iso) || other.country_iso == country_iso)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other.language_ids, language_ids)&&const DeepCollectionEquality().equals(other.life_experiences, life_experiences)&&const DeepCollectionEquality().equals(other.comfort_areas, comfort_areas)&&const DeepCollectionEquality().equals(other.boundaries, boundaries)&&(identical(other.voice_intro_url, voice_intro_url) || other.voice_intro_url == voice_intro_url)&&(identical(other.voice_intro_seconds, voice_intro_seconds) || other.voice_intro_seconds == voice_intro_seconds)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.review_count, review_count) || other.review_count == review_count)&&(identical(other.session_count, session_count) || other.session_count == session_count)&&(identical(other.is_online, is_online) || other.is_online == is_online)&&(identical(other.profile_status, profile_status) || other.profile_status == profile_status)&&(identical(other.rate_per_minute, rate_per_minute) || other.rate_per_minute == rate_per_minute)&&(identical(other.date_of_birth, date_of_birth) || other.date_of_birth == date_of_birth)&&const DeepCollectionEquality().equals(other.rating_breakdown, rating_breakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,full_name,email,phone,phone_country,avatar_url,about_me,country,country_iso,city,const DeepCollectionEquality().hash(language_ids),const DeepCollectionEquality().hash(life_experiences),const DeepCollectionEquality().hash(comfort_areas),const DeepCollectionEquality().hash(boundaries),voice_intro_url,voice_intro_seconds,rating,review_count,session_count,is_online,profile_status,rate_per_minute,date_of_birth,const DeepCollectionEquality().hash(rating_breakdown)]);

@override
String toString() {
  return 'ListenerProfileData(id: $id, full_name: $full_name, email: $email, phone: $phone, phone_country: $phone_country, avatar_url: $avatar_url, about_me: $about_me, country: $country, country_iso: $country_iso, city: $city, language_ids: $language_ids, life_experiences: $life_experiences, comfort_areas: $comfort_areas, boundaries: $boundaries, voice_intro_url: $voice_intro_url, voice_intro_seconds: $voice_intro_seconds, rating: $rating, review_count: $review_count, session_count: $session_count, is_online: $is_online, profile_status: $profile_status, rate_per_minute: $rate_per_minute, date_of_birth: $date_of_birth, rating_breakdown: $rating_breakdown)';
}


}

/// @nodoc
abstract mixin class $ListenerProfileDataCopyWith<$Res>  {
  factory $ListenerProfileDataCopyWith(ListenerProfileData value, $Res Function(ListenerProfileData) _then) = _$ListenerProfileDataCopyWithImpl;
@useResult
$Res call({
 String id, String full_name, String email, String phone, String phone_country, String? avatar_url, String? about_me, String? country, String country_iso, String city, List<String> language_ids, Object? life_experiences, Object? comfort_areas, Object? boundaries, String? voice_intro_url, int voice_intro_seconds, double rating, int review_count, int session_count, bool is_online, String profile_status, double rate_per_minute, String? date_of_birth, Map<String, dynamic>? rating_breakdown
});




}
/// @nodoc
class _$ListenerProfileDataCopyWithImpl<$Res>
    implements $ListenerProfileDataCopyWith<$Res> {
  _$ListenerProfileDataCopyWithImpl(this._self, this._then);

  final ListenerProfileData _self;
  final $Res Function(ListenerProfileData) _then;

/// Create a copy of ListenerProfileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? full_name = null,Object? email = null,Object? phone = null,Object? phone_country = null,Object? avatar_url = freezed,Object? about_me = freezed,Object? country = freezed,Object? country_iso = null,Object? city = null,Object? language_ids = null,Object? life_experiences = freezed,Object? comfort_areas = freezed,Object? boundaries = freezed,Object? voice_intro_url = freezed,Object? voice_intro_seconds = null,Object? rating = null,Object? review_count = null,Object? session_count = null,Object? is_online = null,Object? profile_status = null,Object? rate_per_minute = null,Object? date_of_birth = freezed,Object? rating_breakdown = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,full_name: null == full_name ? _self.full_name : full_name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phone_country: null == phone_country ? _self.phone_country : phone_country // ignore: cast_nullable_to_non_nullable
as String,avatar_url: freezed == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String?,about_me: freezed == about_me ? _self.about_me : about_me // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,country_iso: null == country_iso ? _self.country_iso : country_iso // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,language_ids: null == language_ids ? _self.language_ids : language_ids // ignore: cast_nullable_to_non_nullable
as List<String>,life_experiences: freezed == life_experiences ? _self.life_experiences : life_experiences ,comfort_areas: freezed == comfort_areas ? _self.comfort_areas : comfort_areas ,boundaries: freezed == boundaries ? _self.boundaries : boundaries ,voice_intro_url: freezed == voice_intro_url ? _self.voice_intro_url : voice_intro_url // ignore: cast_nullable_to_non_nullable
as String?,voice_intro_seconds: null == voice_intro_seconds ? _self.voice_intro_seconds : voice_intro_seconds // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,review_count: null == review_count ? _self.review_count : review_count // ignore: cast_nullable_to_non_nullable
as int,session_count: null == session_count ? _self.session_count : session_count // ignore: cast_nullable_to_non_nullable
as int,is_online: null == is_online ? _self.is_online : is_online // ignore: cast_nullable_to_non_nullable
as bool,profile_status: null == profile_status ? _self.profile_status : profile_status // ignore: cast_nullable_to_non_nullable
as String,rate_per_minute: null == rate_per_minute ? _self.rate_per_minute : rate_per_minute // ignore: cast_nullable_to_non_nullable
as double,date_of_birth: freezed == date_of_birth ? _self.date_of_birth : date_of_birth // ignore: cast_nullable_to_non_nullable
as String?,rating_breakdown: freezed == rating_breakdown ? _self.rating_breakdown : rating_breakdown // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerProfileData].
extension ListenerProfileDataPatterns on ListenerProfileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerProfileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerProfileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerProfileData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerProfileData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String full_name,  String email,  String phone,  String phone_country,  String? avatar_url,  String? about_me,  String? country,  String country_iso,  String city,  List<String> language_ids,  Object? life_experiences,  Object? comfort_areas,  Object? boundaries,  String? voice_intro_url,  int voice_intro_seconds,  double rating,  int review_count,  int session_count,  bool is_online,  String profile_status,  double rate_per_minute,  String? date_of_birth,  Map<String, dynamic>? rating_breakdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerProfileData() when $default != null:
return $default(_that.id,_that.full_name,_that.email,_that.phone,_that.phone_country,_that.avatar_url,_that.about_me,_that.country,_that.country_iso,_that.city,_that.language_ids,_that.life_experiences,_that.comfort_areas,_that.boundaries,_that.voice_intro_url,_that.voice_intro_seconds,_that.rating,_that.review_count,_that.session_count,_that.is_online,_that.profile_status,_that.rate_per_minute,_that.date_of_birth,_that.rating_breakdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String full_name,  String email,  String phone,  String phone_country,  String? avatar_url,  String? about_me,  String? country,  String country_iso,  String city,  List<String> language_ids,  Object? life_experiences,  Object? comfort_areas,  Object? boundaries,  String? voice_intro_url,  int voice_intro_seconds,  double rating,  int review_count,  int session_count,  bool is_online,  String profile_status,  double rate_per_minute,  String? date_of_birth,  Map<String, dynamic>? rating_breakdown)  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileData():
return $default(_that.id,_that.full_name,_that.email,_that.phone,_that.phone_country,_that.avatar_url,_that.about_me,_that.country,_that.country_iso,_that.city,_that.language_ids,_that.life_experiences,_that.comfort_areas,_that.boundaries,_that.voice_intro_url,_that.voice_intro_seconds,_that.rating,_that.review_count,_that.session_count,_that.is_online,_that.profile_status,_that.rate_per_minute,_that.date_of_birth,_that.rating_breakdown);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String full_name,  String email,  String phone,  String phone_country,  String? avatar_url,  String? about_me,  String? country,  String country_iso,  String city,  List<String> language_ids,  Object? life_experiences,  Object? comfort_areas,  Object? boundaries,  String? voice_intro_url,  int voice_intro_seconds,  double rating,  int review_count,  int session_count,  bool is_online,  String profile_status,  double rate_per_minute,  String? date_of_birth,  Map<String, dynamic>? rating_breakdown)?  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileData() when $default != null:
return $default(_that.id,_that.full_name,_that.email,_that.phone,_that.phone_country,_that.avatar_url,_that.about_me,_that.country,_that.country_iso,_that.city,_that.language_ids,_that.life_experiences,_that.comfort_areas,_that.boundaries,_that.voice_intro_url,_that.voice_intro_seconds,_that.rating,_that.review_count,_that.session_count,_that.is_online,_that.profile_status,_that.rate_per_minute,_that.date_of_birth,_that.rating_breakdown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerProfileData implements ListenerProfileData {
  const _ListenerProfileData({this.id = '', this.full_name = '', this.email = '', this.phone = '', this.phone_country = '', this.avatar_url, this.about_me, this.country, this.country_iso = '', this.city = '', final  List<String> language_ids = const <String>[], this.life_experiences, this.comfort_areas, this.boundaries, this.voice_intro_url, this.voice_intro_seconds = 0, this.rating = 0.0, this.review_count = 0, this.session_count = 0, this.is_online = false, this.profile_status = '', this.rate_per_minute = 0.0, this.date_of_birth, final  Map<String, dynamic>? rating_breakdown}): _language_ids = language_ids,_rating_breakdown = rating_breakdown;
  factory _ListenerProfileData.fromJson(Map<String, dynamic> json) => _$ListenerProfileDataFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String full_name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String phone_country;
@override final  String? avatar_url;
@override final  String? about_me;
@override final  String? country;
@override@JsonKey() final  String country_iso;
@override@JsonKey() final  String city;
 final  List<String> _language_ids;
@override@JsonKey() List<String> get language_ids {
  if (_language_ids is EqualUnmodifiableListView) return _language_ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_language_ids);
}

@override final  Object? life_experiences;
@override final  Object? comfort_areas;
@override final  Object? boundaries;
@override final  String? voice_intro_url;
@override@JsonKey() final  int voice_intro_seconds;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int review_count;
@override@JsonKey() final  int session_count;
@override@JsonKey() final  bool is_online;
@override@JsonKey() final  String profile_status;
@override@JsonKey() final  double rate_per_minute;
@override final  String? date_of_birth;
 final  Map<String, dynamic>? _rating_breakdown;
@override Map<String, dynamic>? get rating_breakdown {
  final value = _rating_breakdown;
  if (value == null) return null;
  if (_rating_breakdown is EqualUnmodifiableMapView) return _rating_breakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ListenerProfileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerProfileDataCopyWith<_ListenerProfileData> get copyWith => __$ListenerProfileDataCopyWithImpl<_ListenerProfileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerProfileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.full_name, full_name) || other.full_name == full_name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phone_country, phone_country) || other.phone_country == phone_country)&&(identical(other.avatar_url, avatar_url) || other.avatar_url == avatar_url)&&(identical(other.about_me, about_me) || other.about_me == about_me)&&(identical(other.country, country) || other.country == country)&&(identical(other.country_iso, country_iso) || other.country_iso == country_iso)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other._language_ids, _language_ids)&&const DeepCollectionEquality().equals(other.life_experiences, life_experiences)&&const DeepCollectionEquality().equals(other.comfort_areas, comfort_areas)&&const DeepCollectionEquality().equals(other.boundaries, boundaries)&&(identical(other.voice_intro_url, voice_intro_url) || other.voice_intro_url == voice_intro_url)&&(identical(other.voice_intro_seconds, voice_intro_seconds) || other.voice_intro_seconds == voice_intro_seconds)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.review_count, review_count) || other.review_count == review_count)&&(identical(other.session_count, session_count) || other.session_count == session_count)&&(identical(other.is_online, is_online) || other.is_online == is_online)&&(identical(other.profile_status, profile_status) || other.profile_status == profile_status)&&(identical(other.rate_per_minute, rate_per_minute) || other.rate_per_minute == rate_per_minute)&&(identical(other.date_of_birth, date_of_birth) || other.date_of_birth == date_of_birth)&&const DeepCollectionEquality().equals(other._rating_breakdown, _rating_breakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,full_name,email,phone,phone_country,avatar_url,about_me,country,country_iso,city,const DeepCollectionEquality().hash(_language_ids),const DeepCollectionEquality().hash(life_experiences),const DeepCollectionEquality().hash(comfort_areas),const DeepCollectionEquality().hash(boundaries),voice_intro_url,voice_intro_seconds,rating,review_count,session_count,is_online,profile_status,rate_per_minute,date_of_birth,const DeepCollectionEquality().hash(_rating_breakdown)]);

@override
String toString() {
  return 'ListenerProfileData(id: $id, full_name: $full_name, email: $email, phone: $phone, phone_country: $phone_country, avatar_url: $avatar_url, about_me: $about_me, country: $country, country_iso: $country_iso, city: $city, language_ids: $language_ids, life_experiences: $life_experiences, comfort_areas: $comfort_areas, boundaries: $boundaries, voice_intro_url: $voice_intro_url, voice_intro_seconds: $voice_intro_seconds, rating: $rating, review_count: $review_count, session_count: $session_count, is_online: $is_online, profile_status: $profile_status, rate_per_minute: $rate_per_minute, date_of_birth: $date_of_birth, rating_breakdown: $rating_breakdown)';
}


}

/// @nodoc
abstract mixin class _$ListenerProfileDataCopyWith<$Res> implements $ListenerProfileDataCopyWith<$Res> {
  factory _$ListenerProfileDataCopyWith(_ListenerProfileData value, $Res Function(_ListenerProfileData) _then) = __$ListenerProfileDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String full_name, String email, String phone, String phone_country, String? avatar_url, String? about_me, String? country, String country_iso, String city, List<String> language_ids, Object? life_experiences, Object? comfort_areas, Object? boundaries, String? voice_intro_url, int voice_intro_seconds, double rating, int review_count, int session_count, bool is_online, String profile_status, double rate_per_minute, String? date_of_birth, Map<String, dynamic>? rating_breakdown
});




}
/// @nodoc
class __$ListenerProfileDataCopyWithImpl<$Res>
    implements _$ListenerProfileDataCopyWith<$Res> {
  __$ListenerProfileDataCopyWithImpl(this._self, this._then);

  final _ListenerProfileData _self;
  final $Res Function(_ListenerProfileData) _then;

/// Create a copy of ListenerProfileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? full_name = null,Object? email = null,Object? phone = null,Object? phone_country = null,Object? avatar_url = freezed,Object? about_me = freezed,Object? country = freezed,Object? country_iso = null,Object? city = null,Object? language_ids = null,Object? life_experiences = freezed,Object? comfort_areas = freezed,Object? boundaries = freezed,Object? voice_intro_url = freezed,Object? voice_intro_seconds = null,Object? rating = null,Object? review_count = null,Object? session_count = null,Object? is_online = null,Object? profile_status = null,Object? rate_per_minute = null,Object? date_of_birth = freezed,Object? rating_breakdown = freezed,}) {
  return _then(_ListenerProfileData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,full_name: null == full_name ? _self.full_name : full_name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phone_country: null == phone_country ? _self.phone_country : phone_country // ignore: cast_nullable_to_non_nullable
as String,avatar_url: freezed == avatar_url ? _self.avatar_url : avatar_url // ignore: cast_nullable_to_non_nullable
as String?,about_me: freezed == about_me ? _self.about_me : about_me // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,country_iso: null == country_iso ? _self.country_iso : country_iso // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,language_ids: null == language_ids ? _self._language_ids : language_ids // ignore: cast_nullable_to_non_nullable
as List<String>,life_experiences: freezed == life_experiences ? _self.life_experiences : life_experiences ,comfort_areas: freezed == comfort_areas ? _self.comfort_areas : comfort_areas ,boundaries: freezed == boundaries ? _self.boundaries : boundaries ,voice_intro_url: freezed == voice_intro_url ? _self.voice_intro_url : voice_intro_url // ignore: cast_nullable_to_non_nullable
as String?,voice_intro_seconds: null == voice_intro_seconds ? _self.voice_intro_seconds : voice_intro_seconds // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,review_count: null == review_count ? _self.review_count : review_count // ignore: cast_nullable_to_non_nullable
as int,session_count: null == session_count ? _self.session_count : session_count // ignore: cast_nullable_to_non_nullable
as int,is_online: null == is_online ? _self.is_online : is_online // ignore: cast_nullable_to_non_nullable
as bool,profile_status: null == profile_status ? _self.profile_status : profile_status // ignore: cast_nullable_to_non_nullable
as String,rate_per_minute: null == rate_per_minute ? _self.rate_per_minute : rate_per_minute // ignore: cast_nullable_to_non_nullable
as double,date_of_birth: freezed == date_of_birth ? _self.date_of_birth : date_of_birth // ignore: cast_nullable_to_non_nullable
as String?,rating_breakdown: freezed == rating_breakdown ? _self._rating_breakdown : rating_breakdown // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
