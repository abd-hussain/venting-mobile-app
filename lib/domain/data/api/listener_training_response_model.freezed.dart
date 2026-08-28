// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_training_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerTrainingResponseModel {

 String get status; ListenerTrainingData get data;
/// Create a copy of ListenerTrainingResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerTrainingResponseModelCopyWith<ListenerTrainingResponseModel> get copyWith => _$ListenerTrainingResponseModelCopyWithImpl<ListenerTrainingResponseModel>(this as ListenerTrainingResponseModel, _$identity);

  /// Serializes this ListenerTrainingResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerTrainingResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerTrainingResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerTrainingResponseModelCopyWith<$Res>  {
  factory $ListenerTrainingResponseModelCopyWith(ListenerTrainingResponseModel value, $Res Function(ListenerTrainingResponseModel) _then) = _$ListenerTrainingResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerTrainingData data
});


$ListenerTrainingDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerTrainingResponseModelCopyWithImpl<$Res>
    implements $ListenerTrainingResponseModelCopyWith<$Res> {
  _$ListenerTrainingResponseModelCopyWithImpl(this._self, this._then);

  final ListenerTrainingResponseModel _self;
  final $Res Function(ListenerTrainingResponseModel) _then;

/// Create a copy of ListenerTrainingResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerTrainingData,
  ));
}
/// Create a copy of ListenerTrainingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerTrainingDataCopyWith<$Res> get data {
  
  return $ListenerTrainingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerTrainingResponseModel].
extension ListenerTrainingResponseModelPatterns on ListenerTrainingResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerTrainingResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerTrainingResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerTrainingResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerTrainingResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerTrainingResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerTrainingResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerTrainingData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerTrainingResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerTrainingData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerTrainingResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerTrainingData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerTrainingResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerTrainingResponseModel implements ListenerTrainingResponseModel {
  const _ListenerTrainingResponseModel({required this.status, required this.data});
  factory _ListenerTrainingResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerTrainingResponseModelFromJson(json);

@override final  String status;
@override final  ListenerTrainingData data;

/// Create a copy of ListenerTrainingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerTrainingResponseModelCopyWith<_ListenerTrainingResponseModel> get copyWith => __$ListenerTrainingResponseModelCopyWithImpl<_ListenerTrainingResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerTrainingResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerTrainingResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerTrainingResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerTrainingResponseModelCopyWith<$Res> implements $ListenerTrainingResponseModelCopyWith<$Res> {
  factory _$ListenerTrainingResponseModelCopyWith(_ListenerTrainingResponseModel value, $Res Function(_ListenerTrainingResponseModel) _then) = __$ListenerTrainingResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerTrainingData data
});


@override $ListenerTrainingDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerTrainingResponseModelCopyWithImpl<$Res>
    implements _$ListenerTrainingResponseModelCopyWith<$Res> {
  __$ListenerTrainingResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerTrainingResponseModel _self;
  final $Res Function(_ListenerTrainingResponseModel) _then;

/// Create a copy of ListenerTrainingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerTrainingResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerTrainingData,
  ));
}

/// Create a copy of ListenerTrainingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerTrainingDataCopyWith<$Res> get data {
  
  return $ListenerTrainingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerTrainingData {

 List<ListenerTrainingModuleModel> get modules; bool get all_completed; ListenerSetupProgressData? get setup_progress;
/// Create a copy of ListenerTrainingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerTrainingDataCopyWith<ListenerTrainingData> get copyWith => _$ListenerTrainingDataCopyWithImpl<ListenerTrainingData>(this as ListenerTrainingData, _$identity);

  /// Serializes this ListenerTrainingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerTrainingData&&const DeepCollectionEquality().equals(other.modules, modules)&&(identical(other.all_completed, all_completed) || other.all_completed == all_completed)&&(identical(other.setup_progress, setup_progress) || other.setup_progress == setup_progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(modules),all_completed,setup_progress);

@override
String toString() {
  return 'ListenerTrainingData(modules: $modules, all_completed: $all_completed, setup_progress: $setup_progress)';
}


}

