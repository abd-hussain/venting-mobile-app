// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_payout_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerPayoutBalancesResponseModel {

 String get status; ListenerPayoutBalancesData get data;
/// Create a copy of ListenerPayoutBalancesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutBalancesResponseModelCopyWith<ListenerPayoutBalancesResponseModel> get copyWith => _$ListenerPayoutBalancesResponseModelCopyWithImpl<ListenerPayoutBalancesResponseModel>(this as ListenerPayoutBalancesResponseModel, _$identity);

  /// Serializes this ListenerPayoutBalancesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutBalancesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutBalancesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutBalancesResponseModelCopyWith<$Res>  {
  factory $ListenerPayoutBalancesResponseModelCopyWith(ListenerPayoutBalancesResponseModel value, $Res Function(ListenerPayoutBalancesResponseModel) _then) = _$ListenerPayoutBalancesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerPayoutBalancesData data
});


$ListenerPayoutBalancesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerPayoutBalancesResponseModelCopyWithImpl<$Res>
    implements $ListenerPayoutBalancesResponseModelCopyWith<$Res> {
  _$ListenerPayoutBalancesResponseModelCopyWithImpl(this._self, this._then);

  final ListenerPayoutBalancesResponseModel _self;
  final $Res Function(ListenerPayoutBalancesResponseModel) _then;

/// Create a copy of ListenerPayoutBalancesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutBalancesData,
  ));
}
/// Create a copy of ListenerPayoutBalancesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutBalancesDataCopyWith<$Res> get data {
  
  return $ListenerPayoutBalancesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerPayoutBalancesResponseModel].
extension ListenerPayoutBalancesResponseModelPatterns on ListenerPayoutBalancesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutBalancesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutBalancesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutBalancesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutBalancesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutBalancesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutBalancesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerPayoutBalancesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutBalancesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerPayoutBalancesData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutBalancesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerPayoutBalancesData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutBalancesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPayoutBalancesResponseModel implements ListenerPayoutBalancesResponseModel {
  const _ListenerPayoutBalancesResponseModel({required this.status, required this.data});
  factory _ListenerPayoutBalancesResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerPayoutBalancesResponseModelFromJson(json);

@override final  String status;
@override final  ListenerPayoutBalancesData data;

/// Create a copy of ListenerPayoutBalancesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutBalancesResponseModelCopyWith<_ListenerPayoutBalancesResponseModel> get copyWith => __$ListenerPayoutBalancesResponseModelCopyWithImpl<_ListenerPayoutBalancesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutBalancesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutBalancesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutBalancesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutBalancesResponseModelCopyWith<$Res> implements $ListenerPayoutBalancesResponseModelCopyWith<$Res> {
  factory _$ListenerPayoutBalancesResponseModelCopyWith(_ListenerPayoutBalancesResponseModel value, $Res Function(_ListenerPayoutBalancesResponseModel) _then) = __$ListenerPayoutBalancesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerPayoutBalancesData data
});


@override $ListenerPayoutBalancesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerPayoutBalancesResponseModelCopyWithImpl<$Res>
    implements _$ListenerPayoutBalancesResponseModelCopyWith<$Res> {
  __$ListenerPayoutBalancesResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerPayoutBalancesResponseModel _self;
  final $Res Function(_ListenerPayoutBalancesResponseModel) _then;

/// Create a copy of ListenerPayoutBalancesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerPayoutBalancesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutBalancesData,
  ));
}

