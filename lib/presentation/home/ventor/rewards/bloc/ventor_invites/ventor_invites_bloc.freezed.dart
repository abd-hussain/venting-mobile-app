// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_invites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorInvitesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorInvitesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorInvitesEvent()';
}


}

/// @nodoc
class $VentorInvitesEventCopyWith<$Res>  {
$VentorInvitesEventCopyWith(VentorInvitesEvent _, $Res Function(VentorInvitesEvent) __);
}


/// Adds pattern-matching-related methods to [VentorInvitesEvent].
extension VentorInvitesEventPatterns on VentorInvitesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorInvitesEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorInvitesEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements VentorInvitesEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorInvitesEvent.retryLoad()';
}


}




/// @nodoc
mixin _$VentorInvitesState {

 VentorInvitesStatus get status; VentorInvitesOverviewData? get overview; String get errorMessage;
/// Create a copy of VentorInvitesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorInvitesStateCopyWith<VentorInvitesState> get copyWith => _$VentorInvitesStateCopyWithImpl<VentorInvitesState>(this as VentorInvitesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorInvitesState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,errorMessage);

@override
String toString() {
  return 'VentorInvitesState(status: $status, overview: $overview, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorInvitesStateCopyWith<$Res>  {
  factory $VentorInvitesStateCopyWith(VentorInvitesState value, $Res Function(VentorInvitesState) _then) = _$VentorInvitesStateCopyWithImpl;
@useResult
$Res call({
 VentorInvitesStatus status, VentorInvitesOverviewData? overview, String errorMessage
});




}
/// @nodoc
class _$VentorInvitesStateCopyWithImpl<$Res>
    implements $VentorInvitesStateCopyWith<$Res> {
  _$VentorInvitesStateCopyWithImpl(this._self, this._then);

  final VentorInvitesState _self;
  final $Res Function(VentorInvitesState) _then;

/// Create a copy of VentorInvitesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? overview = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorInvitesStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as VentorInvitesOverviewData?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorInvitesState].
extension VentorInvitesStatePatterns on VentorInvitesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorInvitesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorInvitesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorInvitesState value)  $default,){
final _that = this;
switch (_that) {
case _VentorInvitesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorInvitesState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorInvitesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorInvitesStatus status,  VentorInvitesOverviewData? overview,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorInvitesState() when $default != null:
return $default(_that.status,_that.overview,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorInvitesStatus status,  VentorInvitesOverviewData? overview,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorInvitesState():
return $default(_that.status,_that.overview,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorInvitesStatus status,  VentorInvitesOverviewData? overview,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorInvitesState() when $default != null:
return $default(_that.status,_that.overview,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorInvitesState extends VentorInvitesState {
  const _VentorInvitesState({this.status = VentorInvitesStatus.initial, this.overview, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  VentorInvitesStatus status;
@override final  VentorInvitesOverviewData? overview;
@override@JsonKey() final  String errorMessage;

/// Create a copy of VentorInvitesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorInvitesStateCopyWith<_VentorInvitesState> get copyWith => __$VentorInvitesStateCopyWithImpl<_VentorInvitesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorInvitesState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,errorMessage);

@override
String toString() {
  return 'VentorInvitesState(status: $status, overview: $overview, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorInvitesStateCopyWith<$Res> implements $VentorInvitesStateCopyWith<$Res> {
  factory _$VentorInvitesStateCopyWith(_VentorInvitesState value, $Res Function(_VentorInvitesState) _then) = __$VentorInvitesStateCopyWithImpl;
@override @useResult
$Res call({
 VentorInvitesStatus status, VentorInvitesOverviewData? overview, String errorMessage
});




}
/// @nodoc
class __$VentorInvitesStateCopyWithImpl<$Res>
    implements _$VentorInvitesStateCopyWith<$Res> {
  __$VentorInvitesStateCopyWithImpl(this._self, this._then);

  final _VentorInvitesState _self;
  final $Res Function(_VentorInvitesState) _then;

/// Create a copy of VentorInvitesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? overview = freezed,Object? errorMessage = null,}) {
  return _then(_VentorInvitesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorInvitesStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as VentorInvitesOverviewData?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
