// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmailRegistrationEvent {

 String get email;
/// Create a copy of EmailRegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailRegistrationEventCopyWith<EmailRegistrationEvent> get copyWith => _$EmailRegistrationEventCopyWithImpl<EmailRegistrationEvent>(this as EmailRegistrationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailRegistrationEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'EmailRegistrationEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $EmailRegistrationEventCopyWith<$Res>  {
  factory $EmailRegistrationEventCopyWith(EmailRegistrationEvent value, $Res Function(EmailRegistrationEvent) _then) = _$EmailRegistrationEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$EmailRegistrationEventCopyWithImpl<$Res>
    implements $EmailRegistrationEventCopyWith<$Res> {
  _$EmailRegistrationEventCopyWithImpl(this._self, this._then);

  final EmailRegistrationEvent _self;
  final $Res Function(EmailRegistrationEvent) _then;

/// Create a copy of EmailRegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailRegistrationEvent].
extension EmailRegistrationEventPatterns on EmailRegistrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EmailChanged value)?  emailChanged,TResult Function( _CheckEmail value)?  checkEmail,TResult Function( _Submit value)?  submit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that);case _CheckEmail() when checkEmail != null:
return checkEmail(_that);case _Submit() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EmailChanged value)  emailChanged,required TResult Function( _CheckEmail value)  checkEmail,required TResult Function( _Submit value)  submit,}){
final _that = this;
switch (_that) {
case _EmailChanged():
return emailChanged(_that);case _CheckEmail():
return checkEmail(_that);case _Submit():
return submit(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EmailChanged value)?  emailChanged,TResult? Function( _CheckEmail value)?  checkEmail,TResult? Function( _Submit value)?  submit,}){
final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that);case _CheckEmail() when checkEmail != null:
return checkEmail(_that);case _Submit() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  emailChanged,TResult Function( String email)?  checkEmail,TResult Function( String email,  String password)?  submit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _CheckEmail() when checkEmail != null:
return checkEmail(_that.email);case _Submit() when submit != null:
return submit(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  emailChanged,required TResult Function( String email)  checkEmail,required TResult Function( String email,  String password)  submit,}) {final _that = this;
switch (_that) {
case _EmailChanged():
return emailChanged(_that.email);case _CheckEmail():
return checkEmail(_that.email);case _Submit():
return submit(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  emailChanged,TResult? Function( String email)?  checkEmail,TResult? Function( String email,  String password)?  submit,}) {final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _CheckEmail() when checkEmail != null:
return checkEmail(_that.email);case _Submit() when submit != null:
return submit(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _EmailChanged implements EmailRegistrationEvent {
  const _EmailChanged({required this.email});
  

@override final  String email;

/// Create a copy of EmailRegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailChangedCopyWith<_EmailChanged> get copyWith => __$EmailChangedCopyWithImpl<_EmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'EmailRegistrationEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailChangedCopyWith<$Res> implements $EmailRegistrationEventCopyWith<$Res> {
  factory _$EmailChangedCopyWith(_EmailChanged value, $Res Function(_EmailChanged) _then) = __$EmailChangedCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$EmailChangedCopyWithImpl<$Res>
    implements _$EmailChangedCopyWith<$Res> {
  __$EmailChangedCopyWithImpl(this._self, this._then);

  final _EmailChanged _self;
  final $Res Function(_EmailChanged) _then;

/// Create a copy of EmailRegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EmailChanged(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CheckEmail implements EmailRegistrationEvent {
  const _CheckEmail({required this.email});
  

@override final  String email;

/// Create a copy of EmailRegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckEmailCopyWith<_CheckEmail> get copyWith => __$CheckEmailCopyWithImpl<_CheckEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckEmail&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'EmailRegistrationEvent.checkEmail(email: $email)';
}


}

/// @nodoc
abstract mixin class _$CheckEmailCopyWith<$Res> implements $EmailRegistrationEventCopyWith<$Res> {
  factory _$CheckEmailCopyWith(_CheckEmail value, $Res Function(_CheckEmail) _then) = __$CheckEmailCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$CheckEmailCopyWithImpl<$Res>
    implements _$CheckEmailCopyWith<$Res> {
  __$CheckEmailCopyWithImpl(this._self, this._then);

  final _CheckEmail _self;
  final $Res Function(_CheckEmail) _then;

/// Create a copy of EmailRegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_CheckEmail(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Submit implements EmailRegistrationEvent {
  const _Submit({required this.email, required this.password});
  

@override final  String email;
 final  String password;

/// Create a copy of EmailRegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitCopyWith<_Submit> get copyWith => __$SubmitCopyWithImpl<_Submit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submit&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'EmailRegistrationEvent.submit(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SubmitCopyWith<$Res> implements $EmailRegistrationEventCopyWith<$Res> {
  factory _$SubmitCopyWith(_Submit value, $Res Function(_Submit) _then) = __$SubmitCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$SubmitCopyWithImpl<$Res>
    implements _$SubmitCopyWith<$Res> {
  __$SubmitCopyWithImpl(this._self, this._then);

  final _Submit _self;
  final $Res Function(_Submit) _then;

/// Create a copy of EmailRegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_Submit(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$EmailRegistrationState {

 bool get isCheckingEmail; bool get isSubmitting; EmailAuthMode get authMode; String get checkedEmail; AuthCheckEmailData? get checkEmailData;/// Check-email / role-mismatch errors (shown under email).
 String get errorMessage;/// Login / register errors (shown under password).
 String get submitErrorMessage; AuthDestination? get destination;
/// Create a copy of EmailRegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailRegistrationStateCopyWith<EmailRegistrationState> get copyWith => _$EmailRegistrationStateCopyWithImpl<EmailRegistrationState>(this as EmailRegistrationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailRegistrationState&&(identical(other.isCheckingEmail, isCheckingEmail) || other.isCheckingEmail == isCheckingEmail)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.authMode, authMode) || other.authMode == authMode)&&(identical(other.checkedEmail, checkedEmail) || other.checkedEmail == checkedEmail)&&(identical(other.checkEmailData, checkEmailData) || other.checkEmailData == checkEmailData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.submitErrorMessage, submitErrorMessage) || other.submitErrorMessage == submitErrorMessage)&&(identical(other.destination, destination) || other.destination == destination));
}


@override
int get hashCode => Object.hash(runtimeType,isCheckingEmail,isSubmitting,authMode,checkedEmail,checkEmailData,errorMessage,submitErrorMessage,destination);

@override
String toString() {
  return 'EmailRegistrationState(isCheckingEmail: $isCheckingEmail, isSubmitting: $isSubmitting, authMode: $authMode, checkedEmail: $checkedEmail, checkEmailData: $checkEmailData, errorMessage: $errorMessage, submitErrorMessage: $submitErrorMessage, destination: $destination)';
}


}

/// @nodoc
abstract mixin class $EmailRegistrationStateCopyWith<$Res>  {
  factory $EmailRegistrationStateCopyWith(EmailRegistrationState value, $Res Function(EmailRegistrationState) _then) = _$EmailRegistrationStateCopyWithImpl;
@useResult
$Res call({
 bool isCheckingEmail, bool isSubmitting, EmailAuthMode authMode, String checkedEmail, AuthCheckEmailData? checkEmailData, String errorMessage, String submitErrorMessage, AuthDestination? destination
});


$AuthCheckEmailDataCopyWith<$Res>? get checkEmailData;$AuthDestinationCopyWith<$Res>? get destination;

}
/// @nodoc
class _$EmailRegistrationStateCopyWithImpl<$Res>
    implements $EmailRegistrationStateCopyWith<$Res> {
  _$EmailRegistrationStateCopyWithImpl(this._self, this._then);

  final EmailRegistrationState _self;
  final $Res Function(EmailRegistrationState) _then;

/// Create a copy of EmailRegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCheckingEmail = null,Object? isSubmitting = null,Object? authMode = null,Object? checkedEmail = null,Object? checkEmailData = freezed,Object? errorMessage = null,Object? submitErrorMessage = null,Object? destination = freezed,}) {
  return _then(_self.copyWith(
isCheckingEmail: null == isCheckingEmail ? _self.isCheckingEmail : isCheckingEmail // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,authMode: null == authMode ? _self.authMode : authMode // ignore: cast_nullable_to_non_nullable
as EmailAuthMode,checkedEmail: null == checkedEmail ? _self.checkedEmail : checkedEmail // ignore: cast_nullable_to_non_nullable
as String,checkEmailData: freezed == checkEmailData ? _self.checkEmailData : checkEmailData // ignore: cast_nullable_to_non_nullable
as AuthCheckEmailData?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,submitErrorMessage: null == submitErrorMessage ? _self.submitErrorMessage : submitErrorMessage // ignore: cast_nullable_to_non_nullable
as String,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as AuthDestination?,
  ));
}
/// Create a copy of EmailRegistrationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthCheckEmailDataCopyWith<$Res>? get checkEmailData {
    if (_self.checkEmailData == null) {
    return null;
  }

  return $AuthCheckEmailDataCopyWith<$Res>(_self.checkEmailData!, (value) {
    return _then(_self.copyWith(checkEmailData: value));
  });
}/// Create a copy of EmailRegistrationState
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


/// Adds pattern-matching-related methods to [EmailRegistrationState].
extension EmailRegistrationStatePatterns on EmailRegistrationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailRegistrationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailRegistrationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailRegistrationState value)  $default,){
final _that = this;
switch (_that) {
case _EmailRegistrationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailRegistrationState value)?  $default,){
final _that = this;
switch (_that) {
case _EmailRegistrationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isCheckingEmail,  bool isSubmitting,  EmailAuthMode authMode,  String checkedEmail,  AuthCheckEmailData? checkEmailData,  String errorMessage,  String submitErrorMessage,  AuthDestination? destination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailRegistrationState() when $default != null:
return $default(_that.isCheckingEmail,_that.isSubmitting,_that.authMode,_that.checkedEmail,_that.checkEmailData,_that.errorMessage,_that.submitErrorMessage,_that.destination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isCheckingEmail,  bool isSubmitting,  EmailAuthMode authMode,  String checkedEmail,  AuthCheckEmailData? checkEmailData,  String errorMessage,  String submitErrorMessage,  AuthDestination? destination)  $default,) {final _that = this;
switch (_that) {
case _EmailRegistrationState():
return $default(_that.isCheckingEmail,_that.isSubmitting,_that.authMode,_that.checkedEmail,_that.checkEmailData,_that.errorMessage,_that.submitErrorMessage,_that.destination);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isCheckingEmail,  bool isSubmitting,  EmailAuthMode authMode,  String checkedEmail,  AuthCheckEmailData? checkEmailData,  String errorMessage,  String submitErrorMessage,  AuthDestination? destination)?  $default,) {final _that = this;
switch (_that) {
case _EmailRegistrationState() when $default != null:
return $default(_that.isCheckingEmail,_that.isSubmitting,_that.authMode,_that.checkedEmail,_that.checkEmailData,_that.errorMessage,_that.submitErrorMessage,_that.destination);case _:
  return null;

}
}

}

/// @nodoc


class _EmailRegistrationState implements EmailRegistrationState {
  const _EmailRegistrationState({this.isCheckingEmail = false, this.isSubmitting = false, this.authMode = EmailAuthMode.unknown, this.checkedEmail = '', this.checkEmailData, this.errorMessage = '', this.submitErrorMessage = '', this.destination});
  

@override@JsonKey() final  bool isCheckingEmail;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  EmailAuthMode authMode;
@override@JsonKey() final  String checkedEmail;
@override final  AuthCheckEmailData? checkEmailData;
/// Check-email / role-mismatch errors (shown under email).
@override@JsonKey() final  String errorMessage;
/// Login / register errors (shown under password).
@override@JsonKey() final  String submitErrorMessage;
@override final  AuthDestination? destination;

/// Create a copy of EmailRegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailRegistrationStateCopyWith<_EmailRegistrationState> get copyWith => __$EmailRegistrationStateCopyWithImpl<_EmailRegistrationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailRegistrationState&&(identical(other.isCheckingEmail, isCheckingEmail) || other.isCheckingEmail == isCheckingEmail)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.authMode, authMode) || other.authMode == authMode)&&(identical(other.checkedEmail, checkedEmail) || other.checkedEmail == checkedEmail)&&(identical(other.checkEmailData, checkEmailData) || other.checkEmailData == checkEmailData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.submitErrorMessage, submitErrorMessage) || other.submitErrorMessage == submitErrorMessage)&&(identical(other.destination, destination) || other.destination == destination));
}


@override
int get hashCode => Object.hash(runtimeType,isCheckingEmail,isSubmitting,authMode,checkedEmail,checkEmailData,errorMessage,submitErrorMessage,destination);

@override
String toString() {
  return 'EmailRegistrationState(isCheckingEmail: $isCheckingEmail, isSubmitting: $isSubmitting, authMode: $authMode, checkedEmail: $checkedEmail, checkEmailData: $checkEmailData, errorMessage: $errorMessage, submitErrorMessage: $submitErrorMessage, destination: $destination)';
}


}

