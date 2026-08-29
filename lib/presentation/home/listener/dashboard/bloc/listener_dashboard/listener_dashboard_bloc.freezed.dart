// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerDashboardEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerDashboardEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerDashboardEvent()';
}


}

/// @nodoc
class $ListenerDashboardEventCopyWith<$Res>  {
$ListenerDashboardEventCopyWith(ListenerDashboardEvent _, $Res Function(ListenerDashboardEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerDashboardEvent].
extension ListenerDashboardEventPatterns on ListenerDashboardEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetrySetupLoad value)?  retrySetupLoad,TResult Function( _SetupRefreshRequested value)?  setupRefreshRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetrySetupLoad() when retrySetupLoad != null:
return retrySetupLoad(_that);case _SetupRefreshRequested() when setupRefreshRequested != null:
return setupRefreshRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetrySetupLoad value)  retrySetupLoad,required TResult Function( _SetupRefreshRequested value)  setupRefreshRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetrySetupLoad():
return retrySetupLoad(_that);case _SetupRefreshRequested():
return setupRefreshRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetrySetupLoad value)?  retrySetupLoad,TResult? Function( _SetupRefreshRequested value)?  setupRefreshRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetrySetupLoad() when retrySetupLoad != null:
return retrySetupLoad(_that);case _SetupRefreshRequested() when setupRefreshRequested != null:
return setupRefreshRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retrySetupLoad,TResult Function()?  setupRefreshRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetrySetupLoad() when retrySetupLoad != null:
return retrySetupLoad();case _SetupRefreshRequested() when setupRefreshRequested != null:
return setupRefreshRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retrySetupLoad,required TResult Function()  setupRefreshRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetrySetupLoad():
return retrySetupLoad();case _SetupRefreshRequested():
return setupRefreshRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retrySetupLoad,TResult? Function()?  setupRefreshRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetrySetupLoad() when retrySetupLoad != null:
return retrySetupLoad();case _SetupRefreshRequested() when setupRefreshRequested != null:
return setupRefreshRequested();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerDashboardEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerDashboardEvent.started()';
}


}




/// @nodoc


class _RetrySetupLoad implements ListenerDashboardEvent {
  const _RetrySetupLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetrySetupLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerDashboardEvent.retrySetupLoad()';
}


}




/// @nodoc


class _SetupRefreshRequested implements ListenerDashboardEvent {
  const _SetupRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetupRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerDashboardEvent.setupRefreshRequested()';
}


}




/// @nodoc
mixin _$ListenerDashboardState {

 ListenerDashboardSetupStatus get setupStatus; ListenerDashboardSetupProgress? get setupProgress; String get setupErrorMessage; String get listenerDisplayName; ListenerDashboardReminder? get dailyReminder;
/// Create a copy of ListenerDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerDashboardStateCopyWith<ListenerDashboardState> get copyWith => _$ListenerDashboardStateCopyWithImpl<ListenerDashboardState>(this as ListenerDashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerDashboardState&&(identical(other.setupStatus, setupStatus) || other.setupStatus == setupStatus)&&(identical(other.setupProgress, setupProgress) || other.setupProgress == setupProgress)&&(identical(other.setupErrorMessage, setupErrorMessage) || other.setupErrorMessage == setupErrorMessage)&&(identical(other.listenerDisplayName, listenerDisplayName) || other.listenerDisplayName == listenerDisplayName)&&(identical(other.dailyReminder, dailyReminder) || other.dailyReminder == dailyReminder));
}


@override
int get hashCode => Object.hash(runtimeType,setupStatus,setupProgress,setupErrorMessage,listenerDisplayName,dailyReminder);

@override
String toString() {
  return 'ListenerDashboardState(setupStatus: $setupStatus, setupProgress: $setupProgress, setupErrorMessage: $setupErrorMessage, listenerDisplayName: $listenerDisplayName, dailyReminder: $dailyReminder)';
}


}

