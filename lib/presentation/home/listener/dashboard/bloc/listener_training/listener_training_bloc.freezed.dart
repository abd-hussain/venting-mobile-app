// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_training_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerTrainingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerTrainingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerTrainingEvent()';
}


}

/// @nodoc
class $ListenerTrainingEventCopyWith<$Res>  {
$ListenerTrainingEventCopyWith(ListenerTrainingEvent _, $Res Function(ListenerTrainingEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerTrainingEvent].
extension ListenerTrainingEventPatterns on ListenerTrainingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _ModuleCompleted value)?  moduleCompleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _ModuleCompleted() when moduleCompleted != null:
return moduleCompleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _ModuleCompleted value)  moduleCompleted,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _ModuleCompleted():
return moduleCompleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _ModuleCompleted value)?  moduleCompleted,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _ModuleCompleted() when moduleCompleted != null:
return moduleCompleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function( String moduleId)?  moduleCompleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _ModuleCompleted() when moduleCompleted != null:
return moduleCompleted(_that.moduleId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function( String moduleId)  moduleCompleted,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _ModuleCompleted():
return moduleCompleted(_that.moduleId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function( String moduleId)?  moduleCompleted,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _ModuleCompleted() when moduleCompleted != null:
return moduleCompleted(_that.moduleId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerTrainingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerTrainingEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements ListenerTrainingEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerTrainingEvent.retryLoad()';
}


}




/// @nodoc


class _ModuleCompleted implements ListenerTrainingEvent {
  const _ModuleCompleted({required this.moduleId});
  

 final  String moduleId;

/// Create a copy of ListenerTrainingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModuleCompletedCopyWith<_ModuleCompleted> get copyWith => __$ModuleCompletedCopyWithImpl<_ModuleCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModuleCompleted&&(identical(other.moduleId, moduleId) || other.moduleId == moduleId));
}


@override
int get hashCode => Object.hash(runtimeType,moduleId);

@override
String toString() {
  return 'ListenerTrainingEvent.moduleCompleted(moduleId: $moduleId)';
}


}

