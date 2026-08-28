// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_availability_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerAvailabilityEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAvailabilityEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerAvailabilityEvent()';
}


}

/// @nodoc
class $ListenerAvailabilityEventCopyWith<$Res>  {
$ListenerAvailabilityEventCopyWith(ListenerAvailabilityEvent _, $Res Function(ListenerAvailabilityEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerAvailabilityEvent].
extension ListenerAvailabilityEventPatterns on ListenerAvailabilityEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _OnlineStatusChanged value)?  onlineStatusChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _OnlineStatusChanged() when onlineStatusChanged != null:
return onlineStatusChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _OnlineStatusChanged value)  onlineStatusChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _OnlineStatusChanged():
return onlineStatusChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _OnlineStatusChanged value)?  onlineStatusChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _OnlineStatusChanged() when onlineStatusChanged != null:
return onlineStatusChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( bool isOnline)?  onlineStatusChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _OnlineStatusChanged() when onlineStatusChanged != null:
return onlineStatusChanged(_that.isOnline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( bool isOnline)  onlineStatusChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _OnlineStatusChanged():
return onlineStatusChanged(_that.isOnline);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( bool isOnline)?  onlineStatusChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _OnlineStatusChanged() when onlineStatusChanged != null:
return onlineStatusChanged(_that.isOnline);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerAvailabilityEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerAvailabilityEvent.started()';
}


}




/// @nodoc


class _OnlineStatusChanged implements ListenerAvailabilityEvent {
  const _OnlineStatusChanged({required this.isOnline});
  

 final  bool isOnline;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnlineStatusChangedCopyWith<_OnlineStatusChanged> get copyWith => __$OnlineStatusChangedCopyWithImpl<_OnlineStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnlineStatusChanged&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}


@override
int get hashCode => Object.hash(runtimeType,isOnline);

@override
String toString() {
  return 'ListenerAvailabilityEvent.onlineStatusChanged(isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$OnlineStatusChangedCopyWith<$Res> implements $ListenerAvailabilityEventCopyWith<$Res> {
  factory _$OnlineStatusChangedCopyWith(_OnlineStatusChanged value, $Res Function(_OnlineStatusChanged) _then) = __$OnlineStatusChangedCopyWithImpl;
@useResult
$Res call({
 bool isOnline
});




}
/// @nodoc
class __$OnlineStatusChangedCopyWithImpl<$Res>
    implements _$OnlineStatusChangedCopyWith<$Res> {
  __$OnlineStatusChangedCopyWithImpl(this._self, this._then);

  final _OnlineStatusChanged _self;
  final $Res Function(_OnlineStatusChanged) _then;

/// Create a copy of ListenerAvailabilityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isOnline = null,}) {
  return _then(_OnlineStatusChanged(
isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ListenerAvailabilityState {

 ListenerAvailabilityStatus get status; bool get isOnline; bool get isSavingOnline; String get errorMessage;
/// Create a copy of ListenerAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerAvailabilityStateCopyWith<ListenerAvailabilityState> get copyWith => _$ListenerAvailabilityStateCopyWithImpl<ListenerAvailabilityState>(this as ListenerAvailabilityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerAvailabilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.isSavingOnline, isSavingOnline) || other.isSavingOnline == isSavingOnline)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isOnline,isSavingOnline,errorMessage);

@override
String toString() {
  return 'ListenerAvailabilityState(status: $status, isOnline: $isOnline, isSavingOnline: $isSavingOnline, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerAvailabilityStateCopyWith<$Res>  {
  factory $ListenerAvailabilityStateCopyWith(ListenerAvailabilityState value, $Res Function(ListenerAvailabilityState) _then) = _$ListenerAvailabilityStateCopyWithImpl;
@useResult
$Res call({
 ListenerAvailabilityStatus status, bool isOnline, bool isSavingOnline, String errorMessage
});




}
/// @nodoc
class _$ListenerAvailabilityStateCopyWithImpl<$Res>
    implements $ListenerAvailabilityStateCopyWith<$Res> {
  _$ListenerAvailabilityStateCopyWithImpl(this._self, this._then);

  final ListenerAvailabilityState _self;
  final $Res Function(ListenerAvailabilityState) _then;

/// Create a copy of ListenerAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isOnline = null,Object? isSavingOnline = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilityStatus,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,isSavingOnline: null == isSavingOnline ? _self.isSavingOnline : isSavingOnline // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerAvailabilityState].
extension ListenerAvailabilityStatePatterns on ListenerAvailabilityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerAvailabilityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerAvailabilityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerAvailabilityState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerAvailabilityState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerAvailabilityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerAvailabilityStatus status,  bool isOnline,  bool isSavingOnline,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerAvailabilityState() when $default != null:
return $default(_that.status,_that.isOnline,_that.isSavingOnline,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerAvailabilityStatus status,  bool isOnline,  bool isSavingOnline,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityState():
return $default(_that.status,_that.isOnline,_that.isSavingOnline,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerAvailabilityStatus status,  bool isOnline,  bool isSavingOnline,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerAvailabilityState() when $default != null:
return $default(_that.status,_that.isOnline,_that.isSavingOnline,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerAvailabilityState extends ListenerAvailabilityState {
  const _ListenerAvailabilityState({this.status = ListenerAvailabilityStatus.initial, this.isOnline = false, this.isSavingOnline = false, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  ListenerAvailabilityStatus status;
@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  bool isSavingOnline;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerAvailabilityStateCopyWith<_ListenerAvailabilityState> get copyWith => __$ListenerAvailabilityStateCopyWithImpl<_ListenerAvailabilityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerAvailabilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.isSavingOnline, isSavingOnline) || other.isSavingOnline == isSavingOnline)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isOnline,isSavingOnline,errorMessage);

@override
String toString() {
  return 'ListenerAvailabilityState(status: $status, isOnline: $isOnline, isSavingOnline: $isSavingOnline, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerAvailabilityStateCopyWith<$Res> implements $ListenerAvailabilityStateCopyWith<$Res> {
  factory _$ListenerAvailabilityStateCopyWith(_ListenerAvailabilityState value, $Res Function(_ListenerAvailabilityState) _then) = __$ListenerAvailabilityStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerAvailabilityStatus status, bool isOnline, bool isSavingOnline, String errorMessage
});




}
/// @nodoc
class __$ListenerAvailabilityStateCopyWithImpl<$Res>
    implements _$ListenerAvailabilityStateCopyWith<$Res> {
  __$ListenerAvailabilityStateCopyWithImpl(this._self, this._then);

  final _ListenerAvailabilityState _self;
  final $Res Function(_ListenerAvailabilityState) _then;

/// Create a copy of ListenerAvailabilityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isOnline = null,Object? isSavingOnline = null,Object? errorMessage = null,}) {
  return _then(_ListenerAvailabilityState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerAvailabilityStatus,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,isSavingOnline: null == isSavingOnline ? _self.isSavingOnline : isSavingOnline // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
