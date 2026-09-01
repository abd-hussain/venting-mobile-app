// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_sessions_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerSessionsListResponseModel {

 String get status; ListenerSessionsListData get data;
/// Create a copy of ListenerSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSessionsListResponseModelCopyWith<ListenerSessionsListResponseModel> get copyWith => _$ListenerSessionsListResponseModelCopyWithImpl<ListenerSessionsListResponseModel>(this as ListenerSessionsListResponseModel, _$identity);

  /// Serializes this ListenerSessionsListResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionsListResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerSessionsListResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerSessionsListResponseModelCopyWith<$Res>  {
  factory $ListenerSessionsListResponseModelCopyWith(ListenerSessionsListResponseModel value, $Res Function(ListenerSessionsListResponseModel) _then) = _$ListenerSessionsListResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerSessionsListData data
});


$ListenerSessionsListDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerSessionsListResponseModelCopyWithImpl<$Res>
    implements $ListenerSessionsListResponseModelCopyWith<$Res> {
  _$ListenerSessionsListResponseModelCopyWithImpl(this._self, this._then);

  final ListenerSessionsListResponseModel _self;
  final $Res Function(ListenerSessionsListResponseModel) _then;

/// Create a copy of ListenerSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerSessionsListData,
  ));
}
/// Create a copy of ListenerSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSessionsListDataCopyWith<$Res> get data {
  
  return $ListenerSessionsListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerSessionsListResponseModel].
extension ListenerSessionsListResponseModelPatterns on ListenerSessionsListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSessionsListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSessionsListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSessionsListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionsListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSessionsListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionsListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerSessionsListData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSessionsListResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerSessionsListData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionsListResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerSessionsListData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionsListResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSessionsListResponseModel implements ListenerSessionsListResponseModel {
  const _ListenerSessionsListResponseModel({required this.status, required this.data});
  factory _ListenerSessionsListResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerSessionsListResponseModelFromJson(json);

@override final  String status;
@override final  ListenerSessionsListData data;

/// Create a copy of ListenerSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSessionsListResponseModelCopyWith<_ListenerSessionsListResponseModel> get copyWith => __$ListenerSessionsListResponseModelCopyWithImpl<_ListenerSessionsListResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSessionsListResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSessionsListResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerSessionsListResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerSessionsListResponseModelCopyWith<$Res> implements $ListenerSessionsListResponseModelCopyWith<$Res> {
  factory _$ListenerSessionsListResponseModelCopyWith(_ListenerSessionsListResponseModel value, $Res Function(_ListenerSessionsListResponseModel) _then) = __$ListenerSessionsListResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerSessionsListData data
});


@override $ListenerSessionsListDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerSessionsListResponseModelCopyWithImpl<$Res>
    implements _$ListenerSessionsListResponseModelCopyWith<$Res> {
  __$ListenerSessionsListResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerSessionsListResponseModel _self;
  final $Res Function(_ListenerSessionsListResponseModel) _then;

/// Create a copy of ListenerSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerSessionsListResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerSessionsListData,
  ));
}

/// Create a copy of ListenerSessionsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSessionsListDataCopyWith<$Res> get data {
  
  return $ListenerSessionsListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerSessionsListData {

 List<ListenerSessionModel> get items;
/// Create a copy of ListenerSessionsListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSessionsListDataCopyWith<ListenerSessionsListData> get copyWith => _$ListenerSessionsListDataCopyWithImpl<ListenerSessionsListData>(this as ListenerSessionsListData, _$identity);

  /// Serializes this ListenerSessionsListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionsListData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ListenerSessionsListData(items: $items)';
}


}

/// @nodoc
abstract mixin class $ListenerSessionsListDataCopyWith<$Res>  {
  factory $ListenerSessionsListDataCopyWith(ListenerSessionsListData value, $Res Function(ListenerSessionsListData) _then) = _$ListenerSessionsListDataCopyWithImpl;
@useResult
$Res call({
 List<ListenerSessionModel> items
});




}
/// @nodoc
class _$ListenerSessionsListDataCopyWithImpl<$Res>
    implements $ListenerSessionsListDataCopyWith<$Res> {
  _$ListenerSessionsListDataCopyWithImpl(this._self, this._then);

  final ListenerSessionsListData _self;
  final $Res Function(ListenerSessionsListData) _then;

/// Create a copy of ListenerSessionsListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerSessionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerSessionsListData].
extension ListenerSessionsListDataPatterns on ListenerSessionsListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSessionsListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSessionsListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSessionsListData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionsListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSessionsListData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionsListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListenerSessionModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSessionsListData() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListenerSessionModel> items)  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionsListData():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListenerSessionModel> items)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionsListData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSessionsListData implements ListenerSessionsListData {
  const _ListenerSessionsListData({final  List<ListenerSessionModel> items = const <ListenerSessionModel>[]}): _items = items;
  factory _ListenerSessionsListData.fromJson(Map<String, dynamic> json) => _$ListenerSessionsListDataFromJson(json);

 final  List<ListenerSessionModel> _items;
@override@JsonKey() List<ListenerSessionModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ListenerSessionsListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSessionsListDataCopyWith<_ListenerSessionsListData> get copyWith => __$ListenerSessionsListDataCopyWithImpl<_ListenerSessionsListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSessionsListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSessionsListData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ListenerSessionsListData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$ListenerSessionsListDataCopyWith<$Res> implements $ListenerSessionsListDataCopyWith<$Res> {
  factory _$ListenerSessionsListDataCopyWith(_ListenerSessionsListData value, $Res Function(_ListenerSessionsListData) _then) = __$ListenerSessionsListDataCopyWithImpl;
@override @useResult
$Res call({
 List<ListenerSessionModel> items
});




}
/// @nodoc
class __$ListenerSessionsListDataCopyWithImpl<$Res>
    implements _$ListenerSessionsListDataCopyWith<$Res> {
  __$ListenerSessionsListDataCopyWithImpl(this._self, this._then);

  final _ListenerSessionsListData _self;
  final $Res Function(_ListenerSessionsListData) _then;

/// Create a copy of ListenerSessionsListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_ListenerSessionsListData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerSessionModel>,
  ));
}


}


