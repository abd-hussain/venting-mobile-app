// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_notification_preferences_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerNotificationPreferencesResponseModel {

 String get status; ListenerNotificationPreferencesData get data;
/// Create a copy of ListenerNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerNotificationPreferencesResponseModelCopyWith<ListenerNotificationPreferencesResponseModel> get copyWith => _$ListenerNotificationPreferencesResponseModelCopyWithImpl<ListenerNotificationPreferencesResponseModel>(this as ListenerNotificationPreferencesResponseModel, _$identity);

  /// Serializes this ListenerNotificationPreferencesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNotificationPreferencesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerNotificationPreferencesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerNotificationPreferencesResponseModelCopyWith<$Res>  {
  factory $ListenerNotificationPreferencesResponseModelCopyWith(ListenerNotificationPreferencesResponseModel value, $Res Function(ListenerNotificationPreferencesResponseModel) _then) = _$ListenerNotificationPreferencesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerNotificationPreferencesData data
});


$ListenerNotificationPreferencesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerNotificationPreferencesResponseModelCopyWithImpl<$Res>
    implements $ListenerNotificationPreferencesResponseModelCopyWith<$Res> {
  _$ListenerNotificationPreferencesResponseModelCopyWithImpl(this._self, this._then);

  final ListenerNotificationPreferencesResponseModel _self;
  final $Res Function(ListenerNotificationPreferencesResponseModel) _then;

/// Create a copy of ListenerNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerNotificationPreferencesData,
  ));
}
/// Create a copy of ListenerNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerNotificationPreferencesDataCopyWith<$Res> get data {
  
  return $ListenerNotificationPreferencesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerNotificationPreferencesResponseModel].
extension ListenerNotificationPreferencesResponseModelPatterns on ListenerNotificationPreferencesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerNotificationPreferencesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerNotificationPreferencesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerNotificationPreferencesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerNotificationPreferencesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerNotificationPreferencesData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerNotificationPreferencesData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerNotificationPreferencesResponseModel implements ListenerNotificationPreferencesResponseModel {
  const _ListenerNotificationPreferencesResponseModel({required this.status, required this.data});
  factory _ListenerNotificationPreferencesResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerNotificationPreferencesResponseModelFromJson(json);

@override final  String status;
@override final  ListenerNotificationPreferencesData data;

/// Create a copy of ListenerNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerNotificationPreferencesResponseModelCopyWith<_ListenerNotificationPreferencesResponseModel> get copyWith => __$ListenerNotificationPreferencesResponseModelCopyWithImpl<_ListenerNotificationPreferencesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerNotificationPreferencesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerNotificationPreferencesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerNotificationPreferencesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerNotificationPreferencesResponseModelCopyWith<$Res> implements $ListenerNotificationPreferencesResponseModelCopyWith<$Res> {
  factory _$ListenerNotificationPreferencesResponseModelCopyWith(_ListenerNotificationPreferencesResponseModel value, $Res Function(_ListenerNotificationPreferencesResponseModel) _then) = __$ListenerNotificationPreferencesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerNotificationPreferencesData data
});


@override $ListenerNotificationPreferencesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerNotificationPreferencesResponseModelCopyWithImpl<$Res>
    implements _$ListenerNotificationPreferencesResponseModelCopyWith<$Res> {
  __$ListenerNotificationPreferencesResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerNotificationPreferencesResponseModel _self;
  final $Res Function(_ListenerNotificationPreferencesResponseModel) _then;

/// Create a copy of ListenerNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerNotificationPreferencesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerNotificationPreferencesData,
  ));
}

/// Create a copy of ListenerNotificationPreferencesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerNotificationPreferencesDataCopyWith<$Res> get data {
  
  return $ListenerNotificationPreferencesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerNotificationPreferencesData {

 bool get push_enabled; bool get new_session_requests; bool get session_reminder_15_min; bool get session_reminder_10_min; bool get session_reminder_5_min; bool get reviews_feedback; bool get tips_earnings; bool get promotions_updates; bool get email_enabled;
/// Create a copy of ListenerNotificationPreferencesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerNotificationPreferencesDataCopyWith<ListenerNotificationPreferencesData> get copyWith => _$ListenerNotificationPreferencesDataCopyWithImpl<ListenerNotificationPreferencesData>(this as ListenerNotificationPreferencesData, _$identity);

  /// Serializes this ListenerNotificationPreferencesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNotificationPreferencesData&&(identical(other.push_enabled, push_enabled) || other.push_enabled == push_enabled)&&(identical(other.new_session_requests, new_session_requests) || other.new_session_requests == new_session_requests)&&(identical(other.session_reminder_15_min, session_reminder_15_min) || other.session_reminder_15_min == session_reminder_15_min)&&(identical(other.session_reminder_10_min, session_reminder_10_min) || other.session_reminder_10_min == session_reminder_10_min)&&(identical(other.session_reminder_5_min, session_reminder_5_min) || other.session_reminder_5_min == session_reminder_5_min)&&(identical(other.reviews_feedback, reviews_feedback) || other.reviews_feedback == reviews_feedback)&&(identical(other.tips_earnings, tips_earnings) || other.tips_earnings == tips_earnings)&&(identical(other.promotions_updates, promotions_updates) || other.promotions_updates == promotions_updates)&&(identical(other.email_enabled, email_enabled) || other.email_enabled == email_enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,push_enabled,new_session_requests,session_reminder_15_min,session_reminder_10_min,session_reminder_5_min,reviews_feedback,tips_earnings,promotions_updates,email_enabled);

@override
String toString() {
  return 'ListenerNotificationPreferencesData(push_enabled: $push_enabled, new_session_requests: $new_session_requests, session_reminder_15_min: $session_reminder_15_min, session_reminder_10_min: $session_reminder_10_min, session_reminder_5_min: $session_reminder_5_min, reviews_feedback: $reviews_feedback, tips_earnings: $tips_earnings, promotions_updates: $promotions_updates, email_enabled: $email_enabled)';
}


}

