// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_sessions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerSessionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerSessionsEvent()';
}


}

/// @nodoc
class $ListenerSessionsEventCopyWith<$Res>  {
$ListenerSessionsEventCopyWith(ListenerSessionsEvent _, $Res Function(ListenerSessionsEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerSessionsEvent].
extension ListenerSessionsEventPatterns on ListenerSessionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _AcceptRequestRequested value)?  acceptRequestRequested,TResult Function( _DeclineRequestRequested value)?  declineRequestRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _AcceptRequestRequested() when acceptRequestRequested != null:
return acceptRequestRequested(_that);case _DeclineRequestRequested() when declineRequestRequested != null:
return declineRequestRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _AcceptRequestRequested value)  acceptRequestRequested,required TResult Function( _DeclineRequestRequested value)  declineRequestRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _RefreshRequested():
return refreshRequested(_that);case _AcceptRequestRequested():
return acceptRequestRequested(_that);case _DeclineRequestRequested():
return declineRequestRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _AcceptRequestRequested value)?  acceptRequestRequested,TResult? Function( _DeclineRequestRequested value)?  declineRequestRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _AcceptRequestRequested() when acceptRequestRequested != null:
return acceptRequestRequested(_that);case _DeclineRequestRequested() when declineRequestRequested != null:
return declineRequestRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function()?  refreshRequested,TResult Function( String requestId)?  acceptRequestRequested,TResult Function( String requestId)?  declineRequestRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _AcceptRequestRequested() when acceptRequestRequested != null:
return acceptRequestRequested(_that.requestId);case _DeclineRequestRequested() when declineRequestRequested != null:
return declineRequestRequested(_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function()  refreshRequested,required TResult Function( String requestId)  acceptRequestRequested,required TResult Function( String requestId)  declineRequestRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _RefreshRequested():
return refreshRequested();case _AcceptRequestRequested():
return acceptRequestRequested(_that.requestId);case _DeclineRequestRequested():
return declineRequestRequested(_that.requestId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function()?  refreshRequested,TResult? Function( String requestId)?  acceptRequestRequested,TResult? Function( String requestId)?  declineRequestRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _AcceptRequestRequested() when acceptRequestRequested != null:
return acceptRequestRequested(_that.requestId);case _DeclineRequestRequested() when declineRequestRequested != null:
return declineRequestRequested(_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerSessionsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerSessionsEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements ListenerSessionsEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerSessionsEvent.retryLoad()';
}


}




/// @nodoc


class _RefreshRequested implements ListenerSessionsEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerSessionsEvent.refreshRequested()';
}


}




/// @nodoc


class _AcceptRequestRequested implements ListenerSessionsEvent {
  const _AcceptRequestRequested({required this.requestId});
  

