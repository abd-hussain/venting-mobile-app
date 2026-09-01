// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_destination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthDestination {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthDestination);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthDestination()';
}


}

/// @nodoc
class $AuthDestinationCopyWith<$Res>  {
$AuthDestinationCopyWith(AuthDestination _, $Res Function(AuthDestination) __);
}


/// Adds pattern-matching-related methods to [AuthDestination].
extension AuthDestinationPatterns on AuthDestination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthDestinationHome value)?  home,TResult Function( _AuthDestinationVentorRegistration value)?  ventorRegistration,TResult Function( _AuthDestinationListenerRegistration value)?  listenerRegistration,TResult Function( _AuthDestinationListenerUnderReview value)?  listenerUnderReview,TResult Function( _AuthDestinationListenerRejected value)?  listenerRejected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthDestinationHome() when home != null:
return home(_that);case _AuthDestinationVentorRegistration() when ventorRegistration != null:
return ventorRegistration(_that);case _AuthDestinationListenerRegistration() when listenerRegistration != null:
return listenerRegistration(_that);case _AuthDestinationListenerUnderReview() when listenerUnderReview != null:
return listenerUnderReview(_that);case _AuthDestinationListenerRejected() when listenerRejected != null:
return listenerRejected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthDestinationHome value)  home,required TResult Function( _AuthDestinationVentorRegistration value)  ventorRegistration,required TResult Function( _AuthDestinationListenerRegistration value)  listenerRegistration,required TResult Function( _AuthDestinationListenerUnderReview value)  listenerUnderReview,required TResult Function( _AuthDestinationListenerRejected value)  listenerRejected,}){
final _that = this;
switch (_that) {
case _AuthDestinationHome():
return home(_that);case _AuthDestinationVentorRegistration():
return ventorRegistration(_that);case _AuthDestinationListenerRegistration():
return listenerRegistration(_that);case _AuthDestinationListenerUnderReview():
return listenerUnderReview(_that);case _AuthDestinationListenerRejected():
return listenerRejected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthDestinationHome value)?  home,TResult? Function( _AuthDestinationVentorRegistration value)?  ventorRegistration,TResult? Function( _AuthDestinationListenerRegistration value)?  listenerRegistration,TResult? Function( _AuthDestinationListenerUnderReview value)?  listenerUnderReview,TResult? Function( _AuthDestinationListenerRejected value)?  listenerRejected,}){
final _that = this;
switch (_that) {
case _AuthDestinationHome() when home != null:
return home(_that);case _AuthDestinationVentorRegistration() when ventorRegistration != null:
return ventorRegistration(_that);case _AuthDestinationListenerRegistration() when listenerRegistration != null:
return listenerRegistration(_that);case _AuthDestinationListenerUnderReview() when listenerUnderReview != null:
return listenerUnderReview(_that);case _AuthDestinationListenerRejected() when listenerRejected != null:
return listenerRejected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthUserType userType)?  home,TResult Function( String email)?  ventorRegistration,TResult Function( String email)?  listenerRegistration,TResult Function()?  listenerUnderReview,TResult Function()?  listenerRejected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthDestinationHome() when home != null:
return home(_that.userType);case _AuthDestinationVentorRegistration() when ventorRegistration != null:
return ventorRegistration(_that.email);case _AuthDestinationListenerRegistration() when listenerRegistration != null:
return listenerRegistration(_that.email);case _AuthDestinationListenerUnderReview() when listenerUnderReview != null:
return listenerUnderReview();case _AuthDestinationListenerRejected() when listenerRejected != null:
return listenerRejected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthUserType userType)  home,required TResult Function( String email)  ventorRegistration,required TResult Function( String email)  listenerRegistration,required TResult Function()  listenerUnderReview,required TResult Function()  listenerRejected,}) {final _that = this;
switch (_that) {
case _AuthDestinationHome():
return home(_that.userType);case _AuthDestinationVentorRegistration():
return ventorRegistration(_that.email);case _AuthDestinationListenerRegistration():
return listenerRegistration(_that.email);case _AuthDestinationListenerUnderReview():
return listenerUnderReview();case _AuthDestinationListenerRejected():
return listenerRejected();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthUserType userType)?  home,TResult? Function( String email)?  ventorRegistration,TResult? Function( String email)?  listenerRegistration,TResult? Function()?  listenerUnderReview,TResult? Function()?  listenerRejected,}) {final _that = this;
switch (_that) {
case _AuthDestinationHome() when home != null:
return home(_that.userType);case _AuthDestinationVentorRegistration() when ventorRegistration != null:
return ventorRegistration(_that.email);case _AuthDestinationListenerRegistration() when listenerRegistration != null:
return listenerRegistration(_that.email);case _AuthDestinationListenerUnderReview() when listenerUnderReview != null:
return listenerUnderReview();case _AuthDestinationListenerRejected() when listenerRejected != null:
return listenerRejected();case _:
  return null;

}
}

}

