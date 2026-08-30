// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_rewards_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorRewardsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorRewardsEvent()';
}


}

/// @nodoc
class $VentorRewardsEventCopyWith<$Res>  {
$VentorRewardsEventCopyWith(VentorRewardsEvent _, $Res Function(VentorRewardsEvent) __);
}


/// Adds pattern-matching-related methods to [VentorRewardsEvent].
extension VentorRewardsEventPatterns on VentorRewardsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _HistoryTabOpened value)?  historyTabOpened,TResult Function( _RetryHistoryLoad value)?  retryHistoryLoad,TResult Function( _RedeemRequested value)?  redeemRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _HistoryTabOpened() when historyTabOpened != null:
return historyTabOpened(_that);case _RetryHistoryLoad() when retryHistoryLoad != null:
return retryHistoryLoad(_that);case _RedeemRequested() when redeemRequested != null:
return redeemRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _HistoryTabOpened value)  historyTabOpened,required TResult Function( _RetryHistoryLoad value)  retryHistoryLoad,required TResult Function( _RedeemRequested value)  redeemRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _HistoryTabOpened():
return historyTabOpened(_that);case _RetryHistoryLoad():
return retryHistoryLoad(_that);case _RedeemRequested():
return redeemRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _HistoryTabOpened value)?  historyTabOpened,TResult? Function( _RetryHistoryLoad value)?  retryHistoryLoad,TResult? Function( _RedeemRequested value)?  redeemRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _HistoryTabOpened() when historyTabOpened != null:
return historyTabOpened(_that);case _RetryHistoryLoad() when retryHistoryLoad != null:
return retryHistoryLoad(_that);case _RedeemRequested() when redeemRequested != null:
return redeemRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function()?  historyTabOpened,TResult Function()?  retryHistoryLoad,TResult Function( String offerId)?  redeemRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _HistoryTabOpened() when historyTabOpened != null:
return historyTabOpened();case _RetryHistoryLoad() when retryHistoryLoad != null:
return retryHistoryLoad();case _RedeemRequested() when redeemRequested != null:
return redeemRequested(_that.offerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function()  historyTabOpened,required TResult Function()  retryHistoryLoad,required TResult Function( String offerId)  redeemRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _HistoryTabOpened():
return historyTabOpened();case _RetryHistoryLoad():
return retryHistoryLoad();case _RedeemRequested():
return redeemRequested(_that.offerId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function()?  historyTabOpened,TResult? Function()?  retryHistoryLoad,TResult? Function( String offerId)?  redeemRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _HistoryTabOpened() when historyTabOpened != null:
return historyTabOpened();case _RetryHistoryLoad() when retryHistoryLoad != null:
return retryHistoryLoad();case _RedeemRequested() when redeemRequested != null:
return redeemRequested(_that.offerId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorRewardsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorRewardsEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements VentorRewardsEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorRewardsEvent.retryLoad()';
}


}




/// @nodoc


class _HistoryTabOpened implements VentorRewardsEvent {
  const _HistoryTabOpened();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryTabOpened);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorRewardsEvent.historyTabOpened()';
}


}




/// @nodoc


class _RetryHistoryLoad implements VentorRewardsEvent {
  const _RetryHistoryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryHistoryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorRewardsEvent.retryHistoryLoad()';
}


}




/// @nodoc


class _RedeemRequested implements VentorRewardsEvent {
  const _RedeemRequested({required this.offerId});
  

 final  String offerId;

/// Create a copy of VentorRewardsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RedeemRequestedCopyWith<_RedeemRequested> get copyWith => __$RedeemRequestedCopyWithImpl<_RedeemRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RedeemRequested&&(identical(other.offerId, offerId) || other.offerId == offerId));
}


@override
int get hashCode => Object.hash(runtimeType,offerId);

@override
String toString() {
  return 'VentorRewardsEvent.redeemRequested(offerId: $offerId)';
}


}