/// @nodoc
mixin _$ListenerSessionModel {

 String get id; String get scheduled_at; int get duration_minutes; String get ventor_name; String? get ventor_avatar_url; String get message; String get chosen_reason; List<String> get tags; String? get speech_language; bool get is_waiting; bool get can_join_now; bool get is_instant; bool get is_video_call; num get ventor_rating; String? get status_label; num? get session_cost; bool get is_missed; String? get history_outcome;
/// Create a copy of ListenerSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSessionModelCopyWith<ListenerSessionModel> get copyWith => _$ListenerSessionModelCopyWithImpl<ListenerSessionModel>(this as ListenerSessionModel, _$identity);

  /// Serializes this ListenerSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.scheduled_at, scheduled_at) || other.scheduled_at == scheduled_at)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&(identical(other.ventor_name, ventor_name) || other.ventor_name == ventor_name)&&(identical(other.ventor_avatar_url, ventor_avatar_url) || other.ventor_avatar_url == ventor_avatar_url)&&(identical(other.message, message) || other.message == message)&&(identical(other.chosen_reason, chosen_reason) || other.chosen_reason == chosen_reason)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.speech_language, speech_language) || other.speech_language == speech_language)&&(identical(other.is_waiting, is_waiting) || other.is_waiting == is_waiting)&&(identical(other.can_join_now, can_join_now) || other.can_join_now == can_join_now)&&(identical(other.is_instant, is_instant) || other.is_instant == is_instant)&&(identical(other.is_video_call, is_video_call) || other.is_video_call == is_video_call)&&(identical(other.ventor_rating, ventor_rating) || other.ventor_rating == ventor_rating)&&(identical(other.status_label, status_label) || other.status_label == status_label)&&(identical(other.session_cost, session_cost) || other.session_cost == session_cost)&&(identical(other.is_missed, is_missed) || other.is_missed == is_missed)&&(identical(other.history_outcome, history_outcome) || other.history_outcome == history_outcome));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scheduled_at,duration_minutes,ventor_name,ventor_avatar_url,message,chosen_reason,const DeepCollectionEquality().hash(tags),speech_language,is_waiting,can_join_now,is_instant,is_video_call,ventor_rating,status_label,session_cost,is_missed,history_outcome);

@override
String toString() {
  return 'ListenerSessionModel(id: $id, scheduled_at: $scheduled_at, duration_minutes: $duration_minutes, ventor_name: $ventor_name, ventor_avatar_url: $ventor_avatar_url, message: $message, chosen_reason: $chosen_reason, tags: $tags, speech_language: $speech_language, is_waiting: $is_waiting, can_join_now: $can_join_now, is_instant: $is_instant, is_video_call: $is_video_call, ventor_rating: $ventor_rating, status_label: $status_label, session_cost: $session_cost, is_missed: $is_missed, history_outcome: $history_outcome)';
}


}