/// @nodoc
abstract mixin class $ListenerDashboardStateCopyWith<$Res>  {
  factory $ListenerDashboardStateCopyWith(ListenerDashboardState value, $Res Function(ListenerDashboardState) _then) = _$ListenerDashboardStateCopyWithImpl;
@useResult
$Res call({
 ListenerDashboardSetupStatus setupStatus, ListenerDashboardSetupProgress? setupProgress, String setupErrorMessage, String listenerDisplayName, ListenerDashboardReminder? dailyReminder
});




}
/// @nodoc
class _$ListenerDashboardStateCopyWithImpl<$Res>
    implements $ListenerDashboardStateCopyWith<$Res> {
  _$ListenerDashboardStateCopyWithImpl(this._self, this._then);

  final ListenerDashboardState _self;
  final $Res Function(ListenerDashboardState) _then;

/// Create a copy of ListenerDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? setupStatus = null,Object? setupProgress = freezed,Object? setupErrorMessage = null,Object? listenerDisplayName = null,Object? dailyReminder = freezed,}) {
  return _then(_self.copyWith(
setupStatus: null == setupStatus ? _self.setupStatus : setupStatus // ignore: cast_nullable_to_non_nullable
as ListenerDashboardSetupStatus,setupProgress: freezed == setupProgress ? _self.setupProgress : setupProgress // ignore: cast_nullable_to_non_nullable
as ListenerDashboardSetupProgress?,setupErrorMessage: null == setupErrorMessage ? _self.setupErrorMessage : setupErrorMessage // ignore: cast_nullable_to_non_nullable
as String,listenerDisplayName: null == listenerDisplayName ? _self.listenerDisplayName : listenerDisplayName // ignore: cast_nullable_to_non_nullable
as String,dailyReminder: freezed == dailyReminder ? _self.dailyReminder : dailyReminder // ignore: cast_nullable_to_non_nullable
as ListenerDashboardReminder?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerDashboardState].
extension ListenerDashboardStatePatterns on ListenerDashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerDashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerDashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerDashboardState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerDashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerDashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerDashboardSetupStatus setupStatus,  ListenerDashboardSetupProgress? setupProgress,  String setupErrorMessage,  String listenerDisplayName,  ListenerDashboardReminder? dailyReminder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerDashboardState() when $default != null:
return $default(_that.setupStatus,_that.setupProgress,_that.setupErrorMessage,_that.listenerDisplayName,_that.dailyReminder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerDashboardSetupStatus setupStatus,  ListenerDashboardSetupProgress? setupProgress,  String setupErrorMessage,  String listenerDisplayName,  ListenerDashboardReminder? dailyReminder)  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardState():
return $default(_that.setupStatus,_that.setupProgress,_that.setupErrorMessage,_that.listenerDisplayName,_that.dailyReminder);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerDashboardSetupStatus setupStatus,  ListenerDashboardSetupProgress? setupProgress,  String setupErrorMessage,  String listenerDisplayName,  ListenerDashboardReminder? dailyReminder)?  $default,) {final _that = this;
switch (_that) {
case _ListenerDashboardState() when $default != null:
return $default(_that.setupStatus,_that.setupProgress,_that.setupErrorMessage,_that.listenerDisplayName,_that.dailyReminder);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerDashboardState extends ListenerDashboardState {
  const _ListenerDashboardState({this.setupStatus = ListenerDashboardSetupStatus.initial, this.setupProgress, this.setupErrorMessage = '', this.listenerDisplayName = '', this.dailyReminder}): super._();
  

@override@JsonKey() final  ListenerDashboardSetupStatus setupStatus;
@override final  ListenerDashboardSetupProgress? setupProgress;
@override@JsonKey() final  String setupErrorMessage;
@override@JsonKey() final  String listenerDisplayName;
@override final  ListenerDashboardReminder? dailyReminder;

/// Create a copy of ListenerDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerDashboardStateCopyWith<_ListenerDashboardState> get copyWith => __$ListenerDashboardStateCopyWithImpl<_ListenerDashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerDashboardState&&(identical(other.setupStatus, setupStatus) || other.setupStatus == setupStatus)&&(identical(other.setupProgress, setupProgress) || other.setupProgress == setupProgress)&&(identical(other.setupErrorMessage, setupErrorMessage) || other.setupErrorMessage == setupErrorMessage)&&(identical(other.listenerDisplayName, listenerDisplayName) || other.listenerDisplayName == listenerDisplayName)&&(identical(other.dailyReminder, dailyReminder) || other.dailyReminder == dailyReminder));
}


@override
int get hashCode => Object.hash(runtimeType,setupStatus,setupProgress,setupErrorMessage,listenerDisplayName,dailyReminder);

@override
String toString() {
  return 'ListenerDashboardState(setupStatus: $setupStatus, setupProgress: $setupProgress, setupErrorMessage: $setupErrorMessage, listenerDisplayName: $listenerDisplayName, dailyReminder: $dailyReminder)';
}


}

/// @nodoc
abstract mixin class _$ListenerDashboardStateCopyWith<$Res> implements $ListenerDashboardStateCopyWith<$Res> {
  factory _$ListenerDashboardStateCopyWith(_ListenerDashboardState value, $Res Function(_ListenerDashboardState) _then) = __$ListenerDashboardStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerDashboardSetupStatus setupStatus, ListenerDashboardSetupProgress? setupProgress, String setupErrorMessage, String listenerDisplayName, ListenerDashboardReminder? dailyReminder
});




}
/// @nodoc
class __$ListenerDashboardStateCopyWithImpl<$Res>
    implements _$ListenerDashboardStateCopyWith<$Res> {
  __$ListenerDashboardStateCopyWithImpl(this._self, this._then);

  final _ListenerDashboardState _self;
  final $Res Function(_ListenerDashboardState) _then;

/// Create a copy of ListenerDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? setupStatus = null,Object? setupProgress = freezed,Object? setupErrorMessage = null,Object? listenerDisplayName = null,Object? dailyReminder = freezed,}) {
  return _then(_ListenerDashboardState(
setupStatus: null == setupStatus ? _self.setupStatus : setupStatus // ignore: cast_nullable_to_non_nullable
as ListenerDashboardSetupStatus,setupProgress: freezed == setupProgress ? _self.setupProgress : setupProgress // ignore: cast_nullable_to_non_nullable
as ListenerDashboardSetupProgress?,setupErrorMessage: null == setupErrorMessage ? _self.setupErrorMessage : setupErrorMessage // ignore: cast_nullable_to_non_nullable
as String,listenerDisplayName: null == listenerDisplayName ? _self.listenerDisplayName : listenerDisplayName // ignore: cast_nullable_to_non_nullable
as String,dailyReminder: freezed == dailyReminder ? _self.dailyReminder : dailyReminder // ignore: cast_nullable_to_non_nullable
as ListenerDashboardReminder?,
  ));
}


}

// dart format on