 final  String requestId;

/// Create a copy of ListenerSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptRequestRequestedCopyWith<_AcceptRequestRequested> get copyWith => __$AcceptRequestRequestedCopyWithImpl<_AcceptRequestRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptRequestRequested&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'ListenerSessionsEvent.acceptRequestRequested(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$AcceptRequestRequestedCopyWith<$Res> implements $ListenerSessionsEventCopyWith<$Res> {
  factory _$AcceptRequestRequestedCopyWith(_AcceptRequestRequested value, $Res Function(_AcceptRequestRequested) _then) = __$AcceptRequestRequestedCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class __$AcceptRequestRequestedCopyWithImpl<$Res>
    implements _$AcceptRequestRequestedCopyWith<$Res> {
  __$AcceptRequestRequestedCopyWithImpl(this._self, this._then);

  final _AcceptRequestRequested _self;
  final $Res Function(_AcceptRequestRequested) _then;

/// Create a copy of ListenerSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(_AcceptRequestRequested(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeclineRequestRequested implements ListenerSessionsEvent {
  const _DeclineRequestRequested({required this.requestId});
  

 final  String requestId;

/// Create a copy of ListenerSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeclineRequestRequestedCopyWith<_DeclineRequestRequested> get copyWith => __$DeclineRequestRequestedCopyWithImpl<_DeclineRequestRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeclineRequestRequested&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'ListenerSessionsEvent.declineRequestRequested(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$DeclineRequestRequestedCopyWith<$Res> implements $ListenerSessionsEventCopyWith<$Res> {
  factory _$DeclineRequestRequestedCopyWith(_DeclineRequestRequested value, $Res Function(_DeclineRequestRequested) _then) = __$DeclineRequestRequestedCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class __$DeclineRequestRequestedCopyWithImpl<$Res>
    implements _$DeclineRequestRequestedCopyWith<$Res> {
  __$DeclineRequestRequestedCopyWithImpl(this._self, this._then);

  final _DeclineRequestRequested _self;
  final $Res Function(_DeclineRequestRequested) _then;

/// Create a copy of ListenerSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(_DeclineRequestRequested(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ListenerSessionsState {

 ListenerSessionsStatus get status; ListenerSessionsOverview? get overview; String get errorMessage; String get processingRequestId; bool get isProcessingRequest; ListenerSessionsActionFeedback get actionFeedback;
/// Create a copy of ListenerSessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerSessionsStateCopyWith<ListenerSessionsState> get copyWith => _$ListenerSessionsStateCopyWithImpl<ListenerSessionsState>(this as ListenerSessionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerSessionsState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.processingRequestId, processingRequestId) || other.processingRequestId == processingRequestId)&&(identical(other.isProcessingRequest, isProcessingRequest) || other.isProcessingRequest == isProcessingRequest)&&(identical(other.actionFeedback, actionFeedback) || other.actionFeedback == actionFeedback));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,errorMessage,processingRequestId,isProcessingRequest,actionFeedback);

@override
String toString() {
  return 'ListenerSessionsState(status: $status, overview: $overview, errorMessage: $errorMessage, processingRequestId: $processingRequestId, isProcessingRequest: $isProcessingRequest, actionFeedback: $actionFeedback)';
}


}

/// @nodoc
abstract mixin class $ListenerSessionsStateCopyWith<$Res>  {
  factory $ListenerSessionsStateCopyWith(ListenerSessionsState value, $Res Function(ListenerSessionsState) _then) = _$ListenerSessionsStateCopyWithImpl;
@useResult
$Res call({
 ListenerSessionsStatus status, ListenerSessionsOverview? overview, String errorMessage, String processingRequestId, bool isProcessingRequest, ListenerSessionsActionFeedback actionFeedback
});




}
/// @nodoc
class _$ListenerSessionsStateCopyWithImpl<$Res>
    implements $ListenerSessionsStateCopyWith<$Res> {
  _$ListenerSessionsStateCopyWithImpl(this._self, this._then);

  final ListenerSessionsState _self;
  final $Res Function(ListenerSessionsState) _then;

/// Create a copy of ListenerSessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? overview = freezed,Object? errorMessage = null,Object? processingRequestId = null,Object? isProcessingRequest = null,Object? actionFeedback = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerSessionsStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as ListenerSessionsOverview?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,processingRequestId: null == processingRequestId ? _self.processingRequestId : processingRequestId // ignore: cast_nullable_to_non_nullable
as String,isProcessingRequest: null == isProcessingRequest ? _self.isProcessingRequest : isProcessingRequest // ignore: cast_nullable_to_non_nullable
as bool,actionFeedback: null == actionFeedback ? _self.actionFeedback : actionFeedback // ignore: cast_nullable_to_non_nullable
as ListenerSessionsActionFeedback,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerSessionsState].
extension ListenerSessionsStatePatterns on ListenerSessionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerSessionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerSessionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerSessionsState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerSessionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerSessionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerSessionsStatus status,  ListenerSessionsOverview? overview,  String errorMessage,  String processingRequestId,  bool isProcessingRequest,  ListenerSessionsActionFeedback actionFeedback)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerSessionsState() when $default != null:
return $default(_that.status,_that.overview,_that.errorMessage,_that.processingRequestId,_that.isProcessingRequest,_that.actionFeedback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerSessionsStatus status,  ListenerSessionsOverview? overview,  String errorMessage,  String processingRequestId,  bool isProcessingRequest,  ListenerSessionsActionFeedback actionFeedback)  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionsState():
return $default(_that.status,_that.overview,_that.errorMessage,_that.processingRequestId,_that.isProcessingRequest,_that.actionFeedback);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerSessionsStatus status,  ListenerSessionsOverview? overview,  String errorMessage,  String processingRequestId,  bool isProcessingRequest,  ListenerSessionsActionFeedback actionFeedback)?  $default,) {final _that = this;
switch (_that) {
case _ListenerSessionsState() when $default != null:
return $default(_that.status,_that.overview,_that.errorMessage,_that.processingRequestId,_that.isProcessingRequest,_that.actionFeedback);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerSessionsState extends ListenerSessionsState {
  const _ListenerSessionsState({this.status = ListenerSessionsStatus.initial, this.overview, this.errorMessage = '', this.processingRequestId = '', this.isProcessingRequest = false, this.actionFeedback = ListenerSessionsActionFeedback.none}): super._();
  

@override@JsonKey() final  ListenerSessionsStatus status;
@override final  ListenerSessionsOverview? overview;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String processingRequestId;
@override@JsonKey() final  bool isProcessingRequest;
@override@JsonKey() final  ListenerSessionsActionFeedback actionFeedback;

/// Create a copy of ListenerSessionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerSessionsStateCopyWith<_ListenerSessionsState> get copyWith => __$ListenerSessionsStateCopyWithImpl<_ListenerSessionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerSessionsState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.processingRequestId, processingRequestId) || other.processingRequestId == processingRequestId)&&(identical(other.isProcessingRequest, isProcessingRequest) || other.isProcessingRequest == isProcessingRequest)&&(identical(other.actionFeedback, actionFeedback) || other.actionFeedback == actionFeedback));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,errorMessage,processingRequestId,isProcessingRequest,actionFeedback);

@override
String toString() {
  return 'ListenerSessionsState(status: $status, overview: $overview, errorMessage: $errorMessage, processingRequestId: $processingRequestId, isProcessingRequest: $isProcessingRequest, actionFeedback: $actionFeedback)';
}


}

/// @nodoc
abstract mixin class _$ListenerSessionsStateCopyWith<$Res> implements $ListenerSessionsStateCopyWith<$Res> {
  factory _$ListenerSessionsStateCopyWith(_ListenerSessionsState value, $Res Function(_ListenerSessionsState) _then) = __$ListenerSessionsStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerSessionsStatus status, ListenerSessionsOverview? overview, String errorMessage, String processingRequestId, bool isProcessingRequest, ListenerSessionsActionFeedback actionFeedback
});




}
/// @nodoc
class __$ListenerSessionsStateCopyWithImpl<$Res>
    implements _$ListenerSessionsStateCopyWith<$Res> {
  __$ListenerSessionsStateCopyWithImpl(this._self, this._then);

  final _ListenerSessionsState _self;
  final $Res Function(_ListenerSessionsState) _then;

/// Create a copy of ListenerSessionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? overview = freezed,Object? errorMessage = null,Object? processingRequestId = null,Object? isProcessingRequest = null,Object? actionFeedback = null,}) {
  return _then(_ListenerSessionsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerSessionsStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as ListenerSessionsOverview?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,processingRequestId: null == processingRequestId ? _self.processingRequestId : processingRequestId // ignore: cast_nullable_to_non_nullable
as String,isProcessingRequest: null == isProcessingRequest ? _self.isProcessingRequest : isProcessingRequest // ignore: cast_nullable_to_non_nullable
as bool,actionFeedback: null == actionFeedback ? _self.actionFeedback : actionFeedback // ignore: cast_nullable_to_non_nullable
as ListenerSessionsActionFeedback,
  ));
}


}

// dart format on