/// @nodoc
abstract mixin class $ListenerNotificationPreferencesDataCopyWith<$Res>  {
  factory $ListenerNotificationPreferencesDataCopyWith(ListenerNotificationPreferencesData value, $Res Function(ListenerNotificationPreferencesData) _then) = _$ListenerNotificationPreferencesDataCopyWithImpl;
@useResult
$Res call({
 bool push_enabled, bool new_session_requests, bool session_reminder_15_min, bool session_reminder_10_min, bool session_reminder_5_min, bool reviews_feedback, bool tips_earnings, bool promotions_updates, bool email_enabled
});




}
/// @nodoc
class _$ListenerNotificationPreferencesDataCopyWithImpl<$Res>
    implements $ListenerNotificationPreferencesDataCopyWith<$Res> {
  _$ListenerNotificationPreferencesDataCopyWithImpl(this._self, this._then);

  final ListenerNotificationPreferencesData _self;
  final $Res Function(ListenerNotificationPreferencesData) _then;

/// Create a copy of ListenerNotificationPreferencesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? push_enabled = null,Object? new_session_requests = null,Object? session_reminder_15_min = null,Object? session_reminder_10_min = null,Object? session_reminder_5_min = null,Object? reviews_feedback = null,Object? tips_earnings = null,Object? promotions_updates = null,Object? email_enabled = null,}) {
  return _then(_self.copyWith(
push_enabled: null == push_enabled ? _self.push_enabled : push_enabled // ignore: cast_nullable_to_non_nullable
as bool,new_session_requests: null == new_session_requests ? _self.new_session_requests : new_session_requests // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_15_min: null == session_reminder_15_min ? _self.session_reminder_15_min : session_reminder_15_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_10_min: null == session_reminder_10_min ? _self.session_reminder_10_min : session_reminder_10_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_5_min: null == session_reminder_5_min ? _self.session_reminder_5_min : session_reminder_5_min // ignore: cast_nullable_to_non_nullable
as bool,reviews_feedback: null == reviews_feedback ? _self.reviews_feedback : reviews_feedback // ignore: cast_nullable_to_non_nullable
as bool,tips_earnings: null == tips_earnings ? _self.tips_earnings : tips_earnings // ignore: cast_nullable_to_non_nullable
as bool,promotions_updates: null == promotions_updates ? _self.promotions_updates : promotions_updates // ignore: cast_nullable_to_non_nullable
as bool,email_enabled: null == email_enabled ? _self.email_enabled : email_enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerNotificationPreferencesData].
extension ListenerNotificationPreferencesDataPatterns on ListenerNotificationPreferencesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerNotificationPreferencesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerNotificationPreferencesData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerNotificationPreferencesData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool push_enabled,  bool new_session_requests,  bool session_reminder_15_min,  bool session_reminder_10_min,  bool session_reminder_5_min,  bool reviews_feedback,  bool tips_earnings,  bool promotions_updates,  bool email_enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesData() when $default != null:
return $default(_that.push_enabled,_that.new_session_requests,_that.session_reminder_15_min,_that.session_reminder_10_min,_that.session_reminder_5_min,_that.reviews_feedback,_that.tips_earnings,_that.promotions_updates,_that.email_enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool push_enabled,  bool new_session_requests,  bool session_reminder_15_min,  bool session_reminder_10_min,  bool session_reminder_5_min,  bool reviews_feedback,  bool tips_earnings,  bool promotions_updates,  bool email_enabled)  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesData():
return $default(_that.push_enabled,_that.new_session_requests,_that.session_reminder_15_min,_that.session_reminder_10_min,_that.session_reminder_5_min,_that.reviews_feedback,_that.tips_earnings,_that.promotions_updates,_that.email_enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool push_enabled,  bool new_session_requests,  bool session_reminder_15_min,  bool session_reminder_10_min,  bool session_reminder_5_min,  bool reviews_feedback,  bool tips_earnings,  bool promotions_updates,  bool email_enabled)?  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationPreferencesData() when $default != null:
return $default(_that.push_enabled,_that.new_session_requests,_that.session_reminder_15_min,_that.session_reminder_10_min,_that.session_reminder_5_min,_that.reviews_feedback,_that.tips_earnings,_that.promotions_updates,_that.email_enabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerNotificationPreferencesData implements ListenerNotificationPreferencesData {
  const _ListenerNotificationPreferencesData({this.push_enabled = true, this.new_session_requests = true, this.session_reminder_15_min = true, this.session_reminder_10_min = true, this.session_reminder_5_min = true, this.reviews_feedback = true, this.tips_earnings = true, this.promotions_updates = false, this.email_enabled = true});
  factory _ListenerNotificationPreferencesData.fromJson(Map<String, dynamic> json) => _$ListenerNotificationPreferencesDataFromJson(json);

@override@JsonKey() final  bool push_enabled;
@override@JsonKey() final  bool new_session_requests;
@override@JsonKey() final  bool session_reminder_15_min;
@override@JsonKey() final  bool session_reminder_10_min;
@override@JsonKey() final  bool session_reminder_5_min;
@override@JsonKey() final  bool reviews_feedback;
@override@JsonKey() final  bool tips_earnings;
@override@JsonKey() final  bool promotions_updates;
@override@JsonKey() final  bool email_enabled;

/// Create a copy of ListenerNotificationPreferencesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerNotificationPreferencesDataCopyWith<_ListenerNotificationPreferencesData> get copyWith => __$ListenerNotificationPreferencesDataCopyWithImpl<_ListenerNotificationPreferencesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerNotificationPreferencesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerNotificationPreferencesData&&(identical(other.push_enabled, push_enabled) || other.push_enabled == push_enabled)&&(identical(other.new_session_requests, new_session_requests) || other.new_session_requests == new_session_requests)&&(identical(other.session_reminder_15_min, session_reminder_15_min) || other.session_reminder_15_min == session_reminder_15_min)&&(identical(other.session_reminder_10_min, session_reminder_10_min) || other.session_reminder_10_min == session_reminder_10_min)&&(identical(other.session_reminder_5_min, session_reminder_5_min) || other.session_reminder_5_min == session_reminder_5_min)&&(identical(other.reviews_feedback, reviews_feedback) || other.reviews_feedback == reviews_feedback)&&(identical(other.tips_earnings, tips_earnings) || other.tips_earnings == tips_earnings)&&(identical(other.promotions_updates, promotions_updates) || other.promotions_updates == promotions_updates)&&(identical(other.email_enabled, email_enabled) || other.email_enabled == email_enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,push_enabled,new_session_requests,session_reminder_15_min,session_reminder_10_min,session_reminder_5_min,reviews_feedback,tips_earnings,promotions_updates,email_enabled);

@override
String toString() {
  return 'ListenerNotificationPreferencesData(push_enabled: $push_enabled, new_session_requests: $new_session_requests, session_reminder_15_min: $session_reminder_15_min, session_reminder_10_min: $session_reminder_10_min, session_reminder_5_min: $session_reminder_5_min, reviews_feedback: $reviews_feedback, tips_earnings: $tips_earnings, promotions_updates: $promotions_updates, email_enabled: $email_enabled)';
}


}

/// @nodoc
abstract mixin class _$ListenerNotificationPreferencesDataCopyWith<$Res> implements $ListenerNotificationPreferencesDataCopyWith<$Res> {
  factory _$ListenerNotificationPreferencesDataCopyWith(_ListenerNotificationPreferencesData value, $Res Function(_ListenerNotificationPreferencesData) _then) = __$ListenerNotificationPreferencesDataCopyWithImpl;
@override @useResult
$Res call({
 bool push_enabled, bool new_session_requests, bool session_reminder_15_min, bool session_reminder_10_min, bool session_reminder_5_min, bool reviews_feedback, bool tips_earnings, bool promotions_updates, bool email_enabled
});




}
/// @nodoc
class __$ListenerNotificationPreferencesDataCopyWithImpl<$Res>
    implements _$ListenerNotificationPreferencesDataCopyWith<$Res> {
  __$ListenerNotificationPreferencesDataCopyWithImpl(this._self, this._then);

  final _ListenerNotificationPreferencesData _self;
  final $Res Function(_ListenerNotificationPreferencesData) _then;

/// Create a copy of ListenerNotificationPreferencesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? push_enabled = null,Object? new_session_requests = null,Object? session_reminder_15_min = null,Object? session_reminder_10_min = null,Object? session_reminder_5_min = null,Object? reviews_feedback = null,Object? tips_earnings = null,Object? promotions_updates = null,Object? email_enabled = null,}) {
  return _then(_ListenerNotificationPreferencesData(
push_enabled: null == push_enabled ? _self.push_enabled : push_enabled // ignore: cast_nullable_to_non_nullable
as bool,new_session_requests: null == new_session_requests ? _self.new_session_requests : new_session_requests // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_15_min: null == session_reminder_15_min ? _self.session_reminder_15_min : session_reminder_15_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_10_min: null == session_reminder_10_min ? _self.session_reminder_10_min : session_reminder_10_min // ignore: cast_nullable_to_non_nullable
as bool,session_reminder_5_min: null == session_reminder_5_min ? _self.session_reminder_5_min : session_reminder_5_min // ignore: cast_nullable_to_non_nullable
as bool,reviews_feedback: null == reviews_feedback ? _self.reviews_feedback : reviews_feedback // ignore: cast_nullable_to_non_nullable
as bool,tips_earnings: null == tips_earnings ? _self.tips_earnings : tips_earnings // ignore: cast_nullable_to_non_nullable
as bool,promotions_updates: null == promotions_updates ? _self.promotions_updates : promotions_updates // ignore: cast_nullable_to_non_nullable
as bool,email_enabled: null == email_enabled ? _self.email_enabled : email_enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
