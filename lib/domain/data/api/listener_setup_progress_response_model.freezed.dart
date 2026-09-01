// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_setup_progress_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerSetupProgressResponseModel {

 String get status; ListenerSetupProgressData get data;
/// Create a copy of ListenerSetupProgressResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSetupProgressResponseModelCopyWith<ListenerSetupProgressResponseModel> get copyWith => _$ListenerSetupProgressResponseModelCopyWithImpl<ListenerSetupProgressResponseModel>(this as ListenerSetupProgressResponseModel, _$identity);

  /// Serializes this ListenerSetupProgressResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSetupProgressResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerSetupProgressResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerSetupProgressResponseModelCopyWith<$Res>  {
  factory $ListenerSetupProgressResponseModelCopyWith(ListenerSetupProgressResponseModel value, $Res Function(ListenerSetupProgressResponseModel) _then) = _$ListenerSetupProgressResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerSetupProgressData data
});


$ListenerSetupProgressDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerSetupProgressResponseModelCopyWithImpl<$Res>
    implements $ListenerSetupProgressResponseModelCopyWith<$Res> {
  _$ListenerSetupProgressResponseModelCopyWithImpl(this._self, this._then);

  final ListenerSetupProgressResponseModel _self;
  final $Res Function(ListenerSetupProgressResponseModel) _then;

/// Create a copy of ListenerSetupProgressResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerSetupProgressData,
  ));
}
/// Create a copy of ListenerSetupProgressResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSetupProgressDataCopyWith<$Res> get data {
  
  return $ListenerSetupProgressDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerSetupProgressResponseModel].
extension ListenerSetupProgressResponseModelPatterns on ListenerSetupProgressResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSetupProgressResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSetupProgressResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSetupProgressResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSetupProgressResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSetupProgressResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSetupProgressResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerSetupProgressData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSetupProgressResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerSetupProgressData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerSetupProgressResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerSetupProgressData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSetupProgressResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSetupProgressResponseModel implements ListenerSetupProgressResponseModel {
  const _ListenerSetupProgressResponseModel({required this.status, required this.data});
  factory _ListenerSetupProgressResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerSetupProgressResponseModelFromJson(json);

@override final  String status;
@override final  ListenerSetupProgressData data;

/// Create a copy of ListenerSetupProgressResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSetupProgressResponseModelCopyWith<_ListenerSetupProgressResponseModel> get copyWith => __$ListenerSetupProgressResponseModelCopyWithImpl<_ListenerSetupProgressResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSetupProgressResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSetupProgressResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerSetupProgressResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerSetupProgressResponseModelCopyWith<$Res> implements $ListenerSetupProgressResponseModelCopyWith<$Res> {
  factory _$ListenerSetupProgressResponseModelCopyWith(_ListenerSetupProgressResponseModel value, $Res Function(_ListenerSetupProgressResponseModel) _then) = __$ListenerSetupProgressResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerSetupProgressData data
});


@override $ListenerSetupProgressDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerSetupProgressResponseModelCopyWithImpl<$Res>
    implements _$ListenerSetupProgressResponseModelCopyWith<$Res> {
  __$ListenerSetupProgressResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerSetupProgressResponseModel _self;
  final $Res Function(_ListenerSetupProgressResponseModel) _then;

/// Create a copy of ListenerSetupProgressResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerSetupProgressResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerSetupProgressData,
  ));
}

