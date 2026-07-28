// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEvent()';
}


}

/// @nodoc
class $SplashEventCopyWith<$Res>  {
$SplashEventCopyWith(SplashEvent _, $Res Function(SplashEvent) __);
}


/// Adds pattern-matching-related methods to [SplashEvent].
extension SplashEventPatterns on SplashEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CheckAuthenticationStatus value)?  checkAuthenticationStatus,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckAuthenticationStatus() when checkAuthenticationStatus != null:
return checkAuthenticationStatus(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CheckAuthenticationStatus value)  checkAuthenticationStatus,}){
final _that = this;
switch (_that) {
case _CheckAuthenticationStatus():
return checkAuthenticationStatus(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CheckAuthenticationStatus value)?  checkAuthenticationStatus,}){
final _that = this;
switch (_that) {
case _CheckAuthenticationStatus() when checkAuthenticationStatus != null:
return checkAuthenticationStatus(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuthenticationStatus,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckAuthenticationStatus() when checkAuthenticationStatus != null:
return checkAuthenticationStatus();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuthenticationStatus,}) {final _that = this;
switch (_that) {
case _CheckAuthenticationStatus():
return checkAuthenticationStatus();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuthenticationStatus,}) {final _that = this;
switch (_that) {
case _CheckAuthenticationStatus() when checkAuthenticationStatus != null:
return checkAuthenticationStatus();case _:
  return null;

}
}

}

/// @nodoc


class _CheckAuthenticationStatus implements SplashEvent {
  const _CheckAuthenticationStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckAuthenticationStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEvent.checkAuthenticationStatus()';
}


}




/// @nodoc
mixin _$SplashState {

 SplashProcessState get processState; String get errorMessage;
/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashStateCopyWith<SplashState> get copyWith => _$SplashStateCopyWithImpl<SplashState>(this as SplashState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState&&(identical(other.processState, processState) || other.processState == processState)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,processState,errorMessage);

@override
String toString() {
  return 'SplashState(processState: $processState, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SplashStateCopyWith<$Res>  {
  factory $SplashStateCopyWith(SplashState value, $Res Function(SplashState) _then) = _$SplashStateCopyWithImpl;
@useResult
$Res call({
 SplashProcessState processState, String errorMessage
});


$SplashProcessStateCopyWith<$Res> get processState;

}
/// @nodoc
class _$SplashStateCopyWithImpl<$Res>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._self, this._then);

  final SplashState _self;
  final $Res Function(SplashState) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? processState = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
