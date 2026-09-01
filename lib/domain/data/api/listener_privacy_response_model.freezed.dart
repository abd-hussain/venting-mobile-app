// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_privacy_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerPrivacyResponseModel {

 String get status; ListenerPrivacyData get data;
/// Create a copy of ListenerPrivacyResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPrivacyResponseModelCopyWith<ListenerPrivacyResponseModel> get copyWith => _$ListenerPrivacyResponseModelCopyWithImpl<ListenerPrivacyResponseModel>(this as ListenerPrivacyResponseModel, _$identity);

  /// Serializes this ListenerPrivacyResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPrivacyResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPrivacyResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerPrivacyResponseModelCopyWith<$Res>  {
  factory $ListenerPrivacyResponseModelCopyWith(ListenerPrivacyResponseModel value, $Res Function(ListenerPrivacyResponseModel) _then) = _$ListenerPrivacyResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerPrivacyData data
});


$ListenerPrivacyDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerPrivacyResponseModelCopyWithImpl<$Res>
    implements $ListenerPrivacyResponseModelCopyWith<$Res> {
  _$ListenerPrivacyResponseModelCopyWithImpl(this._self, this._then);

  final ListenerPrivacyResponseModel _self;
  final $Res Function(ListenerPrivacyResponseModel) _then;

/// Create a copy of ListenerPrivacyResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPrivacyData,
  ));
}
/// Create a copy of ListenerPrivacyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPrivacyDataCopyWith<$Res> get data {
  
  return $ListenerPrivacyDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerPrivacyResponseModel].
extension ListenerPrivacyResponseModelPatterns on ListenerPrivacyResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPrivacyResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPrivacyResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPrivacyResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPrivacyResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPrivacyResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPrivacyResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerPrivacyData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPrivacyResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerPrivacyData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerPrivacyResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerPrivacyData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPrivacyResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPrivacyResponseModel implements ListenerPrivacyResponseModel {
  const _ListenerPrivacyResponseModel({required this.status, required this.data});
  factory _ListenerPrivacyResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerPrivacyResponseModelFromJson(json);

@override final  String status;
@override final  ListenerPrivacyData data;

/// Create a copy of ListenerPrivacyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPrivacyResponseModelCopyWith<_ListenerPrivacyResponseModel> get copyWith => __$ListenerPrivacyResponseModelCopyWithImpl<_ListenerPrivacyResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPrivacyResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPrivacyResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerPrivacyResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerPrivacyResponseModelCopyWith<$Res> implements $ListenerPrivacyResponseModelCopyWith<$Res> {
  factory _$ListenerPrivacyResponseModelCopyWith(_ListenerPrivacyResponseModel value, $Res Function(_ListenerPrivacyResponseModel) _then) = __$ListenerPrivacyResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerPrivacyData data
});


@override $ListenerPrivacyDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerPrivacyResponseModelCopyWithImpl<$Res>
    implements _$ListenerPrivacyResponseModelCopyWith<$Res> {
  __$ListenerPrivacyResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerPrivacyResponseModel _self;
  final $Res Function(_ListenerPrivacyResponseModel) _then;

/// Create a copy of ListenerPrivacyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerPrivacyResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerPrivacyData,
  ));
}

/// Create a copy of ListenerPrivacyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerPrivacyDataCopyWith<$Res> get data {
  
  return $ListenerPrivacyDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerPrivacyData {

 bool get profile_visible; bool get show_online_status; bool get visible_in_all_countries; List<String> get visible_countries; bool get allow_search_indexing;
/// Create a copy of ListenerPrivacyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPrivacyDataCopyWith<ListenerPrivacyData> get copyWith => _$ListenerPrivacyDataCopyWithImpl<ListenerPrivacyData>(this as ListenerPrivacyData, _$identity);

  /// Serializes this ListenerPrivacyData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPrivacyData&&(identical(other.profile_visible, profile_visible) || other.profile_visible == profile_visible)&&(identical(other.show_online_status, show_online_status) || other.show_online_status == show_online_status)&&(identical(other.visible_in_all_countries, visible_in_all_countries) || other.visible_in_all_countries == visible_in_all_countries)&&const DeepCollectionEquality().equals(other.visible_countries, visible_countries)&&(identical(other.allow_search_indexing, allow_search_indexing) || other.allow_search_indexing == allow_search_indexing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile_visible,show_online_status,visible_in_all_countries,const DeepCollectionEquality().hash(visible_countries),allow_search_indexing);

@override
String toString() {
  return 'ListenerPrivacyData(profile_visible: $profile_visible, show_online_status: $show_online_status, visible_in_all_countries: $visible_in_all_countries, visible_countries: $visible_countries, allow_search_indexing: $allow_search_indexing)';
}


}