/// @nodoc
abstract mixin class $ListenerTrainingDataCopyWith<$Res>  {
  factory $ListenerTrainingDataCopyWith(ListenerTrainingData value, $Res Function(ListenerTrainingData) _then) = _$ListenerTrainingDataCopyWithImpl;
@useResult
$Res call({
 List<ListenerTrainingModuleModel> modules, bool all_completed, ListenerSetupProgressData? setup_progress
});


$ListenerSetupProgressDataCopyWith<$Res>? get setup_progress;

}
/// @nodoc
class _$ListenerTrainingDataCopyWithImpl<$Res>
    implements $ListenerTrainingDataCopyWith<$Res> {
  _$ListenerTrainingDataCopyWithImpl(this._self, this._then);

  final ListenerTrainingData _self;
  final $Res Function(ListenerTrainingData) _then;

/// Create a copy of ListenerTrainingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modules = null,Object? all_completed = null,Object? setup_progress = freezed,}) {
  return _then(_self.copyWith(
modules: null == modules ? _self.modules : modules // ignore: cast_nullable_to_non_nullable
as List<ListenerTrainingModuleModel>,all_completed: null == all_completed ? _self.all_completed : all_completed // ignore: cast_nullable_to_non_nullable
as bool,setup_progress: freezed == setup_progress ? _self.setup_progress : setup_progress // ignore: cast_nullable_to_non_nullable
as ListenerSetupProgressData?,
  ));
}
/// Create a copy of ListenerTrainingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSetupProgressDataCopyWith<$Res>? get setup_progress {
    if (_self.setup_progress == null) {
    return null;
  }

  return $ListenerSetupProgressDataCopyWith<$Res>(_self.setup_progress!, (value) {
    return _then(_self.copyWith(setup_progress: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerTrainingData].
extension ListenerTrainingDataPatterns on ListenerTrainingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerTrainingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerTrainingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerTrainingData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerTrainingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerTrainingData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerTrainingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListenerTrainingModuleModel> modules,  bool all_completed,  ListenerSetupProgressData? setup_progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerTrainingData() when $default != null:
return $default(_that.modules,_that.all_completed,_that.setup_progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListenerTrainingModuleModel> modules,  bool all_completed,  ListenerSetupProgressData? setup_progress)  $default,) {final _that = this;
switch (_that) {
case _ListenerTrainingData():
return $default(_that.modules,_that.all_completed,_that.setup_progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListenerTrainingModuleModel> modules,  bool all_completed,  ListenerSetupProgressData? setup_progress)?  $default,) {final _that = this;
switch (_that) {
case _ListenerTrainingData() when $default != null:
return $default(_that.modules,_that.all_completed,_that.setup_progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerTrainingData implements ListenerTrainingData {
  const _ListenerTrainingData({final  List<ListenerTrainingModuleModel> modules = const <ListenerTrainingModuleModel>[], this.all_completed = false, this.setup_progress}): _modules = modules;
  factory _ListenerTrainingData.fromJson(Map<String, dynamic> json) => _$ListenerTrainingDataFromJson(json);

 final  List<ListenerTrainingModuleModel> _modules;
@override@JsonKey() List<ListenerTrainingModuleModel> get modules {
  if (_modules is EqualUnmodifiableListView) return _modules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modules);
}

@override@JsonKey() final  bool all_completed;
@override final  ListenerSetupProgressData? setup_progress;

/// Create a copy of ListenerTrainingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerTrainingDataCopyWith<_ListenerTrainingData> get copyWith => __$ListenerTrainingDataCopyWithImpl<_ListenerTrainingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerTrainingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerTrainingData&&const DeepCollectionEquality().equals(other._modules, _modules)&&(identical(other.all_completed, all_completed) || other.all_completed == all_completed)&&(identical(other.setup_progress, setup_progress) || other.setup_progress == setup_progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_modules),all_completed,setup_progress);

@override
String toString() {
  return 'ListenerTrainingData(modules: $modules, all_completed: $all_completed, setup_progress: $setup_progress)';
}


}

/// @nodoc
abstract mixin class _$ListenerTrainingDataCopyWith<$Res> implements $ListenerTrainingDataCopyWith<$Res> {
  factory _$ListenerTrainingDataCopyWith(_ListenerTrainingData value, $Res Function(_ListenerTrainingData) _then) = __$ListenerTrainingDataCopyWithImpl;
@override @useResult
$Res call({
 List<ListenerTrainingModuleModel> modules, bool all_completed, ListenerSetupProgressData? setup_progress
});


@override $ListenerSetupProgressDataCopyWith<$Res>? get setup_progress;

}
/// @nodoc
class __$ListenerTrainingDataCopyWithImpl<$Res>
    implements _$ListenerTrainingDataCopyWith<$Res> {
  __$ListenerTrainingDataCopyWithImpl(this._self, this._then);

  final _ListenerTrainingData _self;
  final $Res Function(_ListenerTrainingData) _then;

/// Create a copy of ListenerTrainingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modules = null,Object? all_completed = null,Object? setup_progress = freezed,}) {
  return _then(_ListenerTrainingData(
modules: null == modules ? _self._modules : modules // ignore: cast_nullable_to_non_nullable
as List<ListenerTrainingModuleModel>,all_completed: null == all_completed ? _self.all_completed : all_completed // ignore: cast_nullable_to_non_nullable
as bool,setup_progress: freezed == setup_progress ? _self.setup_progress : setup_progress // ignore: cast_nullable_to_non_nullable
as ListenerSetupProgressData?,
  ));
}

/// Create a copy of ListenerTrainingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSetupProgressDataCopyWith<$Res>? get setup_progress {
    if (_self.setup_progress == null) {
    return null;
  }

  return $ListenerSetupProgressDataCopyWith<$Res>(_self.setup_progress!, (value) {
    return _then(_self.copyWith(setup_progress: value));
  });
}
}


/// @nodoc
mixin _$ListenerTrainingModuleModel {

 String get id; String get title; String get status; String get content_url;
/// Create a copy of ListenerTrainingModuleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerTrainingModuleModelCopyWith<ListenerTrainingModuleModel> get copyWith => _$ListenerTrainingModuleModelCopyWithImpl<ListenerTrainingModuleModel>(this as ListenerTrainingModuleModel, _$identity);

  /// Serializes this ListenerTrainingModuleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerTrainingModuleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.content_url, content_url) || other.content_url == content_url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,status,content_url);

@override
String toString() {
  return 'ListenerTrainingModuleModel(id: $id, title: $title, status: $status, content_url: $content_url)';
}


}

/// @nodoc
abstract mixin class $ListenerTrainingModuleModelCopyWith<$Res>  {
  factory $ListenerTrainingModuleModelCopyWith(ListenerTrainingModuleModel value, $Res Function(ListenerTrainingModuleModel) _then) = _$ListenerTrainingModuleModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String status, String content_url
});




}
/// @nodoc
class _$ListenerTrainingModuleModelCopyWithImpl<$Res>
    implements $ListenerTrainingModuleModelCopyWith<$Res> {
  _$ListenerTrainingModuleModelCopyWithImpl(this._self, this._then);

  final ListenerTrainingModuleModel _self;
  final $Res Function(ListenerTrainingModuleModel) _then;

/// Create a copy of ListenerTrainingModuleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? status = null,Object? content_url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,content_url: null == content_url ? _self.content_url : content_url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerTrainingModuleModel].
extension ListenerTrainingModuleModelPatterns on ListenerTrainingModuleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerTrainingModuleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerTrainingModuleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerTrainingModuleModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerTrainingModuleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerTrainingModuleModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerTrainingModuleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String status,  String content_url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerTrainingModuleModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.content_url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String status,  String content_url)  $default,) {final _that = this;
switch (_that) {
case _ListenerTrainingModuleModel():
return $default(_that.id,_that.title,_that.status,_that.content_url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String status,  String content_url)?  $default,) {final _that = this;
switch (_that) {
case _ListenerTrainingModuleModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.content_url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerTrainingModuleModel implements ListenerTrainingModuleModel {
  const _ListenerTrainingModuleModel({this.id = '', this.title = '', this.status = '', this.content_url = ''});
  factory _ListenerTrainingModuleModel.fromJson(Map<String, dynamic> json) => _$ListenerTrainingModuleModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String status;
@override@JsonKey() final  String content_url;

/// Create a copy of ListenerTrainingModuleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerTrainingModuleModelCopyWith<_ListenerTrainingModuleModel> get copyWith => __$ListenerTrainingModuleModelCopyWithImpl<_ListenerTrainingModuleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerTrainingModuleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerTrainingModuleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.content_url, content_url) || other.content_url == content_url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,status,content_url);

@override
String toString() {
  return 'ListenerTrainingModuleModel(id: $id, title: $title, status: $status, content_url: $content_url)';
}


}

/// @nodoc
abstract mixin class _$ListenerTrainingModuleModelCopyWith<$Res> implements $ListenerTrainingModuleModelCopyWith<$Res> {
  factory _$ListenerTrainingModuleModelCopyWith(_ListenerTrainingModuleModel value, $Res Function(_ListenerTrainingModuleModel) _then) = __$ListenerTrainingModuleModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String status, String content_url
});




}
/// @nodoc
class __$ListenerTrainingModuleModelCopyWithImpl<$Res>
    implements _$ListenerTrainingModuleModelCopyWith<$Res> {
  __$ListenerTrainingModuleModelCopyWithImpl(this._self, this._then);

  final _ListenerTrainingModuleModel _self;
  final $Res Function(_ListenerTrainingModuleModel) _then;

/// Create a copy of ListenerTrainingModuleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? status = null,Object? content_url = null,}) {
  return _then(_ListenerTrainingModuleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,content_url: null == content_url ? _self.content_url : content_url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
