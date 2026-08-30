// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_payment_payouts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerPaymentPayoutsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPaymentPayoutsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPaymentPayoutsEvent()';
}


}

/// @nodoc
class $ListenerPaymentPayoutsEventCopyWith<$Res>  {
$ListenerPaymentPayoutsEventCopyWith(ListenerPaymentPayoutsEvent _, $Res Function(ListenerPaymentPayoutsEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerPaymentPayoutsEvent].
extension ListenerPaymentPayoutsEventPatterns on ListenerPaymentPayoutsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _UpdateMethodRequested value)?  updateMethodRequested,TResult Function( _RequestPayoutRequested value)?  requestPayoutRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _UpdateMethodRequested() when updateMethodRequested != null:
return updateMethodRequested(_that);case _RequestPayoutRequested() when requestPayoutRequested != null:
return requestPayoutRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _UpdateMethodRequested value)  updateMethodRequested,required TResult Function( _RequestPayoutRequested value)  requestPayoutRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _RefreshRequested():
return refreshRequested(_that);case _UpdateMethodRequested():
return updateMethodRequested(_that);case _RequestPayoutRequested():
return requestPayoutRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _UpdateMethodRequested value)?  updateMethodRequested,TResult? Function( _RequestPayoutRequested value)?  requestPayoutRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _UpdateMethodRequested() when updateMethodRequested != null:
return updateMethodRequested(_that);case _RequestPayoutRequested() when requestPayoutRequested != null:
return requestPayoutRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function()?  refreshRequested,TResult Function( String accountHolderName,  String bankName,  String ibanOrAccountNumber,  String? swiftCode)?  updateMethodRequested,TResult Function()?  requestPayoutRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _UpdateMethodRequested() when updateMethodRequested != null:
return updateMethodRequested(_that.accountHolderName,_that.bankName,_that.ibanOrAccountNumber,_that.swiftCode);case _RequestPayoutRequested() when requestPayoutRequested != null:
return requestPayoutRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function()  refreshRequested,required TResult Function( String accountHolderName,  String bankName,  String ibanOrAccountNumber,  String? swiftCode)  updateMethodRequested,required TResult Function()  requestPayoutRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _RefreshRequested():
return refreshRequested();case _UpdateMethodRequested():
return updateMethodRequested(_that.accountHolderName,_that.bankName,_that.ibanOrAccountNumber,_that.swiftCode);case _RequestPayoutRequested():
return requestPayoutRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function()?  refreshRequested,TResult? Function( String accountHolderName,  String bankName,  String ibanOrAccountNumber,  String? swiftCode)?  updateMethodRequested,TResult? Function()?  requestPayoutRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _UpdateMethodRequested() when updateMethodRequested != null:
return updateMethodRequested(_that.accountHolderName,_that.bankName,_that.ibanOrAccountNumber,_that.swiftCode);case _RequestPayoutRequested() when requestPayoutRequested != null:
return requestPayoutRequested();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerPaymentPayoutsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPaymentPayoutsEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements ListenerPaymentPayoutsEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPaymentPayoutsEvent.retryLoad()';
}


}




/// @nodoc


class _RefreshRequested implements ListenerPaymentPayoutsEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPaymentPayoutsEvent.refreshRequested()';
}


}




/// @nodoc


class _UpdateMethodRequested implements ListenerPaymentPayoutsEvent {
  const _UpdateMethodRequested({required this.accountHolderName, required this.bankName, required this.ibanOrAccountNumber, this.swiftCode});
  

 final  String accountHolderName;
 final  String bankName;
 final  String ibanOrAccountNumber;
 final  String? swiftCode;

/// Create a copy of ListenerPaymentPayoutsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMethodRequestedCopyWith<_UpdateMethodRequested> get copyWith => __$UpdateMethodRequestedCopyWithImpl<_UpdateMethodRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMethodRequested&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.ibanOrAccountNumber, ibanOrAccountNumber) || other.ibanOrAccountNumber == ibanOrAccountNumber)&&(identical(other.swiftCode, swiftCode) || other.swiftCode == swiftCode));
}