/// @nodoc
abstract mixin class _$ModuleCompletedCopyWith<$Res> implements $ListenerTrainingEventCopyWith<$Res> {
  factory _$ModuleCompletedCopyWith(_ModuleCompleted value, $Res Function(_ModuleCompleted) _then) = __$ModuleCompletedCopyWithImpl;
@useResult
$Res call({
 String moduleId
});




}
/// @nodoc
class __$ModuleCompletedCopyWithImpl<$Res>
    implements _$ModuleCompletedCopyWith<$Res> {
  __$ModuleCompletedCopyWithImpl(this._self, this._then);

  final _ModuleCompleted _self;
  final $Res Function(_ModuleCompleted) _then;

/// Create a copy of ListenerTrainingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? moduleId = null,}) {
  return _then(_ModuleCompleted(
moduleId: null == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ListenerTrainingState {

 ListenerTrainingLoadStatus get loadStatus; List<ListenerTrainingModule> get modules; bool get allCompleted; bool get isCompletingModule; String get completingModuleId; String get errorMessage;
/// Create a copy of ListenerTrainingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerTrainingStateCopyWith<ListenerTrainingState> get copyWith => _$ListenerTrainingStateCopyWithImpl<ListenerTrainingState>(this as ListenerTrainingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerTrainingState&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&const DeepCollectionEquality().equals(other.modules, modules)&&(identical(other.allCompleted, allCompleted) || other.allCompleted == allCompleted)&&(identical(other.isCompletingModule, isCompletingModule) || other.isCompletingModule == isCompletingModule)&&(identical(other.completingModuleId, completingModuleId) || other.completingModuleId == completingModuleId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loadStatus,const DeepCollectionEquality().hash(modules),allCompleted,isCompletingModule,completingModuleId,errorMessage);

@override
String toString() {
  return 'ListenerTrainingState(loadStatus: $loadStatus, modules: $modules, allCompleted: $allCompleted, isCompletingModule: $isCompletingModule, completingModuleId: $completingModuleId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerTrainingStateCopyWith<$Res>  {
  factory $ListenerTrainingStateCopyWith(ListenerTrainingState value, $Res Function(ListenerTrainingState) _then) = _$ListenerTrainingStateCopyWithImpl;
@useResult
$Res call({
 ListenerTrainingLoadStatus loadStatus, List<ListenerTrainingModule> modules, bool allCompleted, bool isCompletingModule, String completingModuleId, String errorMessage
});




}
/// @nodoc
class _$ListenerTrainingStateCopyWithImpl<$Res>
    implements $ListenerTrainingStateCopyWith<$Res> {
  _$ListenerTrainingStateCopyWithImpl(this._self, this._then);

  final ListenerTrainingState _self;
  final $Res Function(ListenerTrainingState) _then;

/// Create a copy of ListenerTrainingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadStatus = null,Object? modules = null,Object? allCompleted = null,Object? isCompletingModule = null,Object? completingModuleId = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as ListenerTrainingLoadStatus,modules: null == modules ? _self.modules : modules // ignore: cast_nullable_to_non_nullable
as List<ListenerTrainingModule>,allCompleted: null == allCompleted ? _self.allCompleted : allCompleted // ignore: cast_nullable_to_non_nullable
as bool,isCompletingModule: null == isCompletingModule ? _self.isCompletingModule : isCompletingModule // ignore: cast_nullable_to_non_nullable
as bool,completingModuleId: null == completingModuleId ? _self.completingModuleId : completingModuleId // ignore: cast_nullable_to_non_nullable
as String,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerTrainingState].
extension ListenerTrainingStatePatterns on ListenerTrainingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerTrainingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerTrainingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerTrainingState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerTrainingState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerTrainingState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerTrainingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerTrainingLoadStatus loadStatus,  List<ListenerTrainingModule> modules,  bool allCompleted,  bool isCompletingModule,  String completingModuleId,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerTrainingState() when $default != null:
return $default(_that.loadStatus,_that.modules,_that.allCompleted,_that.isCompletingModule,_that.completingModuleId,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerTrainingLoadStatus loadStatus,  List<ListenerTrainingModule> modules,  bool allCompleted,  bool isCompletingModule,  String completingModuleId,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerTrainingState():
return $default(_that.loadStatus,_that.modules,_that.allCompleted,_that.isCompletingModule,_that.completingModuleId,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerTrainingLoadStatus loadStatus,  List<ListenerTrainingModule> modules,  bool allCompleted,  bool isCompletingModule,  String completingModuleId,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerTrainingState() when $default != null:
return $default(_that.loadStatus,_that.modules,_that.allCompleted,_that.isCompletingModule,_that.completingModuleId,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerTrainingState extends ListenerTrainingState {
  const _ListenerTrainingState({this.loadStatus = ListenerTrainingLoadStatus.initial, final  List<ListenerTrainingModule> modules = const <ListenerTrainingModule>[], this.allCompleted = false, this.isCompletingModule = false, this.completingModuleId = '', this.errorMessage = ''}): _modules = modules,super._();
  

@override@JsonKey() final  ListenerTrainingLoadStatus loadStatus;
 final  List<ListenerTrainingModule> _modules;
@override@JsonKey() List<ListenerTrainingModule> get modules {
  if (_modules is EqualUnmodifiableListView) return _modules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modules);
}

@override@JsonKey() final  bool allCompleted;
@override@JsonKey() final  bool isCompletingModule;
@override@JsonKey() final  String completingModuleId;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerTrainingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerTrainingStateCopyWith<_ListenerTrainingState> get copyWith => __$ListenerTrainingStateCopyWithImpl<_ListenerTrainingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerTrainingState&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&const DeepCollectionEquality().equals(other._modules, _modules)&&(identical(other.allCompleted, allCompleted) || other.allCompleted == allCompleted)&&(identical(other.isCompletingModule, isCompletingModule) || other.isCompletingModule == isCompletingModule)&&(identical(other.completingModuleId, completingModuleId) || other.completingModuleId == completingModuleId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loadStatus,const DeepCollectionEquality().hash(_modules),allCompleted,isCompletingModule,completingModuleId,errorMessage);

@override
String toString() {
  return 'ListenerTrainingState(loadStatus: $loadStatus, modules: $modules, allCompleted: $allCompleted, isCompletingModule: $isCompletingModule, completingModuleId: $completingModuleId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerTrainingStateCopyWith<$Res> implements $ListenerTrainingStateCopyWith<$Res> {
  factory _$ListenerTrainingStateCopyWith(_ListenerTrainingState value, $Res Function(_ListenerTrainingState) _then) = __$ListenerTrainingStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerTrainingLoadStatus loadStatus, List<ListenerTrainingModule> modules, bool allCompleted, bool isCompletingModule, String completingModuleId, String errorMessage
});




}
/// @nodoc
class __$ListenerTrainingStateCopyWithImpl<$Res>
    implements _$ListenerTrainingStateCopyWith<$Res> {
  __$ListenerTrainingStateCopyWithImpl(this._self, this._then);

  final _ListenerTrainingState _self;
  final $Res Function(_ListenerTrainingState) _then;

/// Create a copy of ListenerTrainingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadStatus = null,Object? modules = null,Object? allCompleted = null,Object? isCompletingModule = null,Object? completingModuleId = null,Object? errorMessage = null,}) {
  return _then(_ListenerTrainingState(
loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as ListenerTrainingLoadStatus,modules: null == modules ? _self._modules : modules // ignore: cast_nullable_to_non_nullable
as List<ListenerTrainingModule>,allCompleted: null == allCompleted ? _self.allCompleted : allCompleted // ignore: cast_nullable_to_non_nullable
as bool,isCompletingModule: null == isCompletingModule ? _self.isCompletingModule : isCompletingModule // ignore: cast_nullable_to_non_nullable
as bool,completingModuleId: null == completingModuleId ? _self.completingModuleId : completingModuleId // ignore: cast_nullable_to_non_nullable
as String,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
