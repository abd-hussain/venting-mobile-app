// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_dashboard_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerDashboardResponseModel {

 String get status; ListenerDashboardData get data;
/// Create a copy of ListenerDashboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerDashboardResponseModelCopyWith<ListenerDashboardResponseModel> get copyWith => _$ListenerDashboardResponseModelCopyWithImpl<ListenerDashboardResponseModel>(this as ListenerDashboardResponseModel, _$identity);

  /// Serializes this ListenerDashboardResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerDashboardResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerDashboardResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerDashboardResponseModelCopyWith<$Res>  {
  factory $ListenerDashboardResponseModelCopyWith(ListenerDashboardResponseModel value, $Res Function(ListenerDashboardResponseModel) _then) = _$ListenerDashboardResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerDashboardData data
});


$ListenerDashboardDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerDashboardResponseModelCopyWithImpl<$Res>
    implements $ListenerDashboardResponseModelCopyWith<$Res> {
  _$ListenerDashboardResponseModelCopyWithImpl(this._self, this._then);

  final ListenerDashboardResponseModel _self;
  final $Res Function(ListenerDashboardResponseModel) _then;

/// Create a copy of ListenerDashboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerDashboardData,
  ));
}
/// Create a copy of ListenerDashboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerDashboardDataCopyWith<$Res> get data {
  
  return $ListenerDashboardDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerDashboardResponseModel].
extension ListenerDashboardResponseModelPatterns on ListenerDashboardResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerDashboardResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerDashboardResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerDashboardResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerDashboardResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerDashboardData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerDashboardResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerDashboardData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerDashboardData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerDashboardResponseModel implements ListenerDashboardResponseModel {
  const _ListenerDashboardResponseModel({required this.status, required this.data});
  factory _ListenerDashboardResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerDashboardResponseModelFromJson(json);

@override final  String status;
@override final  ListenerDashboardData data;

/// Create a copy of ListenerDashboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerDashboardResponseModelCopyWith<_ListenerDashboardResponseModel> get copyWith => __$ListenerDashboardResponseModelCopyWithImpl<_ListenerDashboardResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerDashboardResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerDashboardResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerDashboardResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerDashboardResponseModelCopyWith<$Res> implements $ListenerDashboardResponseModelCopyWith<$Res> {
  factory _$ListenerDashboardResponseModelCopyWith(_ListenerDashboardResponseModel value, $Res Function(_ListenerDashboardResponseModel) _then) = __$ListenerDashboardResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerDashboardData data
});


@override $ListenerDashboardDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerDashboardResponseModelCopyWithImpl<$Res>
    implements _$ListenerDashboardResponseModelCopyWith<$Res> {
  __$ListenerDashboardResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerDashboardResponseModel _self;
  final $Res Function(_ListenerDashboardResponseModel) _then;

/// Create a copy of ListenerDashboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerDashboardResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerDashboardData,
  ));
}

/// Create a copy of ListenerDashboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerDashboardDataCopyWith<$Res> get data {
  
  return $ListenerDashboardDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc
mixin _$ListenerDashboardData {

 String get display_name; ListenerDashboardReminderModel? get reminder; ListenerDashboardUpcomingSessionModel? get next_upcoming_session;
/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerDashboardDataCopyWith<ListenerDashboardData> get copyWith => _$ListenerDashboardDataCopyWithImpl<ListenerDashboardData>(this as ListenerDashboardData, _$identity);

  /// Serializes this ListenerDashboardData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerDashboardData&&(identical(other.display_name, display_name) || other.display_name == display_name)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.next_upcoming_session, next_upcoming_session) || other.next_upcoming_session == next_upcoming_session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,display_name,reminder,next_upcoming_session);

@override
String toString() {
  return 'ListenerDashboardData(display_name: $display_name, reminder: $reminder, next_upcoming_session: $next_upcoming_session)';
}


}

