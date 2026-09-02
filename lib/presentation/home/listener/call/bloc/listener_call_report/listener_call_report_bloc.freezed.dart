// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_call_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerCallReportEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerCallReportEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerCallReportEvent()';
}


}

/// @nodoc
class $ListenerCallReportEventCopyWith<$Res>  {
$ListenerCallReportEventCopyWith(ListenerCallReportEvent _, $Res Function(ListenerCallReportEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerCallReportEvent].
extension ListenerCallReportEventPatterns on ListenerCallReportEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ReasonSelected value)?  reasonSelected,TResult Function( _SubmitRequested value)?  submitRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReasonSelected() when reasonSelected != null:
return reasonSelected(_that);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ReasonSelected value)  reasonSelected,required TResult Function( _SubmitRequested value)  submitRequested,}){
final _that = this;
switch (_that) {
case _ReasonSelected():
return reasonSelected(_that);case _SubmitRequested():
return submitRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ReasonSelected value)?  reasonSelected,TResult? Function( _SubmitRequested value)?  submitRequested,}){
final _that = this;
switch (_that) {
case _ReasonSelected() when reasonSelected != null:
return reasonSelected(_that);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ListenerCallReportReason reason)?  reasonSelected,TResult Function( String sessionId)?  submitRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReasonSelected() when reasonSelected != null:
return reasonSelected(_that.reason);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ListenerCallReportReason reason)  reasonSelected,required TResult Function( String sessionId)  submitRequested,}) {final _that = this;
switch (_that) {
case _ReasonSelected():
return reasonSelected(_that.reason);case _SubmitRequested():
return submitRequested(_that.sessionId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ListenerCallReportReason reason)?  reasonSelected,TResult? Function( String sessionId)?  submitRequested,}) {final _that = this;
switch (_that) {
case _ReasonSelected() when reasonSelected != null:
return reasonSelected(_that.reason);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc


class _ReasonSelected implements ListenerCallReportEvent {
  const _ReasonSelected(this.reason);
  

 final  ListenerCallReportReason reason;

/// Create a copy of ListenerCallReportEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReasonSelectedCopyWith<_ReasonSelected> get copyWith => __$ReasonSelectedCopyWithImpl<_ReasonSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReasonSelected&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'ListenerCallReportEvent.reasonSelected(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$ReasonSelectedCopyWith<$Res> implements $ListenerCallReportEventCopyWith<$Res> {
  factory _$ReasonSelectedCopyWith(_ReasonSelected value, $Res Function(_ReasonSelected) _then) = __$ReasonSelectedCopyWithImpl;
@useResult
$Res call({
 ListenerCallReportReason reason
});




}
/// @nodoc
class __$ReasonSelectedCopyWithImpl<$Res>
    implements _$ReasonSelectedCopyWith<$Res> {
  __$ReasonSelectedCopyWithImpl(this._self, this._then);

  final _ReasonSelected _self;
  final $Res Function(_ReasonSelected) _then;

/// Create a copy of ListenerCallReportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_ReasonSelected(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ListenerCallReportReason,
  ));
}


}

/// @nodoc


class _SubmitRequested implements ListenerCallReportEvent {
  const _SubmitRequested({required this.sessionId});
  