/// Create a copy of ListenerSetupProgressResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerSetupProgressDataCopyWith<$Res> get data {
  
  return $ListenerSetupProgressDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerSetupProgressData {

 bool get profile_approved; String get profile_status; bool get can_go_online; List<String> get steps_to_refill; String get rejection_reason; bool get registration_complete; int get progress_percent; List<ListenerSetupProgressStepModel> get steps;
/// Create a copy of ListenerSetupProgressData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSetupProgressDataCopyWith<ListenerSetupProgressData> get copyWith => _$ListenerSetupProgressDataCopyWithImpl<ListenerSetupProgressData>(this as ListenerSetupProgressData, _$identity);

  /// Serializes this ListenerSetupProgressData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSetupProgressData&&(identical(other.profile_approved, profile_approved) || other.profile_approved == profile_approved)&&(identical(other.profile_status, profile_status) || other.profile_status == profile_status)&&(identical(other.can_go_online, can_go_online) || other.can_go_online == can_go_online)&&const DeepCollectionEquality().equals(other.steps_to_refill, steps_to_refill)&&(identical(other.rejection_reason, rejection_reason) || other.rejection_reason == rejection_reason)&&(identical(other.registration_complete, registration_complete) || other.registration_complete == registration_complete)&&(identical(other.progress_percent, progress_percent) || other.progress_percent == progress_percent)&&const DeepCollectionEquality().equals(other.steps, steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile_approved,profile_status,can_go_online,const DeepCollectionEquality().hash(steps_to_refill),rejection_reason,registration_complete,progress_percent,const DeepCollectionEquality().hash(steps));

@override
String toString() {
  return 'ListenerSetupProgressData(profile_approved: $profile_approved, profile_status: $profile_status, can_go_online: $can_go_online, steps_to_refill: $steps_to_refill, rejection_reason: $rejection_reason, registration_complete: $registration_complete, progress_percent: $progress_percent, steps: $steps)';
}


}