/// Create a copy of ListenerPayoutBalancesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutBalancesDataCopyWith<$Res> get data {
  
  return $ListenerPayoutBalancesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerPayoutBalancesData {

 num get available; num get pending; num get lifetime;
/// Create a copy of ListenerPayoutBalancesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutBalancesDataCopyWith<ListenerPayoutBalancesData> get copyWith => _$ListenerPayoutBalancesDataCopyWithImpl<ListenerPayoutBalancesData>(this as ListenerPayoutBalancesData, _$identity);

  /// Serializes this ListenerPayoutBalancesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutBalancesData&&(identical(other.available, available) || other.available == available)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.lifetime, lifetime) || other.lifetime == lifetime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,pending,lifetime);

@override
String toString() {
  return 'ListenerPayoutBalancesData(available: $available, pending: $pending, lifetime: $lifetime)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutBalancesDataCopyWith<$Res>  {
  factory $ListenerPayoutBalancesDataCopyWith(ListenerPayoutBalancesData value, $Res Function(ListenerPayoutBalancesData) _then) = _$ListenerPayoutBalancesDataCopyWithImpl;
@useResult
$Res call({
 num available, num pending, num lifetime
});




}
/// @nodoc
class _$ListenerPayoutBalancesDataCopyWithImpl<$Res>
    implements $ListenerPayoutBalancesDataCopyWith<$Res> {
  _$ListenerPayoutBalancesDataCopyWithImpl(this._self, this._then);

  final ListenerPayoutBalancesData _self;
  final $Res Function(ListenerPayoutBalancesData) _then;

/// Create a copy of ListenerPayoutBalancesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? available = null,Object? pending = null,Object? lifetime = null,}) {
  return _then(_self.copyWith(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as num,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as num,lifetime: null == lifetime ? _self.lifetime : lifetime // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerPayoutBalancesData].
extension ListenerPayoutBalancesDataPatterns on ListenerPayoutBalancesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutBalancesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutBalancesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutBalancesData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutBalancesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutBalancesData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutBalancesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num available,  num pending,  num lifetime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutBalancesData() when $default != null:
return $default(_that.available,_that.pending,_that.lifetime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num available,  num pending,  num lifetime)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutBalancesData():
return $default(_that.available,_that.pending,_that.lifetime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num available,  num pending,  num lifetime)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutBalancesData() when $default != null:
return $default(_that.available,_that.pending,_that.lifetime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPayoutBalancesData implements ListenerPayoutBalancesData {
  const _ListenerPayoutBalancesData({this.available = 0, this.pending = 0, this.lifetime = 0});
  factory _ListenerPayoutBalancesData.fromJson(Map<String, dynamic> json) => _$ListenerPayoutBalancesDataFromJson(json);

@override@JsonKey() final  num available;
@override@JsonKey() final  num pending;
@override@JsonKey() final  num lifetime;

/// Create a copy of ListenerPayoutBalancesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutBalancesDataCopyWith<_ListenerPayoutBalancesData> get copyWith => __$ListenerPayoutBalancesDataCopyWithImpl<_ListenerPayoutBalancesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutBalancesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutBalancesData&&(identical(other.available, available) || other.available == available)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.lifetime, lifetime) || other.lifetime == lifetime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,pending,lifetime);

@override
String toString() {
  return 'ListenerPayoutBalancesData(available: $available, pending: $pending, lifetime: $lifetime)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutBalancesDataCopyWith<$Res> implements $ListenerPayoutBalancesDataCopyWith<$Res> {
  factory _$ListenerPayoutBalancesDataCopyWith(_ListenerPayoutBalancesData value, $Res Function(_ListenerPayoutBalancesData) _then) = __$ListenerPayoutBalancesDataCopyWithImpl;
@override @useResult
$Res call({
 num available, num pending, num lifetime
});




}
/// @nodoc
class __$ListenerPayoutBalancesDataCopyWithImpl<$Res>
    implements _$ListenerPayoutBalancesDataCopyWith<$Res> {
  __$ListenerPayoutBalancesDataCopyWithImpl(this._self, this._then);

  final _ListenerPayoutBalancesData _self;
  final $Res Function(_ListenerPayoutBalancesData) _then;

/// Create a copy of ListenerPayoutBalancesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? available = null,Object? pending = null,Object? lifetime = null,}) {
  return _then(_ListenerPayoutBalancesData(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as num,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as num,lifetime: null == lifetime ? _self.lifetime : lifetime // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$ListenerPayoutsListResponseModel {

 String get status; ListenerPayoutsListData get data;
/// Create a copy of ListenerPayoutsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutsListResponseModelCopyWith<ListenerPayoutsListResponseModel> get copyWith => _$ListenerPayoutsListResponseModelCopyWithImpl<ListenerPayoutsListResponseModel>(this as ListenerPayoutsListResponseModel, _$identity);

  /// Serializes this ListenerPayoutsListResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutsListResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutsListResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutsListResponseModelCopyWith<$Res>  {
  factory $ListenerPayoutsListResponseModelCopyWith(ListenerPayoutsListResponseModel value, $Res Function(ListenerPayoutsListResponseModel) _then) = _$ListenerPayoutsListResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerPayoutsListData data
});


$ListenerPayoutsListDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerPayoutsListResponseModelCopyWithImpl<$Res>
    implements $ListenerPayoutsListResponseModelCopyWith<$Res> {
  _$ListenerPayoutsListResponseModelCopyWithImpl(this._self, this._then);

  final ListenerPayoutsListResponseModel _self;
  final $Res Function(ListenerPayoutsListResponseModel) _then;

/// Create a copy of ListenerPayoutsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutsListData,
  ));
}
/// Create a copy of ListenerPayoutsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutsListDataCopyWith<$Res> get data {
  
  return $ListenerPayoutsListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerPayoutsListResponseModel].
extension ListenerPayoutsListResponseModelPatterns on ListenerPayoutsListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutsListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutsListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutsListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutsListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutsListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutsListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerPayoutsListData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutsListResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerPayoutsListData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutsListResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerPayoutsListData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutsListResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPayoutsListResponseModel implements ListenerPayoutsListResponseModel {
  const _ListenerPayoutsListResponseModel({required this.status, required this.data});
  factory _ListenerPayoutsListResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerPayoutsListResponseModelFromJson(json);

@override final  String status;
@override final  ListenerPayoutsListData data;

/// Create a copy of ListenerPayoutsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutsListResponseModelCopyWith<_ListenerPayoutsListResponseModel> get copyWith => __$ListenerPayoutsListResponseModelCopyWithImpl<_ListenerPayoutsListResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutsListResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutsListResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutsListResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutsListResponseModelCopyWith<$Res> implements $ListenerPayoutsListResponseModelCopyWith<$Res> {
  factory _$ListenerPayoutsListResponseModelCopyWith(_ListenerPayoutsListResponseModel value, $Res Function(_ListenerPayoutsListResponseModel) _then) = __$ListenerPayoutsListResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerPayoutsListData data
});


@override $ListenerPayoutsListDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerPayoutsListResponseModelCopyWithImpl<$Res>
    implements _$ListenerPayoutsListResponseModelCopyWith<$Res> {
  __$ListenerPayoutsListResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerPayoutsListResponseModel _self;
  final $Res Function(_ListenerPayoutsListResponseModel) _then;

/// Create a copy of ListenerPayoutsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerPayoutsListResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutsListData,
  ));
}

/// Create a copy of ListenerPayoutsListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutsListDataCopyWith<$Res> get data {
  
  return $ListenerPayoutsListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerPayoutsListData {

 List<ListenerPayoutItemModel> get items;
/// Create a copy of ListenerPayoutsListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutsListDataCopyWith<ListenerPayoutsListData> get copyWith => _$ListenerPayoutsListDataCopyWithImpl<ListenerPayoutsListData>(this as ListenerPayoutsListData, _$identity);

  /// Serializes this ListenerPayoutsListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutsListData&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ListenerPayoutsListData(items: $items)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutsListDataCopyWith<$Res>  {
  factory $ListenerPayoutsListDataCopyWith(ListenerPayoutsListData value, $Res Function(ListenerPayoutsListData) _then) = _$ListenerPayoutsListDataCopyWithImpl;
@useResult
$Res call({
 List<ListenerPayoutItemModel> items
});




}
/// @nodoc
class _$ListenerPayoutsListDataCopyWithImpl<$Res>
    implements $ListenerPayoutsListDataCopyWith<$Res> {
  _$ListenerPayoutsListDataCopyWithImpl(this._self, this._then);

  final ListenerPayoutsListData _self;
  final $Res Function(ListenerPayoutsListData) _then;

/// Create a copy of ListenerPayoutsListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerPayoutItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerPayoutsListData].
extension ListenerPayoutsListDataPatterns on ListenerPayoutsListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutsListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutsListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutsListData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutsListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutsListData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutsListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListenerPayoutItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutsListData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListenerPayoutItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutsListData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListenerPayoutItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutsListData() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPayoutsListData implements ListenerPayoutsListData {
  const _ListenerPayoutsListData({final  List<ListenerPayoutItemModel> items = const <ListenerPayoutItemModel>[]}): _items = items;
  factory _ListenerPayoutsListData.fromJson(Map<String, dynamic> json) => _$ListenerPayoutsListDataFromJson(json);

 final  List<ListenerPayoutItemModel> _items;
@override@JsonKey() List<ListenerPayoutItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ListenerPayoutsListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutsListDataCopyWith<_ListenerPayoutsListData> get copyWith => __$ListenerPayoutsListDataCopyWithImpl<_ListenerPayoutsListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutsListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutsListData&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ListenerPayoutsListData(items: $items)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutsListDataCopyWith<$Res> implements $ListenerPayoutsListDataCopyWith<$Res> {
  factory _$ListenerPayoutsListDataCopyWith(_ListenerPayoutsListData value, $Res Function(_ListenerPayoutsListData) _then) = __$ListenerPayoutsListDataCopyWithImpl;
@override @useResult
$Res call({
 List<ListenerPayoutItemModel> items
});




}
/// @nodoc
class __$ListenerPayoutsListDataCopyWithImpl<$Res>
    implements _$ListenerPayoutsListDataCopyWith<$Res> {
  __$ListenerPayoutsListDataCopyWithImpl(this._self, this._then);

  final _ListenerPayoutsListData _self;
  final $Res Function(_ListenerPayoutsListData) _then;

/// Create a copy of ListenerPayoutsListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_ListenerPayoutsListData(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerPayoutItemModel>,
  ));
}


}


