// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_notifications_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerNotificationsResponseModel {

 String get status; ListenerNotificationsData get data;
/// Create a copy of ListenerNotificationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerNotificationsResponseModelCopyWith<ListenerNotificationsResponseModel> get copyWith => _$ListenerNotificationsResponseModelCopyWithImpl<ListenerNotificationsResponseModel>(this as ListenerNotificationsResponseModel, _$identity);

  /// Serializes this ListenerNotificationsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNotificationsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerNotificationsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerNotificationsResponseModelCopyWith<$Res>  {
  factory $ListenerNotificationsResponseModelCopyWith(ListenerNotificationsResponseModel value, $Res Function(ListenerNotificationsResponseModel) _then) = _$ListenerNotificationsResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerNotificationsData data
});


$ListenerNotificationsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerNotificationsResponseModelCopyWithImpl<$Res>
    implements $ListenerNotificationsResponseModelCopyWith<$Res> {
  _$ListenerNotificationsResponseModelCopyWithImpl(this._self, this._then);

  final ListenerNotificationsResponseModel _self;
  final $Res Function(ListenerNotificationsResponseModel) _then;

/// Create a copy of ListenerNotificationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerNotificationsData,
  ));
}
/// Create a copy of ListenerNotificationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerNotificationsDataCopyWith<$Res> get data {
  
  return $ListenerNotificationsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerNotificationsResponseModel].
extension ListenerNotificationsResponseModelPatterns on ListenerNotificationsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerNotificationsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerNotificationsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerNotificationsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerNotificationsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerNotificationsData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerNotificationsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerNotificationsData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerNotificationsData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationsResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerNotificationsResponseModel implements ListenerNotificationsResponseModel {
  const _ListenerNotificationsResponseModel({required this.status, required this.data});
  factory _ListenerNotificationsResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerNotificationsResponseModelFromJson(json);

@override final  String status;
@override final  ListenerNotificationsData data;

/// Create a copy of ListenerNotificationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerNotificationsResponseModelCopyWith<_ListenerNotificationsResponseModel> get copyWith => __$ListenerNotificationsResponseModelCopyWithImpl<_ListenerNotificationsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerNotificationsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerNotificationsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerNotificationsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerNotificationsResponseModelCopyWith<$Res> implements $ListenerNotificationsResponseModelCopyWith<$Res> {
  factory _$ListenerNotificationsResponseModelCopyWith(_ListenerNotificationsResponseModel value, $Res Function(_ListenerNotificationsResponseModel) _then) = __$ListenerNotificationsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerNotificationsData data
});


@override $ListenerNotificationsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerNotificationsResponseModelCopyWithImpl<$Res>
    implements _$ListenerNotificationsResponseModelCopyWith<$Res> {
  __$ListenerNotificationsResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerNotificationsResponseModel _self;
  final $Res Function(_ListenerNotificationsResponseModel) _then;

/// Create a copy of ListenerNotificationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerNotificationsResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerNotificationsData,
  ));
}

/// Create a copy of ListenerNotificationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerNotificationsDataCopyWith<$Res> get data {
  
  return $ListenerNotificationsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerNotificationsData {

 List<ListenerNotificationItemModel> get items;
/// Create a copy of ListenerNotificationsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerNotificationsDataCopyWith<ListenerNotificationsData> get copyWith => _$ListenerNotificationsDataCopyWithImpl<ListenerNotificationsData>(this as ListenerNotificationsData, _$identity);

  /// Serializes this ListenerNotificationsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNotificationsData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ListenerNotificationsData(items: $items)';
}


}

/// @nodoc
abstract mixin class $ListenerNotificationsDataCopyWith<$Res>  {
  factory $ListenerNotificationsDataCopyWith(ListenerNotificationsData value, $Res Function(ListenerNotificationsData) _then) = _$ListenerNotificationsDataCopyWithImpl;
@useResult
$Res call({
 List<ListenerNotificationItemModel> items
});




}
/// @nodoc
class _$ListenerNotificationsDataCopyWithImpl<$Res>
    implements $ListenerNotificationsDataCopyWith<$Res> {
  _$ListenerNotificationsDataCopyWithImpl(this._self, this._then);

  final ListenerNotificationsData _self;
  final $Res Function(ListenerNotificationsData) _then;

/// Create a copy of ListenerNotificationsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerNotificationItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerNotificationsData].
extension ListenerNotificationsDataPatterns on ListenerNotificationsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerNotificationsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerNotificationsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerNotificationsData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerNotificationsData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListenerNotificationItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerNotificationsData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListenerNotificationItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationsData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListenerNotificationItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationsData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerNotificationsData implements ListenerNotificationsData {
  const _ListenerNotificationsData({final  List<ListenerNotificationItemModel> items = const <ListenerNotificationItemModel>[]}): _items = items;
  factory _ListenerNotificationsData.fromJson(Map<String, dynamic> json) => _$ListenerNotificationsDataFromJson(json);

 final  List<ListenerNotificationItemModel> _items;
@override@JsonKey() List<ListenerNotificationItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ListenerNotificationsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerNotificationsDataCopyWith<_ListenerNotificationsData> get copyWith => __$ListenerNotificationsDataCopyWithImpl<_ListenerNotificationsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerNotificationsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerNotificationsData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ListenerNotificationsData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$ListenerNotificationsDataCopyWith<$Res> implements $ListenerNotificationsDataCopyWith<$Res> {
  factory _$ListenerNotificationsDataCopyWith(_ListenerNotificationsData value, $Res Function(_ListenerNotificationsData) _then) = __$ListenerNotificationsDataCopyWithImpl;
@override @useResult
$Res call({
 List<ListenerNotificationItemModel> items
});




}
/// @nodoc
class __$ListenerNotificationsDataCopyWithImpl<$Res>
    implements _$ListenerNotificationsDataCopyWith<$Res> {
  __$ListenerNotificationsDataCopyWithImpl(this._self, this._then);

  final _ListenerNotificationsData _self;
  final $Res Function(_ListenerNotificationsData) _then;

/// Create a copy of ListenerNotificationsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_ListenerNotificationsData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerNotificationItemModel>,
  ));
}


}