/// @nodoc
abstract mixin class $ListenerPrivacyDataCopyWith<$Res>  {
  factory $ListenerPrivacyDataCopyWith(ListenerPrivacyData value, $Res Function(ListenerPrivacyData) _then) = _$ListenerPrivacyDataCopyWithImpl;
@useResult
$Res call({
 bool profile_visible, bool show_online_status, bool visible_in_all_countries, List<String> visible_countries, bool allow_search_indexing
});




}
/// @nodoc
class _$ListenerPrivacyDataCopyWithImpl<$Res>
    implements $ListenerPrivacyDataCopyWith<$Res> {
  _$ListenerPrivacyDataCopyWithImpl(this._self, this._then);

  final ListenerPrivacyData _self;
  final $Res Function(ListenerPrivacyData) _then;

/// Create a copy of ListenerPrivacyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile_visible = null,Object? show_online_status = null,Object? visible_in_all_countries = null,Object? visible_countries = null,Object? allow_search_indexing = null,}) {
  return _then(_self.copyWith(
profile_visible: null == profile_visible ? _self.profile_visible : profile_visible // ignore: cast_nullable_to_non_nullable
as bool,show_online_status: null == show_online_status ? _self.show_online_status : show_online_status // ignore: cast_nullable_to_non_nullable
as bool,visible_in_all_countries: null == visible_in_all_countries ? _self.visible_in_all_countries : visible_in_all_countries // ignore: cast_nullable_to_non_nullable
as bool,visible_countries: null == visible_countries ? _self.visible_countries : visible_countries // ignore: cast_nullable_to_non_nullable
as List<String>,allow_search_indexing: null == allow_search_indexing ? _self.allow_search_indexing : allow_search_indexing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerPrivacyData].
extension ListenerPrivacyDataPatterns on ListenerPrivacyData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPrivacyData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPrivacyData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPrivacyData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPrivacyData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPrivacyData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPrivacyData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool profile_visible,  bool show_online_status,  bool visible_in_all_countries,  List<String> visible_countries,  bool allow_search_indexing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPrivacyData() when $default != null:
return $default(_that.profile_visible,_that.show_online_status,_that.visible_in_all_countries,_that.visible_countries,_that.allow_search_indexing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool profile_visible,  bool show_online_status,  bool visible_in_all_countries,  List<String> visible_countries,  bool allow_search_indexing)  $default,) {final _that = this;
switch (_that) {
case _ListenerPrivacyData():
return $default(_that.profile_visible,_that.show_online_status,_that.visible_in_all_countries,_that.visible_countries,_that.allow_search_indexing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool profile_visible,  bool show_online_status,  bool visible_in_all_countries,  List<String> visible_countries,  bool allow_search_indexing)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPrivacyData() when $default != null:
return $default(_that.profile_visible,_that.show_online_status,_that.visible_in_all_countries,_that.visible_countries,_that.allow_search_indexing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerPrivacyData implements ListenerPrivacyData {
  const _ListenerPrivacyData({this.profile_visible = true, this.show_online_status = true, this.visible_in_all_countries = true, final  List<String> visible_countries = const <String>[], this.allow_search_indexing = true}): _visible_countries = visible_countries;
  factory _ListenerPrivacyData.fromJson(Map<String, dynamic> json) => _$ListenerPrivacyDataFromJson(json);

@override@JsonKey() final  bool profile_visible;
@override@JsonKey() final  bool show_online_status;
@override@JsonKey() final  bool visible_in_all_countries;
 final  List<String> _visible_countries;
@override@JsonKey() List<String> get visible_countries {
  if (_visible_countries is EqualUnmodifiableListView) return _visible_countries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visible_countries);
}

@override@JsonKey() final  bool allow_search_indexing;

/// Create a copy of ListenerPrivacyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPrivacyDataCopyWith<_ListenerPrivacyData> get copyWith => __$ListenerPrivacyDataCopyWithImpl<_ListenerPrivacyData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerPrivacyDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPrivacyData&&(identical(other.profile_visible, profile_visible) || other.profile_visible == profile_visible)&&(identical(other.show_online_status, show_online_status) || other.show_online_status == show_online_status)&&(identical(other.visible_in_all_countries, visible_in_all_countries) || other.visible_in_all_countries == visible_in_all_countries)&&const DeepCollectionEquality().equals(other._visible_countries, _visible_countries)&&(identical(other.allow_search_indexing, allow_search_indexing) || other.allow_search_indexing == allow_search_indexing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile_visible,show_online_status,visible_in_all_countries,const DeepCollectionEquality().hash(_visible_countries),allow_search_indexing);

@override
String toString() {
  return 'ListenerPrivacyData(profile_visible: $profile_visible, show_online_status: $show_online_status, visible_in_all_countries: $visible_in_all_countries, visible_countries: $visible_countries, allow_search_indexing: $allow_search_indexing)';
}


}

/// @nodoc
abstract mixin class _$ListenerPrivacyDataCopyWith<$Res> implements $ListenerPrivacyDataCopyWith<$Res> {
  factory _$ListenerPrivacyDataCopyWith(_ListenerPrivacyData value, $Res Function(_ListenerPrivacyData) _then) = __$ListenerPrivacyDataCopyWithImpl;
@override @useResult
$Res call({
 bool profile_visible, bool show_online_status, bool visible_in_all_countries, List<String> visible_countries, bool allow_search_indexing
});




}
/// @nodoc
class __$ListenerPrivacyDataCopyWithImpl<$Res>
    implements _$ListenerPrivacyDataCopyWith<$Res> {
  __$ListenerPrivacyDataCopyWithImpl(this._self, this._then);

  final _ListenerPrivacyData _self;
  final $Res Function(_ListenerPrivacyData) _then;

/// Create a copy of ListenerPrivacyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile_visible = null,Object? show_online_status = null,Object? visible_in_all_countries = null,Object? visible_countries = null,Object? allow_search_indexing = null,}) {
  return _then(_ListenerPrivacyData(
profile_visible: null == profile_visible ? _self.profile_visible : profile_visible // ignore: cast_nullable_to_non_nullable
as bool,show_online_status: null == show_online_status ? _self.show_online_status : show_online_status // ignore: cast_nullable_to_non_nullable
as bool,visible_in_all_countries: null == visible_in_all_countries ? _self.visible_in_all_countries : visible_in_all_countries // ignore: cast_nullable_to_non_nullable
as bool,visible_countries: null == visible_countries ? _self._visible_countries : visible_countries // ignore: cast_nullable_to_non_nullable
as List<String>,allow_search_indexing: null == allow_search_indexing ? _self.allow_search_indexing : allow_search_indexing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