/// @nodoc
mixin _$ListenerPayoutItemModel {

 String get id; num get amount; String get date; String get status; String get method_label; String? get reference;
/// Create a copy of ListenerPayoutItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutItemModelCopyWith<ListenerPayoutItemModel> get copyWith => _$ListenerPayoutItemModelCopyWithImpl<ListenerPayoutItemModel>(this as ListenerPayoutItemModel, _$identity);

  /// Serializes this ListenerPayoutItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.method_label, method_label) || other.method_label == method_label)&&(identical(other.reference, reference) || other.reference == reference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,date,status,method_label,reference);

@override
String toString() {
  return 'ListenerPayoutItemModel(id: $id, amount: $amount, date: $date, status: $status, method_label: $method_label, reference: $reference)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutItemModelCopyWith<$Res>  {
  factory $ListenerPayoutItemModelCopyWith(ListenerPayoutItemModel value, $Res Function(ListenerPayoutItemModel) _then) = _$ListenerPayoutItemModelCopyWithImpl;
@useResult
$Res call({
 String id, num amount, String date, String status, String method_label, String? reference
});




}
/// @nodoc
class _$ListenerPayoutItemModelCopyWithImpl<$Res>
    implements $ListenerPayoutItemModelCopyWith<$Res> {
  _$ListenerPayoutItemModelCopyWithImpl(this._self, this._then);

  final ListenerPayoutItemModel _self;
  final $Res Function(ListenerPayoutItemModel) _then;

/// Create a copy of ListenerPayoutItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? date = null,Object? status = null,Object? method_label = null,Object? reference = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,method_label: null == method_label ? _self.method_label : method_label // ignore: cast_nullable_to_non_nullable
as String,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerPayoutItemModel].
extension ListenerPayoutItemModelPatterns on ListenerPayoutItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  num amount,  String date,  String status,  String method_label,  String? reference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutItemModel() when $default != null:
return $default(_that.id,_that.amount,_that.date,_that.status,_that.method_label,_that.reference);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  num amount,  String date,  String status,  String method_label,  String? reference)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutItemModel():
return $default(_that.id,_that.amount,_that.date,_that.status,_that.method_label,_that.reference);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  num amount,  String date,  String status,  String method_label,  String? reference)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutItemModel() when $default != null:
return $default(_that.id,_that.amount,_that.date,_that.status,_that.method_label,_that.reference);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPayoutItemModel implements ListenerPayoutItemModel {
  const _ListenerPayoutItemModel({this.id = '', this.amount = 0, this.date = '', this.status = '', this.method_label = '', this.reference});
  factory _ListenerPayoutItemModel.fromJson(Map<String, dynamic> json) => _$ListenerPayoutItemModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  num amount;
@override@JsonKey() final  String date;
@override@JsonKey() final  String status;
@override@JsonKey() final  String method_label;
@override final  String? reference;

/// Create a copy of ListenerPayoutItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutItemModelCopyWith<_ListenerPayoutItemModel> get copyWith => __$ListenerPayoutItemModelCopyWithImpl<_ListenerPayoutItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.method_label, method_label) || other.method_label == method_label)&&(identical(other.reference, reference) || other.reference == reference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,date,status,method_label,reference);

@override
String toString() {
  return 'ListenerPayoutItemModel(id: $id, amount: $amount, date: $date, status: $status, method_label: $method_label, reference: $reference)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutItemModelCopyWith<$Res> implements $ListenerPayoutItemModelCopyWith<$Res> {
  factory _$ListenerPayoutItemModelCopyWith(_ListenerPayoutItemModel value, $Res Function(_ListenerPayoutItemModel) _then) = __$ListenerPayoutItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, num amount, String date, String status, String method_label, String? reference
});




}
/// @nodoc
class __$ListenerPayoutItemModelCopyWithImpl<$Res>
    implements _$ListenerPayoutItemModelCopyWith<$Res> {
  __$ListenerPayoutItemModelCopyWithImpl(this._self, this._then);

  final _ListenerPayoutItemModel _self;
  final $Res Function(_ListenerPayoutItemModel) _then;

/// Create a copy of ListenerPayoutItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? date = null,Object? status = null,Object? method_label = null,Object? reference = freezed,}) {
  return _then(_ListenerPayoutItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,method_label: null == method_label ? _self.method_label : method_label // ignore: cast_nullable_to_non_nullable
as String,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ListenerPayoutMethodUpdateResponseModel {

 String get status; ListenerPayoutMethodModel get data;
/// Create a copy of ListenerPayoutMethodUpdateResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutMethodUpdateResponseModelCopyWith<ListenerPayoutMethodUpdateResponseModel> get copyWith => _$ListenerPayoutMethodUpdateResponseModelCopyWithImpl<ListenerPayoutMethodUpdateResponseModel>(this as ListenerPayoutMethodUpdateResponseModel, _$identity);

  /// Serializes this ListenerPayoutMethodUpdateResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutMethodUpdateResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutMethodUpdateResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutMethodUpdateResponseModelCopyWith<$Res>  {
  factory $ListenerPayoutMethodUpdateResponseModelCopyWith(ListenerPayoutMethodUpdateResponseModel value, $Res Function(ListenerPayoutMethodUpdateResponseModel) _then) = _$ListenerPayoutMethodUpdateResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerPayoutMethodModel data
});


$ListenerPayoutMethodModelCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerPayoutMethodUpdateResponseModelCopyWithImpl<$Res>
    implements $ListenerPayoutMethodUpdateResponseModelCopyWith<$Res> {
  _$ListenerPayoutMethodUpdateResponseModelCopyWithImpl(this._self, this._then);

  final ListenerPayoutMethodUpdateResponseModel _self;
  final $Res Function(ListenerPayoutMethodUpdateResponseModel) _then;

/// Create a copy of ListenerPayoutMethodUpdateResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutMethodModel,
  ));
}
/// Create a copy of ListenerPayoutMethodUpdateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutMethodModelCopyWith<$Res> get data {
  
  return $ListenerPayoutMethodModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerPayoutMethodUpdateResponseModel].
