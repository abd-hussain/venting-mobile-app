// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorProfileEvent()';
}


}

/// @nodoc
class $VentorProfileEventCopyWith<$Res>  {
$VentorProfileEventCopyWith(VentorProfileEvent _, $Res Function(VentorProfileEvent) __);
}


/// Adds pattern-matching-related methods to [VentorProfileEvent].
extension VentorProfileEventPatterns on VentorProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _ProfileUpdateRequested value)?  profileUpdateRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _ProfileUpdateRequested() when profileUpdateRequested != null:
return profileUpdateRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _ProfileUpdateRequested value)  profileUpdateRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _RefreshRequested():
return refreshRequested(_that);case _ProfileUpdateRequested():
return profileUpdateRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _ProfileUpdateRequested value)?  profileUpdateRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _ProfileUpdateRequested() when profileUpdateRequested != null:
return profileUpdateRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function()?  refreshRequested,TResult Function( String? nickname,  String? avatarFilePath)?  profileUpdateRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _ProfileUpdateRequested() when profileUpdateRequested != null:
return profileUpdateRequested(_that.nickname,_that.avatarFilePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function()  refreshRequested,required TResult Function( String? nickname,  String? avatarFilePath)  profileUpdateRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _RefreshRequested():
return refreshRequested();case _ProfileUpdateRequested():
return profileUpdateRequested(_that.nickname,_that.avatarFilePath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function()?  refreshRequested,TResult? Function( String? nickname,  String? avatarFilePath)?  profileUpdateRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _ProfileUpdateRequested() when profileUpdateRequested != null:
return profileUpdateRequested(_that.nickname,_that.avatarFilePath);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorProfileEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorProfileEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements VentorProfileEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorProfileEvent.retryLoad()';
}


}




/// @nodoc


class _RefreshRequested implements VentorProfileEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorProfileEvent.refreshRequested()';
}


}




/// @nodoc


class _ProfileUpdateRequested implements VentorProfileEvent {
  const _ProfileUpdateRequested({this.nickname, this.avatarFilePath});
  

 final  String? nickname;
 final  String? avatarFilePath;

/// Create a copy of VentorProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileUpdateRequestedCopyWith<_ProfileUpdateRequested> get copyWith => __$ProfileUpdateRequestedCopyWithImpl<_ProfileUpdateRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUpdateRequested&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarFilePath, avatarFilePath) || other.avatarFilePath == avatarFilePath));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,avatarFilePath);

@override
String toString() {
  return 'VentorProfileEvent.profileUpdateRequested(nickname: $nickname, avatarFilePath: $avatarFilePath)';
}


}