/// @nodoc
abstract mixin class $ListenerDashboardDataCopyWith<$Res>  {
  factory $ListenerDashboardDataCopyWith(ListenerDashboardData value, $Res Function(ListenerDashboardData) _then) = _$ListenerDashboardDataCopyWithImpl;
@useResult
$Res call({
 String display_name, ListenerDashboardReminderModel? reminder, ListenerDashboardUpcomingSessionModel? next_upcoming_session
});


$ListenerDashboardReminderModelCopyWith<$Res>? get reminder;$ListenerDashboardUpcomingSessionModelCopyWith<$Res>? get next_upcoming_session;

}
/// @nodoc
class _$ListenerDashboardDataCopyWithImpl<$Res>
    implements $ListenerDashboardDataCopyWith<$Res> {
  _$ListenerDashboardDataCopyWithImpl(this._self, this._then);

  final ListenerDashboardData _self;
  final $Res Function(ListenerDashboardData) _then;

/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? display_name = null,Object? reminder = freezed,Object? next_upcoming_session = freezed,}) {
  return _then(_self.copyWith(
display_name: null == display_name ? _self.display_name : display_name // ignore: cast_nullable_to_non_nullable
as String,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as ListenerDashboardReminderModel?,next_upcoming_session: freezed == next_upcoming_session ? _self.next_upcoming_session : next_upcoming_session // ignore: cast_nullable_to_non_nullable
as ListenerDashboardUpcomingSessionModel?,
  ));
}
/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerDashboardReminderModelCopyWith<$Res>? get reminder {
    if (_self.reminder == null) {
    return null;
  }

  return $ListenerDashboardReminderModelCopyWith<$Res>(_self.reminder!, (value) {
    return _then(_self.copyWith(reminder: value));
  });
}/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerDashboardUpcomingSessionModelCopyWith<$Res>? get next_upcoming_session {
    if (_self.next_upcoming_session == null) {
    return null;
  }

  return $ListenerDashboardUpcomingSessionModelCopyWith<$Res>(_self.next_upcoming_session!, (value) {
    return _then(_self.copyWith(next_upcoming_session: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerDashboardData].
extension ListenerDashboardDataPatterns on ListenerDashboardData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerDashboardData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerDashboardData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerDashboardData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerDashboardData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String display_name,  ListenerDashboardReminderModel? reminder,  ListenerDashboardUpcomingSessionModel? next_upcoming_session)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerDashboardData() when $default != null:
return $default(_that.display_name,_that.reminder,_that.next_upcoming_session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String display_name,  ListenerDashboardReminderModel? reminder,  ListenerDashboardUpcomingSessionModel? next_upcoming_session)  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardData():
return $default(_that.display_name,_that.reminder,_that.next_upcoming_session);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String display_name,  ListenerDashboardReminderModel? reminder,  ListenerDashboardUpcomingSessionModel? next_upcoming_session)?  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardData() when $default != null:
return $default(_that.display_name,_that.reminder,_that.next_upcoming_session);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ListenerDashboardData implements ListenerDashboardData {
  const _ListenerDashboardData({this.display_name = '', this.reminder, this.next_upcoming_session});
  

@override@JsonKey() final  String display_name;
@override final  ListenerDashboardReminderModel? reminder;
@override final  ListenerDashboardUpcomingSessionModel? next_upcoming_session;

/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerDashboardDataCopyWith<_ListenerDashboardData> get copyWith => __$ListenerDashboardDataCopyWithImpl<_ListenerDashboardData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerDashboardDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerDashboardData&&(identical(other.display_name, display_name) || other.display_name == display_name)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.next_upcoming_session, next_upcoming_session) || other.next_upcoming_session == next_upcoming_session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,display_name,reminder,next_upcoming_session);

@override
String toString() {
  return 'ListenerDashboardData(display_name: $display_name, reminder: $reminder, next_upcoming_session: $next_upcoming_session)';
}


}

