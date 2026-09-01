// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_buy_points_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorBuyPointsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBuyPointsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBuyPointsEvent()';
}


}

/// @nodoc
class $VentorBuyPointsEventCopyWith<$Res>  {
$VentorBuyPointsEventCopyWith(VentorBuyPointsEvent _, $Res Function(VentorBuyPointsEvent) __);
}


/// Adds pattern-matching-related methods to [VentorBuyPointsEvent].
extension VentorBuyPointsEventPatterns on VentorBuyPointsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _PurchaseRequested value)?  purchaseRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _PurchaseRequested() when purchaseRequested != null:
return purchaseRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _PurchaseRequested value)  purchaseRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _PurchaseRequested():
return purchaseRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _PurchaseRequested value)?  purchaseRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _PurchaseRequested() when purchaseRequested != null:
return purchaseRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function( String packageId)?  purchaseRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _PurchaseRequested() when purchaseRequested != null:
return purchaseRequested(_that.packageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function( String packageId)  purchaseRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _PurchaseRequested():
return purchaseRequested(_that.packageId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function( String packageId)?  purchaseRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _PurchaseRequested() when purchaseRequested != null:
return purchaseRequested(_that.packageId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorBuyPointsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBuyPointsEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements VentorBuyPointsEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorBuyPointsEvent.retryLoad()';
}


}




/// @nodoc


class _PurchaseRequested implements VentorBuyPointsEvent {
  const _PurchaseRequested({required this.packageId});
  

 final  String packageId;

/// Create a copy of VentorBuyPointsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseRequestedCopyWith<_PurchaseRequested> get copyWith => __$PurchaseRequestedCopyWithImpl<_PurchaseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseRequested&&(identical(other.packageId, packageId) || other.packageId == packageId));
}


@override
int get hashCode => Object.hash(runtimeType,packageId);

@override
String toString() {
  return 'VentorBuyPointsEvent.purchaseRequested(packageId: $packageId)';
}


}