 final  String sessionId;

/// Create a copy of ListenerCallReportEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitRequestedCopyWith<_SubmitRequested> get copyWith => __$SubmitRequestedCopyWithImpl<_SubmitRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitRequested&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'ListenerCallReportEvent.submitRequested(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$SubmitRequestedCopyWith<$Res> implements $ListenerCallReportEventCopyWith<$Res> {
  factory _$SubmitRequestedCopyWith(_SubmitRequested value, $Res Function(_SubmitRequested) _then) = __$SubmitRequestedCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class __$SubmitRequestedCopyWithImpl<$Res>
    implements _$SubmitRequestedCopyWith<$Res> {
  __$SubmitRequestedCopyWithImpl(this._self, this._then);

  final _SubmitRequested _self;
  final $Res Function(_SubmitRequested) _then;

/// Create a copy of ListenerCallReportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_SubmitRequested(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ListenerCallReportState {

 ListenerCallReportStatus get status; ListenerCallReportReason? get selectedReason; bool get submitSucceeded; String get errorMessage;
/// Create a copy of ListenerCallReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerCallReportStateCopyWith<ListenerCallReportState> get copyWith => _$ListenerCallReportStateCopyWithImpl<ListenerCallReportState>(this as ListenerCallReportState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerCallReportState&&(identical(other.status, status) || other.status == status)&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason)&&(identical(other.submitSucceeded, submitSucceeded) || other.submitSucceeded == submitSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,selectedReason,submitSucceeded,errorMessage);

@override
String toString() {
  return 'ListenerCallReportState(status: $status, selectedReason: $selectedReason, submitSucceeded: $submitSucceeded, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerCallReportStateCopyWith<$Res>  {
  factory $ListenerCallReportStateCopyWith(ListenerCallReportState value, $Res Function(ListenerCallReportState) _then) = _$ListenerCallReportStateCopyWithImpl;
@useResult
$Res call({
 ListenerCallReportStatus status, ListenerCallReportReason? selectedReason, bool submitSucceeded, String errorMessage
});




}
/// @nodoc
class _$ListenerCallReportStateCopyWithImpl<$Res>
    implements $ListenerCallReportStateCopyWith<$Res> {
  _$ListenerCallReportStateCopyWithImpl(this._self, this._then);

  final ListenerCallReportState _self;
  final $Res Function(ListenerCallReportState) _then;

/// Create a copy of ListenerCallReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? selectedReason = freezed,Object? submitSucceeded = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerCallReportStatus,selectedReason: freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as ListenerCallReportReason?,submitSucceeded: null == submitSucceeded ? _self.submitSucceeded : submitSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerCallReportState].
extension ListenerCallReportStatePatterns on ListenerCallReportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerCallReportState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerCallReportState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerCallReportState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerCallReportState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerCallReportState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerCallReportState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerCallReportStatus status,  ListenerCallReportReason? selectedReason,  bool submitSucceeded,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerCallReportState() when $default != null:
return $default(_that.status,_that.selectedReason,_that.submitSucceeded,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerCallReportStatus status,  ListenerCallReportReason? selectedReason,  bool submitSucceeded,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerCallReportState():
return $default(_that.status,_that.selectedReason,_that.submitSucceeded,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerCallReportStatus status,  ListenerCallReportReason? selectedReason,  bool submitSucceeded,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerCallReportState() when $default != null:
return $default(_that.status,_that.selectedReason,_that.submitSucceeded,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerCallReportState extends ListenerCallReportState {
  const _ListenerCallReportState({this.status = ListenerCallReportStatus.ready, this.selectedReason, this.submitSucceeded = false, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  ListenerCallReportStatus status;
@override final  ListenerCallReportReason? selectedReason;
@override@JsonKey() final  bool submitSucceeded;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerCallReportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerCallReportStateCopyWith<_ListenerCallReportState> get copyWith => __$ListenerCallReportStateCopyWithImpl<_ListenerCallReportState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerCallReportState&&(identical(other.status, status) || other.status == status)&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason)&&(identical(other.submitSucceeded, submitSucceeded) || other.submitSucceeded == submitSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,selectedReason,submitSucceeded,errorMessage);

@override
String toString() {
  return 'ListenerCallReportState(status: $status, selectedReason: $selectedReason, submitSucceeded: $submitSucceeded, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerCallReportStateCopyWith<$Res> implements $ListenerCallReportStateCopyWith<$Res> {
  factory _$ListenerCallReportStateCopyWith(_ListenerCallReportState value, $Res Function(_ListenerCallReportState) _then) = __$ListenerCallReportStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerCallReportStatus status, ListenerCallReportReason? selectedReason, bool submitSucceeded, String errorMessage
});




}
/// @nodoc
class __$ListenerCallReportStateCopyWithImpl<$Res>
    implements _$ListenerCallReportStateCopyWith<$Res> {
  __$ListenerCallReportStateCopyWithImpl(this._self, this._then);

  final _ListenerCallReportState _self;
  final $Res Function(_ListenerCallReportState) _then;

/// Create a copy of ListenerCallReportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? selectedReason = freezed,Object? submitSucceeded = null,Object? errorMessage = null,}) {
  return _then(_ListenerCallReportState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerCallReportStatus,selectedReason: freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as ListenerCallReportReason?,submitSucceeded: null == submitSucceeded ? _self.submitSucceeded : submitSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