/// @nodoc
abstract mixin class $ListenerSetupProgressDataCopyWith<$Res>  {
  factory $ListenerSetupProgressDataCopyWith(ListenerSetupProgressData value, $Res Function(ListenerSetupProgressData) _then) = _$ListenerSetupProgressDataCopyWithImpl;
@useResult
$Res call({
 bool profile_approved, String profile_status, bool can_go_online, List<String> steps_to_refill, String rejection_reason, bool registration_complete, int progress_percent, List<ListenerSetupProgressStepModel> steps
});




}
/// @nodoc
class _$ListenerSetupProgressDataCopyWithImpl<$Res>
    implements $ListenerSetupProgressDataCopyWith<$Res> {
  _$ListenerSetupProgressDataCopyWithImpl(this._self, this._then);

  final ListenerSetupProgressData _self;
  final $Res Function(ListenerSetupProgressData) _then;

/// Create a copy of ListenerSetupProgressData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile_approved = null,Object? profile_status = null,Object? can_go_online = null,Object? steps_to_refill = null,Object? rejection_reason = null,Object? registration_complete = null,Object? progress_percent = null,Object? steps = null,}) {
  return _then(_self.copyWith(
profile_approved: null == profile_approved ? _self.profile_approved : profile_approved // ignore: cast_nullable_to_non_nullable
as bool,profile_status: null == profile_status ? _self.profile_status : profile_status // ignore: cast_nullable_to_non_nullable
as String,can_go_online: null == can_go_online ? _self.can_go_online : can_go_online // ignore: cast_nullable_to_non_nullable
as bool,steps_to_refill: null == steps_to_refill ? _self.steps_to_refill : steps_to_refill // ignore: cast_nullable_to_non_nullable
as List<String>,rejection_reason: null == rejection_reason ? _self.rejection_reason : rejection_reason // ignore: cast_nullable_to_non_nullable
as String,registration_complete: null == registration_complete ? _self.registration_complete : registration_complete // ignore: cast_nullable_to_non_nullable
as bool,progress_percent: null == progress_percent ? _self.progress_percent : progress_percent // ignore: cast_nullable_to_non_nullable
as int,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<ListenerSetupProgressStepModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerSetupProgressData].
extension ListenerSetupProgressDataPatterns on ListenerSetupProgressData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSetupProgressData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSetupProgressData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSetupProgressData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSetupProgressData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSetupProgressData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSetupProgressData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool profile_approved,  String profile_status,  bool can_go_online,  List<String> steps_to_refill,  String rejection_reason,  bool registration_complete,  int progress_percent,  List<ListenerSetupProgressStepModel> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSetupProgressData() when $default != null:
return $default(_that.profile_approved,_that.profile_status,_that.can_go_online,_that.steps_to_refill,_that.rejection_reason,_that.registration_complete,_that.progress_percent,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool profile_approved,  String profile_status,  bool can_go_online,  List<String> steps_to_refill,  String rejection_reason,  bool registration_complete,  int progress_percent,  List<ListenerSetupProgressStepModel> steps)  $default,) {final _that = this;
switch (_that) {
case _ListenerSetupProgressData():
return $default(_that.profile_approved,_that.profile_status,_that.can_go_online,_that.steps_to_refill,_that.rejection_reason,_that.registration_complete,_that.progress_percent,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool profile_approved,  String profile_status,  bool can_go_online,  List<String> steps_to_refill,  String rejection_reason,  bool registration_complete,  int progress_percent,  List<ListenerSetupProgressStepModel> steps)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSetupProgressData() when $default != null:
return $default(_that.profile_approved,_that.profile_status,_that.can_go_online,_that.steps_to_refill,_that.rejection_reason,_that.registration_complete,_that.progress_percent,_that.steps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSetupProgressData implements ListenerSetupProgressData {
  const _ListenerSetupProgressData({this.profile_approved = false, this.profile_status = 'incomplete', this.can_go_online = false, final  List<String> steps_to_refill = const <String>[], this.rejection_reason = '', this.registration_complete = false, this.progress_percent = 0, final  List<ListenerSetupProgressStepModel> steps = const <ListenerSetupProgressStepModel>[]}): _steps_to_refill = steps_to_refill,_steps = steps;
  factory _ListenerSetupProgressData.fromJson(Map<String, dynamic> json) => _$ListenerSetupProgressDataFromJson(json);

@override@JsonKey() final  bool profile_approved;
@override@JsonKey() final  String profile_status;
@override@JsonKey() final  bool can_go_online;
 final  List<String> _steps_to_refill;
@override@JsonKey() List<String> get steps_to_refill {
  if (_steps_to_refill is EqualUnmodifiableListView) return _steps_to_refill;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps_to_refill);
}

@override@JsonKey() final  String rejection_reason;
@override@JsonKey() final  bool registration_complete;
@override@JsonKey() final  int progress_percent;
 final  List<ListenerSetupProgressStepModel> _steps;
@override@JsonKey() List<ListenerSetupProgressStepModel> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of ListenerSetupProgressData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSetupProgressDataCopyWith<_ListenerSetupProgressData> get copyWith => __$ListenerSetupProgressDataCopyWithImpl<_ListenerSetupProgressData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSetupProgressDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSetupProgressData&&(identical(other.profile_approved, profile_approved) || other.profile_approved == profile_approved)&&(identical(other.profile_status, profile_status) || other.profile_status == profile_status)&&(identical(other.can_go_online, can_go_online) || other.can_go_online == can_go_online)&&const DeepCollectionEquality().equals(other._steps_to_refill, _steps_to_refill)&&(identical(other.rejection_reason, rejection_reason) || other.rejection_reason == rejection_reason)&&(identical(other.registration_complete, registration_complete) || other.registration_complete == registration_complete)&&(identical(other.progress_percent, progress_percent) || other.progress_percent == progress_percent)&&const DeepCollectionEquality().equals(other._steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profile_approved,profile_status,can_go_online,const DeepCollectionEquality().hash(_steps_to_refill),rejection_reason,registration_complete,progress_percent,const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'ListenerSetupProgressData(profile_approved: $profile_approved, profile_status: $profile_status, can_go_online: $can_go_online, steps_to_refill: $steps_to_refill, rejection_reason: $rejection_reason, registration_complete: $registration_complete, progress_percent: $progress_percent, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$ListenerSetupProgressDataCopyWith<$Res> implements $ListenerSetupProgressDataCopyWith<$Res> {
  factory _$ListenerSetupProgressDataCopyWith(_ListenerSetupProgressData value, $Res Function(_ListenerSetupProgressData) _then) = __$ListenerSetupProgressDataCopyWithImpl;
@override @useResult
$Res call({
 bool profile_approved, String profile_status, bool can_go_online, List<String> steps_to_refill, String rejection_reason, bool registration_complete, int progress_percent, List<ListenerSetupProgressStepModel> steps
});




}
/// @nodoc
class __$ListenerSetupProgressDataCopyWithImpl<$Res>
    implements _$ListenerSetupProgressDataCopyWith<$Res> {
  __$ListenerSetupProgressDataCopyWithImpl(this._self, this._then);

  final _ListenerSetupProgressData _self;
  final $Res Function(_ListenerSetupProgressData) _then;

/// Create a copy of ListenerSetupProgressData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile_approved = null,Object? profile_status = null,Object? can_go_online = null,Object? steps_to_refill = null,Object? rejection_reason = null,Object? registration_complete = null,Object? progress_percent = null,Object? steps = null,}) {
  return _then(_ListenerSetupProgressData(
profile_approved: null == profile_approved ? _self.profile_approved : profile_approved // ignore: cast_nullable_to_non_nullable
as bool,profile_status: null == profile_status ? _self.profile_status : profile_status // ignore: cast_nullable_to_non_nullable
as String,can_go_online: null == can_go_online ? _self.can_go_online : can_go_online // ignore: cast_nullable_to_non_nullable
as bool,steps_to_refill: null == steps_to_refill ? _self._steps_to_refill : steps_to_refill // ignore: cast_nullable_to_non_nullable
as List<String>,rejection_reason: null == rejection_reason ? _self.rejection_reason : rejection_reason // ignore: cast_nullable_to_non_nullable
as String,registration_complete: null == registration_complete ? _self.registration_complete : registration_complete // ignore: cast_nullable_to_non_nullable
as bool,progress_percent: null == progress_percent ? _self.progress_percent : progress_percent // ignore: cast_nullable_to_non_nullable
as int,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<ListenerSetupProgressStepModel>,
  ));
}


}


/// @nodoc
mixin _$ListenerSetupProgressStepModel {

 String get id; String get status;
/// Create a copy of ListenerSetupProgressStepModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSetupProgressStepModelCopyWith<ListenerSetupProgressStepModel> get copyWith => _$ListenerSetupProgressStepModelCopyWithImpl<ListenerSetupProgressStepModel>(this as ListenerSetupProgressStepModel, _$identity);

  /// Serializes this ListenerSetupProgressStepModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSetupProgressStepModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'ListenerSetupProgressStepModel(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class $ListenerSetupProgressStepModelCopyWith<$Res>  {
  factory $ListenerSetupProgressStepModelCopyWith(ListenerSetupProgressStepModel value, $Res Function(ListenerSetupProgressStepModel) _then) = _$ListenerSetupProgressStepModelCopyWithImpl;
@useResult
$Res call({
 String id, String status
});




}
/// @nodoc
class _$ListenerSetupProgressStepModelCopyWithImpl<$Res>
    implements $ListenerSetupProgressStepModelCopyWith<$Res> {
  _$ListenerSetupProgressStepModelCopyWithImpl(this._self, this._then);

  final ListenerSetupProgressStepModel _self;
  final $Res Function(ListenerSetupProgressStepModel) _then;

/// Create a copy of ListenerSetupProgressStepModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerSetupProgressStepModel].
extension ListenerSetupProgressStepModelPatterns on ListenerSetupProgressStepModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSetupProgressStepModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSetupProgressStepModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSetupProgressStepModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSetupProgressStepModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSetupProgressStepModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSetupProgressStepModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSetupProgressStepModel() when $default != null:
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status)  $default,) {final _that = this;
switch (_that) {
case _ListenerSetupProgressStepModel():
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSetupProgressStepModel() when $default != null:
return $default(_that.id,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerSetupProgressStepModel implements ListenerSetupProgressStepModel {
  const _ListenerSetupProgressStepModel({this.id = '', this.status = ''});
  factory _ListenerSetupProgressStepModel.fromJson(Map<String, dynamic> json) => _$ListenerSetupProgressStepModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String status;

/// Create a copy of ListenerSetupProgressStepModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSetupProgressStepModelCopyWith<_ListenerSetupProgressStepModel> get copyWith => __$ListenerSetupProgressStepModelCopyWithImpl<_ListenerSetupProgressStepModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerSetupProgressStepModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSetupProgressStepModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'ListenerSetupProgressStepModel(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ListenerSetupProgressStepModelCopyWith<$Res> implements $ListenerSetupProgressStepModelCopyWith<$Res> {
  factory _$ListenerSetupProgressStepModelCopyWith(_ListenerSetupProgressStepModel value, $Res Function(_ListenerSetupProgressStepModel) _then) = __$ListenerSetupProgressStepModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String status
});




}
/// @nodoc
class __$ListenerSetupProgressStepModelCopyWithImpl<$Res>
    implements _$ListenerSetupProgressStepModelCopyWith<$Res> {
  __$ListenerSetupProgressStepModelCopyWithImpl(this._self, this._then);

  final _ListenerSetupProgressStepModel _self;
  final $Res Function(_ListenerSetupProgressStepModel) _then;

/// Create a copy of ListenerSetupProgressStepModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,}) {
  return _then(_ListenerSetupProgressStepModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