@override
int get hashCode => Object.hash(runtimeType,accountHolderName,bankName,ibanOrAccountNumber,swiftCode);

@override
String toString() {
  return 'ListenerPaymentPayoutsEvent.updateMethodRequested(accountHolderName: $accountHolderName, bankName: $bankName, ibanOrAccountNumber: $ibanOrAccountNumber, swiftCode: $swiftCode)';
}


}

/// @nodoc
abstract mixin class _$UpdateMethodRequestedCopyWith<$Res> implements $ListenerPaymentPayoutsEventCopyWith<$Res> {
  factory _$UpdateMethodRequestedCopyWith(_UpdateMethodRequested value, $Res Function(_UpdateMethodRequested) _then) = __$UpdateMethodRequestedCopyWithImpl;
@useResult
$Res call({
 String accountHolderName, String bankName, String ibanOrAccountNumber, String? swiftCode
});




}
/// @nodoc
class __$UpdateMethodRequestedCopyWithImpl<$Res>
    implements _$UpdateMethodRequestedCopyWith<$Res> {
  __$UpdateMethodRequestedCopyWithImpl(this._self, this._then);

  final _UpdateMethodRequested _self;
  final $Res Function(_UpdateMethodRequested) _then;

/// Create a copy of ListenerPaymentPayoutsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountHolderName = null,Object? bankName = null,Object? ibanOrAccountNumber = null,Object? swiftCode = freezed,}) {
  return _then(_UpdateMethodRequested(
accountHolderName: null == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,ibanOrAccountNumber: null == ibanOrAccountNumber ? _self.ibanOrAccountNumber : ibanOrAccountNumber // ignore: cast_nullable_to_non_nullable
as String,swiftCode: freezed == swiftCode ? _self.swiftCode : swiftCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _RequestPayoutRequested implements ListenerPaymentPayoutsEvent {
  const _RequestPayoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestPayoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPaymentPayoutsEvent.requestPayoutRequested()';
}


}




/// @nodoc
mixin _$ListenerPaymentPayoutsState {

 ListenerPaymentPayoutsStatus get status; ListenerPaymentPayoutsOverview? get overview; String get errorMessage; bool get isSavingMethod; bool get isRequestingPayout; String get mutationErrorMessage; bool get payoutRequestSucceeded; bool get methodUpdateSucceeded;
/// Create a copy of ListenerPaymentPayoutsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPaymentPayoutsStateCopyWith<ListenerPaymentPayoutsState> get copyWith => _$ListenerPaymentPayoutsStateCopyWithImpl<ListenerPaymentPayoutsState>(this as ListenerPaymentPayoutsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPaymentPayoutsState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSavingMethod, isSavingMethod) || other.isSavingMethod == isSavingMethod)&&(identical(other.isRequestingPayout, isRequestingPayout) || other.isRequestingPayout == isRequestingPayout)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage)&&(identical(other.payoutRequestSucceeded, payoutRequestSucceeded) || other.payoutRequestSucceeded == payoutRequestSucceeded)&&(identical(other.methodUpdateSucceeded, methodUpdateSucceeded) || other.methodUpdateSucceeded == methodUpdateSucceeded));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,errorMessage,isSavingMethod,isRequestingPayout,mutationErrorMessage,payoutRequestSucceeded,methodUpdateSucceeded);

@override
String toString() {
  return 'ListenerPaymentPayoutsState(status: $status, overview: $overview, errorMessage: $errorMessage, isSavingMethod: $isSavingMethod, isRequestingPayout: $isRequestingPayout, mutationErrorMessage: $mutationErrorMessage, payoutRequestSucceeded: $payoutRequestSucceeded, methodUpdateSucceeded: $methodUpdateSucceeded)';
}


}

/// @nodoc
abstract mixin class $ListenerPaymentPayoutsStateCopyWith<$Res>  {
  factory $ListenerPaymentPayoutsStateCopyWith(ListenerPaymentPayoutsState value, $Res Function(ListenerPaymentPayoutsState) _then) = _$ListenerPaymentPayoutsStateCopyWithImpl;
@useResult
$Res call({
 ListenerPaymentPayoutsStatus status, ListenerPaymentPayoutsOverview? overview, String errorMessage, bool isSavingMethod, bool isRequestingPayout, String mutationErrorMessage, bool payoutRequestSucceeded, bool methodUpdateSucceeded
});




}
/// @nodoc
class _$ListenerPaymentPayoutsStateCopyWithImpl<$Res>
    implements $ListenerPaymentPayoutsStateCopyWith<$Res> {
  _$ListenerPaymentPayoutsStateCopyWithImpl(this._self, this._then);

  final ListenerPaymentPayoutsState _self;
  final $Res Function(ListenerPaymentPayoutsState) _then;

/// Create a copy of ListenerPaymentPayoutsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? overview = freezed,Object? errorMessage = null,Object? isSavingMethod = null,Object? isRequestingPayout = null,Object? mutationErrorMessage = null,Object? payoutRequestSucceeded = null,Object? methodUpdateSucceeded = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerPaymentPayoutsStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as ListenerPaymentPayoutsOverview?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isSavingMethod: null == isSavingMethod ? _self.isSavingMethod : isSavingMethod // ignore: cast_nullable_to_non_nullable
as bool,isRequestingPayout: null == isRequestingPayout ? _self.isRequestingPayout : isRequestingPayout // ignore: cast_nullable_to_non_nullable
as bool,mutationErrorMessage: null == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String,payoutRequestSucceeded: null == payoutRequestSucceeded ? _self.payoutRequestSucceeded : payoutRequestSucceeded // ignore: cast_nullable_to_non_nullable
as bool,methodUpdateSucceeded: null == methodUpdateSucceeded ? _self.methodUpdateSucceeded : methodUpdateSucceeded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerPaymentPayoutsState].
extension ListenerPaymentPayoutsStatePatterns on ListenerPaymentPayoutsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPaymentPayoutsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPaymentPayoutsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPaymentPayoutsState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPaymentPayoutsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPaymentPayoutsState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPaymentPayoutsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerPaymentPayoutsStatus status,  ListenerPaymentPayoutsOverview? overview,  String errorMessage,  bool isSavingMethod,  bool isRequestingPayout,  String mutationErrorMessage,  bool payoutRequestSucceeded,  bool methodUpdateSucceeded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPaymentPayoutsState() when $default != null:
return $default(_that.status,_that.overview,_that.errorMessage,_that.isSavingMethod,_that.isRequestingPayout,_that.mutationErrorMessage,_that.payoutRequestSucceeded,_that.methodUpdateSucceeded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerPaymentPayoutsStatus status,  ListenerPaymentPayoutsOverview? overview,  String errorMessage,  bool isSavingMethod,  bool isRequestingPayout,  String mutationErrorMessage,  bool payoutRequestSucceeded,  bool methodUpdateSucceeded)  $default,) {final _that = this;
switch (_that) {
case _ListenerPaymentPayoutsState():
return $default(_that.status,_that.overview,_that.errorMessage,_that.isSavingMethod,_that.isRequestingPayout,_that.mutationErrorMessage,_that.payoutRequestSucceeded,_that.methodUpdateSucceeded);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerPaymentPayoutsStatus status,  ListenerPaymentPayoutsOverview? overview,  String errorMessage,  bool isSavingMethod,  bool isRequestingPayout,  String mutationErrorMessage,  bool payoutRequestSucceeded,  bool methodUpdateSucceeded)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPaymentPayoutsState() when $default != null:
return $default(_that.status,_that.overview,_that.errorMessage,_that.isSavingMethod,_that.isRequestingPayout,_that.mutationErrorMessage,_that.payoutRequestSucceeded,_that.methodUpdateSucceeded);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerPaymentPayoutsState extends ListenerPaymentPayoutsState {
  const _ListenerPaymentPayoutsState({this.status = ListenerPaymentPayoutsStatus.initial, this.overview, this.errorMessage = '', this.isSavingMethod = false, this.isRequestingPayout = false, this.mutationErrorMessage = '', this.payoutRequestSucceeded = false, this.methodUpdateSucceeded = false}): super._();
  

@override@JsonKey() final  ListenerPaymentPayoutsStatus status;
@override final  ListenerPaymentPayoutsOverview? overview;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  bool isSavingMethod;
@override@JsonKey() final  bool isRequestingPayout;
@override@JsonKey() final  String mutationErrorMessage;
@override@JsonKey() final  bool payoutRequestSucceeded;
@override@JsonKey() final  bool methodUpdateSucceeded;

/// Create a copy of ListenerPaymentPayoutsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPaymentPayoutsStateCopyWith<_ListenerPaymentPayoutsState> get copyWith => __$ListenerPaymentPayoutsStateCopyWithImpl<_ListenerPaymentPayoutsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPaymentPayoutsState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSavingMethod, isSavingMethod) || other.isSavingMethod == isSavingMethod)&&(identical(other.isRequestingPayout, isRequestingPayout) || other.isRequestingPayout == isRequestingPayout)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage)&&(identical(other.payoutRequestSucceeded, payoutRequestSucceeded) || other.payoutRequestSucceeded == payoutRequestSucceeded)&&(identical(other.methodUpdateSucceeded, methodUpdateSucceeded) || other.methodUpdateSucceeded == methodUpdateSucceeded));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,errorMessage,isSavingMethod,isRequestingPayout,mutationErrorMessage,payoutRequestSucceeded,methodUpdateSucceeded);

@override
String toString() {
  return 'ListenerPaymentPayoutsState(status: $status, overview: $overview, errorMessage: $errorMessage, isSavingMethod: $isSavingMethod, isRequestingPayout: $isRequestingPayout, mutationErrorMessage: $mutationErrorMessage, payoutRequestSucceeded: $payoutRequestSucceeded, methodUpdateSucceeded: $methodUpdateSucceeded)';
}


}

/// @nodoc
abstract mixin class _$ListenerPaymentPayoutsStateCopyWith<$Res> implements $ListenerPaymentPayoutsStateCopyWith<$Res> {
  factory _$ListenerPaymentPayoutsStateCopyWith(_ListenerPaymentPayoutsState value, $Res Function(_ListenerPaymentPayoutsState) _then) = __$ListenerPaymentPayoutsStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerPaymentPayoutsStatus status, ListenerPaymentPayoutsOverview? overview, String errorMessage, bool isSavingMethod, bool isRequestingPayout, String mutationErrorMessage, bool payoutRequestSucceeded, bool methodUpdateSucceeded
});




}
/// @nodoc
class __$ListenerPaymentPayoutsStateCopyWithImpl<$Res>
    implements _$ListenerPaymentPayoutsStateCopyWith<$Res> {
  __$ListenerPaymentPayoutsStateCopyWithImpl(this._self, this._then);

  final _ListenerPaymentPayoutsState _self;
  final $Res Function(_ListenerPaymentPayoutsState) _then;

/// Create a copy of ListenerPaymentPayoutsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? overview = freezed,Object? errorMessage = null,Object? isSavingMethod = null,Object? isRequestingPayout = null,Object? mutationErrorMessage = null,Object? payoutRequestSucceeded = null,Object? methodUpdateSucceeded = null,}) {
  return _then(_ListenerPaymentPayoutsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerPaymentPayoutsStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as ListenerPaymentPayoutsOverview?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isSavingMethod: null == isSavingMethod ? _self.isSavingMethod : isSavingMethod // ignore: cast_nullable_to_non_nullable
as bool,isRequestingPayout: null == isRequestingPayout ? _self.isRequestingPayout : isRequestingPayout // ignore: cast_nullable_to_non_nullable
as bool,mutationErrorMessage: null == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String,payoutRequestSucceeded: null == payoutRequestSucceeded ? _self.payoutRequestSucceeded : payoutRequestSucceeded // ignore: cast_nullable_to_non_nullable
as bool,methodUpdateSucceeded: null == methodUpdateSucceeded ? _self.methodUpdateSucceeded : methodUpdateSucceeded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
