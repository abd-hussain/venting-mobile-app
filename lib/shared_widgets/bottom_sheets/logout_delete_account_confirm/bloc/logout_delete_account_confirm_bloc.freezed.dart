// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_delete_account_confirm_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogoutDeleteAccountConfirmEvent {

 LogoutDeleteAccountConfirmKind get kind;
/// Create a copy of LogoutDeleteAccountConfirmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutDeleteAccountConfirmEventCopyWith<LogoutDeleteAccountConfirmEvent> get copyWith => _$LogoutDeleteAccountConfirmEventCopyWithImpl<LogoutDeleteAccountConfirmEvent>(this as LogoutDeleteAccountConfirmEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutDeleteAccountConfirmEvent&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'LogoutDeleteAccountConfirmEvent(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $LogoutDeleteAccountConfirmEventCopyWith<$Res>  {
  factory $LogoutDeleteAccountConfirmEventCopyWith(LogoutDeleteAccountConfirmEvent value, $Res Function(LogoutDeleteAccountConfirmEvent) _then) = _$LogoutDeleteAccountConfirmEventCopyWithImpl;
@useResult
$Res call({
 LogoutDeleteAccountConfirmKind kind
});




}
/// @nodoc
class _$LogoutDeleteAccountConfirmEventCopyWithImpl<$Res>
    implements $LogoutDeleteAccountConfirmEventCopyWith<$Res> {
  _$LogoutDeleteAccountConfirmEventCopyWithImpl(this._self, this._then);

  final LogoutDeleteAccountConfirmEvent _self;
  final $Res Function(LogoutDeleteAccountConfirmEvent) _then;

/// Create a copy of LogoutDeleteAccountConfirmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as LogoutDeleteAccountConfirmKind,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutDeleteAccountConfirmEvent].
extension LogoutDeleteAccountConfirmEventPatterns on LogoutDeleteAccountConfirmEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Confirm value)?  confirm,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Confirm() when confirm != null:
return confirm(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Confirm value)  confirm,}){
final _that = this;
switch (_that) {
case _Confirm():
return confirm(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Confirm value)?  confirm,}){
final _that = this;
switch (_that) {
case _Confirm() when confirm != null:
return confirm(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LogoutDeleteAccountConfirmKind kind)?  confirm,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Confirm() when confirm != null:
return confirm(_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LogoutDeleteAccountConfirmKind kind)  confirm,}) {final _that = this;
switch (_that) {
case _Confirm():
return confirm(_that.kind);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LogoutDeleteAccountConfirmKind kind)?  confirm,}) {final _that = this;
switch (_that) {
case _Confirm() when confirm != null:
return confirm(_that.kind);case _:
  return null;

}
}

}

/// @nodoc


class _Confirm implements LogoutDeleteAccountConfirmEvent {
  const _Confirm({required this.kind});
  

@override final  LogoutDeleteAccountConfirmKind kind;

/// Create a copy of LogoutDeleteAccountConfirmEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmCopyWith<_Confirm> get copyWith => __$ConfirmCopyWithImpl<_Confirm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Confirm&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'LogoutDeleteAccountConfirmEvent.confirm(kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$ConfirmCopyWith<$Res> implements $LogoutDeleteAccountConfirmEventCopyWith<$Res> {
  factory _$ConfirmCopyWith(_Confirm value, $Res Function(_Confirm) _then) = __$ConfirmCopyWithImpl;
@override @useResult
$Res call({
 LogoutDeleteAccountConfirmKind kind
});




}
/// @nodoc
class __$ConfirmCopyWithImpl<$Res>
    implements _$ConfirmCopyWith<$Res> {
  __$ConfirmCopyWithImpl(this._self, this._then);

  final _Confirm _self;
  final $Res Function(_Confirm) _then;

/// Create a copy of LogoutDeleteAccountConfirmEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,}) {
  return _then(_Confirm(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as LogoutDeleteAccountConfirmKind,
  ));
}


}