/// @nodoc
abstract mixin class $ListenerSessionModelCopyWith<$Res>  {
  factory $ListenerSessionModelCopyWith(ListenerSessionModel value, $Res Function(ListenerSessionModel) _then) = _$ListenerSessionModelCopyWithImpl;
@useResult
$Res call({
 String id, String scheduled_at, int duration_minutes, String ventor_name, String? ventor_avatar_url, String message, String chosen_reason, List<String> tags, String? speech_language, bool is_waiting, bool can_join_now, bool is_instant, bool is_video_call, num ventor_rating, String? status_label, num? session_cost, bool is_missed, String? history_outcome
});




}
/// @nodoc
class _$ListenerSessionModelCopyWithImpl<$Res>
    implements $ListenerSessionModelCopyWith<$Res> {
  _$ListenerSessionModelCopyWithImpl(this._self, this._then);

  final ListenerSessionModel _self;
  final $Res Function(ListenerSessionModel) _then;

/// Create a copy of ListenerSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scheduled_at = null,Object? duration_minutes = null,Object? ventor_name = null,Object? ventor_avatar_url = freezed,Object? message = null,Object? chosen_reason = null,Object? tags = null,Object? speech_language = freezed,Object? is_waiting = null,Object? can_join_now = null,Object? is_instant = null,Object? is_video_call = null,Object? ventor_rating = null,Object? status_label = freezed,Object? session_cost = freezed,Object? is_missed = null,Object? history_outcome = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scheduled_at: null == scheduled_at ? _self.scheduled_at : scheduled_at // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,ventor_name: null == ventor_name ? _self.ventor_name : ventor_name // ignore: cast_nullable_to_non_nullable
as String,ventor_avatar_url: freezed == ventor_avatar_url ? _self.ventor_avatar_url : ventor_avatar_url // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,chosen_reason: null == chosen_reason ? _self.chosen_reason : chosen_reason // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,speech_language: freezed == speech_language ? _self.speech_language : speech_language // ignore: cast_nullable_to_non_nullable
as String?,is_waiting: null == is_waiting ? _self.is_waiting : is_waiting // ignore: cast_nullable_to_non_nullable
as bool,can_join_now: null == can_join_now ? _self.can_join_now : can_join_now // ignore: cast_nullable_to_non_nullable
as bool,is_instant: null == is_instant ? _self.is_instant : is_instant // ignore: cast_nullable_to_non_nullable
as bool,is_video_call: null == is_video_call ? _self.is_video_call : is_video_call // ignore: cast_nullable_to_non_nullable
as bool,ventor_rating: null == ventor_rating ? _self.ventor_rating : ventor_rating // ignore: cast_nullable_to_non_nullable
as num,status_label: freezed == status_label ? _self.status_label : status_label // ignore: cast_nullable_to_non_nullable
as String?,session_cost: freezed == session_cost ? _self.session_cost : session_cost // ignore: cast_nullable_to_non_nullable
as num?,is_missed: null == is_missed ? _self.is_missed : is_missed // ignore: cast_nullable_to_non_nullable
as bool,history_outcome: freezed == history_outcome ? _self.history_outcome : history_outcome // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerSessionModel].
extension ListenerSessionModelPatterns on ListenerSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String scheduled_at,  int duration_minutes,  String ventor_name,  String? ventor_avatar_url,  String message,  String chosen_reason,  List<String> tags,  String? speech_language,  bool is_waiting,  bool can_join_now,  bool is_instant,  bool is_video_call,  num ventor_rating,  String? status_label,  num? session_cost,  bool is_missed,  String? history_outcome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSessionModel() when $default != null:
return $default(_that.id,_that.scheduled_at,_that.duration_minutes,_that.ventor_name,_that.ventor_avatar_url,_that.message,_that.chosen_reason,_that.tags,_that.speech_language,_that.is_waiting,_that.can_join_now,_that.is_instant,_that.is_video_call,_that.ventor_rating,_that.status_label,_that.session_cost,_that.is_missed,_that.history_outcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String scheduled_at,  int duration_minutes,  String ventor_name,  String? ventor_avatar_url,  String message,  String chosen_reason,  List<String> tags,  String? speech_language,  bool is_waiting,  bool can_join_now,  bool is_instant,  bool is_video_call,  num ventor_rating,  String? status_label,  num? session_cost,  bool is_missed,  String? history_outcome)  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionModel():
return $default(_that.id,_that.scheduled_at,_that.duration_minutes,_that.ventor_name,_that.ventor_avatar_url,_that.message,_that.chosen_reason,_that.tags,_that.speech_language,_that.is_waiting,_that.can_join_now,_that.is_instant,_that.is_video_call,_that.ventor_rating,_that.status_label,_that.session_cost,_that.is_missed,_that.history_outcome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String scheduled_at,  int duration_minutes,  String ventor_name,  String? ventor_avatar_url,  String message,  String chosen_reason,  List<String> tags,  String? speech_language,  bool is_waiting,  bool can_join_now,  bool is_instant,  bool is_video_call,  num ventor_rating,  String? status_label,  num? session_cost,  bool is_missed,  String? history_outcome)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionModel() when $default != null:
return $default(_that.id,_that.scheduled_at,_that.duration_minutes,_that.ventor_name,_that.ventor_avatar_url,_that.message,_that.chosen_reason,_that.tags,_that.speech_language,_that.is_waiting,_that.can_join_now,_that.is_instant,_that.is_video_call,_that.ventor_rating,_that.status_label,_that.session_cost,_that.is_missed,_that.history_outcome);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSessionModel implements ListenerSessionModel {
  const _ListenerSessionModel({this.id = '', this.scheduled_at = '', this.duration_minutes = 0, this.ventor_name = '', this.ventor_avatar_url, this.message = '', this.chosen_reason = '', final  List<String> tags = const <String>[], this.speech_language, this.is_waiting = false, this.can_join_now = false, this.is_instant = false, this.is_video_call = false, this.ventor_rating = 0, this.status_label, this.session_cost, this.is_missed = false, this.history_outcome}): _tags = tags;
  factory _ListenerSessionModel.fromJson(Map<String, dynamic> json) => _$ListenerSessionModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String scheduled_at;
@override@JsonKey() final  int duration_minutes;
@override@JsonKey() final  String ventor_name;
@override final  String? ventor_avatar_url;
@override@JsonKey() final  String message;
@override@JsonKey() final  String chosen_reason;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String? speech_language;
@override@JsonKey() final  bool is_waiting;
@override@JsonKey() final  bool can_join_now;
@override@JsonKey() final  bool is_instant;
@override@JsonKey() final  bool is_video_call;
@override@JsonKey() final  num ventor_rating;
@override final  String? status_label;
@override final  num? session_cost;
@override@JsonKey() final  bool is_missed;
@override final  String? history_outcome;

/// Create a copy of ListenerSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSessionModelCopyWith<_ListenerSessionModel> get copyWith => __$ListenerSessionModelCopyWithImpl<_ListenerSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.scheduled_at, scheduled_at) || other.scheduled_at == scheduled_at)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&(identical(other.ventor_name, ventor_name) || other.ventor_name == ventor_name)&&(identical(other.ventor_avatar_url, ventor_avatar_url) || other.ventor_avatar_url == ventor_avatar_url)&&(identical(other.message, message) || other.message == message)&&(identical(other.chosen_reason, chosen_reason) || other.chosen_reason == chosen_reason)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.speech_language, speech_language) || other.speech_language == speech_language)&&(identical(other.is_waiting, is_waiting) || other.is_waiting == is_waiting)&&(identical(other.can_join_now, can_join_now) || other.can_join_now == can_join_now)&&(identical(other.is_instant, is_instant) || other.is_instant == is_instant)&&(identical(other.is_video_call, is_video_call) || other.is_video_call == is_video_call)&&(identical(other.ventor_rating, ventor_rating) || other.ventor_rating == ventor_rating)&&(identical(other.status_label, status_label) || other.status_label == status_label)&&(identical(other.session_cost, session_cost) || other.session_cost == session_cost)&&(identical(other.is_missed, is_missed) || other.is_missed == is_missed)&&(identical(other.history_outcome, history_outcome) || other.history_outcome == history_outcome));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scheduled_at,duration_minutes,ventor_name,ventor_avatar_url,message,chosen_reason,const DeepCollectionEquality().hash(_tags),speech_language,is_waiting,can_join_now,is_instant,is_video_call,ventor_rating,status_label,session_cost,is_missed,history_outcome);

@override
String toString() {
  return 'ListenerSessionModel(id: $id, scheduled_at: $scheduled_at, duration_minutes: $duration_minutes, ventor_name: $ventor_name, ventor_avatar_url: $ventor_avatar_url, message: $message, chosen_reason: $chosen_reason, tags: $tags, speech_language: $speech_language, is_waiting: $is_waiting, can_join_now: $can_join_now, is_instant: $is_instant, is_video_call: $is_video_call, ventor_rating: $ventor_rating, status_label: $status_label, session_cost: $session_cost, is_missed: $is_missed, history_outcome: $history_outcome)';
}


}

/// @nodoc
abstract mixin class _$ListenerSessionModelCopyWith<$Res> implements $ListenerSessionModelCopyWith<$Res> {
  factory _$ListenerSessionModelCopyWith(_ListenerSessionModel value, $Res Function(_ListenerSessionModel) _then) = __$ListenerSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String scheduled_at, int duration_minutes, String ventor_name, String? ventor_avatar_url, String message, String chosen_reason, List<String> tags, String? speech_language, bool is_waiting, bool can_join_now, bool is_instant, bool is_video_call, num ventor_rating, String? status_label, num? session_cost, bool is_missed, String? history_outcome
});




}
/// @nodoc
class __$ListenerSessionModelCopyWithImpl<$Res>
    implements _$ListenerSessionModelCopyWith<$Res> {
  __$ListenerSessionModelCopyWithImpl(this._self, this._then);

  final _ListenerSessionModel _self;
  final $Res Function(_ListenerSessionModel) _then;

/// Create a copy of ListenerSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scheduled_at = null,Object? duration_minutes = null,Object? ventor_name = null,Object? ventor_avatar_url = freezed,Object? message = null,Object? chosen_reason = null,Object? tags = null,Object? speech_language = freezed,Object? is_waiting = null,Object? can_join_now = null,Object? is_instant = null,Object? is_video_call = null,Object? ventor_rating = null,Object? status_label = freezed,Object? session_cost = freezed,Object? is_missed = null,Object? history_outcome = freezed,}) {
  return _then(_ListenerSessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scheduled_at: null == scheduled_at ? _self.scheduled_at : scheduled_at // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,ventor_name: null == ventor_name ? _self.ventor_name : ventor_name // ignore: cast_nullable_to_non_nullable
as String,ventor_avatar_url: freezed == ventor_avatar_url ? _self.ventor_avatar_url : ventor_avatar_url // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,chosen_reason: null == chosen_reason ? _self.chosen_reason : chosen_reason // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,speech_language: freezed == speech_language ? _self.speech_language : speech_language // ignore: cast_nullable_to_non_nullable
as String?,is_waiting: null == is_waiting ? _self.is_waiting : is_waiting // ignore: cast_nullable_to_non_nullable
as bool,can_join_now: null == can_join_now ? _self.can_join_now : can_join_now // ignore: cast_nullable_to_non_nullable
as bool,is_instant: null == is_instant ? _self.is_instant : is_instant // ignore: cast_nullable_to_non_nullable
as bool,is_video_call: null == is_video_call ? _self.is_video_call : is_video_call // ignore: cast_nullable_to_non_nullable
as bool,ventor_rating: null == ventor_rating ? _self.ventor_rating : ventor_rating // ignore: cast_nullable_to_non_nullable
as num,status_label: freezed == status_label ? _self.status_label : status_label // ignore: cast_nullable_to_non_nullable
as String?,session_cost: freezed == session_cost ? _self.session_cost : session_cost // ignore: cast_nullable_to_non_nullable
as num?,is_missed: null == is_missed ? _self.is_missed : is_missed // ignore: cast_nullable_to_non_nullable
as bool,history_outcome: freezed == history_outcome ? _self.history_outcome : history_outcome // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ListenerSessionStatsResponseModel {

 String get status; ListenerSessionStatsData get data;
/// Create a copy of ListenerSessionStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSessionStatsResponseModelCopyWith<ListenerSessionStatsResponseModel> get copyWith => _$ListenerSessionStatsResponseModelCopyWithImpl<ListenerSessionStatsResponseModel>(this as ListenerSessionStatsResponseModel, _$identity);

  /// Serializes this ListenerSessionStatsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionStatsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerSessionStatsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerSessionStatsResponseModelCopyWith<$Res>  {
  factory $ListenerSessionStatsResponseModelCopyWith(ListenerSessionStatsResponseModel value, $Res Function(ListenerSessionStatsResponseModel) _then) = _$ListenerSessionStatsResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerSessionStatsData data
});


$ListenerSessionStatsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerSessionStatsResponseModelCopyWithImpl<$Res>
    implements $ListenerSessionStatsResponseModelCopyWith<$Res> {
  _$ListenerSessionStatsResponseModelCopyWithImpl(this._self, this._then);

  final ListenerSessionStatsResponseModel _self;
  final $Res Function(ListenerSessionStatsResponseModel) _then;

/// Create a copy of ListenerSessionStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerSessionStatsData,
  ));
}
/// Create a copy of ListenerSessionStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSessionStatsDataCopyWith<$Res> get data {
  
  return $ListenerSessionStatsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerSessionStatsResponseModel].
extension ListenerSessionStatsResponseModelPatterns on ListenerSessionStatsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSessionStatsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSessionStatsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSessionStatsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionStatsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSessionStatsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionStatsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerSessionStatsData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSessionStatsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerSessionStatsData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionStatsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerSessionStatsData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionStatsResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSessionStatsResponseModel implements ListenerSessionStatsResponseModel {
  const _ListenerSessionStatsResponseModel({required this.status, required this.data});
  factory _ListenerSessionStatsResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerSessionStatsResponseModelFromJson(json);

@override final  String status;
@override final  ListenerSessionStatsData data;

/// Create a copy of ListenerSessionStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSessionStatsResponseModelCopyWith<_ListenerSessionStatsResponseModel> get copyWith => __$ListenerSessionStatsResponseModelCopyWithImpl<_ListenerSessionStatsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSessionStatsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSessionStatsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerSessionStatsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerSessionStatsResponseModelCopyWith<$Res> implements $ListenerSessionStatsResponseModelCopyWith<$Res> {
  factory _$ListenerSessionStatsResponseModelCopyWith(_ListenerSessionStatsResponseModel value, $Res Function(_ListenerSessionStatsResponseModel) _then) = __$ListenerSessionStatsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerSessionStatsData data
});


@override $ListenerSessionStatsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerSessionStatsResponseModelCopyWithImpl<$Res>
    implements _$ListenerSessionStatsResponseModelCopyWith<$Res> {
  __$ListenerSessionStatsResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerSessionStatsResponseModel _self;
  final $Res Function(_ListenerSessionStatsResponseModel) _then;

/// Create a copy of ListenerSessionStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerSessionStatsResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerSessionStatsData,
  ));
}

/// Create a copy of ListenerSessionStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSessionStatsDataCopyWith<$Res> get data {
  
  return $ListenerSessionStatsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerSessionStatsData {

 int get accepted_count; int get declined_count; int get missed_count;
/// Create a copy of ListenerSessionStatsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSessionStatsDataCopyWith<ListenerSessionStatsData> get copyWith => _$ListenerSessionStatsDataCopyWithImpl<ListenerSessionStatsData>(this as ListenerSessionStatsData, _$identity);

  /// Serializes this ListenerSessionStatsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionStatsData&&(identical(other.accepted_count, accepted_count) || other.accepted_count == accepted_count)&&(identical(other.declined_count, declined_count) || other.declined_count == declined_count)&&(identical(other.missed_count, missed_count) || other.missed_count == missed_count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accepted_count,declined_count,missed_count);

@override
String toString() {
  return 'ListenerSessionStatsData(accepted_count: $accepted_count, declined_count: $declined_count, missed_count: $missed_count)';
}


}

