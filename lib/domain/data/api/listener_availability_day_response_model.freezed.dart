// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_availability_day_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerAvailabilityDayResponseModel {

 String get status; ListenerAvailabilityDayData get data;
/// Create a copy of ListenerAvailabilityDayResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerAvailabilityDayResponseModelCopyWith<ListenerAvailabilityDayResponseModel> get copyWith => _$ListenerAvailabilityDayResponseModelCopyWithImpl<ListenerAvailabilityDayResponseModel>(this as ListenerAvailabilityDayResponseModel, _$identity);

  /// Serializes this ListenerAvailabilityDayResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAvailabilityDayResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerAvailabilityDayResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerAvailabilityDayResponseModelCopyWith<$Res>  {
  factory $ListenerAvailabilityDayResponseModelCopyWith(ListenerAvailabilityDayResponseModel value, $Res Function(ListenerAvailabilityDayResponseModel) _then) = _$ListenerAvailabilityDayResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerAvailabilityDayData data
});


$ListenerAvailabilityDayDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerAvailabilityDayResponseModelCopyWithImpl<$Res>
    implements $ListenerAvailabilityDayResponseModelCopyWith<$Res> {
  _$ListenerAvailabilityDayResponseModelCopyWithImpl(this._self, this._then);

  final ListenerAvailabilityDayResponseModel _self;
  final $Res Function(ListenerAvailabilityDayResponseModel) _then;

/// Create a copy of ListenerAvailabilityDayResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilityDayData,
  ));
}
/// Create a copy of ListenerAvailabilityDayResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerAvailabilityDayDataCopyWith<$Res> get data {
  
  return $ListenerAvailabilityDayDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerAvailabilityDayResponseModel].
extension ListenerAvailabilityDayResponseModelPatterns on ListenerAvailabilityDayResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerAvailabilityDayResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerAvailabilityDayResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerAvailabilityDayResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityDayResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerAvailabilityDayResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityDayResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerAvailabilityDayData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerAvailabilityDayResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerAvailabilityDayData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityDayResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerAvailabilityDayData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityDayResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerAvailabilityDayResponseModel implements ListenerAvailabilityDayResponseModel {
  const _ListenerAvailabilityDayResponseModel({required this.status, required this.data});
  factory _ListenerAvailabilityDayResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerAvailabilityDayResponseModelFromJson(json);

@override final  String status;
@override final  ListenerAvailabilityDayData data;

/// Create a copy of ListenerAvailabilityDayResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerAvailabilityDayResponseModelCopyWith<_ListenerAvailabilityDayResponseModel> get copyWith => __$ListenerAvailabilityDayResponseModelCopyWithImpl<_ListenerAvailabilityDayResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerAvailabilityDayResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerAvailabilityDayResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerAvailabilityDayResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerAvailabilityDayResponseModelCopyWith<$Res> implements $ListenerAvailabilityDayResponseModelCopyWith<$Res> {
  factory _$ListenerAvailabilityDayResponseModelCopyWith(_ListenerAvailabilityDayResponseModel value, $Res Function(_ListenerAvailabilityDayResponseModel) _then) = __$ListenerAvailabilityDayResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerAvailabilityDayData data
});


@override $ListenerAvailabilityDayDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerAvailabilityDayResponseModelCopyWithImpl<$Res>
    implements _$ListenerAvailabilityDayResponseModelCopyWith<$Res> {
  __$ListenerAvailabilityDayResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerAvailabilityDayResponseModel _self;
  final $Res Function(_ListenerAvailabilityDayResponseModel) _then;

/// Create a copy of ListenerAvailabilityDayResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerAvailabilityDayResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilityDayData,
  ));
}

/// Create a copy of ListenerAvailabilityDayResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerAvailabilityDayDataCopyWith<$Res> get data {
  
  return $ListenerAvailabilityDayDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
