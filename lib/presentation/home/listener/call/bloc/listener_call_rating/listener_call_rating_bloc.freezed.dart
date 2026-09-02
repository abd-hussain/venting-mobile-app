// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_call_rating_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerCallRatingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerCallRatingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerCallRatingEvent()';
}


}

/// @nodoc
class $ListenerCallRatingEventCopyWith<$Res>  {
$ListenerCallRatingEventCopyWith(ListenerCallRatingEvent _, $Res Function(ListenerCallRatingEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerCallRatingEvent].
extension ListenerCallRatingEventPatterns on ListenerCallRatingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StarsChanged value)?  starsChanged,TResult Function( _FeltHeardChanged value)?  feltHeardChanged,TResult Function( _TalkAgainChanged value)?  talkAgainChanged,TResult Function( _SubmitRequested value)?  submitRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StarsChanged() when starsChanged != null:
return starsChanged(_that);case _FeltHeardChanged() when feltHeardChanged != null:
return feltHeardChanged(_that);case _TalkAgainChanged() when talkAgainChanged != null:
return talkAgainChanged(_that);case _SubmitRequested() when submitRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StarsChanged value)  starsChanged,required TResult Function( _FeltHeardChanged value)  feltHeardChanged,required TResult Function( _TalkAgainChanged value)  talkAgainChanged,required TResult Function( _SubmitRequested value)  submitRequested,}){
final _that = this;
switch (_that) {
case _StarsChanged():
return starsChanged(_that);case _FeltHeardChanged():
return feltHeardChanged(_that);case _TalkAgainChanged():
return talkAgainChanged(_that);case _SubmitRequested():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StarsChanged value)?  starsChanged,TResult? Function( _FeltHeardChanged value)?  feltHeardChanged,TResult? Function( _TalkAgainChanged value)?  talkAgainChanged,TResult? Function( _SubmitRequested value)?  submitRequested,}){
final _that = this;
switch (_that) {
case _StarsChanged() when starsChanged != null:
return starsChanged(_that);case _FeltHeardChanged() when feltHeardChanged != null:
return feltHeardChanged(_that);case _TalkAgainChanged() when talkAgainChanged != null:
return talkAgainChanged(_that);case _SubmitRequested() when submitRequested != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int stars)?  starsChanged,TResult Function( bool value)?  feltHeardChanged,TResult Function( bool value)?  talkAgainChanged,TResult Function( String sessionId)?  submitRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StarsChanged() when starsChanged != null:
return starsChanged(_that.stars);case _FeltHeardChanged() when feltHeardChanged != null:
return feltHeardChanged(_that.value);case _TalkAgainChanged() when talkAgainChanged != null:
return talkAgainChanged(_that.value);case _SubmitRequested() when submitRequested != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int stars)  starsChanged,required TResult Function( bool value)  feltHeardChanged,required TResult Function( bool value)  talkAgainChanged,required TResult Function( String sessionId)  submitRequested,}) {final _that = this;
switch (_that) {
case _StarsChanged():
return starsChanged(_that.stars);case _FeltHeardChanged():
return feltHeardChanged(_that.value);case _TalkAgainChanged():
return talkAgainChanged(_that.value);case _SubmitRequested():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int stars)?  starsChanged,TResult? Function( bool value)?  feltHeardChanged,TResult? Function( bool value)?  talkAgainChanged,TResult? Function( String sessionId)?  submitRequested,}) {final _that = this;
switch (_that) {
case _StarsChanged() when starsChanged != null:
return starsChanged(_that.stars);case _FeltHeardChanged() when feltHeardChanged != null:
return feltHeardChanged(_that.value);case _TalkAgainChanged() when talkAgainChanged != null:
return talkAgainChanged(_that.value);case _SubmitRequested() when submitRequested != null:
return submitRequested(_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc


class _StarsChanged implements ListenerCallRatingEvent {
  const _StarsChanged(this.stars);
  

 final  int stars;

/// Create a copy of ListenerCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StarsChangedCopyWith<_StarsChanged> get copyWith => __$StarsChangedCopyWithImpl<_StarsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StarsChanged&&(identical(other.stars, stars) || other.stars == stars));
}


@override
int get hashCode => Object.hash(runtimeType,stars);

@override
String toString() {
  return 'ListenerCallRatingEvent.starsChanged(stars: $stars)';
}


}

/// @nodoc
abstract mixin class _$StarsChangedCopyWith<$Res> implements $ListenerCallRatingEventCopyWith<$Res> {
  factory _$StarsChangedCopyWith(_StarsChanged value, $Res Function(_StarsChanged) _then) = __$StarsChangedCopyWithImpl;
@useResult
$Res call({
 int stars
});




}
/// @nodoc
class __$StarsChangedCopyWithImpl<$Res>
    implements _$StarsChangedCopyWith<$Res> {
  __$StarsChangedCopyWithImpl(this._self, this._then);

  final _StarsChanged _self;
  final $Res Function(_StarsChanged) _then;

/// Create a copy of ListenerCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stars = null,}) {
  return _then(_StarsChanged(
null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FeltHeardChanged implements ListenerCallRatingEvent {
  const _FeltHeardChanged(this.value);
  

 final  bool value;

/// Create a copy of ListenerCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeltHeardChangedCopyWith<_FeltHeardChanged> get copyWith => __$FeltHeardChangedCopyWithImpl<_FeltHeardChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeltHeardChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ListenerCallRatingEvent.feltHeardChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$FeltHeardChangedCopyWith<$Res> implements $ListenerCallRatingEventCopyWith<$Res> {
  factory _$FeltHeardChangedCopyWith(_FeltHeardChanged value, $Res Function(_FeltHeardChanged) _then) = __$FeltHeardChangedCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class __$FeltHeardChangedCopyWithImpl<$Res>
    implements _$FeltHeardChangedCopyWith<$Res> {
  __$FeltHeardChangedCopyWithImpl(this._self, this._then);

  final _FeltHeardChanged _self;
  final $Res Function(_FeltHeardChanged) _then;

/// Create a copy of ListenerCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_FeltHeardChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _TalkAgainChanged implements ListenerCallRatingEvent {
  const _TalkAgainChanged(this.value);
  

 final  bool value;

/// Create a copy of ListenerCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TalkAgainChangedCopyWith<_TalkAgainChanged> get copyWith => __$TalkAgainChangedCopyWithImpl<_TalkAgainChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TalkAgainChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ListenerCallRatingEvent.talkAgainChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$TalkAgainChangedCopyWith<$Res> implements $ListenerCallRatingEventCopyWith<$Res> {
  factory _$TalkAgainChangedCopyWith(_TalkAgainChanged value, $Res Function(_TalkAgainChanged) _then) = __$TalkAgainChangedCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class __$TalkAgainChangedCopyWithImpl<$Res>
    implements _$TalkAgainChangedCopyWith<$Res> {
  __$TalkAgainChangedCopyWithImpl(this._self, this._then);

  final _TalkAgainChanged _self;
  final $Res Function(_TalkAgainChanged) _then;

/// Create a copy of ListenerCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_TalkAgainChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SubmitRequested implements ListenerCallRatingEvent {
  const _SubmitRequested({required this.sessionId});
  

 final  String sessionId;

/// Create a copy of ListenerCallRatingEvent
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
  return 'ListenerCallRatingEvent.submitRequested(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$SubmitRequestedCopyWith<$Res> implements $ListenerCallRatingEventCopyWith<$Res> {
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

/// Create a copy of ListenerCallRatingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_SubmitRequested(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ListenerCallRatingState {

 ListenerCallRatingStatus get status; int get stars; bool? get feltHeard; bool? get talkAgain; bool get submitSucceeded; String get errorMessage;
/// Create a copy of ListenerCallRatingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerCallRatingStateCopyWith<ListenerCallRatingState> get copyWith => _$ListenerCallRatingStateCopyWithImpl<ListenerCallRatingState>(this as ListenerCallRatingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerCallRatingState&&(identical(other.status, status) || other.status == status)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.feltHeard, feltHeard) || other.feltHeard == feltHeard)&&(identical(other.talkAgain, talkAgain) || other.talkAgain == talkAgain)&&(identical(other.submitSucceeded, submitSucceeded) || other.submitSucceeded == submitSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,stars,feltHeard,talkAgain,submitSucceeded,errorMessage);

@override
String toString() {
  return 'ListenerCallRatingState(status: $status, stars: $stars, feltHeard: $feltHeard, talkAgain: $talkAgain, submitSucceeded: $submitSucceeded, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerCallRatingStateCopyWith<$Res>  {
  factory $ListenerCallRatingStateCopyWith(ListenerCallRatingState value, $Res Function(ListenerCallRatingState) _then) = _$ListenerCallRatingStateCopyWithImpl;
@useResult
$Res call({
 ListenerCallRatingStatus status, int stars, bool? feltHeard, bool? talkAgain, bool submitSucceeded, String errorMessage
});




}
/// @nodoc
class _$ListenerCallRatingStateCopyWithImpl<$Res>
    implements $ListenerCallRatingStateCopyWith<$Res> {
  _$ListenerCallRatingStateCopyWithImpl(this._self, this._then);

  final ListenerCallRatingState _self;
  final $Res Function(ListenerCallRatingState) _then;

/// Create a copy of ListenerCallRatingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? stars = null,Object? feltHeard = freezed,Object? talkAgain = freezed,Object? submitSucceeded = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerCallRatingStatus,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,feltHeard: freezed == feltHeard ? _self.feltHeard : feltHeard // ignore: cast_nullable_to_non_nullable
as bool?,talkAgain: freezed == talkAgain ? _self.talkAgain : talkAgain // ignore: cast_nullable_to_non_nullable
as bool?,submitSucceeded: null == submitSucceeded ? _self.submitSucceeded : submitSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerCallRatingState].
extension ListenerCallRatingStatePatterns on ListenerCallRatingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerCallRatingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerCallRatingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerCallRatingState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerCallRatingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerCallRatingState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerCallRatingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerCallRatingStatus status,  int stars,  bool? feltHeard,  bool? talkAgain,  bool submitSucceeded,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerCallRatingState() when $default != null:
return $default(_that.status,_that.stars,_that.feltHeard,_that.talkAgain,_that.submitSucceeded,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerCallRatingStatus status,  int stars,  bool? feltHeard,  bool? talkAgain,  bool submitSucceeded,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerCallRatingState():
return $default(_that.status,_that.stars,_that.feltHeard,_that.talkAgain,_that.submitSucceeded,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerCallRatingStatus status,  int stars,  bool? feltHeard,  bool? talkAgain,  bool submitSucceeded,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerCallRatingState() when $default != null:
return $default(_that.status,_that.stars,_that.feltHeard,_that.talkAgain,_that.submitSucceeded,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerCallRatingState extends ListenerCallRatingState {
  const _ListenerCallRatingState({this.status = ListenerCallRatingStatus.ready, this.stars = 5, this.feltHeard, this.talkAgain, this.submitSucceeded = false, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  ListenerCallRatingStatus status;
@override@JsonKey() final  int stars;
@override final  bool? feltHeard;
@override final  bool? talkAgain;
@override@JsonKey() final  bool submitSucceeded;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerCallRatingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerCallRatingStateCopyWith<_ListenerCallRatingState> get copyWith => __$ListenerCallRatingStateCopyWithImpl<_ListenerCallRatingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerCallRatingState&&(identical(other.status, status) || other.status == status)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.feltHeard, feltHeard) || other.feltHeard == feltHeard)&&(identical(other.talkAgain, talkAgain) || other.talkAgain == talkAgain)&&(identical(other.submitSucceeded, submitSucceeded) || other.submitSucceeded == submitSucceeded)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,stars,feltHeard,talkAgain,submitSucceeded,errorMessage);

@override
String toString() {
  return 'ListenerCallRatingState(status: $status, stars: $stars, feltHeard: $feltHeard, talkAgain: $talkAgain, submitSucceeded: $submitSucceeded, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerCallRatingStateCopyWith<$Res> implements $ListenerCallRatingStateCopyWith<$Res> {
  factory _$ListenerCallRatingStateCopyWith(_ListenerCallRatingState value, $Res Function(_ListenerCallRatingState) _then) = __$ListenerCallRatingStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerCallRatingStatus status, int stars, bool? feltHeard, bool? talkAgain, bool submitSucceeded, String errorMessage
});




}
/// @nodoc
class __$ListenerCallRatingStateCopyWithImpl<$Res>
    implements _$ListenerCallRatingStateCopyWith<$Res> {
  __$ListenerCallRatingStateCopyWithImpl(this._self, this._then);

  final _ListenerCallRatingState _self;
  final $Res Function(_ListenerCallRatingState) _then;

/// Create a copy of ListenerCallRatingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? stars = null,Object? feltHeard = freezed,Object? talkAgain = freezed,Object? submitSucceeded = null,Object? errorMessage = null,}) {
  return _then(_ListenerCallRatingState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerCallRatingStatus,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,feltHeard: freezed == feltHeard ? _self.feltHeard : feltHeard // ignore: cast_nullable_to_non_nullable
as bool?,talkAgain: freezed == talkAgain ? _self.talkAgain : talkAgain // ignore: cast_nullable_to_non_nullable
as bool?,submitSucceeded: null == submitSucceeded ? _self.submitSucceeded : submitSucceeded // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
