// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_join_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionJoinResponseModel {

 String get status; SessionJoinData get data;
/// Create a copy of SessionJoinResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionJoinResponseModelCopyWith<SessionJoinResponseModel> get copyWith => _$SessionJoinResponseModelCopyWithImpl<SessionJoinResponseModel>(this as SessionJoinResponseModel, _$identity);

  /// Serializes this SessionJoinResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionJoinResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'SessionJoinResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $SessionJoinResponseModelCopyWith<$Res>  {
  factory $SessionJoinResponseModelCopyWith(SessionJoinResponseModel value, $Res Function(SessionJoinResponseModel) _then) = _$SessionJoinResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, SessionJoinData data
});


$SessionJoinDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SessionJoinResponseModelCopyWithImpl<$Res>
    implements $SessionJoinResponseModelCopyWith<$Res> {
  _$SessionJoinResponseModelCopyWithImpl(this._self, this._then);

  final SessionJoinResponseModel _self;
  final $Res Function(SessionJoinResponseModel) _then;

/// Create a copy of SessionJoinResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SessionJoinData,
  ));
}
/// Create a copy of SessionJoinResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionJoinDataCopyWith<$Res> get data {
  
  return $SessionJoinDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionJoinResponseModel].
extension SessionJoinResponseModelPatterns on SessionJoinResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionJoinResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionJoinResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionJoinResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionJoinResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionJoinResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionJoinResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  SessionJoinData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionJoinResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  SessionJoinData data)  $default,) {final _that = this;
switch (_that) {
case _SessionJoinResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  SessionJoinData data)?  $default,) {final _that = this;
switch (_that) {
case _SessionJoinResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionJoinResponseModel implements SessionJoinResponseModel {
  const _SessionJoinResponseModel({required this.status, required this.data});
  factory _SessionJoinResponseModel.fromJson(Map<String, dynamic> json) => _$SessionJoinResponseModelFromJson(json);

@override final  String status;
@override final  SessionJoinData data;

/// Create a copy of SessionJoinResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionJoinResponseModelCopyWith<_SessionJoinResponseModel> get copyWith => __$SessionJoinResponseModelCopyWithImpl<_SessionJoinResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionJoinResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionJoinResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'SessionJoinResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SessionJoinResponseModelCopyWith<$Res> implements $SessionJoinResponseModelCopyWith<$Res> {
  factory _$SessionJoinResponseModelCopyWith(_SessionJoinResponseModel value, $Res Function(_SessionJoinResponseModel) _then) = __$SessionJoinResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, SessionJoinData data
});


@override $SessionJoinDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SessionJoinResponseModelCopyWithImpl<$Res>
    implements _$SessionJoinResponseModelCopyWith<$Res> {
  __$SessionJoinResponseModelCopyWithImpl(this._self, this._then);

  final _SessionJoinResponseModel _self;
  final $Res Function(_SessionJoinResponseModel) _then;

/// Create a copy of SessionJoinResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_SessionJoinResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SessionJoinData,
  ));
}

/// Create a copy of SessionJoinResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionJoinDataCopyWith<$Res> get data {
  
  return $SessionJoinDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SessionJoinData {

 String get call_token; String get channel_id; String get expires_at; List<SessionJoinIceServerModel>? get ice_servers;
/// Create a copy of SessionJoinData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionJoinDataCopyWith<SessionJoinData> get copyWith => _$SessionJoinDataCopyWithImpl<SessionJoinData>(this as SessionJoinData, _$identity);

  /// Serializes this SessionJoinData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionJoinData&&(identical(other.call_token, call_token) || other.call_token == call_token)&&(identical(other.channel_id, channel_id) || other.channel_id == channel_id)&&(identical(other.expires_at, expires_at) || other.expires_at == expires_at)&&const DeepCollectionEquality().equals(other.ice_servers, ice_servers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,call_token,channel_id,expires_at,const DeepCollectionEquality().hash(ice_servers));

@override
String toString() {
  return 'SessionJoinData(call_token: $call_token, channel_id: $channel_id, expires_at: $expires_at, ice_servers: $ice_servers)';
}


}