/// @nodoc
abstract mixin class $ListenerSessionStatsDataCopyWith<$Res>  {
  factory $ListenerSessionStatsDataCopyWith(ListenerSessionStatsData value, $Res Function(ListenerSessionStatsData) _then) = _$ListenerSessionStatsDataCopyWithImpl;
@useResult
$Res call({
 int accepted_count, int declined_count, int missed_count
});




}
/// @nodoc
class _$ListenerSessionStatsDataCopyWithImpl<$Res>
    implements $ListenerSessionStatsDataCopyWith<$Res> {
  _$ListenerSessionStatsDataCopyWithImpl(this._self, this._then);

  final ListenerSessionStatsData _self;
  final $Res Function(ListenerSessionStatsData) _then;

/// Create a copy of ListenerSessionStatsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accepted_count = null,Object? declined_count = null,Object? missed_count = null,}) {
  return _then(_self.copyWith(
accepted_count: null == accepted_count ? _self.accepted_count : accepted_count // ignore: cast_nullable_to_non_nullable
as int,declined_count: null == declined_count ? _self.declined_count : declined_count // ignore: cast_nullable_to_non_nullable
as int,missed_count: null == missed_count ? _self.missed_count : missed_count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerSessionStatsData].
extension ListenerSessionStatsDataPatterns on ListenerSessionStatsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSessionStatsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSessionStatsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSessionStatsData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionStatsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSessionStatsData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionStatsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int accepted_count,  int declined_count,  int missed_count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSessionStatsData() when $default != null:
return $default(_that.accepted_count,_that.declined_count,_that.missed_count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int accepted_count,  int declined_count,  int missed_count)  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionStatsData():
return $default(_that.accepted_count,_that.declined_count,_that.missed_count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int accepted_count,  int declined_count,  int missed_count)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionStatsData() when $default != null:
return $default(_that.accepted_count,_that.declined_count,_that.missed_count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSessionStatsData implements ListenerSessionStatsData {
  const _ListenerSessionStatsData({this.accepted_count = 0, this.declined_count = 0, this.missed_count = 0});
  factory _ListenerSessionStatsData.fromJson(Map<String, dynamic> json) => _$ListenerSessionStatsDataFromJson(json);

@override@JsonKey() final  int accepted_count;
@override@JsonKey() final  int declined_count;
@override@JsonKey() final  int missed_count;

/// Create a copy of ListenerSessionStatsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSessionStatsDataCopyWith<_ListenerSessionStatsData> get copyWith => __$ListenerSessionStatsDataCopyWithImpl<_ListenerSessionStatsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSessionStatsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSessionStatsData&&(identical(other.accepted_count, accepted_count) || other.accepted_count == accepted_count)&&(identical(other.declined_count, declined_count) || other.declined_count == declined_count)&&(identical(other.missed_count, missed_count) || other.missed_count == missed_count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accepted_count,declined_count,missed_count);

@override
String toString() {
  return 'ListenerSessionStatsData(accepted_count: $accepted_count, declined_count: $declined_count, missed_count: $missed_count)';
}


}

/// @nodoc
abstract mixin class _$ListenerSessionStatsDataCopyWith<$Res> implements $ListenerSessionStatsDataCopyWith<$Res> {
  factory _$ListenerSessionStatsDataCopyWith(_ListenerSessionStatsData value, $Res Function(_ListenerSessionStatsData) _then) = __$ListenerSessionStatsDataCopyWithImpl;
@override @useResult
$Res call({
 int accepted_count, int declined_count, int missed_count
});




}
/// @nodoc
class __$ListenerSessionStatsDataCopyWithImpl<$Res>
    implements _$ListenerSessionStatsDataCopyWith<$Res> {
  __$ListenerSessionStatsDataCopyWithImpl(this._self, this._then);

  final _ListenerSessionStatsData _self;
  final $Res Function(_ListenerSessionStatsData) _then;

/// Create a copy of ListenerSessionStatsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accepted_count = null,Object? declined_count = null,Object? missed_count = null,}) {
  return _then(_ListenerSessionStatsData(
accepted_count: null == accepted_count ? _self.accepted_count : accepted_count // ignore: cast_nullable_to_non_nullable
as int,declined_count: null == declined_count ? _self.declined_count : declined_count // ignore: cast_nullable_to_non_nullable
as int,missed_count: null == missed_count ? _self.missed_count : missed_count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ListenerSessionRequestsResponseModel {

 String get status; ListenerSessionRequestsData get data;
/// Create a copy of ListenerSessionRequestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSessionRequestsResponseModelCopyWith<ListenerSessionRequestsResponseModel> get copyWith => _$ListenerSessionRequestsResponseModelCopyWithImpl<ListenerSessionRequestsResponseModel>(this as ListenerSessionRequestsResponseModel, _$identity);

  /// Serializes this ListenerSessionRequestsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionRequestsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerSessionRequestsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerSessionRequestsResponseModelCopyWith<$Res>  {
  factory $ListenerSessionRequestsResponseModelCopyWith(ListenerSessionRequestsResponseModel value, $Res Function(ListenerSessionRequestsResponseModel) _then) = _$ListenerSessionRequestsResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerSessionRequestsData data
});


$ListenerSessionRequestsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerSessionRequestsResponseModelCopyWithImpl<$Res>
    implements $ListenerSessionRequestsResponseModelCopyWith<$Res> {
  _$ListenerSessionRequestsResponseModelCopyWithImpl(this._self, this._then);

  final ListenerSessionRequestsResponseModel _self;
  final $Res Function(ListenerSessionRequestsResponseModel) _then;

/// Create a copy of ListenerSessionRequestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerSessionRequestsData,
  ));
}
/// Create a copy of ListenerSessionRequestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSessionRequestsDataCopyWith<$Res> get data {
  
  return $ListenerSessionRequestsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerSessionRequestsResponseModel].
extension ListenerSessionRequestsResponseModelPatterns on ListenerSessionRequestsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSessionRequestsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSessionRequestsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSessionRequestsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionRequestsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSessionRequestsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionRequestsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerSessionRequestsData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSessionRequestsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerSessionRequestsData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionRequestsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerSessionRequestsData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionRequestsResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSessionRequestsResponseModel implements ListenerSessionRequestsResponseModel {
  const _ListenerSessionRequestsResponseModel({required this.status, required this.data});
  factory _ListenerSessionRequestsResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerSessionRequestsResponseModelFromJson(json);

@override final  String status;
@override final  ListenerSessionRequestsData data;

/// Create a copy of ListenerSessionRequestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSessionRequestsResponseModelCopyWith<_ListenerSessionRequestsResponseModel> get copyWith => __$ListenerSessionRequestsResponseModelCopyWithImpl<_ListenerSessionRequestsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSessionRequestsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSessionRequestsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerSessionRequestsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerSessionRequestsResponseModelCopyWith<$Res> implements $ListenerSessionRequestsResponseModelCopyWith<$Res> {
  factory _$ListenerSessionRequestsResponseModelCopyWith(_ListenerSessionRequestsResponseModel value, $Res Function(_ListenerSessionRequestsResponseModel) _then) = __$ListenerSessionRequestsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerSessionRequestsData data
});


@override $ListenerSessionRequestsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerSessionRequestsResponseModelCopyWithImpl<$Res>
    implements _$ListenerSessionRequestsResponseModelCopyWith<$Res> {
  __$ListenerSessionRequestsResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerSessionRequestsResponseModel _self;
  final $Res Function(_ListenerSessionRequestsResponseModel) _then;

/// Create a copy of ListenerSessionRequestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerSessionRequestsResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerSessionRequestsData,
  ));
}

/// Create a copy of ListenerSessionRequestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSessionRequestsDataCopyWith<$Res> get data {
  
  return $ListenerSessionRequestsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerSessionRequestsData {

 List<ListenerSessionRequestModel> get items;
/// Create a copy of ListenerSessionRequestsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSessionRequestsDataCopyWith<ListenerSessionRequestsData> get copyWith => _$ListenerSessionRequestsDataCopyWithImpl<ListenerSessionRequestsData>(this as ListenerSessionRequestsData, _$identity);

  /// Serializes this ListenerSessionRequestsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionRequestsData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ListenerSessionRequestsData(items: $items)';
}


}

/// @nodoc
abstract mixin class $ListenerSessionRequestsDataCopyWith<$Res>  {
  factory $ListenerSessionRequestsDataCopyWith(ListenerSessionRequestsData value, $Res Function(ListenerSessionRequestsData) _then) = _$ListenerSessionRequestsDataCopyWithImpl;
@useResult
$Res call({
 List<ListenerSessionRequestModel> items
});




}
/// @nodoc
class _$ListenerSessionRequestsDataCopyWithImpl<$Res>
    implements $ListenerSessionRequestsDataCopyWith<$Res> {
  _$ListenerSessionRequestsDataCopyWithImpl(this._self, this._then);

  final ListenerSessionRequestsData _self;
  final $Res Function(ListenerSessionRequestsData) _then;

/// Create a copy of ListenerSessionRequestsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerSessionRequestModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerSessionRequestsData].
extension ListenerSessionRequestsDataPatterns on ListenerSessionRequestsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSessionRequestsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSessionRequestsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSessionRequestsData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionRequestsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSessionRequestsData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionRequestsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListenerSessionRequestModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSessionRequestsData() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListenerSessionRequestModel> items)  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionRequestsData():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListenerSessionRequestModel> items)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionRequestsData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSessionRequestsData implements ListenerSessionRequestsData {
  const _ListenerSessionRequestsData({final  List<ListenerSessionRequestModel> items = const <ListenerSessionRequestModel>[]}): _items = items;
  factory _ListenerSessionRequestsData.fromJson(Map<String, dynamic> json) => _$ListenerSessionRequestsDataFromJson(json);