/// @nodoc
abstract mixin class _$ListenerDashboardDataCopyWith<$Res> implements $ListenerDashboardDataCopyWith<$Res> {
  factory _$ListenerDashboardDataCopyWith(_ListenerDashboardData value, $Res Function(_ListenerDashboardData) _then) = __$ListenerDashboardDataCopyWithImpl;
@override @useResult
$Res call({
 String display_name, ListenerDashboardReminderModel? reminder, ListenerDashboardUpcomingSessionModel? next_upcoming_session
});


@override $ListenerDashboardReminderModelCopyWith<$Res>? get reminder;@override $ListenerDashboardUpcomingSessionModelCopyWith<$Res>? get next_upcoming_session;

}
/// @nodoc
class __$ListenerDashboardDataCopyWithImpl<$Res>
    implements _$ListenerDashboardDataCopyWith<$Res> {
  __$ListenerDashboardDataCopyWithImpl(this._self, this._then);

  final _ListenerDashboardData _self;
  final $Res Function(_ListenerDashboardData) _then;

/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? display_name = null,Object? reminder = freezed,Object? next_upcoming_session = freezed,}) {
  return _then(_ListenerDashboardData(
display_name: null == display_name ? _self.display_name : display_name // ignore: cast_nullable_to_non_nullable
as String,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as ListenerDashboardReminderModel?,next_upcoming_session: freezed == next_upcoming_session ? _self.next_upcoming_session : next_upcoming_session // ignore: cast_nullable_to_non_nullable
as ListenerDashboardUpcomingSessionModel?,
  ));
}

/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerDashboardReminderModelCopyWith<$Res>? get reminder {
    if (_self.reminder == null) {
    return null;
  }

  return $ListenerDashboardReminderModelCopyWith<$Res>(_self.reminder!, (value) {
    return _then(_self.copyWith(reminder: value));
  });
}/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerDashboardUpcomingSessionModelCopyWith<$Res>? get next_upcoming_session {
    if (_self.next_upcoming_session == null) {
    return null;
  }

  return $ListenerDashboardUpcomingSessionModelCopyWith<$Res>(_self.next_upcoming_session!, (value) {
    return _then(_self.copyWith(next_upcoming_session: value));
  });
}
}


/// @nodoc
mixin _$ListenerDashboardUpcomingSessionModel {

 String get id; String get ventor_name; String get when_label; int get duration_minutes; String? get ventor_avatar_url;
/// Create a copy of ListenerDashboardUpcomingSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerDashboardUpcomingSessionModelCopyWith<ListenerDashboardUpcomingSessionModel> get copyWith => _$ListenerDashboardUpcomingSessionModelCopyWithImpl<ListenerDashboardUpcomingSessionModel>(this as ListenerDashboardUpcomingSessionModel, _$identity);

  /// Serializes this ListenerDashboardUpcomingSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerDashboardUpcomingSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ventor_name, ventor_name) || other.ventor_name == ventor_name)&&(identical(other.when_label, when_label) || other.when_label == when_label)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&(identical(other.ventor_avatar_url, ventor_avatar_url) || other.ventor_avatar_url == ventor_avatar_url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ventor_name,when_label,duration_minutes,ventor_avatar_url);

@override
String toString() {
  return 'ListenerDashboardUpcomingSessionModel(id: $id, ventor_name: $ventor_name, when_label: $when_label, duration_minutes: $duration_minutes, ventor_avatar_url: $ventor_avatar_url)';
}


}

