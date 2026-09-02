// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_listener_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorListenerProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorListenerProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorListenerProfileEvent()';
}


}

/// @nodoc
class $VentorListenerProfileEventCopyWith<$Res>  {
$VentorListenerProfileEventCopyWith(VentorListenerProfileEvent _, $Res Function(VentorListenerProfileEvent) __);
}


/// Adds pattern-matching-related methods to [VentorListenerProfileEvent].
extension VentorListenerProfileEventPatterns on VentorListenerProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _FavoriteToggled value)?  favoriteToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _FavoriteToggled value)  favoriteToggled,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _FavoriteToggled():
return favoriteToggled(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _FavoriteToggled value)?  favoriteToggled,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function()?  favoriteToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _FavoriteToggled() when favoriteToggled != null:
return favoriteToggled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function()  favoriteToggled,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _FavoriteToggled():
return favoriteToggled();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function()?  favoriteToggled,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _FavoriteToggled() when favoriteToggled != null:
return favoriteToggled();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorListenerProfileEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorListenerProfileEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements VentorListenerProfileEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorListenerProfileEvent.retryLoad()';
}


}




/// @nodoc


class _FavoriteToggled implements VentorListenerProfileEvent {
  const _FavoriteToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorListenerProfileEvent.favoriteToggled()';
}


}




