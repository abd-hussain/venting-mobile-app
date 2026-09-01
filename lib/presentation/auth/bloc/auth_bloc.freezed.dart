// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SignInWithGoogle value)?  signInWithGoogle,TResult Function( _SignInWithApple value)?  signInWithApple,TResult Function( _ClearError value)?  clearError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle(_that);case _SignInWithApple() when signInWithApple != null:
return signInWithApple(_that);case _ClearError() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SignInWithGoogle value)  signInWithGoogle,required TResult Function( _SignInWithApple value)  signInWithApple,required TResult Function( _ClearError value)  clearError,}){
final _that = this;
switch (_that) {
case _SignInWithGoogle():
return signInWithGoogle(_that);case _SignInWithApple():
return signInWithApple(_that);case _ClearError():
return clearError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SignInWithGoogle value)?  signInWithGoogle,TResult? Function( _SignInWithApple value)?  signInWithApple,TResult? Function( _ClearError value)?  clearError,}){
final _that = this;
switch (_that) {
case _SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle(_that);case _SignInWithApple() when signInWithApple != null:
return signInWithApple(_that);case _ClearError() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  signInWithGoogle,TResult Function()?  signInWithApple,TResult Function()?  clearError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle();case _SignInWithApple() when signInWithApple != null:
return signInWithApple();case _ClearError() when clearError != null:
return clearError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  signInWithGoogle,required TResult Function()  signInWithApple,required TResult Function()  clearError,}) {final _that = this;
switch (_that) {
case _SignInWithGoogle():
return signInWithGoogle();case _SignInWithApple():
return signInWithApple();case _ClearError():
return clearError();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  signInWithGoogle,TResult? Function()?  signInWithApple,TResult? Function()?  clearError,}) {final _that = this;
switch (_that) {
case _SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle();case _SignInWithApple() when signInWithApple != null:
return signInWithApple();case _ClearError() when clearError != null:
return clearError();case _:
  return null;

}
}

}

/// @nodoc


class _SignInWithGoogle implements AuthEvent {
  const _SignInWithGoogle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInWithGoogle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInWithGoogle()';
}


}




/// @nodoc


class _SignInWithApple implements AuthEvent {
  const _SignInWithApple();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInWithApple);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInWithApple()';
}


}




/// @nodoc


class _ClearError implements AuthEvent {
  const _ClearError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.clearError()';
}


}




/// @nodoc
mixin _$AuthState {

 bool get isLoadingGoogle; bool get isLoadingApple; String get errorMessage; AuthDestination? get destination;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.isLoadingGoogle, isLoadingGoogle) || other.isLoadingGoogle == isLoadingGoogle)&&(identical(other.isLoadingApple, isLoadingApple) || other.isLoadingApple == isLoadingApple)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.destination, destination) || other.destination == destination));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingGoogle,isLoadingApple,errorMessage,destination);

@override
String toString() {
  return 'AuthState(isLoadingGoogle: $isLoadingGoogle, isLoadingApple: $isLoadingApple, errorMessage: $errorMessage, destination: $destination)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 bool isLoadingGoogle, bool isLoadingApple, String errorMessage, AuthDestination? destination
});


$AuthDestinationCopyWith<$Res>? get destination;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoadingGoogle = null,Object? isLoadingApple = null,Object? errorMessage = null,Object? destination = freezed,}) {
  return _then(_self.copyWith(
isLoadingGoogle: null == isLoadingGoogle ? _self.isLoadingGoogle : isLoadingGoogle // ignore: cast_nullable_to_non_nullable
as bool,isLoadingApple: null == isLoadingApple ? _self.isLoadingApple : isLoadingApple // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as AuthDestination?,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthDestinationCopyWith<$Res>? get destination {
    if (_self.destination == null) {
    return null;
  }

  return $AuthDestinationCopyWith<$Res>(_self.destination!, (value) {
    return _then(_self.copyWith(destination: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoadingGoogle,  bool isLoadingApple,  String errorMessage,  AuthDestination? destination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.isLoadingGoogle,_that.isLoadingApple,_that.errorMessage,_that.destination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoadingGoogle,  bool isLoadingApple,  String errorMessage,  AuthDestination? destination)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.isLoadingGoogle,_that.isLoadingApple,_that.errorMessage,_that.destination);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoadingGoogle,  bool isLoadingApple,  String errorMessage,  AuthDestination? destination)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.isLoadingGoogle,_that.isLoadingApple,_that.errorMessage,_that.destination);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.isLoadingGoogle = false, this.isLoadingApple = false, this.errorMessage = '', this.destination});
  

@override@JsonKey() final  bool isLoadingGoogle;
@override@JsonKey() final  bool isLoadingApple;
@override@JsonKey() final  String errorMessage;
@override final  AuthDestination? destination;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.isLoadingGoogle, isLoadingGoogle) || other.isLoadingGoogle == isLoadingGoogle)&&(identical(other.isLoadingApple, isLoadingApple) || other.isLoadingApple == isLoadingApple)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.destination, destination) || other.destination == destination));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingGoogle,isLoadingApple,errorMessage,destination);

@override
String toString() {
  return 'AuthState(isLoadingGoogle: $isLoadingGoogle, isLoadingApple: $isLoadingApple, errorMessage: $errorMessage, destination: $destination)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoadingGoogle, bool isLoadingApple, String errorMessage, AuthDestination? destination
});


@override $AuthDestinationCopyWith<$Res>? get destination;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoadingGoogle = null,Object? isLoadingApple = null,Object? errorMessage = null,Object? destination = freezed,}) {
  return _then(_AuthState(
isLoadingGoogle: null == isLoadingGoogle ? _self.isLoadingGoogle : isLoadingGoogle // ignore: cast_nullable_to_non_nullable
as bool,isLoadingApple: null == isLoadingApple ? _self.isLoadingApple : isLoadingApple // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as AuthDestination?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthDestinationCopyWith<$Res>? get destination {
    if (_self.destination == null) {
    return null;
  }

  return $AuthDestinationCopyWith<$Res>(_self.destination!, (value) {
    return _then(_self.copyWith(destination: value));
  });
}
}

// dart format on
