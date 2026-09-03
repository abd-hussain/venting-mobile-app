// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_booked_session_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorBookedSessionDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBookedSessionDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBookedSessionDetailEvent()';
}


}

/// @nodoc
class $VentorBookedSessionDetailEventCopyWith<$Res>  {
$VentorBookedSessionDetailEventCopyWith(VentorBookedSessionDetailEvent _, $Res Function(VentorBookedSessionDetailEvent) __);
}


/// Adds pattern-matching-related methods to [VentorBookedSessionDetailEvent].
extension VentorBookedSessionDetailEventPatterns on VentorBookedSessionDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _CancelRequested value)?  cancelRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _CancelRequested() when cancelRequested != null:
return cancelRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _CancelRequested value)  cancelRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _CancelRequested():
return cancelRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _CancelRequested value)?  cancelRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _CancelRequested() when cancelRequested != null:
return cancelRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function( String? reason)?  cancelRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _CancelRequested() when cancelRequested != null:
return cancelRequested(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function( String? reason)  cancelRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _CancelRequested():
return cancelRequested(_that.reason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function( String? reason)?  cancelRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _CancelRequested() when cancelRequested != null:
return cancelRequested(_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorBookedSessionDetailEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBookedSessionDetailEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements VentorBookedSessionDetailEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBookedSessionDetailEvent.retryLoad()';
}


}




/// @nodoc


class _CancelRequested implements VentorBookedSessionDetailEvent {
  const _CancelRequested({this.reason});
  

 final  String? reason;

/// Create a copy of VentorBookedSessionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelRequestedCopyWith<_CancelRequested> get copyWith => __$CancelRequestedCopyWithImpl<_CancelRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelRequested&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'VentorBookedSessionDetailEvent.cancelRequested(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$CancelRequestedCopyWith<$Res> implements $VentorBookedSessionDetailEventCopyWith<$Res> {
  factory _$CancelRequestedCopyWith(_CancelRequested value, $Res Function(_CancelRequested) _then) = __$CancelRequestedCopyWithImpl;
@useResult
$Res call({
 String? reason
});




}
/// @nodoc
class __$CancelRequestedCopyWithImpl<$Res>
    implements _$CancelRequestedCopyWith<$Res> {
  __$CancelRequestedCopyWithImpl(this._self, this._then);

  final _CancelRequested _self;
  final $Res Function(_CancelRequested) _then;

/// Create a copy of VentorBookedSessionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = freezed,}) {
  return _then(_CancelRequested(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$VentorBookedSessionDetailState {

 VentorBookedSessionDetailStatus get status; VentorBookedSession get session; VentorBookedSessionListenerSummary? get listener; VentorBookedSessionPayment? get payment; bool get isCancelling; bool get cancelSucceeded; String get errorMessage; String get cancelErrorMessage;
/// Create a copy of VentorBookedSessionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorBookedSessionDetailStateCopyWith<VentorBookedSessionDetailState> get copyWith => _$VentorBookedSessionDetailStateCopyWithImpl<VentorBookedSessionDetailState>(this as VentorBookedSessionDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBookedSessionDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.session, session) || other.session == session)&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.isCancelling, isCancelling) || other.isCancelling == isCancelling)&&(identical(other.cancelSucceeded, cancelSucceeded) || other.cancelSucceeded == cancelSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.cancelErrorMessage, cancelErrorMessage) || other.cancelErrorMessage == cancelErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,session,listener,payment,isCancelling,cancelSucceeded,errorMessage,cancelErrorMessage);

@override
String toString() {
  return 'VentorBookedSessionDetailState(status: $status, session: $session, listener: $listener, payment: $payment, isCancelling: $isCancelling, cancelSucceeded: $cancelSucceeded, errorMessage: $errorMessage, cancelErrorMessage: $cancelErrorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorBookedSessionDetailStateCopyWith<$Res>  {
  factory $VentorBookedSessionDetailStateCopyWith(VentorBookedSessionDetailState value, $Res Function(VentorBookedSessionDetailState) _then) = _$VentorBookedSessionDetailStateCopyWithImpl;
@useResult
$Res call({
 VentorBookedSessionDetailStatus status, VentorBookedSession session, VentorBookedSessionListenerSummary? listener, VentorBookedSessionPayment? payment, bool isCancelling, bool cancelSucceeded, String errorMessage, String cancelErrorMessage
});




}
/// @nodoc
class _$VentorBookedSessionDetailStateCopyWithImpl<$Res>
    implements $VentorBookedSessionDetailStateCopyWith<$Res> {
  _$VentorBookedSessionDetailStateCopyWithImpl(this._self, this._then);

  final VentorBookedSessionDetailState _self;
  final $Res Function(VentorBookedSessionDetailState) _then;

/// Create a copy of VentorBookedSessionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? session = null,Object? listener = freezed,Object? payment = freezed,Object? isCancelling = null,Object? cancelSucceeded = null,Object? errorMessage = null,Object? cancelErrorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionDetailStatus,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as VentorBookedSession,listener: freezed == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionListenerSummary?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionPayment?,isCancelling: null == isCancelling ? _self.isCancelling : isCancelling // ignore: cast_nullable_to_non_nullable
as bool,cancelSucceeded: null == cancelSucceeded ? _self.cancelSucceeded : cancelSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,cancelErrorMessage: null == cancelErrorMessage ? _self.cancelErrorMessage : cancelErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorBookedSessionDetailState].
extension VentorBookedSessionDetailStatePatterns on VentorBookedSessionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorBookedSessionDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorBookedSessionDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorBookedSessionDetailState value)  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorBookedSessionDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorBookedSessionDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorBookedSessionDetailStatus status,  VentorBookedSession session,  VentorBookedSessionListenerSummary? listener,  VentorBookedSessionPayment? payment,  bool isCancelling,  bool cancelSucceeded,  String errorMessage,  String cancelErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorBookedSessionDetailState() when $default != null:
return $default(_that.status,_that.session,_that.listener,_that.payment,_that.isCancelling,_that.cancelSucceeded,_that.errorMessage,_that.cancelErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorBookedSessionDetailStatus status,  VentorBookedSession session,  VentorBookedSessionListenerSummary? listener,  VentorBookedSessionPayment? payment,  bool isCancelling,  bool cancelSucceeded,  String errorMessage,  String cancelErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionDetailState():
return $default(_that.status,_that.session,_that.listener,_that.payment,_that.isCancelling,_that.cancelSucceeded,_that.errorMessage,_that.cancelErrorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorBookedSessionDetailStatus status,  VentorBookedSession session,  VentorBookedSessionListenerSummary? listener,  VentorBookedSessionPayment? payment,  bool isCancelling,  bool cancelSucceeded,  String errorMessage,  String cancelErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorBookedSessionDetailState() when $default != null:
return $default(_that.status,_that.session,_that.listener,_that.payment,_that.isCancelling,_that.cancelSucceeded,_that.errorMessage,_that.cancelErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorBookedSessionDetailState extends VentorBookedSessionDetailState {
  const _VentorBookedSessionDetailState({this.status = VentorBookedSessionDetailStatus.initial, required this.session, this.listener, this.payment, this.isCancelling = false, this.cancelSucceeded = false, this.errorMessage = '', this.cancelErrorMessage = ''}): super._();
  

@override@JsonKey() final  VentorBookedSessionDetailStatus status;
@override final  VentorBookedSession session;
@override final  VentorBookedSessionListenerSummary? listener;
@override final  VentorBookedSessionPayment? payment;
@override@JsonKey() final  bool isCancelling;
@override@JsonKey() final  bool cancelSucceeded;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String cancelErrorMessage;

/// Create a copy of VentorBookedSessionDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorBookedSessionDetailStateCopyWith<_VentorBookedSessionDetailState> get copyWith => __$VentorBookedSessionDetailStateCopyWithImpl<_VentorBookedSessionDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorBookedSessionDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.session, session) || other.session == session)&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.isCancelling, isCancelling) || other.isCancelling == isCancelling)&&(identical(other.cancelSucceeded, cancelSucceeded) || other.cancelSucceeded == cancelSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.cancelErrorMessage, cancelErrorMessage) || other.cancelErrorMessage == cancelErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,session,listener,payment,isCancelling,cancelSucceeded,errorMessage,cancelErrorMessage);

@override
String toString() {
  return 'VentorBookedSessionDetailState(status: $status, session: $session, listener: $listener, payment: $payment, isCancelling: $isCancelling, cancelSucceeded: $cancelSucceeded, errorMessage: $errorMessage, cancelErrorMessage: $cancelErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorBookedSessionDetailStateCopyWith<$Res> implements $VentorBookedSessionDetailStateCopyWith<$Res> {
  factory _$VentorBookedSessionDetailStateCopyWith(_VentorBookedSessionDetailState value, $Res Function(_VentorBookedSessionDetailState) _then) = __$VentorBookedSessionDetailStateCopyWithImpl;
@override @useResult
$Res call({
 VentorBookedSessionDetailStatus status, VentorBookedSession session, VentorBookedSessionListenerSummary? listener, VentorBookedSessionPayment? payment, bool isCancelling, bool cancelSucceeded, String errorMessage, String cancelErrorMessage
});




}
/// @nodoc
class __$VentorBookedSessionDetailStateCopyWithImpl<$Res>
    implements _$VentorBookedSessionDetailStateCopyWith<$Res> {
  __$VentorBookedSessionDetailStateCopyWithImpl(this._self, this._then);

  final _VentorBookedSessionDetailState _self;
  final $Res Function(_VentorBookedSessionDetailState) _then;

/// Create a copy of VentorBookedSessionDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? session = null,Object? listener = freezed,Object? payment = freezed,Object? isCancelling = null,Object? cancelSucceeded = null,Object? errorMessage = null,Object? cancelErrorMessage = null,}) {
  return _then(_VentorBookedSessionDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionDetailStatus,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as VentorBookedSession,listener: freezed == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionListenerSummary?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as VentorBookedSessionPayment?,isCancelling: null == isCancelling ? _self.isCancelling : isCancelling // ignore: cast_nullable_to_non_nullable
as bool,cancelSucceeded: null == cancelSucceeded ? _self.cancelSucceeded : cancelSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,cancelErrorMessage: null == cancelErrorMessage ? _self.cancelErrorMessage : cancelErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
