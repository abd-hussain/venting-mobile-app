// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_first_session_tutorial_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerFirstSessionTutorialEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerFirstSessionTutorialEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerFirstSessionTutorialEvent()';
}


}

/// @nodoc
class $ListenerFirstSessionTutorialEventCopyWith<$Res>  {
$ListenerFirstSessionTutorialEventCopyWith(ListenerFirstSessionTutorialEvent _, $Res Function(ListenerFirstSessionTutorialEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerFirstSessionTutorialEvent].
extension ListenerFirstSessionTutorialEventPatterns on ListenerFirstSessionTutorialEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AcknowledgeRequested value)?  acknowledgeRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AcknowledgeRequested() when acknowledgeRequested != null:
return acknowledgeRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AcknowledgeRequested value)  acknowledgeRequested,}){
final _that = this;
switch (_that) {
case _AcknowledgeRequested():
return acknowledgeRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AcknowledgeRequested value)?  acknowledgeRequested,}){
final _that = this;
switch (_that) {
case _AcknowledgeRequested() when acknowledgeRequested != null:
return acknowledgeRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  acknowledgeRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AcknowledgeRequested() when acknowledgeRequested != null:
return acknowledgeRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  acknowledgeRequested,}) {final _that = this;
switch (_that) {
case _AcknowledgeRequested():
return acknowledgeRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  acknowledgeRequested,}) {final _that = this;
switch (_that) {
case _AcknowledgeRequested() when acknowledgeRequested != null:
return acknowledgeRequested();case _:
  return null;

}
}

}

/// @nodoc


class _AcknowledgeRequested implements ListenerFirstSessionTutorialEvent {
  const _AcknowledgeRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcknowledgeRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerFirstSessionTutorialEvent.acknowledgeRequested()';
}


}




/// @nodoc
mixin _$ListenerFirstSessionTutorialState {

 bool get isSubmitting; bool get isAcknowledged; String get errorMessage;
/// Create a copy of ListenerFirstSessionTutorialState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerFirstSessionTutorialStateCopyWith<ListenerFirstSessionTutorialState> get copyWith => _$ListenerFirstSessionTutorialStateCopyWithImpl<ListenerFirstSessionTutorialState>(this as ListenerFirstSessionTutorialState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerFirstSessionTutorialState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isAcknowledged, isAcknowledged) || other.isAcknowledged == isAcknowledged)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,isAcknowledged,errorMessage);

@override
String toString() {
  return 'ListenerFirstSessionTutorialState(isSubmitting: $isSubmitting, isAcknowledged: $isAcknowledged, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerFirstSessionTutorialStateCopyWith<$Res>  {
  factory $ListenerFirstSessionTutorialStateCopyWith(ListenerFirstSessionTutorialState value, $Res Function(ListenerFirstSessionTutorialState) _then) = _$ListenerFirstSessionTutorialStateCopyWithImpl;
@useResult
$Res call({
 bool isSubmitting, bool isAcknowledged, String errorMessage
});




}
/// @nodoc
class _$ListenerFirstSessionTutorialStateCopyWithImpl<$Res>
    implements $ListenerFirstSessionTutorialStateCopyWith<$Res> {
  _$ListenerFirstSessionTutorialStateCopyWithImpl(this._self, this._then);

  final ListenerFirstSessionTutorialState _self;
  final $Res Function(ListenerFirstSessionTutorialState) _then;

/// Create a copy of ListenerFirstSessionTutorialState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSubmitting = null,Object? isAcknowledged = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isAcknowledged: null == isAcknowledged ? _self.isAcknowledged : isAcknowledged // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerFirstSessionTutorialState].
extension ListenerFirstSessionTutorialStatePatterns on ListenerFirstSessionTutorialState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerFirstSessionTutorialState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerFirstSessionTutorialState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerFirstSessionTutorialState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerFirstSessionTutorialState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerFirstSessionTutorialState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerFirstSessionTutorialState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSubmitting,  bool isAcknowledged,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerFirstSessionTutorialState() when $default != null:
return $default(_that.isSubmitting,_that.isAcknowledged,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSubmitting,  bool isAcknowledged,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerFirstSessionTutorialState():
return $default(_that.isSubmitting,_that.isAcknowledged,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSubmitting,  bool isAcknowledged,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerFirstSessionTutorialState() when $default != null:
return $default(_that.isSubmitting,_that.isAcknowledged,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerFirstSessionTutorialState implements ListenerFirstSessionTutorialState {
  const _ListenerFirstSessionTutorialState({this.isSubmitting = false, this.isAcknowledged = false, this.errorMessage = ''});
  

@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isAcknowledged;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerFirstSessionTutorialState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerFirstSessionTutorialStateCopyWith<_ListenerFirstSessionTutorialState> get copyWith => __$ListenerFirstSessionTutorialStateCopyWithImpl<_ListenerFirstSessionTutorialState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerFirstSessionTutorialState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isAcknowledged, isAcknowledged) || other.isAcknowledged == isAcknowledged)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,isAcknowledged,errorMessage);

@override
String toString() {
  return 'ListenerFirstSessionTutorialState(isSubmitting: $isSubmitting, isAcknowledged: $isAcknowledged, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerFirstSessionTutorialStateCopyWith<$Res> implements $ListenerFirstSessionTutorialStateCopyWith<$Res> {
  factory _$ListenerFirstSessionTutorialStateCopyWith(_ListenerFirstSessionTutorialState value, $Res Function(_ListenerFirstSessionTutorialState) _then) = __$ListenerFirstSessionTutorialStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSubmitting, bool isAcknowledged, String errorMessage
});




}
/// @nodoc
class __$ListenerFirstSessionTutorialStateCopyWithImpl<$Res>
    implements _$ListenerFirstSessionTutorialStateCopyWith<$Res> {
  __$ListenerFirstSessionTutorialStateCopyWithImpl(this._self, this._then);

  final _ListenerFirstSessionTutorialState _self;
  final $Res Function(_ListenerFirstSessionTutorialState) _then;

/// Create a copy of ListenerFirstSessionTutorialState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSubmitting = null,Object? isAcknowledged = null,Object? errorMessage = null,}) {
  return _then(_ListenerFirstSessionTutorialState(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isAcknowledged: null == isAcknowledged ? _self.isAcknowledged : isAcknowledged // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