/// @nodoc
abstract mixin class $ListenerDashboardUpcomingSessionModelCopyWith<$Res>  {
  factory $ListenerDashboardUpcomingSessionModelCopyWith(ListenerDashboardUpcomingSessionModel value, $Res Function(ListenerDashboardUpcomingSessionModel) _then) = _$ListenerDashboardUpcomingSessionModelCopyWithImpl;
@useResult
$Res call({
 String id, String ventor_name, String when_label, int duration_minutes, String? ventor_avatar_url
});




}
/// @nodoc
class _$ListenerDashboardUpcomingSessionModelCopyWithImpl<$Res>
    implements $ListenerDashboardUpcomingSessionModelCopyWith<$Res> {
  _$ListenerDashboardUpcomingSessionModelCopyWithImpl(this._self, this._then);

  final ListenerDashboardUpcomingSessionModel _self;
  final $Res Function(ListenerDashboardUpcomingSessionModel) _then;

/// Create a copy of ListenerDashboardUpcomingSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ventor_name = null,Object? when_label = null,Object? duration_minutes = null,Object? ventor_avatar_url = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ventor_name: null == ventor_name ? _self.ventor_name : ventor_name // ignore: cast_nullable_to_non_nullable
as String,when_label: null == when_label ? _self.when_label : when_label // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,ventor_avatar_url: freezed == ventor_avatar_url ? _self.ventor_avatar_url : ventor_avatar_url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerDashboardUpcomingSessionModel].
extension ListenerDashboardUpcomingSessionModelPatterns on ListenerDashboardUpcomingSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerDashboardUpcomingSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerDashboardUpcomingSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerDashboardUpcomingSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardUpcomingSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerDashboardUpcomingSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardUpcomingSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ventor_name,  String when_label,  int duration_minutes,  String? ventor_avatar_url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerDashboardUpcomingSessionModel() when $default != null:
return $default(_that.id,_that.ventor_name,_that.when_label,_that.duration_minutes,_that.ventor_avatar_url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ventor_name,  String when_label,  int duration_minutes,  String? ventor_avatar_url)  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardUpcomingSessionModel():
return $default(_that.id,_that.ventor_name,_that.when_label,_that.duration_minutes,_that.ventor_avatar_url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ventor_name,  String when_label,  int duration_minutes,  String? ventor_avatar_url)?  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardUpcomingSessionModel() when $default != null:
return $default(_that.id,_that.ventor_name,_that.when_label,_that.duration_minutes,_that.ventor_avatar_url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerDashboardUpcomingSessionModel implements ListenerDashboardUpcomingSessionModel {
  const _ListenerDashboardUpcomingSessionModel({this.id = '', this.ventor_name = '', this.when_label = '', this.duration_minutes = 0, this.ventor_avatar_url});
  factory _ListenerDashboardUpcomingSessionModel.fromJson(Map<String, dynamic> json) => _$ListenerDashboardUpcomingSessionModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String ventor_name;
@override@JsonKey() final  String when_label;
@override@JsonKey() final  int duration_minutes;
@override final  String? ventor_avatar_url;

/// Create a copy of ListenerDashboardUpcomingSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerDashboardUpcomingSessionModelCopyWith<_ListenerDashboardUpcomingSessionModel> get copyWith => __$ListenerDashboardUpcomingSessionModelCopyWithImpl<_ListenerDashboardUpcomingSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerDashboardUpcomingSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerDashboardUpcomingSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ventor_name, ventor_name) || other.ventor_name == ventor_name)&&(identical(other.when_label, when_label) || other.when_label == when_label)&&(identical(other.duration_minutes, duration_minutes) || other.duration_minutes == duration_minutes)&&(identical(other.ventor_avatar_url, ventor_avatar_url) || other.ventor_avatar_url == ventor_avatar_url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ventor_name,when_label,duration_minutes,ventor_avatar_url);

@override
String toString() {
  return 'ListenerDashboardUpcomingSessionModel(id: $id, ventor_name: $ventor_name, when_label: $when_label, duration_minutes: $duration_minutes, ventor_avatar_url: $ventor_avatar_url)';
}


}

/// @nodoc
abstract mixin class _$ListenerDashboardUpcomingSessionModelCopyWith<$Res> implements $ListenerDashboardUpcomingSessionModelCopyWith<$Res> {
  factory _$ListenerDashboardUpcomingSessionModelCopyWith(_ListenerDashboardUpcomingSessionModel value, $Res Function(_ListenerDashboardUpcomingSessionModel) _then) = __$ListenerDashboardUpcomingSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String ventor_name, String when_label, int duration_minutes, String? ventor_avatar_url
});




}
/// @nodoc
class __$ListenerDashboardUpcomingSessionModelCopyWithImpl<$Res>
    implements _$ListenerDashboardUpcomingSessionModelCopyWith<$Res> {
  __$ListenerDashboardUpcomingSessionModelCopyWithImpl(this._self, this._then);

  final _ListenerDashboardUpcomingSessionModel _self;
  final $Res Function(_ListenerDashboardUpcomingSessionModel) _then;

/// Create a copy of ListenerDashboardUpcomingSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ventor_name = null,Object? when_label = null,Object? duration_minutes = null,Object? ventor_avatar_url = freezed,}) {
  return _then(_ListenerDashboardUpcomingSessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ventor_name: null == ventor_name ? _self.ventor_name : ventor_name // ignore: cast_nullable_to_non_nullable
as String,when_label: null == when_label ? _self.when_label : when_label // ignore: cast_nullable_to_non_nullable
as String,duration_minutes: null == duration_minutes ? _self.duration_minutes : duration_minutes // ignore: cast_nullable_to_non_nullable
as int,ventor_avatar_url: freezed == ventor_avatar_url ? _self.ventor_avatar_url : ventor_avatar_url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ListenerDashboardReminderModel {

 String get title; String get message;
/// Create a copy of ListenerDashboardReminderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerDashboardReminderModelCopyWith<ListenerDashboardReminderModel> get copyWith => _$ListenerDashboardReminderModelCopyWithImpl<ListenerDashboardReminderModel>(this as ListenerDashboardReminderModel, _$identity);

  /// Serializes this ListenerDashboardReminderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerDashboardReminderModel&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,message);

@override
String toString() {
  return 'ListenerDashboardReminderModel(title: $title, message: $message)';
}


}

/// @nodoc
abstract mixin class $ListenerDashboardReminderModelCopyWith<$Res>  {
  factory $ListenerDashboardReminderModelCopyWith(ListenerDashboardReminderModel value, $Res Function(ListenerDashboardReminderModel) _then) = _$ListenerDashboardReminderModelCopyWithImpl;
@useResult
$Res call({
 String title, String message
});




}
/// @nodoc
class _$ListenerDashboardReminderModelCopyWithImpl<$Res>
    implements $ListenerDashboardReminderModelCopyWith<$Res> {
  _$ListenerDashboardReminderModelCopyWithImpl(this._self, this._then);

  final ListenerDashboardReminderModel _self;
  final $Res Function(ListenerDashboardReminderModel) _then;

/// Create a copy of ListenerDashboardReminderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? message = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerDashboardReminderModel].
extension ListenerDashboardReminderModelPatterns on ListenerDashboardReminderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerDashboardReminderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerDashboardReminderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerDashboardReminderModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardReminderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerDashboardReminderModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardReminderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerDashboardReminderModel() when $default != null:
return $default(_that.title,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String message)  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardReminderModel():
return $default(_that.title,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String message)?  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardReminderModel() when $default != null:
return $default(_that.title,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerDashboardReminderModel implements ListenerDashboardReminderModel {
  const _ListenerDashboardReminderModel({this.title = '', this.message = ''});
  factory _ListenerDashboardReminderModel.fromJson(Map<String, dynamic> json) => _$ListenerDashboardReminderModelFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String message;

/// Create a copy of ListenerDashboardReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerDashboardReminderModelCopyWith<_ListenerDashboardReminderModel> get copyWith => __$ListenerDashboardReminderModelCopyWithImpl<_ListenerDashboardReminderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerDashboardReminderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerDashboardReminderModel&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,message);

@override
String toString() {
  return 'ListenerDashboardReminderModel(title: $title, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ListenerDashboardReminderModelCopyWith<$Res> implements $ListenerDashboardReminderModelCopyWith<$Res> {
  factory _$ListenerDashboardReminderModelCopyWith(_ListenerDashboardReminderModel value, $Res Function(_ListenerDashboardReminderModel) _then) = __$ListenerDashboardReminderModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String message
});




}
/// @nodoc
class __$ListenerDashboardReminderModelCopyWithImpl<$Res>
    implements _$ListenerDashboardReminderModelCopyWith<$Res> {
  __$ListenerDashboardReminderModelCopyWithImpl(this._self, this._then);

  final _ListenerDashboardReminderModel _self;
  final $Res Function(_ListenerDashboardReminderModel) _then;

/// Create a copy of ListenerDashboardReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? message = null,}) {
  return _then(_ListenerDashboardReminderModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
