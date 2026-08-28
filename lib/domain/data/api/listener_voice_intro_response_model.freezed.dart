// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_voice_intro_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerVoiceIntroResponseModel {

 String get status; ListenerVoiceIntroData get data;
/// Create a copy of ListenerVoiceIntroResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerVoiceIntroResponseModelCopyWith<ListenerVoiceIntroResponseModel> get copyWith => _$ListenerVoiceIntroResponseModelCopyWithImpl<ListenerVoiceIntroResponseModel>(this as ListenerVoiceIntroResponseModel, _$identity);

  /// Serializes this ListenerVoiceIntroResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerVoiceIntroResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerVoiceIntroResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerVoiceIntroResponseModelCopyWith<$Res>  {
  factory $ListenerVoiceIntroResponseModelCopyWith(ListenerVoiceIntroResponseModel value, $Res Function(ListenerVoiceIntroResponseModel) _then) = _$ListenerVoiceIntroResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerVoiceIntroData data
});


$ListenerVoiceIntroDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerVoiceIntroResponseModelCopyWithImpl<$Res>
    implements $ListenerVoiceIntroResponseModelCopyWith<$Res> {
  _$ListenerVoiceIntroResponseModelCopyWithImpl(this._self, this._then);

  final ListenerVoiceIntroResponseModel _self;
  final $Res Function(ListenerVoiceIntroResponseModel) _then;

/// Create a copy of ListenerVoiceIntroResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerVoiceIntroData,
  ));
}
/// Create a copy of ListenerVoiceIntroResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerVoiceIntroDataCopyWith<$Res> get data {
  
  return $ListenerVoiceIntroDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerVoiceIntroResponseModel].
extension ListenerVoiceIntroResponseModelPatterns on ListenerVoiceIntroResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerVoiceIntroResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerVoiceIntroResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerVoiceIntroResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerVoiceIntroResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerVoiceIntroResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerVoiceIntroResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerVoiceIntroData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerVoiceIntroResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerVoiceIntroData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerVoiceIntroResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerVoiceIntroData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerVoiceIntroResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerVoiceIntroResponseModel implements ListenerVoiceIntroResponseModel {
  const _ListenerVoiceIntroResponseModel({required this.status, required this.data});
  factory _ListenerVoiceIntroResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerVoiceIntroResponseModelFromJson(json);

@override final  String status;
@override final  ListenerVoiceIntroData data;

/// Create a copy of ListenerVoiceIntroResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerVoiceIntroResponseModelCopyWith<_ListenerVoiceIntroResponseModel> get copyWith => __$ListenerVoiceIntroResponseModelCopyWithImpl<_ListenerVoiceIntroResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerVoiceIntroResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerVoiceIntroResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerVoiceIntroResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerVoiceIntroResponseModelCopyWith<$Res> implements $ListenerVoiceIntroResponseModelCopyWith<$Res> {
  factory _$ListenerVoiceIntroResponseModelCopyWith(_ListenerVoiceIntroResponseModel value, $Res Function(_ListenerVoiceIntroResponseModel) _then) = __$ListenerVoiceIntroResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerVoiceIntroData data
});


@override $ListenerVoiceIntroDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerVoiceIntroResponseModelCopyWithImpl<$Res>
    implements _$ListenerVoiceIntroResponseModelCopyWith<$Res> {
  __$ListenerVoiceIntroResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerVoiceIntroResponseModel _self;
  final $Res Function(_ListenerVoiceIntroResponseModel) _then;

/// Create a copy of ListenerVoiceIntroResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerVoiceIntroResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerVoiceIntroData,
  ));
}

/// Create a copy of ListenerVoiceIntroResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerVoiceIntroDataCopyWith<$Res> get data {
  
  return $ListenerVoiceIntroDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerVoiceIntroData {

 String get voice_intro_url; int get voice_intro_seconds;
/// Create a copy of ListenerVoiceIntroData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerVoiceIntroDataCopyWith<ListenerVoiceIntroData> get copyWith => _$ListenerVoiceIntroDataCopyWithImpl<ListenerVoiceIntroData>(this as ListenerVoiceIntroData, _$identity);

  /// Serializes this ListenerVoiceIntroData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerVoiceIntroData&&(identical(other.voice_intro_url, voice_intro_url) || other.voice_intro_url == voice_intro_url)&&(identical(other.voice_intro_seconds, voice_intro_seconds) || other.voice_intro_seconds == voice_intro_seconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voice_intro_url,voice_intro_seconds);

@override
String toString() {
  return 'ListenerVoiceIntroData(voice_intro_url: $voice_intro_url, voice_intro_seconds: $voice_intro_seconds)';
}


}