 final  List<ListenerSessionRequestModel> _items;
@override@JsonKey() List<ListenerSessionRequestModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ListenerSessionRequestsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSessionRequestsDataCopyWith<_ListenerSessionRequestsData> get copyWith => __$ListenerSessionRequestsDataCopyWithImpl<_ListenerSessionRequestsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSessionRequestsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSessionRequestsData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ListenerSessionRequestsData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$ListenerSessionRequestsDataCopyWith<$Res> implements $ListenerSessionRequestsDataCopyWith<$Res> {
  factory _$ListenerSessionRequestsDataCopyWith(_ListenerSessionRequestsData value, $Res Function(_ListenerSessionRequestsData) _then) = __$ListenerSessionRequestsDataCopyWithImpl;
@override @useResult
$Res call({
 List<ListenerSessionRequestModel> items
});




}
/// @nodoc
class __$ListenerSessionRequestsDataCopyWithImpl<$Res>
    implements _$ListenerSessionRequestsDataCopyWith<$Res> {
  __$ListenerSessionRequestsDataCopyWithImpl(this._self, this._then);

  final _ListenerSessionRequestsData _self;
  final $Res Function(_ListenerSessionRequestsData) _then;

/// Create a copy of ListenerSessionRequestsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_ListenerSessionRequestsData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerSessionRequestModel>,
  ));
}


}


/// @nodoc
mixin _$ListenerSessionRequestModel {

 String get id; String get ventor_name; String? get ventor_avatar_url; String get message; String get chosen_reason; String get scheduled_at; int get duration_minutes; List<String> get tags; String get received_at; String? get speech_language; bool get is_instant; bool get is_video_call; num get ventor_rating;
/// Create a copy of ListenerSessionRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSessionRequestModelCopyWith<ListenerSessionRequestModel> get copyWith => _$ListenerSessionRequestModelCopyWithImpl<ListenerSessionRequestModel>(this as ListenerSessionRequestModel, _$identity);

  /// Serializes this ListenerSessionRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ventor_name, ventor_name) || other.ventor_name == ventor_name)&&(identical(other.ventor_avatar_url, ventor_avatar_url) || other.ventor_avatar_url == ventor_avatar_url)&&(identical(other.message, message) || other.message == message)&&(identical(other.chosen_reason, chosen_reason) || other.chosen_reason == chosen_reason)&&(identical(other.scheduled_at, scheduled_at) || other.scheduled_at == scheduled_at)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.received_at, received_at) || other.received_at == received_at)&&(identical(other.speech_language, speech_language) || other.speech_language == speech_language)&&(identical(other.is_instant, is_instant) || other.is_instant == is_instant)&&(identical(other.is_video_call, is_video_call) || other.is_video_call == is_video_call)&&(identical(other.ventor_rating, ventor_rating) || other.ventor_rating == ventor_rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ventor_name,ventor_avatar_url,message,chosen_reason,scheduled_at,duration_minutes,const DeepCollectionEquality().hash(tags),received_at,speech_language,is_instant,is_video_call,ventor_rating);

@override
String toString() {
  return 'ListenerSessionRequestModel(id: $id, ventor_name: $ventor_name, ventor_avatar_url: $ventor_avatar_url, message: $message, chosen_reason: $chosen_reason, scheduled_at: $scheduled_at, duration_minutes: $duration_minutes, tags: $tags, received_at: $received_at, speech_language: $speech_language, is_instant: $is_instant, is_video_call: $is_video_call, ventor_rating: $ventor_rating)';
}


}