/// @nodoc
mixin _$ListenerNotificationItemModel {

 String get id; String get type; String get title; String get body; String get created_at; bool get is_read; Map<String, dynamic> get data;
/// Create a copy of ListenerNotificationItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerNotificationItemModelCopyWith<ListenerNotificationItemModel> get copyWith => _$ListenerNotificationItemModelCopyWithImpl<ListenerNotificationItemModel>(this as ListenerNotificationItemModel, _$identity);

  /// Serializes this ListenerNotificationItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNotificationItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.is_read, is_read) || other.is_read == is_read)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,body,created_at,is_read,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ListenerNotificationItemModel(id: $id, type: $type, title: $title, body: $body, created_at: $created_at, is_read: $is_read, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerNotificationItemModelCopyWith<$Res>  {
  factory $ListenerNotificationItemModelCopyWith(ListenerNotificationItemModel value, $Res Function(ListenerNotificationItemModel) _then) = _$ListenerNotificationItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String type, String title, String body, String created_at, bool is_read, Map<String, dynamic> data
});




}
/// @nodoc
class _$ListenerNotificationItemModelCopyWithImpl<$Res>
    implements $ListenerNotificationItemModelCopyWith<$Res> {
  _$ListenerNotificationItemModelCopyWithImpl(this._self, this._then);

  final ListenerNotificationItemModel _self;
  final $Res Function(ListenerNotificationItemModel) _then;

/// Create a copy of ListenerNotificationItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? created_at = null,Object? is_read = null,Object? data = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,created_at: null == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String,is_read: null == is_read ? _self.is_read : is_read // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerNotificationItemModel].
extension ListenerNotificationItemModelPatterns on ListenerNotificationItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerNotificationItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerNotificationItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerNotificationItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerNotificationItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String body,  String created_at,  bool is_read,  Map<String, dynamic> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerNotificationItemModel() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.created_at,_that.is_read,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String body,  String created_at,  bool is_read,  Map<String, dynamic> data)  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationItemModel():
return $default(_that.id,_that.type,_that.title,_that.body,_that.created_at,_that.is_read,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String title,  String body,  String created_at,  bool is_read,  Map<String, dynamic> data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationItemModel() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.created_at,_that.is_read,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerNotificationItemModel implements ListenerNotificationItemModel {
  const _ListenerNotificationItemModel({this.id = '', this.type = '', this.title = '', this.body = '', this.created_at = '', this.is_read = false, final  Map<String, dynamic> data = const <String, dynamic>{}}): _data = data;
  factory _ListenerNotificationItemModel.fromJson(Map<String, dynamic> json) => _$ListenerNotificationItemModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String type;
@override@JsonKey() final  String title;
@override@JsonKey() final  String body;
@override@JsonKey() final  String created_at;
@override@JsonKey() final  bool is_read;
 final  Map<String, dynamic> _data;
@override@JsonKey() Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of ListenerNotificationItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerNotificationItemModelCopyWith<_ListenerNotificationItemModel> get copyWith => __$ListenerNotificationItemModelCopyWithImpl<_ListenerNotificationItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerNotificationItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerNotificationItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.is_read, is_read) || other.is_read == is_read)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,body,created_at,is_read,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ListenerNotificationItemModel(id: $id, type: $type, title: $title, body: $body, created_at: $created_at, is_read: $is_read, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerNotificationItemModelCopyWith<$Res> implements $ListenerNotificationItemModelCopyWith<$Res> {
  factory _$ListenerNotificationItemModelCopyWith(_ListenerNotificationItemModel value, $Res Function(_ListenerNotificationItemModel) _then) = __$ListenerNotificationItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String title, String body, String created_at, bool is_read, Map<String, dynamic> data
});




}
/// @nodoc
class __$ListenerNotificationItemModelCopyWithImpl<$Res>
    implements _$ListenerNotificationItemModelCopyWith<$Res> {
  __$ListenerNotificationItemModelCopyWithImpl(this._self, this._then);

  final _ListenerNotificationItemModel _self;
  final $Res Function(_ListenerNotificationItemModel) _then;

/// Create a copy of ListenerNotificationItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? created_at = null,Object? is_read = null,Object? data = null,}) {
  return _then(_ListenerNotificationItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,created_at: null == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String,is_read: null == is_read ? _self.is_read : is_read // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