/// @nodoc
abstract mixin class $ListenerVoiceIntroDataCopyWith<$Res>  {
  factory $ListenerVoiceIntroDataCopyWith(ListenerVoiceIntroData value, $Res Function(ListenerVoiceIntroData) _then) = _$ListenerVoiceIntroDataCopyWithImpl;
@useResult
$Res call({
 String voice_intro_url, int voice_intro_seconds
});




}
/// @nodoc
class _$ListenerVoiceIntroDataCopyWithImpl<$Res>
    implements $ListenerVoiceIntroDataCopyWith<$Res> {
  _$ListenerVoiceIntroDataCopyWithImpl(this._self, this._then);

  final ListenerVoiceIntroData _self;
  final $Res Function(ListenerVoiceIntroData) _then;

/// Create a copy of ListenerVoiceIntroData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voice_intro_url = null,Object? voice_intro_seconds = null,}) {
  return _then(_self.copyWith(
voice_intro_url: null == voice_intro_url ? _self.voice_intro_url : voice_intro_url // ignore: cast_nullable_to_non_nullable
as String,voice_intro_seconds: null == voice_intro_seconds ? _self.voice_intro_seconds : voice_intro_seconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerVoiceIntroData].
extension ListenerVoiceIntroDataPatterns on ListenerVoiceIntroData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerVoiceIntroData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerVoiceIntroData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerVoiceIntroData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerVoiceIntroData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerVoiceIntroData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerVoiceIntroData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String voice_intro_url,  int voice_intro_seconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerVoiceIntroData() when $default != null:
return $default(_that.voice_intro_url,_that.voice_intro_seconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String voice_intro_url,  int voice_intro_seconds)  $default,) {final _that = this;
switch (_that) {
case _ListenerVoiceIntroData():
return $default(_that.voice_intro_url,_that.voice_intro_seconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String voice_intro_url,  int voice_intro_seconds)?  $default,) {final _that = this;
switch (_that) {
case _ListenerVoiceIntroData() when $default != null:
return $default(_that.voice_intro_url,_that.voice_intro_seconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerVoiceIntroData implements ListenerVoiceIntroData {
  const _ListenerVoiceIntroData({this.voice_intro_url = '', this.voice_intro_seconds = 0});
  factory _ListenerVoiceIntroData.fromJson(Map<String, dynamic> json) => _$ListenerVoiceIntroDataFromJson(json);

@override@JsonKey() final  String voice_intro_url;
@override@JsonKey() final  int voice_intro_seconds;

/// Create a copy of ListenerVoiceIntroData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerVoiceIntroDataCopyWith<_ListenerVoiceIntroData> get copyWith => __$ListenerVoiceIntroDataCopyWithImpl<_ListenerVoiceIntroData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerVoiceIntroDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerVoiceIntroData&&(identical(other.voice_intro_url, voice_intro_url) || other.voice_intro_url == voice_intro_url)&&(identical(other.voice_intro_seconds, voice_intro_seconds) || other.voice_intro_seconds == voice_intro_seconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voice_intro_url,voice_intro_seconds);

@override
String toString() {
  return 'ListenerVoiceIntroData(voice_intro_url: $voice_intro_url, voice_intro_seconds: $voice_intro_seconds)';
}


}

/// @nodoc
abstract mixin class _$ListenerVoiceIntroDataCopyWith<$Res> implements $ListenerVoiceIntroDataCopyWith<$Res> {
  factory _$ListenerVoiceIntroDataCopyWith(_ListenerVoiceIntroData value, $Res Function(_ListenerVoiceIntroData) _then) = __$ListenerVoiceIntroDataCopyWithImpl;
@override @useResult
$Res call({
 String voice_intro_url, int voice_intro_seconds
});




}
/// @nodoc
class __$ListenerVoiceIntroDataCopyWithImpl<$Res>
    implements _$ListenerVoiceIntroDataCopyWith<$Res> {
  __$ListenerVoiceIntroDataCopyWithImpl(this._self, this._then);

  final _ListenerVoiceIntroData _self;
  final $Res Function(_ListenerVoiceIntroData) _then;

/// Create a copy of ListenerVoiceIntroData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voice_intro_url = null,Object? voice_intro_seconds = null,}) {
  return _then(_ListenerVoiceIntroData(
voice_intro_url: null == voice_intro_url ? _self.voice_intro_url : voice_intro_url // ignore: cast_nullable_to_non_nullable
as String,voice_intro_seconds: null == voice_intro_seconds ? _self.voice_intro_seconds : voice_intro_seconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