/// @nodoc
abstract mixin class _$EmailRegistrationStateCopyWith<$Res> implements $EmailRegistrationStateCopyWith<$Res> {
  factory _$EmailRegistrationStateCopyWith(_EmailRegistrationState value, $Res Function(_EmailRegistrationState) _then) = __$EmailRegistrationStateCopyWithImpl;
@override @useResult
$Res call({
 bool isCheckingEmail, bool isSubmitting, EmailAuthMode authMode, String checkedEmail, AuthCheckEmailData? checkEmailData, String errorMessage, String submitErrorMessage, AuthDestination? destination
});


@override $AuthCheckEmailDataCopyWith<$Res>? get checkEmailData;@override $AuthDestinationCopyWith<$Res>? get destination;

}
/// @nodoc
class __$EmailRegistrationStateCopyWithImpl<$Res>
    implements _$EmailRegistrationStateCopyWith<$Res> {
  __$EmailRegistrationStateCopyWithImpl(this._self, this._then);

  final _EmailRegistrationState _self;
  final $Res Function(_EmailRegistrationState) _then;

/// Create a copy of EmailRegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCheckingEmail = null,Object? isSubmitting = null,Object? authMode = null,Object? checkedEmail = null,Object? checkEmailData = freezed,Object? errorMessage = null,Object? submitErrorMessage = null,Object? destination = freezed,}) {
  return _then(_EmailRegistrationState(
isCheckingEmail: null == isCheckingEmail ? _self.isCheckingEmail : isCheckingEmail // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,authMode: null == authMode ? _self.authMode : authMode // ignore: cast_nullable_to_non_nullable
as EmailAuthMode,checkedEmail: null == checkedEmail ? _self.checkedEmail : checkedEmail // ignore: cast_nullable_to_non_nullable
as String,checkEmailData: freezed == checkEmailData ? _self.checkEmailData : checkEmailData // ignore: cast_nullable_to_non_nullable
as AuthCheckEmailData?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,submitErrorMessage: null == submitErrorMessage ? _self.submitErrorMessage : submitErrorMessage // ignore: cast_nullable_to_non_nullable
as String,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as AuthDestination?,
  ));
}

/// Create a copy of EmailRegistrationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthCheckEmailDataCopyWith<$Res>? get checkEmailData {
    if (_self.checkEmailData == null) {
    return null;
  }

  return $AuthCheckEmailDataCopyWith<$Res>(_self.checkEmailData!, (value) {
    return _then(_self.copyWith(checkEmailData: value));
  });
}/// Create a copy of EmailRegistrationState
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