/// @nodoc
abstract mixin class $ListenerSessionRequestModelCopyWith<$Res>  {
  factory $ListenerSessionRequestModelCopyWith(ListenerSessionRequestModel value, $Res Function(ListenerSessionRequestModel) _then) = _$ListenerSessionRequestModelCopyWithImpl;
@useResult
$Res call({
 String id, String ventor_name, String? ventor_avatar_url, String message, String chosen_reason, String scheduled_at, int duration_minutes, List<String> tags, String received_at, String? speech_language, bool is_instant, bool is_video_call, num ventor_rating
});




}
/// @nodoc
class _$ListenerSessionRequestModelCopyWithImpl<$Res>
    implements $ListenerSessionRequestModelCopyWith<$Res> {
  _$ListenerSessionRequestModelCopyWithImpl(this._self, this._then);

  final ListenerSessionRequestModel _self;
  final $Res Function(ListenerSessionRequestModel) _then;

/// Create a copy of ListenerSessionRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ventor_name = null,Object? ventor_avatar_url = freezed,Object? message = null,Object? chosen_reason = null,Object? scheduled_at = null,Object? duration_minutes = null,Object? tags = null,Object? received_at = null,Object? speech_language = freezed,Object? is_instant = null,Object? is_video_call = null,Object? ventor_rating = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ventor_name: null == ventor_name ? _self.ventor_name : ventor_name // ignore: cast_nullable_to_non_nullable
as String,ventor_avatar_url: freezed == ventor_avatar_url ? _self.ventor_avatar_url : ventor_avatar_url // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,chosen_reason: null == chosen_reason ? _self.chosen_reason : chosen_reason // ignore: cast_nullable_to_non_nullable
as String,scheduled_at: null == scheduled_at ? _self.scheduled_at : scheduled_at // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,received_at: null == received_at ? _self.received_at : received_at // ignore: cast_nullable_to_non_nullable
as String,speech_language: freezed == speech_language ? _self.speech_language : speech_language // ignore: cast_nullable_to_non_nullable
as String?,is_instant: null == is_instant ? _self.is_instant : is_instant // ignore: cast_nullable_to_non_nullable
as bool,is_video_call: null == is_video_call ? _self.is_video_call : is_video_call // ignore: cast_nullable_to_non_nullable
as bool,ventor_rating: null == ventor_rating ? _self.ventor_rating : ventor_rating // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerSessionRequestModel].
extension ListenerSessionRequestModelPatterns on ListenerSessionRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSessionRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSessionRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSessionRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSessionRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ventor_name,  String? ventor_avatar_url,  String message,  String chosen_reason,  String scheduled_at,  int duration_minutes,  List<String> tags,  String received_at,  String? speech_language,  bool is_instant,  bool is_video_call,  num ventor_rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSessionRequestModel() when $default != null:
return $default(_that.id,_that.ventor_name,_that.ventor_avatar_url,_that.message,_that.chosen_reason,_that.scheduled_at,_that.duration_minutes,_that.tags,_that.received_at,_that.speech_language,_that.is_instant,_that.is_video_call,_that.ventor_rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ventor_name,  String? ventor_avatar_url,  String message,  String chosen_reason,  String scheduled_at,  int duration_minutes,  List<String> tags,  String received_at,  String? speech_language,  bool is_instant,  bool is_video_call,  num ventor_rating)  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionRequestModel():
return $default(_that.id,_that.ventor_name,_that.ventor_avatar_url,_that.message,_that.chosen_reason,_that.scheduled_at,_that.duration_minutes,_that.tags,_that.received_at,_that.speech_language,_that.is_instant,_that.is_video_call,_that.ventor_rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ventor_name,  String? ventor_avatar_url,  String message,  String chosen_reason,  String scheduled_at,  int duration_minutes,  List<String> tags,  String received_at,  String? speech_language,  bool is_instant,  bool is_video_call,  num ventor_rating)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionRequestModel() when $default != null:
return $default(_that.id,_that.ventor_name,_that.ventor_avatar_url,_that.message,_that.chosen_reason,_that.scheduled_at,_that.duration_minutes,_that.tags,_that.received_at,_that.speech_language,_that.is_instant,_that.is_video_call,_that.ventor_rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSessionRequestModel implements ListenerSessionRequestModel {
  const _ListenerSessionRequestModel({this.id = '', this.ventor_name = '', this.ventor_avatar_url, this.message = '', this.chosen_reason = '', this.scheduled_at = '', this.duration_minutes = 0, final  List<String> tags = const <String>[], this.received_at = '', this.speech_language, this.is_instant = false, this.is_video_call = false, this.ventor_rating = 0}): _tags = tags;
  factory _ListenerSessionRequestModel.fromJson(Map<String, dynamic> json) => _$ListenerSessionRequestModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String ventor_name;
@override final  String? ventor_avatar_url;
@override@JsonKey() final  String message;
@override@JsonKey() final  String chosen_reason;
@override@JsonKey() final  String scheduled_at;
@override@JsonKey() final  int duration_minutes;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  String received_at;
@override final  String? speech_language;
@override@JsonKey() final  bool is_instant;
@override@JsonKey() final  bool is_video_call;
@override@JsonKey() final  num ventor_rating;

/// Create a copy of ListenerSessionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSessionRequestModelCopyWith<_ListenerSessionRequestModel> get copyWith => __$ListenerSessionRequestModelCopyWithImpl<_ListenerSessionRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSessionRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSessionRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ventor_name, ventor_name) || other.ventor_name == ventor_name)&&(identical(other.ventor_avatar_url, ventor_avatar_url) || other.ventor_avatar_url == ventor_avatar_url)&&(identical(other.message, message) || other.message == message)&&(identical(other.chosen_reason, chosen_reason) || other.chosen_reason == chosen_reason)&&(identical(other.scheduled_at, scheduled_at) || other.scheduled_at == scheduled_at)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.received_at, received_at) || other.received_at == received_at)&&(identical(other.speech_language, speech_language) || other.speech_language == speech_language)&&(identical(other.is_instant, is_instant) || other.is_instant == is_instant)&&(identical(other.is_video_call, is_video_call) || other.is_video_call == is_video_call)&&(identical(other.ventor_rating, ventor_rating) || other.ventor_rating == ventor_rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ventor_name,ventor_avatar_url,message,chosen_reason,scheduled_at,duration_minutes,const DeepCollectionEquality().hash(_tags),received_at,speech_language,is_instant,is_video_call,ventor_rating);

@override
String toString() {
  return 'ListenerSessionRequestModel(id: $id, ventor_name: $ventor_name, ventor_avatar_url: $ventor_avatar_url, message: $message, chosen_reason: $chosen_reason, scheduled_at: $scheduled_at, duration_minutes: $duration_minutes, tags: $tags, received_at: $received_at, speech_language: $speech_language, is_instant: $is_instant, is_video_call: $is_video_call, ventor_rating: $ventor_rating)';
}


}

/// @nodoc
abstract mixin class _$ListenerSessionRequestModelCopyWith<$Res> implements $ListenerSessionRequestModelCopyWith<$Res> {
  factory _$ListenerSessionRequestModelCopyWith(_ListenerSessionRequestModel value, $Res Function(_ListenerSessionRequestModel) _then) = __$ListenerSessionRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String ventor_name, String? ventor_avatar_url, String message, String chosen_reason, String scheduled_at, int duration_minutes, List<String> tags, String received_at, String? speech_language, bool is_instant, bool is_video_call, num ventor_rating
});




}
/// @nodoc
class __$ListenerSessionRequestModelCopyWithImpl<$Res>
    implements _$ListenerSessionRequestModelCopyWith<$Res> {
  __$ListenerSessionRequestModelCopyWithImpl(this._self, this._then);

  final _ListenerSessionRequestModel _self;
  final $Res Function(_ListenerSessionRequestModel) _then;

/// Create a copy of ListenerSessionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ventor_name = null,Object? ventor_avatar_url = freezed,Object? message = null,Object? chosen_reason = null,Object? scheduled_at = null,Object? duration_minutes = null,Object? tags = null,Object? received_at = null,Object? speech_language = freezed,Object? is_instant = null,Object? is_video_call = null,Object? ventor_rating = null,}) {
  return _then(_ListenerSessionRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ventor_name: null == ventor_name ? _self.ventor_name : ventor_name // ignore: cast_nullable_to_non_nullable
as String,ventor_avatar_url: freezed == ventor_avatar_url ? _self.ventor_avatar_url : ventor_avatar_url // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,chosen_reason: null == chosen_reason ? _self.chosen_reason : chosen_reason // ignore: cast_nullable_to_non_nullable
as String,scheduled_at: null == scheduled_at ? _self.scheduled_at : scheduled_at // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,received_at: null == received_at ? _self.received_at : received_at // ignore: cast_nullable_to_non_nullable
as String,speech_language: freezed == speech_language ? _self.speech_language : speech_language // ignore: cast_nullable_to_non_nullable
as String?,is_instant: null == is_instant ? _self.is_instant : is_instant // ignore: cast_nullable_to_non_nullable
as bool,is_video_call: null == is_video_call ? _self.is_video_call : is_video_call // ignore: cast_nullable_to_non_nullable
as bool,ventor_rating: null == ventor_rating ? _self.ventor_rating : ventor_rating // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$ListenerAcceptSessionRequestResponseModel {

 String get status; ListenerAcceptSessionRequestData get data;
/// Create a copy of ListenerAcceptSessionRequestResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerAcceptSessionRequestResponseModelCopyWith<ListenerAcceptSessionRequestResponseModel> get copyWith => _$ListenerAcceptSessionRequestResponseModelCopyWithImpl<ListenerAcceptSessionRequestResponseModel>(this as ListenerAcceptSessionRequestResponseModel, _$identity);

  /// Serializes this ListenerAcceptSessionRequestResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAcceptSessionRequestResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerAcceptSessionRequestResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerAcceptSessionRequestResponseModelCopyWith<$Res>  {
  factory $ListenerAcceptSessionRequestResponseModelCopyWith(ListenerAcceptSessionRequestResponseModel value, $Res Function(ListenerAcceptSessionRequestResponseModel) _then) = _$ListenerAcceptSessionRequestResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerAcceptSessionRequestData data
});


$ListenerAcceptSessionRequestDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerAcceptSessionRequestResponseModelCopyWithImpl<$Res>
    implements $ListenerAcceptSessionRequestResponseModelCopyWith<$Res> {
  _$ListenerAcceptSessionRequestResponseModelCopyWithImpl(this._self, this._then);

  final ListenerAcceptSessionRequestResponseModel _self;
  final $Res Function(ListenerAcceptSessionRequestResponseModel) _then;

/// Create a copy of ListenerAcceptSessionRequestResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerAcceptSessionRequestData,
  ));
}
/// Create a copy of ListenerAcceptSessionRequestResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerAcceptSessionRequestDataCopyWith<$Res> get data {
  
  return $ListenerAcceptSessionRequestDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerAcceptSessionRequestResponseModel].
extension ListenerAcceptSessionRequestResponseModelPatterns on ListenerAcceptSessionRequestResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerAcceptSessionRequestResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerAcceptSessionRequestResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerAcceptSessionRequestResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerAcceptSessionRequestResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerAcceptSessionRequestResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerAcceptSessionRequestResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerAcceptSessionRequestData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerAcceptSessionRequestResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerAcceptSessionRequestData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerAcceptSessionRequestResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerAcceptSessionRequestData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerAcceptSessionRequestResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerAcceptSessionRequestResponseModel implements ListenerAcceptSessionRequestResponseModel {
  const _ListenerAcceptSessionRequestResponseModel({required this.status, required this.data});
  factory _ListenerAcceptSessionRequestResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerAcceptSessionRequestResponseModelFromJson(json);

@override final  String status;
@override final  ListenerAcceptSessionRequestData data;

/// Create a copy of ListenerAcceptSessionRequestResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerAcceptSessionRequestResponseModelCopyWith<_ListenerAcceptSessionRequestResponseModel> get copyWith => __$ListenerAcceptSessionRequestResponseModelCopyWithImpl<_ListenerAcceptSessionRequestResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerAcceptSessionRequestResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerAcceptSessionRequestResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerAcceptSessionRequestResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerAcceptSessionRequestResponseModelCopyWith<$Res> implements $ListenerAcceptSessionRequestResponseModelCopyWith<$Res> {
  factory _$ListenerAcceptSessionRequestResponseModelCopyWith(_ListenerAcceptSessionRequestResponseModel value, $Res Function(_ListenerAcceptSessionRequestResponseModel) _then) = __$ListenerAcceptSessionRequestResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerAcceptSessionRequestData data
});


@override $ListenerAcceptSessionRequestDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerAcceptSessionRequestResponseModelCopyWithImpl<$Res>
    implements _$ListenerAcceptSessionRequestResponseModelCopyWith<$Res> {
  __$ListenerAcceptSessionRequestResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerAcceptSessionRequestResponseModel _self;
  final $Res Function(_ListenerAcceptSessionRequestResponseModel) _then;

/// Create a copy of ListenerAcceptSessionRequestResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerAcceptSessionRequestResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerAcceptSessionRequestData,
  ));
}

/// Create a copy of ListenerAcceptSessionRequestResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerAcceptSessionRequestDataCopyWith<$Res> get data {
  
  return $ListenerAcceptSessionRequestDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerAcceptSessionRequestData {

 String get session_id; String get status;
/// Create a copy of ListenerAcceptSessionRequestData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerAcceptSessionRequestDataCopyWith<ListenerAcceptSessionRequestData> get copyWith => _$ListenerAcceptSessionRequestDataCopyWithImpl<ListenerAcceptSessionRequestData>(this as ListenerAcceptSessionRequestData, _$identity);

  /// Serializes this ListenerAcceptSessionRequestData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAcceptSessionRequestData&&(identical(other.session_id, session_id) || other.session_id == session_id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session_id,status);

@override
String toString() {
  return 'ListenerAcceptSessionRequestData(session_id: $session_id, status: $status)';
}


}

/// @nodoc
abstract mixin class $ListenerAcceptSessionRequestDataCopyWith<$Res>  {
  factory $ListenerAcceptSessionRequestDataCopyWith(ListenerAcceptSessionRequestData value, $Res Function(ListenerAcceptSessionRequestData) _then) = _$ListenerAcceptSessionRequestDataCopyWithImpl;
@useResult
$Res call({
 String session_id, String status
});




}
/// @nodoc
class _$ListenerAcceptSessionRequestDataCopyWithImpl<$Res>
    implements $ListenerAcceptSessionRequestDataCopyWith<$Res> {
  _$ListenerAcceptSessionRequestDataCopyWithImpl(this._self, this._then);

  final ListenerAcceptSessionRequestData _self;
  final $Res Function(ListenerAcceptSessionRequestData) _then;

/// Create a copy of ListenerAcceptSessionRequestData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session_id = null,Object? status = null,}) {
  return _then(_self.copyWith(
session_id: null == session_id ? _self.session_id : session_id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerAcceptSessionRequestData].
extension ListenerAcceptSessionRequestDataPatterns on ListenerAcceptSessionRequestData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerAcceptSessionRequestData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerAcceptSessionRequestData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerAcceptSessionRequestData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerAcceptSessionRequestData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerAcceptSessionRequestData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerAcceptSessionRequestData() when $default != null:
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
case _ListenerAcceptSessionRequestData() when $default != null:
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
case _ListenerAcceptSessionRequestData():
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
case _ListenerAcceptSessionRequestData() when $default != null:
return $default(_that.session_id,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerAcceptSessionRequestData implements ListenerAcceptSessionRequestData {
  const _ListenerAcceptSessionRequestData({this.session_id = '', this.status = ''});
  factory _ListenerAcceptSessionRequestData.fromJson(Map<String, dynamic> json) => _$ListenerAcceptSessionRequestDataFromJson(json);

@override@JsonKey() final  String session_id;
@override@JsonKey() final  String status;

/// Create a copy of ListenerAcceptSessionRequestData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerAcceptSessionRequestDataCopyWith<_ListenerAcceptSessionRequestData> get copyWith => __$ListenerAcceptSessionRequestDataCopyWithImpl<_ListenerAcceptSessionRequestData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerAcceptSessionRequestDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerAcceptSessionRequestData&&(identical(other.session_id, session_id) || other.session_id == session_id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session_id,status);

@override
String toString() {
  return 'ListenerAcceptSessionRequestData(session_id: $session_id, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ListenerAcceptSessionRequestDataCopyWith<$Res> implements $ListenerAcceptSessionRequestDataCopyWith<$Res> {
  factory _$ListenerAcceptSessionRequestDataCopyWith(_ListenerAcceptSessionRequestData value, $Res Function(_ListenerAcceptSessionRequestData) _then) = __$ListenerAcceptSessionRequestDataCopyWithImpl;
@override @useResult
$Res call({
 String session_id, String status
});




}
/// @nodoc
class __$ListenerAcceptSessionRequestDataCopyWithImpl<$Res>
    implements _$ListenerAcceptSessionRequestDataCopyWith<$Res> {
  __$ListenerAcceptSessionRequestDataCopyWithImpl(this._self, this._then);

  final _ListenerAcceptSessionRequestData _self;
  final $Res Function(_ListenerAcceptSessionRequestData) _then;

/// Create a copy of ListenerAcceptSessionRequestData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session_id = null,Object? status = null,}) {
  return _then(_ListenerAcceptSessionRequestData(
session_id: null == session_id ? _self.session_id : session_id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