/// @nodoc
abstract mixin class _$ProfileUpdateRequestedCopyWith<$Res> implements $VentorProfileEventCopyWith<$Res> {
  factory _$ProfileUpdateRequestedCopyWith(_ProfileUpdateRequested value, $Res Function(_ProfileUpdateRequested) _then) = __$ProfileUpdateRequestedCopyWithImpl;
@useResult
$Res call({
 String? nickname, String? avatarFilePath
});




}
/// @nodoc
class __$ProfileUpdateRequestedCopyWithImpl<$Res>
    implements _$ProfileUpdateRequestedCopyWith<$Res> {
  __$ProfileUpdateRequestedCopyWithImpl(this._self, this._then);

  final _ProfileUpdateRequested _self;
  final $Res Function(_ProfileUpdateRequested) _then;

/// Create a copy of VentorProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nickname = freezed,Object? avatarFilePath = freezed,}) {
  return _then(_ProfileUpdateRequested(
nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,avatarFilePath: freezed == avatarFilePath ? _self.avatarFilePath : avatarFilePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$VentorProfileState {

 VentorProfileStatus get status; VentorProfileOverview? get overview; String get errorMessage; bool get isUpdating; String? get localAvatarFilePath; int get avatarCacheToken;
/// Create a copy of VentorProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorProfileStateCopyWith<VentorProfileState> get copyWith => _$VentorProfileStateCopyWithImpl<VentorProfileState>(this as VentorProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.localAvatarFilePath, localAvatarFilePath) || other.localAvatarFilePath == localAvatarFilePath)&&(identical(other.avatarCacheToken, avatarCacheToken) || other.avatarCacheToken == avatarCacheToken));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,errorMessage,isUpdating,localAvatarFilePath,avatarCacheToken);

@override
String toString() {
  return 'VentorProfileState(status: $status, overview: $overview, errorMessage: $errorMessage, isUpdating: $isUpdating, localAvatarFilePath: $localAvatarFilePath, avatarCacheToken: $avatarCacheToken)';
}


}

/// @nodoc
abstract mixin class $VentorProfileStateCopyWith<$Res>  {
  factory $VentorProfileStateCopyWith(VentorProfileState value, $Res Function(VentorProfileState) _then) = _$VentorProfileStateCopyWithImpl;
@useResult
$Res call({
 VentorProfileStatus status, VentorProfileOverview? overview, String errorMessage, bool isUpdating, String? localAvatarFilePath, int avatarCacheToken
});




}
/// @nodoc
class _$VentorProfileStateCopyWithImpl<$Res>
    implements $VentorProfileStateCopyWith<$Res> {
  _$VentorProfileStateCopyWithImpl(this._self, this._then);

  final VentorProfileState _self;
  final $Res Function(VentorProfileState) _then;

/// Create a copy of VentorProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? overview = freezed,Object? errorMessage = null,Object? isUpdating = null,Object? localAvatarFilePath = freezed,Object? avatarCacheToken = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorProfileStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as VentorProfileOverview?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,localAvatarFilePath: freezed == localAvatarFilePath ? _self.localAvatarFilePath : localAvatarFilePath // ignore: cast_nullable_to_non_nullable
as String?,avatarCacheToken: null == avatarCacheToken ? _self.avatarCacheToken : avatarCacheToken // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorProfileState].
extension VentorProfileStatePatterns on VentorProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorProfileState value)  $default,){
final _that = this;
switch (_that) {
case _VentorProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorProfileStatus status,  VentorProfileOverview? overview,  String errorMessage,  bool isUpdating,  String? localAvatarFilePath,  int avatarCacheToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorProfileState() when $default != null:
return $default(_that.status,_that.overview,_that.errorMessage,_that.isUpdating,_that.localAvatarFilePath,_that.avatarCacheToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorProfileStatus status,  VentorProfileOverview? overview,  String errorMessage,  bool isUpdating,  String? localAvatarFilePath,  int avatarCacheToken)  $default,) {final _that = this;
switch (_that) {
case _VentorProfileState():
return $default(_that.status,_that.overview,_that.errorMessage,_that.isUpdating,_that.localAvatarFilePath,_that.avatarCacheToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorProfileStatus status,  VentorProfileOverview? overview,  String errorMessage,  bool isUpdating,  String? localAvatarFilePath,  int avatarCacheToken)?  $default,) {final _that = this;
switch (_that) {
case _VentorProfileState() when $default != null:
return $default(_that.status,_that.overview,_that.errorMessage,_that.isUpdating,_that.localAvatarFilePath,_that.avatarCacheToken);case _:
  return null;

}
}

}

/// @nodoc


class _VentorProfileState extends VentorProfileState {
  const _VentorProfileState({this.status = VentorProfileStatus.initial, this.overview, this.errorMessage = '', this.isUpdating = false, this.localAvatarFilePath, this.avatarCacheToken = 0}): super._();
  

@override@JsonKey() final  VentorProfileStatus status;
@override final  VentorProfileOverview? overview;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  bool isUpdating;
@override final  String? localAvatarFilePath;
@override@JsonKey() final  int avatarCacheToken;

/// Create a copy of VentorProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorProfileStateCopyWith<_VentorProfileState> get copyWith => __$VentorProfileStateCopyWithImpl<_VentorProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.localAvatarFilePath, localAvatarFilePath) || other.localAvatarFilePath == localAvatarFilePath)&&(identical(other.avatarCacheToken, avatarCacheToken) || other.avatarCacheToken == avatarCacheToken));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,errorMessage,isUpdating,localAvatarFilePath,avatarCacheToken);

@override
String toString() {
  return 'VentorProfileState(status: $status, overview: $overview, errorMessage: $errorMessage, isUpdating: $isUpdating, localAvatarFilePath: $localAvatarFilePath, avatarCacheToken: $avatarCacheToken)';
}


}

/// @nodoc
abstract mixin class _$VentorProfileStateCopyWith<$Res> implements $VentorProfileStateCopyWith<$Res> {
  factory _$VentorProfileStateCopyWith(_VentorProfileState value, $Res Function(_VentorProfileState) _then) = __$VentorProfileStateCopyWithImpl;
@override @useResult
$Res call({
 VentorProfileStatus status, VentorProfileOverview? overview, String errorMessage, bool isUpdating, String? localAvatarFilePath, int avatarCacheToken
});




}
/// @nodoc
class __$VentorProfileStateCopyWithImpl<$Res>
    implements _$VentorProfileStateCopyWith<$Res> {
  __$VentorProfileStateCopyWithImpl(this._self, this._then);

  final _VentorProfileState _self;
  final $Res Function(_VentorProfileState) _then;

/// Create a copy of VentorProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? overview = freezed,Object? errorMessage = null,Object? isUpdating = null,Object? localAvatarFilePath = freezed,Object? avatarCacheToken = null,}) {
  return _then(_VentorProfileState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorProfileStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as VentorProfileOverview?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,localAvatarFilePath: freezed == localAvatarFilePath ? _self.localAvatarFilePath : localAvatarFilePath // ignore: cast_nullable_to_non_nullable
as String?,avatarCacheToken: null == avatarCacheToken ? _self.avatarCacheToken : avatarCacheToken // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