/// @nodoc


class _AuthDestinationHome implements AuthDestination {
  const _AuthDestinationHome({required this.userType});
  

 final  AuthUserType userType;

/// Create a copy of AuthDestination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDestinationHomeCopyWith<_AuthDestinationHome> get copyWith => __$AuthDestinationHomeCopyWithImpl<_AuthDestinationHome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDestinationHome&&(identical(other.userType, userType) || other.userType == userType));
}


@override
int get hashCode => Object.hash(runtimeType,userType);

@override
String toString() {
  return 'AuthDestination.home(userType: $userType)';
}


}

/// @nodoc
abstract mixin class _$AuthDestinationHomeCopyWith<$Res> implements $AuthDestinationCopyWith<$Res> {
  factory _$AuthDestinationHomeCopyWith(_AuthDestinationHome value, $Res Function(_AuthDestinationHome) _then) = __$AuthDestinationHomeCopyWithImpl;
@useResult
$Res call({
 AuthUserType userType
});




}
/// @nodoc
class __$AuthDestinationHomeCopyWithImpl<$Res>
    implements _$AuthDestinationHomeCopyWith<$Res> {
  __$AuthDestinationHomeCopyWithImpl(this._self, this._then);

  final _AuthDestinationHome _self;
  final $Res Function(_AuthDestinationHome) _then;

/// Create a copy of AuthDestination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userType = null,}) {
  return _then(_AuthDestinationHome(
userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as AuthUserType,
  ));
}


}

/// @nodoc


class _AuthDestinationVentorRegistration implements AuthDestination {
  const _AuthDestinationVentorRegistration({required this.email});
  

 final  String email;

/// Create a copy of AuthDestination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDestinationVentorRegistrationCopyWith<_AuthDestinationVentorRegistration> get copyWith => __$AuthDestinationVentorRegistrationCopyWithImpl<_AuthDestinationVentorRegistration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDestinationVentorRegistration&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthDestination.ventorRegistration(email: $email)';
}


}

/// @nodoc
abstract mixin class _$AuthDestinationVentorRegistrationCopyWith<$Res> implements $AuthDestinationCopyWith<$Res> {
  factory _$AuthDestinationVentorRegistrationCopyWith(_AuthDestinationVentorRegistration value, $Res Function(_AuthDestinationVentorRegistration) _then) = __$AuthDestinationVentorRegistrationCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$AuthDestinationVentorRegistrationCopyWithImpl<$Res>
    implements _$AuthDestinationVentorRegistrationCopyWith<$Res> {
  __$AuthDestinationVentorRegistrationCopyWithImpl(this._self, this._then);

  final _AuthDestinationVentorRegistration _self;
  final $Res Function(_AuthDestinationVentorRegistration) _then;

/// Create a copy of AuthDestination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_AuthDestinationVentorRegistration(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthDestinationListenerRegistration implements AuthDestination {
  const _AuthDestinationListenerRegistration({required this.email});
  

 final  String email;

/// Create a copy of AuthDestination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDestinationListenerRegistrationCopyWith<_AuthDestinationListenerRegistration> get copyWith => __$AuthDestinationListenerRegistrationCopyWithImpl<_AuthDestinationListenerRegistration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDestinationListenerRegistration&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthDestination.listenerRegistration(email: $email)';
}


}

/// @nodoc
abstract mixin class _$AuthDestinationListenerRegistrationCopyWith<$Res> implements $AuthDestinationCopyWith<$Res> {
  factory _$AuthDestinationListenerRegistrationCopyWith(_AuthDestinationListenerRegistration value, $Res Function(_AuthDestinationListenerRegistration) _then) = __$AuthDestinationListenerRegistrationCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$AuthDestinationListenerRegistrationCopyWithImpl<$Res>
    implements _$AuthDestinationListenerRegistrationCopyWith<$Res> {
  __$AuthDestinationListenerRegistrationCopyWithImpl(this._self, this._then);

  final _AuthDestinationListenerRegistration _self;
  final $Res Function(_AuthDestinationListenerRegistration) _then;

/// Create a copy of AuthDestination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_AuthDestinationListenerRegistration(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AuthDestinationListenerUnderReview implements AuthDestination {
  const _AuthDestinationListenerUnderReview();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDestinationListenerUnderReview);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthDestination.listenerUnderReview()';
}


}




/// @nodoc


class _AuthDestinationListenerRejected implements AuthDestination {
  const _AuthDestinationListenerRejected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDestinationListenerRejected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthDestination.listenerRejected()';
}


}




// dart format on