/// @nodoc
mixin _$LogoutDeleteAccountConfirmState {

 LogoutDeleteAccountConfirmStatus get status; String get errorMessage;
/// Create a copy of LogoutDeleteAccountConfirmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutDeleteAccountConfirmStateCopyWith<LogoutDeleteAccountConfirmState> get copyWith => _$LogoutDeleteAccountConfirmStateCopyWithImpl<LogoutDeleteAccountConfirmState>(this as LogoutDeleteAccountConfirmState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutDeleteAccountConfirmState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'LogoutDeleteAccountConfirmState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LogoutDeleteAccountConfirmStateCopyWith<$Res>  {
  factory $LogoutDeleteAccountConfirmStateCopyWith(LogoutDeleteAccountConfirmState value, $Res Function(LogoutDeleteAccountConfirmState) _then) = _$LogoutDeleteAccountConfirmStateCopyWithImpl;
@useResult
$Res call({
 LogoutDeleteAccountConfirmStatus status, String errorMessage
});




}
/// @nodoc
class _$LogoutDeleteAccountConfirmStateCopyWithImpl<$Res>
    implements $LogoutDeleteAccountConfirmStateCopyWith<$Res> {
  _$LogoutDeleteAccountConfirmStateCopyWithImpl(this._self, this._then);

  final LogoutDeleteAccountConfirmState _self;
  final $Res Function(LogoutDeleteAccountConfirmState) _then;

/// Create a copy of LogoutDeleteAccountConfirmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LogoutDeleteAccountConfirmStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutDeleteAccountConfirmState].
extension LogoutDeleteAccountConfirmStatePatterns on LogoutDeleteAccountConfirmState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutDeleteAccountConfirmState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutDeleteAccountConfirmState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutDeleteAccountConfirmState value)  $default,){
final _that = this;
switch (_that) {
case _LogoutDeleteAccountConfirmState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutDeleteAccountConfirmState value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutDeleteAccountConfirmState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LogoutDeleteAccountConfirmStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutDeleteAccountConfirmState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LogoutDeleteAccountConfirmStatus status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LogoutDeleteAccountConfirmState():
return $default(_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LogoutDeleteAccountConfirmStatus status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LogoutDeleteAccountConfirmState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LogoutDeleteAccountConfirmState extends LogoutDeleteAccountConfirmState {
  const _LogoutDeleteAccountConfirmState({this.status = LogoutDeleteAccountConfirmStatus.idle, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  LogoutDeleteAccountConfirmStatus status;
@override@JsonKey() final  String errorMessage;

/// Create a copy of LogoutDeleteAccountConfirmState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutDeleteAccountConfirmStateCopyWith<_LogoutDeleteAccountConfirmState> get copyWith => __$LogoutDeleteAccountConfirmStateCopyWithImpl<_LogoutDeleteAccountConfirmState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutDeleteAccountConfirmState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'LogoutDeleteAccountConfirmState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LogoutDeleteAccountConfirmStateCopyWith<$Res> implements $LogoutDeleteAccountConfirmStateCopyWith<$Res> {
  factory _$LogoutDeleteAccountConfirmStateCopyWith(_LogoutDeleteAccountConfirmState value, $Res Function(_LogoutDeleteAccountConfirmState) _then) = __$LogoutDeleteAccountConfirmStateCopyWithImpl;
@override @useResult
$Res call({
 LogoutDeleteAccountConfirmStatus status, String errorMessage
});




}
/// @nodoc
class __$LogoutDeleteAccountConfirmStateCopyWithImpl<$Res>
    implements _$LogoutDeleteAccountConfirmStateCopyWith<$Res> {
  __$LogoutDeleteAccountConfirmStateCopyWithImpl(this._self, this._then);

  final _LogoutDeleteAccountConfirmState _self;
  final $Res Function(_LogoutDeleteAccountConfirmState) _then;

/// Create a copy of LogoutDeleteAccountConfirmState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = null,}) {
  return _then(_LogoutDeleteAccountConfirmState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LogoutDeleteAccountConfirmStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
