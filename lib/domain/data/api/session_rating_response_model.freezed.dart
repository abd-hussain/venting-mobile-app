// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_rating_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionRatingResponseModel {

 String get status; SessionRatingData get data;
/// Create a copy of SessionRatingResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionRatingResponseModelCopyWith<SessionRatingResponseModel> get copyWith => _$SessionRatingResponseModelCopyWithImpl<SessionRatingResponseModel>(this as SessionRatingResponseModel, _$identity);

  /// Serializes this SessionRatingResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionRatingResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'SessionRatingResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $SessionRatingResponseModelCopyWith<$Res>  {
  factory $SessionRatingResponseModelCopyWith(SessionRatingResponseModel value, $Res Function(SessionRatingResponseModel) _then) = _$SessionRatingResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, SessionRatingData data
});


$SessionRatingDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SessionRatingResponseModelCopyWithImpl<$Res>
    implements $SessionRatingResponseModelCopyWith<$Res> {
  _$SessionRatingResponseModelCopyWithImpl(this._self, this._then);

  final SessionRatingResponseModel _self;
  final $Res Function(SessionRatingResponseModel) _then;

/// Create a copy of SessionRatingResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SessionRatingData,
  ));
}
/// Create a copy of SessionRatingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionRatingDataCopyWith<$Res> get data {
  
  return $SessionRatingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionRatingResponseModel].
extension SessionRatingResponseModelPatterns on SessionRatingResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionRatingResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionRatingResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionRatingResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionRatingResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionRatingResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionRatingResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  SessionRatingData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionRatingResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  SessionRatingData data)  $default,) {final _that = this;
switch (_that) {
case _SessionRatingResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  SessionRatingData data)?  $default,) {final _that = this;
switch (_that) {
case _SessionRatingResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionRatingResponseModel implements SessionRatingResponseModel {
  const _SessionRatingResponseModel({required this.status, required this.data});
  factory _SessionRatingResponseModel.fromJson(Map<String, dynamic> json) => _$SessionRatingResponseModelFromJson(json);

@override final  String status;
@override final  SessionRatingData data;

/// Create a copy of SessionRatingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionRatingResponseModelCopyWith<_SessionRatingResponseModel> get copyWith => __$SessionRatingResponseModelCopyWithImpl<_SessionRatingResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionRatingResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionRatingResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'SessionRatingResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SessionRatingResponseModelCopyWith<$Res> implements $SessionRatingResponseModelCopyWith<$Res> {
  factory _$SessionRatingResponseModelCopyWith(_SessionRatingResponseModel value, $Res Function(_SessionRatingResponseModel) _then) = __$SessionRatingResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, SessionRatingData data
});


@override $SessionRatingDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SessionRatingResponseModelCopyWithImpl<$Res>
    implements _$SessionRatingResponseModelCopyWith<$Res> {
  __$SessionRatingResponseModelCopyWithImpl(this._self, this._then);

  final _SessionRatingResponseModel _self;
  final $Res Function(_SessionRatingResponseModel) _then;

/// Create a copy of SessionRatingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_SessionRatingResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SessionRatingData,
  ));
}

/// Create a copy of SessionRatingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionRatingDataCopyWith<$Res> get data {
  
  return $SessionRatingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SessionRatingData {

 bool get ok; num? get tip_charged;
/// Create a copy of SessionRatingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionRatingDataCopyWith<SessionRatingData> get copyWith => _$SessionRatingDataCopyWithImpl<SessionRatingData>(this as SessionRatingData, _$identity);

  /// Serializes this SessionRatingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionRatingData&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.tip_charged, tip_charged) || other.tip_charged == tip_charged));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,tip_charged);

@override
String toString() {
  return 'SessionRatingData(ok: $ok, tip_charged: $tip_charged)';
}


}

/// @nodoc
abstract mixin class $SessionRatingDataCopyWith<$Res>  {
  factory $SessionRatingDataCopyWith(SessionRatingData value, $Res Function(SessionRatingData) _then) = _$SessionRatingDataCopyWithImpl;
@useResult
$Res call({
 bool ok, num? tip_charged
});




}
/// @nodoc
class _$SessionRatingDataCopyWithImpl<$Res>
    implements $SessionRatingDataCopyWith<$Res> {
  _$SessionRatingDataCopyWithImpl(this._self, this._then);

  final SessionRatingData _self;
  final $Res Function(SessionRatingData) _then;

/// Create a copy of SessionRatingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ok = null,Object? tip_charged = freezed,}) {
  return _then(_self.copyWith(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,tip_charged: freezed == tip_charged ? _self.tip_charged : tip_charged // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionRatingData].
extension SessionRatingDataPatterns on SessionRatingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionRatingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionRatingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionRatingData value)  $default,){
final _that = this;
switch (_that) {
case _SessionRatingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionRatingData value)?  $default,){
final _that = this;
switch (_that) {
case _SessionRatingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ok,  num? tip_charged)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionRatingData() when $default != null:
return $default(_that.ok,_that.tip_charged);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ok,  num? tip_charged)  $default,) {final _that = this;
switch (_that) {
case _SessionRatingData():
return $default(_that.ok,_that.tip_charged);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ok,  num? tip_charged)?  $default,) {final _that = this;
switch (_that) {
case _SessionRatingData() when $default != null:
return $default(_that.ok,_that.tip_charged);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionRatingData implements SessionRatingData {
  const _SessionRatingData({this.ok = true, this.tip_charged});
  factory _SessionRatingData.fromJson(Map<String, dynamic> json) => _$SessionRatingDataFromJson(json);

@override@JsonKey() final  bool ok;
@override final  num? tip_charged;

/// Create a copy of SessionRatingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionRatingDataCopyWith<_SessionRatingData> get copyWith => __$SessionRatingDataCopyWithImpl<_SessionRatingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionRatingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionRatingData&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.tip_charged, tip_charged) || other.tip_charged == tip_charged));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,tip_charged);

@override
String toString() {
  return 'SessionRatingData(ok: $ok, tip_charged: $tip_charged)';
}


}

/// @nodoc
abstract mixin class _$SessionRatingDataCopyWith<$Res> implements $SessionRatingDataCopyWith<$Res> {
  factory _$SessionRatingDataCopyWith(_SessionRatingData value, $Res Function(_SessionRatingData) _then) = __$SessionRatingDataCopyWithImpl;
@override @useResult
$Res call({
 bool ok, num? tip_charged
});




}
/// @nodoc
class __$SessionRatingDataCopyWithImpl<$Res>
    implements _$SessionRatingDataCopyWith<$Res> {
  __$SessionRatingDataCopyWithImpl(this._self, this._then);

  final _SessionRatingData _self;
  final $Res Function(_SessionRatingData) _then;

/// Create a copy of SessionRatingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,Object? tip_charged = freezed,}) {
  return _then(_SessionRatingData(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,tip_charged: freezed == tip_charged ? _self.tip_charged : tip_charged // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}


}

// dart format on
