// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_end_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionEndResponseModel {

 String get status; SessionEndData get data;
/// Create a copy of SessionEndResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionEndResponseModelCopyWith<SessionEndResponseModel> get copyWith => _$SessionEndResponseModelCopyWithImpl<SessionEndResponseModel>(this as SessionEndResponseModel, _$identity);

  /// Serializes this SessionEndResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEndResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'SessionEndResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $SessionEndResponseModelCopyWith<$Res>  {
  factory $SessionEndResponseModelCopyWith(SessionEndResponseModel value, $Res Function(SessionEndResponseModel) _then) = _$SessionEndResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, SessionEndData data
});


$SessionEndDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SessionEndResponseModelCopyWithImpl<$Res>
    implements $SessionEndResponseModelCopyWith<$Res> {
  _$SessionEndResponseModelCopyWithImpl(this._self, this._then);

  final SessionEndResponseModel _self;
  final $Res Function(SessionEndResponseModel) _then;

/// Create a copy of SessionEndResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SessionEndData,
  ));
}
/// Create a copy of SessionEndResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionEndDataCopyWith<$Res> get data {
  
  return $SessionEndDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionEndResponseModel].
extension SessionEndResponseModelPatterns on SessionEndResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionEndResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionEndResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionEndResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionEndResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionEndResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionEndResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  SessionEndData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionEndResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  SessionEndData data)  $default,) {final _that = this;
switch (_that) {
case _SessionEndResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  SessionEndData data)?  $default,) {final _that = this;
switch (_that) {
case _SessionEndResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionEndResponseModel implements SessionEndResponseModel {
  const _SessionEndResponseModel({required this.status, required this.data});
  factory _SessionEndResponseModel.fromJson(Map<String, dynamic> json) => _$SessionEndResponseModelFromJson(json);

@override final  String status;
@override final  SessionEndData data;

/// Create a copy of SessionEndResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionEndResponseModelCopyWith<_SessionEndResponseModel> get copyWith => __$SessionEndResponseModelCopyWithImpl<_SessionEndResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionEndResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionEndResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'SessionEndResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SessionEndResponseModelCopyWith<$Res> implements $SessionEndResponseModelCopyWith<$Res> {
  factory _$SessionEndResponseModelCopyWith(_SessionEndResponseModel value, $Res Function(_SessionEndResponseModel) _then) = __$SessionEndResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, SessionEndData data
});


@override $SessionEndDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SessionEndResponseModelCopyWithImpl<$Res>
    implements _$SessionEndResponseModelCopyWith<$Res> {
  __$SessionEndResponseModelCopyWithImpl(this._self, this._then);

  final _SessionEndResponseModel _self;
  final $Res Function(_SessionEndResponseModel) _then;

/// Create a copy of SessionEndResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_SessionEndResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SessionEndData,
  ));
}

/// Create a copy of SessionEndResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionEndDataCopyWith<$Res> get data {
  
  return $SessionEndDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SessionEndData {

 String get session_id; String get status;
/// Create a copy of SessionEndData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionEndDataCopyWith<SessionEndData> get copyWith => _$SessionEndDataCopyWithImpl<SessionEndData>(this as SessionEndData, _$identity);

  /// Serializes this SessionEndData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEndData&&(identical(other.session_id, session_id) || other.session_id == session_id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session_id,status);

@override
String toString() {
  return 'SessionEndData(session_id: $session_id, status: $status)';
}


}

/// @nodoc
abstract mixin class $SessionEndDataCopyWith<$Res>  {
  factory $SessionEndDataCopyWith(SessionEndData value, $Res Function(SessionEndData) _then) = _$SessionEndDataCopyWithImpl;
@useResult
$Res call({
 String session_id, String status
});




}
/// @nodoc
class _$SessionEndDataCopyWithImpl<$Res>
    implements $SessionEndDataCopyWith<$Res> {
  _$SessionEndDataCopyWithImpl(this._self, this._then);

  final SessionEndData _self;
  final $Res Function(SessionEndData) _then;

/// Create a copy of SessionEndData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session_id = null,Object? status = null,}) {
  return _then(_self.copyWith(
session_id: null == session_id ? _self.session_id : session_id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionEndData].
extension SessionEndDataPatterns on SessionEndData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionEndData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionEndData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionEndData value)  $default,){
final _that = this;
switch (_that) {
case _SessionEndData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionEndData value)?  $default,){
final _that = this;
switch (_that) {
case _SessionEndData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String session_id,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionEndData() when $default != null:
return $default(_that.session_id,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String session_id,  String status)  $default,) {final _that = this;
switch (_that) {
case _SessionEndData():
return $default(_that.session_id,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String session_id,  String status)?  $default,) {final _that = this;
switch (_that) {
case _SessionEndData() when $default != null:
return $default(_that.session_id,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionEndData implements SessionEndData {
  const _SessionEndData({this.session_id = '', this.status = 'completed'});
  factory _SessionEndData.fromJson(Map<String, dynamic> json) => _$SessionEndDataFromJson(json);

@override@JsonKey() final  String session_id;
@override@JsonKey() final  String status;

/// Create a copy of SessionEndData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionEndDataCopyWith<_SessionEndData> get copyWith => __$SessionEndDataCopyWithImpl<_SessionEndData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionEndDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionEndData&&(identical(other.session_id, session_id) || other.session_id == session_id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session_id,status);

@override
String toString() {
  return 'SessionEndData(session_id: $session_id, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SessionEndDataCopyWith<$Res> implements $SessionEndDataCopyWith<$Res> {
  factory _$SessionEndDataCopyWith(_SessionEndData value, $Res Function(_SessionEndData) _then) = __$SessionEndDataCopyWithImpl;
@override @useResult
$Res call({
 String session_id, String status
});




}
/// @nodoc
class __$SessionEndDataCopyWithImpl<$Res>
    implements _$SessionEndDataCopyWith<$Res> {
  __$SessionEndDataCopyWithImpl(this._self, this._then);

  final _SessionEndData _self;
  final $Res Function(_SessionEndData) _then;

/// Create a copy of SessionEndData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session_id = null,Object? status = null,}) {
  return _then(_SessionEndData(
session_id: null == session_id ? _self.session_id : session_id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
