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

 String get display_name; ListenerDashboardReminderModel? get reminder;
/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerDashboardDataCopyWith<ListenerDashboardData> get copyWith => _$ListenerDashboardDataCopyWithImpl<ListenerDashboardData>(this as ListenerDashboardData, _$identity);

  /// Serializes this ListenerDashboardData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerDashboardData&&(identical(other.display_name, display_name) || other.display_name == display_name)&&(identical(other.reminder, reminder) || other.reminder == reminder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,display_name,reminder);

@override
String toString() {
  return 'ListenerDashboardData(display_name: $display_name, reminder: $reminder)';
}


}

/// @nodoc
abstract mixin class $ListenerDashboardDataCopyWith<$Res>  {
  factory $ListenerDashboardDataCopyWith(ListenerDashboardData value, $Res Function(ListenerDashboardData) _then) = _$ListenerDashboardDataCopyWithImpl;
@useResult
$Res call({
 String display_name, ListenerDashboardReminderModel? reminder
});


$ListenerDashboardReminderModelCopyWith<$Res>? get reminder;

}
/// @nodoc
class _$ListenerDashboardDataCopyWithImpl<$Res>
    implements $ListenerDashboardDataCopyWith<$Res> {
  _$ListenerDashboardDataCopyWithImpl(this._self, this._then);

  final ListenerDashboardData _self;
  final $Res Function(ListenerDashboardData) _then;

/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? display_name = null,Object? reminder = freezed,}) {
  return _then(_self.copyWith(
display_name: null == display_name ? _self.display_name : display_name // ignore: cast_nullable_to_non_nullable
as String,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as ListenerDashboardReminderModel?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String display_name,  ListenerDashboardReminderModel? reminder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerDashboardData() when $default != null:
return $default(_that.display_name,_that.reminder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String display_name,  ListenerDashboardReminderModel? reminder)  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardData():
return $default(_that.display_name,_that.reminder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String display_name,  ListenerDashboardReminderModel? reminder)?  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardData() when $default != null:
return $default(_that.display_name,_that.reminder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ListenerDashboardData implements ListenerDashboardData {
  const _ListenerDashboardData({this.display_name = '', this.reminder});
  

@override@JsonKey() final  String display_name;
@override final  ListenerDashboardReminderModel? reminder;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerDashboardData&&(identical(other.display_name, display_name) || other.display_name == display_name)&&(identical(other.reminder, reminder) || other.reminder == reminder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,display_name,reminder);

@override
String toString() {
  return 'ListenerDashboardData(display_name: $display_name, reminder: $reminder)';
}


}

/// @nodoc
abstract mixin class _$ListenerDashboardDataCopyWith<$Res> implements $ListenerDashboardDataCopyWith<$Res> {
  factory _$ListenerDashboardDataCopyWith(_ListenerDashboardData value, $Res Function(_ListenerDashboardData) _then) = __$ListenerDashboardDataCopyWithImpl;
@override @useResult
$Res call({
 String display_name, ListenerDashboardReminderModel? reminder
});


@override $ListenerDashboardReminderModelCopyWith<$Res>? get reminder;

}
/// @nodoc
class __$ListenerDashboardDataCopyWithImpl<$Res>
    implements _$ListenerDashboardDataCopyWith<$Res> {
  __$ListenerDashboardDataCopyWithImpl(this._self, this._then);

  final _ListenerDashboardData _self;
  final $Res Function(_ListenerDashboardData) _then;

/// Create a copy of ListenerDashboardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? display_name = null,Object? reminder = freezed,}) {
  return _then(_ListenerDashboardData(
display_name: null == display_name ? _self.display_name : display_name // ignore: cast_nullable_to_non_nullable
as String,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as ListenerDashboardReminderModel?,
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