/// @nodoc
abstract mixin class $SessionJoinDataCopyWith<$Res>  {
  factory $SessionJoinDataCopyWith(SessionJoinData value, $Res Function(SessionJoinData) _then) = _$SessionJoinDataCopyWithImpl;
@useResult
$Res call({
 String call_token, String channel_id, String expires_at, List<SessionJoinIceServerModel>? ice_servers
});




}
/// @nodoc
class _$SessionJoinDataCopyWithImpl<$Res>
    implements $SessionJoinDataCopyWith<$Res> {
  _$SessionJoinDataCopyWithImpl(this._self, this._then);

  final SessionJoinData _self;
  final $Res Function(SessionJoinData) _then;

/// Create a copy of SessionJoinData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? call_token = null,Object? channel_id = null,Object? expires_at = null,Object? ice_servers = freezed,}) {
  return _then(_self.copyWith(
call_token: null == call_token ? _self.call_token : call_token // ignore: cast_nullable_to_non_nullable
as String,channel_id: null == channel_id ? _self.channel_id : channel_id // ignore: cast_nullable_to_non_nullable
as String,expires_at: null == expires_at ? _self.expires_at : expires_at // ignore: cast_nullable_to_non_nullable
as String,ice_servers: freezed == ice_servers ? _self.ice_servers : ice_servers // ignore: cast_nullable_to_non_nullable
as List<SessionJoinIceServerModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionJoinData].
extension SessionJoinDataPatterns on SessionJoinData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionJoinData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionJoinData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionJoinData value)  $default,){
final _that = this;
switch (_that) {
case _SessionJoinData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionJoinData value)?  $default,){
final _that = this;
switch (_that) {
case _SessionJoinData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String call_token,  String channel_id,  String expires_at,  List<SessionJoinIceServerModel>? ice_servers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionJoinData() when $default != null:
return $default(_that.call_token,_that.channel_id,_that.expires_at,_that.ice_servers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String call_token,  String channel_id,  String expires_at,  List<SessionJoinIceServerModel>? ice_servers)  $default,) {final _that = this;
switch (_that) {
case _SessionJoinData():
return $default(_that.call_token,_that.channel_id,_that.expires_at,_that.ice_servers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String call_token,  String channel_id,  String expires_at,  List<SessionJoinIceServerModel>? ice_servers)?  $default,) {final _that = this;
switch (_that) {
case _SessionJoinData() when $default != null:
return $default(_that.call_token,_that.channel_id,_that.expires_at,_that.ice_servers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionJoinData implements SessionJoinData {
  const _SessionJoinData({this.call_token = '', this.channel_id = '', this.expires_at = '', final  List<SessionJoinIceServerModel>? ice_servers}): _ice_servers = ice_servers;
  factory _SessionJoinData.fromJson(Map<String, dynamic> json) => _$SessionJoinDataFromJson(json);

@override@JsonKey() final  String call_token;
@override@JsonKey() final  String channel_id;
@override@JsonKey() final  String expires_at;
 final  List<SessionJoinIceServerModel>? _ice_servers;
@override List<SessionJoinIceServerModel>? get ice_servers {
  final value = _ice_servers;
  if (value == null) return null;
  if (_ice_servers is EqualUnmodifiableListView) return _ice_servers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SessionJoinData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionJoinDataCopyWith<_SessionJoinData> get copyWith => __$SessionJoinDataCopyWithImpl<_SessionJoinData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionJoinDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionJoinData&&(identical(other.call_token, call_token) || other.call_token == call_token)&&(identical(other.channel_id, channel_id) || other.channel_id == channel_id)&&(identical(other.expires_at, expires_at) || other.expires_at == expires_at)&&const DeepCollectionEquality().equals(other._ice_servers, _ice_servers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,call_token,channel_id,expires_at,const DeepCollectionEquality().hash(_ice_servers));

@override
String toString() {
  return 'SessionJoinData(call_token: $call_token, channel_id: $channel_id, expires_at: $expires_at, ice_servers: $ice_servers)';
}


}

/// @nodoc
abstract mixin class _$SessionJoinDataCopyWith<$Res> implements $SessionJoinDataCopyWith<$Res> {
  factory _$SessionJoinDataCopyWith(_SessionJoinData value, $Res Function(_SessionJoinData) _then) = __$SessionJoinDataCopyWithImpl;
@override @useResult
$Res call({
 String call_token, String channel_id, String expires_at, List<SessionJoinIceServerModel>? ice_servers
});




}
/// @nodoc
class __$SessionJoinDataCopyWithImpl<$Res>
    implements _$SessionJoinDataCopyWith<$Res> {
  __$SessionJoinDataCopyWithImpl(this._self, this._then);

  final _SessionJoinData _self;
  final $Res Function(_SessionJoinData) _then;

/// Create a copy of SessionJoinData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? call_token = null,Object? channel_id = null,Object? expires_at = null,Object? ice_servers = freezed,}) {
  return _then(_SessionJoinData(
call_token: null == call_token ? _self.call_token : call_token // ignore: cast_nullable_to_non_nullable
as String,channel_id: null == channel_id ? _self.channel_id : channel_id // ignore: cast_nullable_to_non_nullable
as String,expires_at: null == expires_at ? _self.expires_at : expires_at // ignore: cast_nullable_to_non_nullable
as String,ice_servers: freezed == ice_servers ? _self._ice_servers : ice_servers // ignore: cast_nullable_to_non_nullable
as List<SessionJoinIceServerModel>?,
  ));
}


}


/// @nodoc
mixin _$SessionJoinIceServerModel {

 List<String> get urls;
/// Create a copy of SessionJoinIceServerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionJoinIceServerModelCopyWith<SessionJoinIceServerModel> get copyWith => _$SessionJoinIceServerModelCopyWithImpl<SessionJoinIceServerModel>(this as SessionJoinIceServerModel, _$identity);

  /// Serializes this SessionJoinIceServerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionJoinIceServerModel&&const DeepCollectionEquality().equals(other.urls, urls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(urls));

@override
String toString() {
  return 'SessionJoinIceServerModel(urls: $urls)';
}


}

/// @nodoc
abstract mixin class $SessionJoinIceServerModelCopyWith<$Res>  {
  factory $SessionJoinIceServerModelCopyWith(SessionJoinIceServerModel value, $Res Function(SessionJoinIceServerModel) _then) = _$SessionJoinIceServerModelCopyWithImpl;
@useResult
$Res call({
 List<String> urls
});




}
/// @nodoc
class _$SessionJoinIceServerModelCopyWithImpl<$Res>
    implements $SessionJoinIceServerModelCopyWith<$Res> {
  _$SessionJoinIceServerModelCopyWithImpl(this._self, this._then);

  final SessionJoinIceServerModel _self;
  final $Res Function(SessionJoinIceServerModel) _then;

/// Create a copy of SessionJoinIceServerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? urls = null,}) {
  return _then(_self.copyWith(
urls: null == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionJoinIceServerModel].
extension SessionJoinIceServerModelPatterns on SessionJoinIceServerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionJoinIceServerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionJoinIceServerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionJoinIceServerModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionJoinIceServerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionJoinIceServerModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionJoinIceServerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> urls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionJoinIceServerModel() when $default != null:
return $default(_that.urls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> urls)  $default,) {final _that = this;
switch (_that) {
case _SessionJoinIceServerModel():
return $default(_that.urls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> urls)?  $default,) {final _that = this;
switch (_that) {
case _SessionJoinIceServerModel() when $default != null:
return $default(_that.urls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionJoinIceServerModel implements SessionJoinIceServerModel {
  const _SessionJoinIceServerModel({final  List<String> urls = const <String>[]}): _urls = urls;
  factory _SessionJoinIceServerModel.fromJson(Map<String, dynamic> json) => _$SessionJoinIceServerModelFromJson(json);

 final  List<String> _urls;
@override@JsonKey() List<String> get urls {
  if (_urls is EqualUnmodifiableListView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_urls);
}


/// Create a copy of SessionJoinIceServerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionJoinIceServerModelCopyWith<_SessionJoinIceServerModel> get copyWith => __$SessionJoinIceServerModelCopyWithImpl<_SessionJoinIceServerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionJoinIceServerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionJoinIceServerModel&&const DeepCollectionEquality().equals(other._urls, _urls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_urls));

@override
String toString() {
  return 'SessionJoinIceServerModel(urls: $urls)';
}


}

/// @nodoc
abstract mixin class _$SessionJoinIceServerModelCopyWith<$Res> implements $SessionJoinIceServerModelCopyWith<$Res> {
  factory _$SessionJoinIceServerModelCopyWith(_SessionJoinIceServerModel value, $Res Function(_SessionJoinIceServerModel) _then) = __$SessionJoinIceServerModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> urls
});




}
/// @nodoc
class __$SessionJoinIceServerModelCopyWithImpl<$Res>
    implements _$SessionJoinIceServerModelCopyWith<$Res> {
  __$SessionJoinIceServerModelCopyWithImpl(this._self, this._then);

  final _SessionJoinIceServerModel _self;
  final $Res Function(_SessionJoinIceServerModel) _then;

/// Create a copy of SessionJoinIceServerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? urls = null,}) {
  return _then(_SessionJoinIceServerModel(
urls: null == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