extension ListenerPayoutMethodUpdateResponseModelPatterns on ListenerPayoutMethodUpdateResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutMethodUpdateResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodUpdateResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutMethodUpdateResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodUpdateResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutMethodUpdateResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMethodUpdateResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerPayoutMethodModel data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodUpdateResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerPayoutMethodModel data)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodUpdateResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerPayoutMethodModel data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMethodUpdateResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPayoutMethodUpdateResponseModel implements ListenerPayoutMethodUpdateResponseModel {
  const _ListenerPayoutMethodUpdateResponseModel({required this.status, required this.data});
  factory _ListenerPayoutMethodUpdateResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerPayoutMethodUpdateResponseModelFromJson(json);

@override final  String status;
@override final  ListenerPayoutMethodModel data;

/// Create a copy of ListenerPayoutMethodUpdateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutMethodUpdateResponseModelCopyWith<_ListenerPayoutMethodUpdateResponseModel> get copyWith => __$ListenerPayoutMethodUpdateResponseModelCopyWithImpl<_ListenerPayoutMethodUpdateResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutMethodUpdateResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutMethodUpdateResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutMethodUpdateResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutMethodUpdateResponseModelCopyWith<$Res> implements $ListenerPayoutMethodUpdateResponseModelCopyWith<$Res> {
  factory _$ListenerPayoutMethodUpdateResponseModelCopyWith(_ListenerPayoutMethodUpdateResponseModel value, $Res Function(_ListenerPayoutMethodUpdateResponseModel) _then) = __$ListenerPayoutMethodUpdateResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerPayoutMethodModel data
});


@override $ListenerPayoutMethodModelCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerPayoutMethodUpdateResponseModelCopyWithImpl<$Res>
    implements _$ListenerPayoutMethodUpdateResponseModelCopyWith<$Res> {
  __$ListenerPayoutMethodUpdateResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerPayoutMethodUpdateResponseModel _self;
  final $Res Function(_ListenerPayoutMethodUpdateResponseModel) _then;

/// Create a copy of ListenerPayoutMethodUpdateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerPayoutMethodUpdateResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutMethodModel,
  ));
}

/// Create a copy of ListenerPayoutMethodUpdateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutMethodModelCopyWith<$Res> get data {
  
  return $ListenerPayoutMethodModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerPayoutMutationResponseModel {

 String get status; ListenerPayoutItemModel get data;
/// Create a copy of ListenerPayoutMutationResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutMutationResponseModelCopyWith<ListenerPayoutMutationResponseModel> get copyWith => _$ListenerPayoutMutationResponseModelCopyWithImpl<ListenerPayoutMutationResponseModel>(this as ListenerPayoutMutationResponseModel, _$identity);

  /// Serializes this ListenerPayoutMutationResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutMutationResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutMutationResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutMutationResponseModelCopyWith<$Res>  {
  factory $ListenerPayoutMutationResponseModelCopyWith(ListenerPayoutMutationResponseModel value, $Res Function(ListenerPayoutMutationResponseModel) _then) = _$ListenerPayoutMutationResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerPayoutItemModel data
});


$ListenerPayoutItemModelCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerPayoutMutationResponseModelCopyWithImpl<$Res>
    implements $ListenerPayoutMutationResponseModelCopyWith<$Res> {
  _$ListenerPayoutMutationResponseModelCopyWithImpl(this._self, this._then);

  final ListenerPayoutMutationResponseModel _self;
  final $Res Function(ListenerPayoutMutationResponseModel) _then;

/// Create a copy of ListenerPayoutMutationResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutItemModel,
  ));
}
/// Create a copy of ListenerPayoutMutationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutItemModelCopyWith<$Res> get data {
  
  return $ListenerPayoutItemModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerPayoutMutationResponseModel].
extension ListenerPayoutMutationResponseModelPatterns on ListenerPayoutMutationResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutMutationResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutMutationResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutMutationResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMutationResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutMutationResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutMutationResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerPayoutItemModel data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutMutationResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerPayoutItemModel data)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMutationResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerPayoutItemModel data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutMutationResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPayoutMutationResponseModel implements ListenerPayoutMutationResponseModel {
  const _ListenerPayoutMutationResponseModel({required this.status, required this.data});
  factory _ListenerPayoutMutationResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerPayoutMutationResponseModelFromJson(json);

@override final  String status;
@override final  ListenerPayoutItemModel data;

/// Create a copy of ListenerPayoutMutationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutMutationResponseModelCopyWith<_ListenerPayoutMutationResponseModel> get copyWith => __$ListenerPayoutMutationResponseModelCopyWithImpl<_ListenerPayoutMutationResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPayoutMutationResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutMutationResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPayoutMutationResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutMutationResponseModelCopyWith<$Res> implements $ListenerPayoutMutationResponseModelCopyWith<$Res> {
  factory _$ListenerPayoutMutationResponseModelCopyWith(_ListenerPayoutMutationResponseModel value, $Res Function(_ListenerPayoutMutationResponseModel) _then) = __$ListenerPayoutMutationResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerPayoutItemModel data
});


@override $ListenerPayoutItemModelCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerPayoutMutationResponseModelCopyWithImpl<$Res>
    implements _$ListenerPayoutMutationResponseModelCopyWith<$Res> {
  __$ListenerPayoutMutationResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerPayoutMutationResponseModel _self;
  final $Res Function(_ListenerPayoutMutationResponseModel) _then;

/// Create a copy of ListenerPayoutMutationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerPayoutMutationResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPayoutItemModel,
  ));
}

/// Create a copy of ListenerPayoutMutationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPayoutItemModelCopyWith<$Res> get data {
  
  return $ListenerPayoutItemModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