/// @nodoc
mixin _$VentorListenerProfileState {

 VentorListenerProfileStatus get status; VentorFindListener get listener; bool get isUpdatingFavorite; int get favoriteSyncToken; String get errorMessage; String get favoriteErrorMessage;
/// Create a copy of VentorListenerProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorListenerProfileStateCopyWith<VentorListenerProfileState> get copyWith => _$VentorListenerProfileStateCopyWithImpl<VentorListenerProfileState>(this as VentorListenerProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorListenerProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.isUpdatingFavorite, isUpdatingFavorite) || other.isUpdatingFavorite == isUpdatingFavorite)&&(identical(other.favoriteSyncToken, favoriteSyncToken) || other.favoriteSyncToken == favoriteSyncToken)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.favoriteErrorMessage, favoriteErrorMessage) || other.favoriteErrorMessage == favoriteErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,listener,isUpdatingFavorite,favoriteSyncToken,errorMessage,favoriteErrorMessage);

@override
String toString() {
  return 'VentorListenerProfileState(status: $status, listener: $listener, isUpdatingFavorite: $isUpdatingFavorite, favoriteSyncToken: $favoriteSyncToken, errorMessage: $errorMessage, favoriteErrorMessage: $favoriteErrorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorListenerProfileStateCopyWith<$Res>  {
  factory $VentorListenerProfileStateCopyWith(VentorListenerProfileState value, $Res Function(VentorListenerProfileState) _then) = _$VentorListenerProfileStateCopyWithImpl;
@useResult
$Res call({
 VentorListenerProfileStatus status, VentorFindListener listener, bool isUpdatingFavorite, int favoriteSyncToken, String errorMessage, String favoriteErrorMessage
});




}
/// @nodoc
class _$VentorListenerProfileStateCopyWithImpl<$Res>
    implements $VentorListenerProfileStateCopyWith<$Res> {
  _$VentorListenerProfileStateCopyWithImpl(this._self, this._then);

  final VentorListenerProfileState _self;
  final $Res Function(VentorListenerProfileState) _then;

/// Create a copy of VentorListenerProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? listener = null,Object? isUpdatingFavorite = null,Object? favoriteSyncToken = null,Object? errorMessage = null,Object? favoriteErrorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorListenerProfileStatus,listener: null == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as VentorFindListener,isUpdatingFavorite: null == isUpdatingFavorite ? _self.isUpdatingFavorite : isUpdatingFavorite // ignore: cast_nullable_to_non_nullable
as bool,favoriteSyncToken: null == favoriteSyncToken ? _self.favoriteSyncToken : favoriteSyncToken // ignore: cast_nullable_to_non_nullable
as int,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,favoriteErrorMessage: null == favoriteErrorMessage ? _self.favoriteErrorMessage : favoriteErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorListenerProfileState].
extension VentorListenerProfileStatePatterns on VentorListenerProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorListenerProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorListenerProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorListenerProfileState value)  $default,){
final _that = this;
switch (_that) {
case _VentorListenerProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorListenerProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorListenerProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorListenerProfileStatus status,  VentorFindListener listener,  bool isUpdatingFavorite,  int favoriteSyncToken,  String errorMessage,  String favoriteErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorListenerProfileState() when $default != null:
return $default(_that.status,_that.listener,_that.isUpdatingFavorite,_that.favoriteSyncToken,_that.errorMessage,_that.favoriteErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorListenerProfileStatus status,  VentorFindListener listener,  bool isUpdatingFavorite,  int favoriteSyncToken,  String errorMessage,  String favoriteErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorListenerProfileState():
return $default(_that.status,_that.listener,_that.isUpdatingFavorite,_that.favoriteSyncToken,_that.errorMessage,_that.favoriteErrorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorListenerProfileStatus status,  VentorFindListener listener,  bool isUpdatingFavorite,  int favoriteSyncToken,  String errorMessage,  String favoriteErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorListenerProfileState() when $default != null:
return $default(_that.status,_that.listener,_that.isUpdatingFavorite,_that.favoriteSyncToken,_that.errorMessage,_that.favoriteErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorListenerProfileState extends VentorListenerProfileState {
  const _VentorListenerProfileState({this.status = VentorListenerProfileStatus.initial, required this.listener, this.isUpdatingFavorite = false, this.favoriteSyncToken = 0, this.errorMessage = '', this.favoriteErrorMessage = ''}): super._();
  

@override@JsonKey() final  VentorListenerProfileStatus status;
@override final  VentorFindListener listener;
@override@JsonKey() final  bool isUpdatingFavorite;
@override@JsonKey() final  int favoriteSyncToken;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String favoriteErrorMessage;

/// Create a copy of VentorListenerProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorListenerProfileStateCopyWith<_VentorListenerProfileState> get copyWith => __$VentorListenerProfileStateCopyWithImpl<_VentorListenerProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorListenerProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.listener, listener) || other.listener == listener)&&(identical(other.isUpdatingFavorite, isUpdatingFavorite) || other.isUpdatingFavorite == isUpdatingFavorite)&&(identical(other.favoriteSyncToken, favoriteSyncToken) || other.favoriteSyncToken == favoriteSyncToken)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.favoriteErrorMessage, favoriteErrorMessage) || other.favoriteErrorMessage == favoriteErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,listener,isUpdatingFavorite,favoriteSyncToken,errorMessage,favoriteErrorMessage);

@override
String toString() {
  return 'VentorListenerProfileState(status: $status, listener: $listener, isUpdatingFavorite: $isUpdatingFavorite, favoriteSyncToken: $favoriteSyncToken, errorMessage: $errorMessage, favoriteErrorMessage: $favoriteErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorListenerProfileStateCopyWith<$Res> implements $VentorListenerProfileStateCopyWith<$Res> {
  factory _$VentorListenerProfileStateCopyWith(_VentorListenerProfileState value, $Res Function(_VentorListenerProfileState) _then) = __$VentorListenerProfileStateCopyWithImpl;
@override @useResult
$Res call({
 VentorListenerProfileStatus status, VentorFindListener listener, bool isUpdatingFavorite, int favoriteSyncToken, String errorMessage, String favoriteErrorMessage
});




}
/// @nodoc
class __$VentorListenerProfileStateCopyWithImpl<$Res>
    implements _$VentorListenerProfileStateCopyWith<$Res> {
  __$VentorListenerProfileStateCopyWithImpl(this._self, this._then);

  final _VentorListenerProfileState _self;
  final $Res Function(_VentorListenerProfileState) _then;

/// Create a copy of VentorListenerProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? listener = null,Object? isUpdatingFavorite = null,Object? favoriteSyncToken = null,Object? errorMessage = null,Object? favoriteErrorMessage = null,}) {
  return _then(_VentorListenerProfileState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorListenerProfileStatus,listener: null == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as VentorFindListener,isUpdatingFavorite: null == isUpdatingFavorite ? _self.isUpdatingFavorite : isUpdatingFavorite // ignore: cast_nullable_to_non_nullable
as bool,favoriteSyncToken: null == favoriteSyncToken ? _self.favoriteSyncToken : favoriteSyncToken // ignore: cast_nullable_to_non_nullable
as int,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,favoriteErrorMessage: null == favoriteErrorMessage ? _self.favoriteErrorMessage : favoriteErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
