// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_invites_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VentorInvitesResponseModel {

 String get status; VentorInvitesData get data;
/// Create a copy of VentorInvitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorInvitesResponseModelCopyWith<VentorInvitesResponseModel> get copyWith => _$VentorInvitesResponseModelCopyWithImpl<VentorInvitesResponseModel>(this as VentorInvitesResponseModel, _$identity);

  /// Serializes this VentorInvitesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorInvitesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorInvitesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $VentorInvitesResponseModelCopyWith<$Res>  {
  factory $VentorInvitesResponseModelCopyWith(VentorInvitesResponseModel value, $Res Function(VentorInvitesResponseModel) _then) = _$VentorInvitesResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, VentorInvitesData data
});


$VentorInvitesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VentorInvitesResponseModelCopyWithImpl<$Res>
    implements $VentorInvitesResponseModelCopyWith<$Res> {
  _$VentorInvitesResponseModelCopyWithImpl(this._self, this._then);

  final VentorInvitesResponseModel _self;
  final $Res Function(VentorInvitesResponseModel) _then;

/// Create a copy of VentorInvitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorInvitesData,
  ));
}
/// Create a copy of VentorInvitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorInvitesDataCopyWith<$Res> get data {
  
  return $VentorInvitesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VentorInvitesResponseModel].
extension VentorInvitesResponseModelPatterns on VentorInvitesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorInvitesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorInvitesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorInvitesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorInvitesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorInvitesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorInvitesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  VentorInvitesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorInvitesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  VentorInvitesData data)  $default,) {final _that = this;
switch (_that) {
case _VentorInvitesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  VentorInvitesData data)?  $default,) {final _that = this;
switch (_that) {
case _VentorInvitesResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorInvitesResponseModel implements VentorInvitesResponseModel {
  const _VentorInvitesResponseModel({required this.status, required this.data});
  factory _VentorInvitesResponseModel.fromJson(Map<String, dynamic> json) => _$VentorInvitesResponseModelFromJson(json);

@override final  String status;
@override final  VentorInvitesData data;

/// Create a copy of VentorInvitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorInvitesResponseModelCopyWith<_VentorInvitesResponseModel> get copyWith => __$VentorInvitesResponseModelCopyWithImpl<_VentorInvitesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorInvitesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorInvitesResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'VentorInvitesResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VentorInvitesResponseModelCopyWith<$Res> implements $VentorInvitesResponseModelCopyWith<$Res> {
  factory _$VentorInvitesResponseModelCopyWith(_VentorInvitesResponseModel value, $Res Function(_VentorInvitesResponseModel) _then) = __$VentorInvitesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, VentorInvitesData data
});


@override $VentorInvitesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VentorInvitesResponseModelCopyWithImpl<$Res>
    implements _$VentorInvitesResponseModelCopyWith<$Res> {
  __$VentorInvitesResponseModelCopyWithImpl(this._self, this._then);

  final _VentorInvitesResponseModel _self;
  final $Res Function(_VentorInvitesResponseModel) _then;

/// Create a copy of VentorInvitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_VentorInvitesResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VentorInvitesData,
  ));
}

/// Create a copy of VentorInvitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VentorInvitesDataCopyWith<$Res> get data {
  
  return $VentorInvitesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VentorInvitesData {

 String get invite_code; String get invite_link; int get total_invited; int get invite_points_earned; List<VentorInviteItemModel> get items;
/// Create a copy of VentorInvitesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorInvitesDataCopyWith<VentorInvitesData> get copyWith => _$VentorInvitesDataCopyWithImpl<VentorInvitesData>(this as VentorInvitesData, _$identity);

  /// Serializes this VentorInvitesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorInvitesData&&(identical(other.invite_code, invite_code) || other.invite_code == invite_code)&&(identical(other.invite_link, invite_link) || other.invite_link == invite_link)&&(identical(other.total_invited, total_invited) || other.total_invited == total_invited)&&(identical(other.invite_points_earned, invite_points_earned) || other.invite_points_earned == invite_points_earned)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invite_code,invite_link,total_invited,invite_points_earned,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'VentorInvitesData(invite_code: $invite_code, invite_link: $invite_link, total_invited: $total_invited, invite_points_earned: $invite_points_earned, items: $items)';
}


}