/// @nodoc
abstract mixin class _$RedeemRequestedCopyWith<$Res> implements $VentorRewardsEventCopyWith<$Res> {
  factory _$RedeemRequestedCopyWith(_RedeemRequested value, $Res Function(_RedeemRequested) _then) = __$RedeemRequestedCopyWithImpl;
@useResult
$Res call({
 String offerId
});




}
/// @nodoc
class __$RedeemRequestedCopyWithImpl<$Res>
    implements _$RedeemRequestedCopyWith<$Res> {
  __$RedeemRequestedCopyWithImpl(this._self, this._then);

  final _RedeemRequested _self;
  final $Res Function(_RedeemRequested) _then;

/// Create a copy of VentorRewardsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offerId = null,}) {
  return _then(_RedeemRequested(
offerId: null == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VentorRewardsState {

 VentorRewardsStatus get rewardsStatus; VentorRewardsOverviewData? get rewards; VentorRewardsHistoryStatus get historyStatus; List<VentorRewardTradeData> get trades; bool get historyLoaded; String get errorMessage; String get historyErrorMessage; bool get isRedeeming; bool get redeemSuccess;
/// Create a copy of VentorRewardsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorRewardsStateCopyWith<VentorRewardsState> get copyWith => _$VentorRewardsStateCopyWithImpl<VentorRewardsState>(this as VentorRewardsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorRewardsState&&(identical(other.rewardsStatus, rewardsStatus) || other.rewardsStatus == rewardsStatus)&&(identical(other.rewards, rewards) || other.rewards == rewards)&&(identical(other.historyStatus, historyStatus) || other.historyStatus == historyStatus)&&const DeepCollectionEquality().equals(other.trades, trades)&&(identical(other.historyLoaded, historyLoaded) || other.historyLoaded == historyLoaded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.historyErrorMessage, historyErrorMessage) || other.historyErrorMessage == historyErrorMessage)&&(identical(other.isRedeeming, isRedeeming) || other.isRedeeming == isRedeeming)&&(identical(other.redeemSuccess, redeemSuccess) || other.redeemSuccess == redeemSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,rewardsStatus,rewards,historyStatus,const DeepCollectionEquality().hash(trades),historyLoaded,errorMessage,historyErrorMessage,isRedeeming,redeemSuccess);

@override
String toString() {
  return 'VentorRewardsState(rewardsStatus: $rewardsStatus, rewards: $rewards, historyStatus: $historyStatus, trades: $trades, historyLoaded: $historyLoaded, errorMessage: $errorMessage, historyErrorMessage: $historyErrorMessage, isRedeeming: $isRedeeming, redeemSuccess: $redeemSuccess)';
}


}

/// @nodoc
abstract mixin class $VentorRewardsStateCopyWith<$Res>  {
  factory $VentorRewardsStateCopyWith(VentorRewardsState value, $Res Function(VentorRewardsState) _then) = _$VentorRewardsStateCopyWithImpl;
@useResult
$Res call({
 VentorRewardsStatus rewardsStatus, VentorRewardsOverviewData? rewards, VentorRewardsHistoryStatus historyStatus, List<VentorRewardTradeData> trades, bool historyLoaded, String errorMessage, String historyErrorMessage, bool isRedeeming, bool redeemSuccess
});




}
/// @nodoc
class _$VentorRewardsStateCopyWithImpl<$Res>
    implements $VentorRewardsStateCopyWith<$Res> {
  _$VentorRewardsStateCopyWithImpl(this._self, this._then);

  final VentorRewardsState _self;
  final $Res Function(VentorRewardsState) _then;

/// Create a copy of VentorRewardsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rewardsStatus = null,Object? rewards = freezed,Object? historyStatus = null,Object? trades = null,Object? historyLoaded = null,Object? errorMessage = null,Object? historyErrorMessage = null,Object? isRedeeming = null,Object? redeemSuccess = null,}) {
  return _then(_self.copyWith(
rewardsStatus: null == rewardsStatus ? _self.rewardsStatus : rewardsStatus // ignore: cast_nullable_to_non_nullable
as VentorRewardsStatus,rewards: freezed == rewards ? _self.rewards : rewards // ignore: cast_nullable_to_non_nullable
as VentorRewardsOverviewData?,historyStatus: null == historyStatus ? _self.historyStatus : historyStatus // ignore: cast_nullable_to_non_nullable
as VentorRewardsHistoryStatus,trades: null == trades ? _self.trades : trades // ignore: cast_nullable_to_non_nullable
as List<VentorRewardTradeData>,historyLoaded: null == historyLoaded ? _self.historyLoaded : historyLoaded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,historyErrorMessage: null == historyErrorMessage ? _self.historyErrorMessage : historyErrorMessage // ignore: cast_nullable_to_non_nullable
as String,isRedeeming: null == isRedeeming ? _self.isRedeeming : isRedeeming // ignore: cast_nullable_to_non_nullable
as bool,redeemSuccess: null == redeemSuccess ? _self.redeemSuccess : redeemSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorRewardsState].
extension VentorRewardsStatePatterns on VentorRewardsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorRewardsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorRewardsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorRewardsState value)  $default,){
final _that = this;
switch (_that) {
case _VentorRewardsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorRewardsState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorRewardsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorRewardsStatus rewardsStatus,  VentorRewardsOverviewData? rewards,  VentorRewardsHistoryStatus historyStatus,  List<VentorRewardTradeData> trades,  bool historyLoaded,  String errorMessage,  String historyErrorMessage,  bool isRedeeming,  bool redeemSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorRewardsState() when $default != null:
return $default(_that.rewardsStatus,_that.rewards,_that.historyStatus,_that.trades,_that.historyLoaded,_that.errorMessage,_that.historyErrorMessage,_that.isRedeeming,_that.redeemSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorRewardsStatus rewardsStatus,  VentorRewardsOverviewData? rewards,  VentorRewardsHistoryStatus historyStatus,  List<VentorRewardTradeData> trades,  bool historyLoaded,  String errorMessage,  String historyErrorMessage,  bool isRedeeming,  bool redeemSuccess)  $default,) {final _that = this;
switch (_that) {
case _VentorRewardsState():
return $default(_that.rewardsStatus,_that.rewards,_that.historyStatus,_that.trades,_that.historyLoaded,_that.errorMessage,_that.historyErrorMessage,_that.isRedeeming,_that.redeemSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorRewardsStatus rewardsStatus,  VentorRewardsOverviewData? rewards,  VentorRewardsHistoryStatus historyStatus,  List<VentorRewardTradeData> trades,  bool historyLoaded,  String errorMessage,  String historyErrorMessage,  bool isRedeeming,  bool redeemSuccess)?  $default,) {final _that = this;
switch (_that) {
case _VentorRewardsState() when $default != null:
return $default(_that.rewardsStatus,_that.rewards,_that.historyStatus,_that.trades,_that.historyLoaded,_that.errorMessage,_that.historyErrorMessage,_that.isRedeeming,_that.redeemSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _VentorRewardsState extends VentorRewardsState {
  const _VentorRewardsState({this.rewardsStatus = VentorRewardsStatus.initial, this.rewards, this.historyStatus = VentorRewardsHistoryStatus.initial, final  List<VentorRewardTradeData> trades = const <VentorRewardTradeData>[], this.historyLoaded = false, this.errorMessage = '', this.historyErrorMessage = '', this.isRedeeming = false, this.redeemSuccess = false}): _trades = trades,super._();
  

@override@JsonKey() final  VentorRewardsStatus rewardsStatus;
@override final  VentorRewardsOverviewData? rewards;
@override@JsonKey() final  VentorRewardsHistoryStatus historyStatus;
 final  List<VentorRewardTradeData> _trades;
@override@JsonKey() List<VentorRewardTradeData> get trades {
  if (_trades is EqualUnmodifiableListView) return _trades;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trades);
}

@override@JsonKey() final  bool historyLoaded;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String historyErrorMessage;
@override@JsonKey() final  bool isRedeeming;
@override@JsonKey() final  bool redeemSuccess;

/// Create a copy of VentorRewardsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorRewardsStateCopyWith<_VentorRewardsState> get copyWith => __$VentorRewardsStateCopyWithImpl<_VentorRewardsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorRewardsState&&(identical(other.rewardsStatus, rewardsStatus) || other.rewardsStatus == rewardsStatus)&&(identical(other.rewards, rewards) || other.rewards == rewards)&&(identical(other.historyStatus, historyStatus) || other.historyStatus == historyStatus)&&const DeepCollectionEquality().equals(other._trades, _trades)&&(identical(other.historyLoaded, historyLoaded) || other.historyLoaded == historyLoaded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.historyErrorMessage, historyErrorMessage) || other.historyErrorMessage == historyErrorMessage)&&(identical(other.isRedeeming, isRedeeming) || other.isRedeeming == isRedeeming)&&(identical(other.redeemSuccess, redeemSuccess) || other.redeemSuccess == redeemSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,rewardsStatus,rewards,historyStatus,const DeepCollectionEquality().hash(_trades),historyLoaded,errorMessage,historyErrorMessage,isRedeeming,redeemSuccess);

@override
String toString() {
  return 'VentorRewardsState(rewardsStatus: $rewardsStatus, rewards: $rewards, historyStatus: $historyStatus, trades: $trades, historyLoaded: $historyLoaded, errorMessage: $errorMessage, historyErrorMessage: $historyErrorMessage, isRedeeming: $isRedeeming, redeemSuccess: $redeemSuccess)';
}


}

/// @nodoc
abstract mixin class _$VentorRewardsStateCopyWith<$Res> implements $VentorRewardsStateCopyWith<$Res> {
  factory _$VentorRewardsStateCopyWith(_VentorRewardsState value, $Res Function(_VentorRewardsState) _then) = __$VentorRewardsStateCopyWithImpl;
@override @useResult
$Res call({
 VentorRewardsStatus rewardsStatus, VentorRewardsOverviewData? rewards, VentorRewardsHistoryStatus historyStatus, List<VentorRewardTradeData> trades, bool historyLoaded, String errorMessage, String historyErrorMessage, bool isRedeeming, bool redeemSuccess
});




}
/// @nodoc
class __$VentorRewardsStateCopyWithImpl<$Res>
    implements _$VentorRewardsStateCopyWith<$Res> {
  __$VentorRewardsStateCopyWithImpl(this._self, this._then);

  final _VentorRewardsState _self;
  final $Res Function(_VentorRewardsState) _then;

/// Create a copy of VentorRewardsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rewardsStatus = null,Object? rewards = freezed,Object? historyStatus = null,Object? trades = null,Object? historyLoaded = null,Object? errorMessage = null,Object? historyErrorMessage = null,Object? isRedeeming = null,Object? redeemSuccess = null,}) {
  return _then(_VentorRewardsState(
rewardsStatus: null == rewardsStatus ? _self.rewardsStatus : rewardsStatus // ignore: cast_nullable_to_non_nullable
as VentorRewardsStatus,rewards: freezed == rewards ? _self.rewards : rewards // ignore: cast_nullable_to_non_nullable
as VentorRewardsOverviewData?,historyStatus: null == historyStatus ? _self.historyStatus : historyStatus // ignore: cast_nullable_to_non_nullable
as VentorRewardsHistoryStatus,trades: null == trades ? _self._trades : trades // ignore: cast_nullable_to_non_nullable
as List<VentorRewardTradeData>,historyLoaded: null == historyLoaded ? _self.historyLoaded : historyLoaded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,historyErrorMessage: null == historyErrorMessage ? _self.historyErrorMessage : historyErrorMessage // ignore: cast_nullable_to_non_nullable
as String,isRedeeming: null == isRedeeming ? _self.isRedeeming : isRedeeming // ignore: cast_nullable_to_non_nullable
as bool,redeemSuccess: null == redeemSuccess ? _self.redeemSuccess : redeemSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