/// @nodoc
abstract mixin class _$PurchaseRequestedCopyWith<$Res> implements $VentorBuyPointsEventCopyWith<$Res> {
  factory _$PurchaseRequestedCopyWith(_PurchaseRequested value, $Res Function(_PurchaseRequested) _then) = __$PurchaseRequestedCopyWithImpl;
@useResult
$Res call({
 String packageId
});




}
/// @nodoc
class __$PurchaseRequestedCopyWithImpl<$Res>
    implements _$PurchaseRequestedCopyWith<$Res> {
  __$PurchaseRequestedCopyWithImpl(this._self, this._then);

  final _PurchaseRequested _self;
  final $Res Function(_PurchaseRequested) _then;

/// Create a copy of VentorBuyPointsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageId = null,}) {
  return _then(_PurchaseRequested(
packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VentorBuyPointsState {

 VentorBuyPointsStatus get status; List<VentorPointPackageData> get packages; String get errorMessage; bool get isPurchasing; String get purchaseErrorMessage; bool get purchaseSuccess; VentorPurchasePointsResult? get purchaseResult;
/// Create a copy of VentorBuyPointsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorBuyPointsStateCopyWith<VentorBuyPointsState> get copyWith => _$VentorBuyPointsStateCopyWithImpl<VentorBuyPointsState>(this as VentorBuyPointsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorBuyPointsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.packages, packages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isPurchasing, isPurchasing) || other.isPurchasing == isPurchasing)&&(identical(other.purchaseErrorMessage, purchaseErrorMessage) || other.purchaseErrorMessage == purchaseErrorMessage)&&(identical(other.purchaseSuccess, purchaseSuccess) || other.purchaseSuccess == purchaseSuccess)&&(identical(other.purchaseResult, purchaseResult) || other.purchaseResult == purchaseResult));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(packages),errorMessage,isPurchasing,purchaseErrorMessage,purchaseSuccess,purchaseResult);

@override
String toString() {
  return 'VentorBuyPointsState(status: $status, packages: $packages, errorMessage: $errorMessage, isPurchasing: $isPurchasing, purchaseErrorMessage: $purchaseErrorMessage, purchaseSuccess: $purchaseSuccess, purchaseResult: $purchaseResult)';
}


}

/// @nodoc
abstract mixin class $VentorBuyPointsStateCopyWith<$Res>  {
  factory $VentorBuyPointsStateCopyWith(VentorBuyPointsState value, $Res Function(VentorBuyPointsState) _then) = _$VentorBuyPointsStateCopyWithImpl;
@useResult
$Res call({
 VentorBuyPointsStatus status, List<VentorPointPackageData> packages, String errorMessage, bool isPurchasing, String purchaseErrorMessage, bool purchaseSuccess, VentorPurchasePointsResult? purchaseResult
});




}
/// @nodoc
class _$VentorBuyPointsStateCopyWithImpl<$Res>
    implements $VentorBuyPointsStateCopyWith<$Res> {
  _$VentorBuyPointsStateCopyWithImpl(this._self, this._then);

  final VentorBuyPointsState _self;
  final $Res Function(VentorBuyPointsState) _then;

/// Create a copy of VentorBuyPointsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? packages = null,Object? errorMessage = null,Object? isPurchasing = null,Object? purchaseErrorMessage = null,Object? purchaseSuccess = null,Object? purchaseResult = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorBuyPointsStatus,packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<VentorPointPackageData>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isPurchasing: null == isPurchasing ? _self.isPurchasing : isPurchasing // ignore: cast_nullable_to_non_nullable
as bool,purchaseErrorMessage: null == purchaseErrorMessage ? _self.purchaseErrorMessage : purchaseErrorMessage // ignore: cast_nullable_to_non_nullable
as String,purchaseSuccess: null == purchaseSuccess ? _self.purchaseSuccess : purchaseSuccess // ignore: cast_nullable_to_non_nullable
as bool,purchaseResult: freezed == purchaseResult ? _self.purchaseResult : purchaseResult // ignore: cast_nullable_to_non_nullable
as VentorPurchasePointsResult?,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorBuyPointsState].
extension VentorBuyPointsStatePatterns on VentorBuyPointsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorBuyPointsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorBuyPointsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorBuyPointsState value)  $default,){
final _that = this;
switch (_that) {
case _VentorBuyPointsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorBuyPointsState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorBuyPointsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorBuyPointsStatus status,  List<VentorPointPackageData> packages,  String errorMessage,  bool isPurchasing,  String purchaseErrorMessage,  bool purchaseSuccess,  VentorPurchasePointsResult? purchaseResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorBuyPointsState() when $default != null:
return $default(_that.status,_that.packages,_that.errorMessage,_that.isPurchasing,_that.purchaseErrorMessage,_that.purchaseSuccess,_that.purchaseResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorBuyPointsStatus status,  List<VentorPointPackageData> packages,  String errorMessage,  bool isPurchasing,  String purchaseErrorMessage,  bool purchaseSuccess,  VentorPurchasePointsResult? purchaseResult)  $default,) {final _that = this;
switch (_that) {
case _VentorBuyPointsState():
return $default(_that.status,_that.packages,_that.errorMessage,_that.isPurchasing,_that.purchaseErrorMessage,_that.purchaseSuccess,_that.purchaseResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorBuyPointsStatus status,  List<VentorPointPackageData> packages,  String errorMessage,  bool isPurchasing,  String purchaseErrorMessage,  bool purchaseSuccess,  VentorPurchasePointsResult? purchaseResult)?  $default,) {final _that = this;
switch (_that) {
case _VentorBuyPointsState() when $default != null:
return $default(_that.status,_that.packages,_that.errorMessage,_that.isPurchasing,_that.purchaseErrorMessage,_that.purchaseSuccess,_that.purchaseResult);case _:
  return null;

}
}

}

/// @nodoc


class _VentorBuyPointsState extends VentorBuyPointsState {
  const _VentorBuyPointsState({this.status = VentorBuyPointsStatus.initial, final  List<VentorPointPackageData> packages = const <VentorPointPackageData>[], this.errorMessage = '', this.isPurchasing = false, this.purchaseErrorMessage = '', this.purchaseSuccess = false, this.purchaseResult}): _packages = packages,super._();
  

@override@JsonKey() final  VentorBuyPointsStatus status;
 final  List<VentorPointPackageData> _packages;
@override@JsonKey() List<VentorPointPackageData> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}

@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  bool isPurchasing;
@override@JsonKey() final  String purchaseErrorMessage;
@override@JsonKey() final  bool purchaseSuccess;
@override final  VentorPurchasePointsResult? purchaseResult;

/// Create a copy of VentorBuyPointsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorBuyPointsStateCopyWith<_VentorBuyPointsState> get copyWith => __$VentorBuyPointsStateCopyWithImpl<_VentorBuyPointsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorBuyPointsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._packages, _packages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isPurchasing, isPurchasing) || other.isPurchasing == isPurchasing)&&(identical(other.purchaseErrorMessage, purchaseErrorMessage) || other.purchaseErrorMessage == purchaseErrorMessage)&&(identical(other.purchaseSuccess, purchaseSuccess) || other.purchaseSuccess == purchaseSuccess)&&(identical(other.purchaseResult, purchaseResult) || other.purchaseResult == purchaseResult));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_packages),errorMessage,isPurchasing,purchaseErrorMessage,purchaseSuccess,purchaseResult);

@override
String toString() {
  return 'VentorBuyPointsState(status: $status, packages: $packages, errorMessage: $errorMessage, isPurchasing: $isPurchasing, purchaseErrorMessage: $purchaseErrorMessage, purchaseSuccess: $purchaseSuccess, purchaseResult: $purchaseResult)';
}


}

/// @nodoc
abstract mixin class _$VentorBuyPointsStateCopyWith<$Res> implements $VentorBuyPointsStateCopyWith<$Res> {
  factory _$VentorBuyPointsStateCopyWith(_VentorBuyPointsState value, $Res Function(_VentorBuyPointsState) _then) = __$VentorBuyPointsStateCopyWithImpl;
@override @useResult
$Res call({
 VentorBuyPointsStatus status, List<VentorPointPackageData> packages, String errorMessage, bool isPurchasing, String purchaseErrorMessage, bool purchaseSuccess, VentorPurchasePointsResult? purchaseResult
});




}
/// @nodoc
class __$VentorBuyPointsStateCopyWithImpl<$Res>
    implements _$VentorBuyPointsStateCopyWith<$Res> {
  __$VentorBuyPointsStateCopyWithImpl(this._self, this._then);

  final _VentorBuyPointsState _self;
  final $Res Function(_VentorBuyPointsState) _then;

/// Create a copy of VentorBuyPointsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? packages = null,Object? errorMessage = null,Object? isPurchasing = null,Object? purchaseErrorMessage = null,Object? purchaseSuccess = null,Object? purchaseResult = freezed,}) {
  return _then(_VentorBuyPointsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorBuyPointsStatus,packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<VentorPointPackageData>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isPurchasing: null == isPurchasing ? _self.isPurchasing : isPurchasing // ignore: cast_nullable_to_non_nullable
as bool,purchaseErrorMessage: null == purchaseErrorMessage ? _self.purchaseErrorMessage : purchaseErrorMessage // ignore: cast_nullable_to_non_nullable
as String,purchaseSuccess: null == purchaseSuccess ? _self.purchaseSuccess : purchaseSuccess // ignore: cast_nullable_to_non_nullable
as bool,purchaseResult: freezed == purchaseResult ? _self.purchaseResult : purchaseResult // ignore: cast_nullable_to_non_nullable
as VentorPurchasePointsResult?,
  ));
}


}

// dart format on