/// @nodoc
abstract mixin class $VentorInvitesDataCopyWith<$Res>  {
  factory $VentorInvitesDataCopyWith(VentorInvitesData value, $Res Function(VentorInvitesData) _then) = _$VentorInvitesDataCopyWithImpl;
@useResult
$Res call({
 String invite_code, String invite_link, int total_invited, int invite_points_earned, List<VentorInviteItemModel> items
});




}
/// @nodoc
class _$VentorInvitesDataCopyWithImpl<$Res>
    implements $VentorInvitesDataCopyWith<$Res> {
  _$VentorInvitesDataCopyWithImpl(this._self, this._then);

  final VentorInvitesData _self;
  final $Res Function(VentorInvitesData) _then;

/// Create a copy of VentorInvitesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invite_code = null,Object? invite_link = null,Object? total_invited = null,Object? invite_points_earned = null,Object? items = null,}) {
  return _then(_self.copyWith(
invite_code: null == invite_code ? _self.invite_code : invite_code // ignore: cast_nullable_to_non_nullable
as String,invite_link: null == invite_link ? _self.invite_link : invite_link // ignore: cast_nullable_to_non_nullable
as String,total_invited: null == total_invited ? _self.total_invited : total_invited // ignore: cast_nullable_to_non_nullable
as int,invite_points_earned: null == invite_points_earned ? _self.invite_points_earned : invite_points_earned // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<VentorInviteItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorInvitesData].
extension VentorInvitesDataPatterns on VentorInvitesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorInvitesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorInvitesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorInvitesData value)  $default,){
final _that = this;
switch (_that) {
case _VentorInvitesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorInvitesData value)?  $default,){
final _that = this;
switch (_that) {
case _VentorInvitesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String invite_code,  String invite_link,  int total_invited,  int invite_points_earned,  List<VentorInviteItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorInvitesData() when $default != null:
return $default(_that.invite_code,_that.invite_link,_that.total_invited,_that.invite_points_earned,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String invite_code,  String invite_link,  int total_invited,  int invite_points_earned,  List<VentorInviteItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _VentorInvitesData():
return $default(_that.invite_code,_that.invite_link,_that.total_invited,_that.invite_points_earned,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String invite_code,  String invite_link,  int total_invited,  int invite_points_earned,  List<VentorInviteItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _VentorInvitesData() when $default != null:
return $default(_that.invite_code,_that.invite_link,_that.total_invited,_that.invite_points_earned,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorInvitesData implements VentorInvitesData {
  const _VentorInvitesData({this.invite_code = '', this.invite_link = '', this.total_invited = 0, this.invite_points_earned = 0, final  List<VentorInviteItemModel> items = const <VentorInviteItemModel>[]}): _items = items;
  factory _VentorInvitesData.fromJson(Map<String, dynamic> json) => _$VentorInvitesDataFromJson(json);

@override@JsonKey() final  String invite_code;
@override@JsonKey() final  String invite_link;
@override@JsonKey() final  int total_invited;
@override@JsonKey() final  int invite_points_earned;
 final  List<VentorInviteItemModel> _items;
@override@JsonKey() List<VentorInviteItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of VentorInvitesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorInvitesDataCopyWith<_VentorInvitesData> get copyWith => __$VentorInvitesDataCopyWithImpl<_VentorInvitesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorInvitesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorInvitesData&&(identical(other.invite_code, invite_code) || other.invite_code == invite_code)&&(identical(other.invite_link, invite_link) || other.invite_link == invite_link)&&(identical(other.total_invited, total_invited) || other.total_invited == total_invited)&&(identical(other.invite_points_earned, invite_points_earned) || other.invite_points_earned == invite_points_earned)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invite_code,invite_link,total_invited,invite_points_earned,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'VentorInvitesData(invite_code: $invite_code, invite_link: $invite_link, total_invited: $total_invited, invite_points_earned: $invite_points_earned, items: $items)';
}


}

/// @nodoc
abstract mixin class _$VentorInvitesDataCopyWith<$Res> implements $VentorInvitesDataCopyWith<$Res> {
  factory _$VentorInvitesDataCopyWith(_VentorInvitesData value, $Res Function(_VentorInvitesData) _then) = __$VentorInvitesDataCopyWithImpl;
@override @useResult
$Res call({
 String invite_code, String invite_link, int total_invited, int invite_points_earned, List<VentorInviteItemModel> items
});




}
/// @nodoc
class __$VentorInvitesDataCopyWithImpl<$Res>
    implements _$VentorInvitesDataCopyWith<$Res> {
  __$VentorInvitesDataCopyWithImpl(this._self, this._then);

  final _VentorInvitesData _self;
  final $Res Function(_VentorInvitesData) _then;

/// Create a copy of VentorInvitesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invite_code = null,Object? invite_link = null,Object? total_invited = null,Object? invite_points_earned = null,Object? items = null,}) {
  return _then(_VentorInvitesData(
invite_code: null == invite_code ? _self.invite_code : invite_code // ignore: cast_nullable_to_non_nullable
as String,invite_link: null == invite_link ? _self.invite_link : invite_link // ignore: cast_nullable_to_non_nullable
as String,total_invited: null == total_invited ? _self.total_invited : total_invited // ignore: cast_nullable_to_non_nullable
as int,invite_points_earned: null == invite_points_earned ? _self.invite_points_earned : invite_points_earned // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<VentorInviteItemModel>,
  ));
}


}


/// @nodoc
mixin _$VentorInviteItemModel {

 String get id; String get name; String get status; int get points_earned;
/// Create a copy of VentorInviteItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorInviteItemModelCopyWith<VentorInviteItemModel> get copyWith => _$VentorInviteItemModelCopyWithImpl<VentorInviteItemModel>(this as VentorInviteItemModel, _$identity);

  /// Serializes this VentorInviteItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorInviteItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.points_earned, points_earned) || other.points_earned == points_earned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,points_earned);

@override
String toString() {
  return 'VentorInviteItemModel(id: $id, name: $name, status: $status, points_earned: $points_earned)';
}


}

/// @nodoc
abstract mixin class $VentorInviteItemModelCopyWith<$Res>  {
  factory $VentorInviteItemModelCopyWith(VentorInviteItemModel value, $Res Function(VentorInviteItemModel) _then) = _$VentorInviteItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String status, int points_earned
});




}
/// @nodoc
class _$VentorInviteItemModelCopyWithImpl<$Res>
    implements $VentorInviteItemModelCopyWith<$Res> {
  _$VentorInviteItemModelCopyWithImpl(this._self, this._then);

  final VentorInviteItemModel _self;
  final $Res Function(VentorInviteItemModel) _then;

/// Create a copy of VentorInviteItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? points_earned = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,points_earned: null == points_earned ? _self.points_earned : points_earned // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorInviteItemModel].
extension VentorInviteItemModelPatterns on VentorInviteItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorInviteItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorInviteItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorInviteItemModel value)  $default,){
final _that = this;
switch (_that) {
case _VentorInviteItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorInviteItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _VentorInviteItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String status,  int points_earned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorInviteItemModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.points_earned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String status,  int points_earned)  $default,) {final _that = this;
switch (_that) {
case _VentorInviteItemModel():
return $default(_that.id,_that.name,_that.status,_that.points_earned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String status,  int points_earned)?  $default,) {final _that = this;
switch (_that) {
case _VentorInviteItemModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.points_earned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VentorInviteItemModel implements VentorInviteItemModel {
  const _VentorInviteItemModel({this.id = '', this.name = '', this.status = '', this.points_earned = 0});
  factory _VentorInviteItemModel.fromJson(Map<String, dynamic> json) => _$VentorInviteItemModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String status;
@override@JsonKey() final  int points_earned;

/// Create a copy of VentorInviteItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorInviteItemModelCopyWith<_VentorInviteItemModel> get copyWith => __$VentorInviteItemModelCopyWithImpl<_VentorInviteItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VentorInviteItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorInviteItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.points_earned, points_earned) || other.points_earned == points_earned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,points_earned);

@override
String toString() {
  return 'VentorInviteItemModel(id: $id, name: $name, status: $status, points_earned: $points_earned)';
}


}

/// @nodoc
abstract mixin class _$VentorInviteItemModelCopyWith<$Res> implements $VentorInviteItemModelCopyWith<$Res> {
  factory _$VentorInviteItemModelCopyWith(_VentorInviteItemModel value, $Res Function(_VentorInviteItemModel) _then) = __$VentorInviteItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String status, int points_earned
});




}
/// @nodoc
class __$VentorInviteItemModelCopyWithImpl<$Res>
    implements _$VentorInviteItemModelCopyWith<$Res> {
  __$VentorInviteItemModelCopyWithImpl(this._self, this._then);

  final _VentorInviteItemModel _self;
  final $Res Function(_VentorInviteItemModel) _then;

/// Create a copy of VentorInviteItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? points_earned = null,}) {
  return _then(_VentorInviteItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,points_earned: null == points_earned ? _self.points_earned : points_earned // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