processState: null == processState ? _self.processState : processState // ignore: cast_nullable_to_non_nullable
as SplashProcessState,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashProcessStateCopyWith<$Res> get processState {
  
  return $SplashProcessStateCopyWith<$Res>(_self.processState, (value) {
    return _then(_self.copyWith(processState: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashState value)  $default,){
final _that = this;
switch (_that) {
case _SplashState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashState value)?  $default,){
final _that = this;
switch (_that) {
case _SplashState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SplashProcessState processState,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashState() when $default != null:
return $default(_that.processState,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SplashProcessState processState,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SplashState():
return $default(_that.processState,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SplashProcessState processState,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SplashState() when $default != null:
return $default(_that.processState,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SplashState implements SplashState {
  const _SplashState({this.processState = const SplashProcessState.idle(), this.errorMessage = ""});
  

@override@JsonKey() final  SplashProcessState processState;
@override@JsonKey() final  String errorMessage;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashStateCopyWith<_SplashState> get copyWith => __$SplashStateCopyWithImpl<_SplashState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashState&&(identical(other.processState, processState) || other.processState == processState)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,processState,errorMessage);

@override
String toString() {
  return 'SplashState(processState: $processState, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SplashStateCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$SplashStateCopyWith(_SplashState value, $Res Function(_SplashState) _then) = __$SplashStateCopyWithImpl;
@override @useResult
$Res call({
 SplashProcessState processState, String errorMessage
});


@override $SplashProcessStateCopyWith<$Res> get processState;

}
/// @nodoc
class __$SplashStateCopyWithImpl<$Res>
    implements _$SplashStateCopyWith<$Res> {
  __$SplashStateCopyWithImpl(this._self, this._then);

  final _SplashState _self;
  final $Res Function(_SplashState) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? processState = null,Object? errorMessage = null,}) {
  return _then(_SplashState(
processState: null == processState ? _self.processState : processState // ignore: cast_nullable_to_non_nullable
as SplashProcessState,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashProcessStateCopyWith<$Res> get processState {
  
  return $SplashProcessStateCopyWith<$Res>(_self.processState, (value) {
    return _then(_self.copyWith(processState: value));
  });
}
}

/// @nodoc
mixin _$SplashProcessState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashProcessState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashProcessState()';
}


}

/// @nodoc
class $SplashProcessStateCopyWith<$Res>  {
$SplashProcessStateCopyWith(SplashProcessState _, $Res Function(SplashProcessState) __);
}


/// Adds pattern-matching-related methods to [SplashProcessState].
extension SplashProcessStatePatterns on SplashProcessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SplashProcessIdle value)?  idle,TResult Function( SplashProcessNeedOnboarding value)?  needOnboarding,TResult Function( SplashProcessAutherizedForApp value)?  autherizedForApp,TResult Function( SplashProcessNeedToLogIn value)?  needToLogIn,TResult Function( SplashProcessNeedToRegister value)?  needToRegister,TResult Function( SplashProcessError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SplashProcessIdle() when idle != null:
return idle(_that);case SplashProcessNeedOnboarding() when needOnboarding != null:
return needOnboarding(_that);case SplashProcessAutherizedForApp() when autherizedForApp != null:
return autherizedForApp(_that);case SplashProcessNeedToLogIn() when needToLogIn != null:
return needToLogIn(_that);case SplashProcessNeedToRegister() when needToRegister != null:
return needToRegister(_that);case SplashProcessError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SplashProcessIdle value)  idle,required TResult Function( SplashProcessNeedOnboarding value)  needOnboarding,required TResult Function( SplashProcessAutherizedForApp value)  autherizedForApp,required TResult Function( SplashProcessNeedToLogIn value)  needToLogIn,required TResult Function( SplashProcessNeedToRegister value)  needToRegister,required TResult Function( SplashProcessError value)  error,}){
final _that = this;
switch (_that) {
case SplashProcessIdle():
return idle(_that);case SplashProcessNeedOnboarding():
return needOnboarding(_that);case SplashProcessAutherizedForApp():
return autherizedForApp(_that);case SplashProcessNeedToLogIn():
return needToLogIn(_that);case SplashProcessNeedToRegister():
return needToRegister(_that);case SplashProcessError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SplashProcessIdle value)?  idle,TResult? Function( SplashProcessNeedOnboarding value)?  needOnboarding,TResult? Function( SplashProcessAutherizedForApp value)?  autherizedForApp,TResult? Function( SplashProcessNeedToLogIn value)?  needToLogIn,TResult? Function( SplashProcessNeedToRegister value)?  needToRegister,TResult? Function( SplashProcessError value)?  error,}){
final _that = this;
switch (_that) {
case SplashProcessIdle() when idle != null:
return idle(_that);case SplashProcessNeedOnboarding() when needOnboarding != null:
return needOnboarding(_that);case SplashProcessAutherizedForApp() when autherizedForApp != null:
return autherizedForApp(_that);case SplashProcessNeedToLogIn() when needToLogIn != null:
return needToLogIn(_that);case SplashProcessNeedToRegister() when needToRegister != null:
return needToRegister(_that);case SplashProcessError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  needOnboarding,TResult Function()?  autherizedForApp,TResult Function()?  needToLogIn,TResult Function()?  needToRegister,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SplashProcessIdle() when idle != null:
return idle();case SplashProcessNeedOnboarding() when needOnboarding != null:
return needOnboarding();case SplashProcessAutherizedForApp() when autherizedForApp != null:
return autherizedForApp();case SplashProcessNeedToLogIn() when needToLogIn != null:
return needToLogIn();case SplashProcessNeedToRegister() when needToRegister != null:
return needToRegister();case SplashProcessError() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  needOnboarding,required TResult Function()  autherizedForApp,required TResult Function()  needToLogIn,required TResult Function()  needToRegister,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case SplashProcessIdle():
return idle();case SplashProcessNeedOnboarding():
return needOnboarding();case SplashProcessAutherizedForApp():
return autherizedForApp();case SplashProcessNeedToLogIn():
return needToLogIn();case SplashProcessNeedToRegister():
return needToRegister();case SplashProcessError():
return error();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  needOnboarding,TResult? Function()?  autherizedForApp,TResult? Function()?  needToLogIn,TResult? Function()?  needToRegister,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case SplashProcessIdle() when idle != null:
return idle();case SplashProcessNeedOnboarding() when needOnboarding != null:
return needOnboarding();case SplashProcessAutherizedForApp() when autherizedForApp != null:
return autherizedForApp();case SplashProcessNeedToLogIn() when needToLogIn != null:
return needToLogIn();case SplashProcessNeedToRegister() when needToRegister != null:
return needToRegister();case SplashProcessError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class SplashProcessIdle implements SplashProcessState {
  const SplashProcessIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashProcessIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashProcessState.idle()';
}


}




/// @nodoc


class SplashProcessNeedOnboarding implements SplashProcessState {
  const SplashProcessNeedOnboarding();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashProcessNeedOnboarding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashProcessState.needOnboarding()';
}


}




/// @nodoc


class SplashProcessAutherizedForApp implements SplashProcessState {
  const SplashProcessAutherizedForApp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashProcessAutherizedForApp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashProcessState.autherizedForApp()';
}


}




/// @nodoc


class SplashProcessNeedToLogIn implements SplashProcessState {
  const SplashProcessNeedToLogIn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashProcessNeedToLogIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashProcessState.needToLogIn()';
}


}




/// @nodoc


class SplashProcessNeedToRegister implements SplashProcessState {
  const SplashProcessNeedToRegister();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashProcessNeedToRegister);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashProcessState.needToRegister()';
}


}




/// @nodoc


class SplashProcessError implements SplashProcessState {
  const SplashProcessError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashProcessError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashProcessState.error()';
}


}




// dart format on
