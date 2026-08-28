// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerProfileEvent()';
}


}

/// @nodoc
class $ListenerProfileEventCopyWith<$Res>  {
$ListenerProfileEventCopyWith(ListenerProfileEvent _, $Res Function(ListenerProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerProfileEvent].
extension ListenerProfileEventPatterns on ListenerProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _AvatarUpdateRequested value)?  avatarUpdateRequested,TResult Function( _AboutMeUpdateRequested value)?  aboutMeUpdateRequested,TResult Function( _VoiceIntroUpdateRequested value)?  voiceIntroUpdateRequested,TResult Function( _ProfileFieldsUpdateRequested value)?  profileFieldsUpdateRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _AvatarUpdateRequested() when avatarUpdateRequested != null:
return avatarUpdateRequested(_that);case _AboutMeUpdateRequested() when aboutMeUpdateRequested != null:
return aboutMeUpdateRequested(_that);case _VoiceIntroUpdateRequested() when voiceIntroUpdateRequested != null:
return voiceIntroUpdateRequested(_that);case _ProfileFieldsUpdateRequested() when profileFieldsUpdateRequested != null:
return profileFieldsUpdateRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _AvatarUpdateRequested value)  avatarUpdateRequested,required TResult Function( _AboutMeUpdateRequested value)  aboutMeUpdateRequested,required TResult Function( _VoiceIntroUpdateRequested value)  voiceIntroUpdateRequested,required TResult Function( _ProfileFieldsUpdateRequested value)  profileFieldsUpdateRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RefreshRequested():
return refreshRequested(_that);case _AvatarUpdateRequested():
return avatarUpdateRequested(_that);case _AboutMeUpdateRequested():
return aboutMeUpdateRequested(_that);case _VoiceIntroUpdateRequested():
return voiceIntroUpdateRequested(_that);case _ProfileFieldsUpdateRequested():
return profileFieldsUpdateRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _AvatarUpdateRequested value)?  avatarUpdateRequested,TResult? Function( _AboutMeUpdateRequested value)?  aboutMeUpdateRequested,TResult? Function( _VoiceIntroUpdateRequested value)?  voiceIntroUpdateRequested,TResult? Function( _ProfileFieldsUpdateRequested value)?  profileFieldsUpdateRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _AvatarUpdateRequested() when avatarUpdateRequested != null:
return avatarUpdateRequested(_that);case _AboutMeUpdateRequested() when aboutMeUpdateRequested != null:
return aboutMeUpdateRequested(_that);case _VoiceIntroUpdateRequested() when voiceIntroUpdateRequested != null:
return voiceIntroUpdateRequested(_that);case _ProfileFieldsUpdateRequested() when profileFieldsUpdateRequested != null:
return profileFieldsUpdateRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function( String avatarFilePath)?  avatarUpdateRequested,TResult Function( String aboutMe)?  aboutMeUpdateRequested,TResult Function( String voiceFilePath,  int durationSeconds)?  voiceIntroUpdateRequested,TResult Function( ListenerProfileSavingTarget target,  Map<String, dynamic> fields)?  profileFieldsUpdateRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _AvatarUpdateRequested() when avatarUpdateRequested != null:
return avatarUpdateRequested(_that.avatarFilePath);case _AboutMeUpdateRequested() when aboutMeUpdateRequested != null:
return aboutMeUpdateRequested(_that.aboutMe);case _VoiceIntroUpdateRequested() when voiceIntroUpdateRequested != null:
return voiceIntroUpdateRequested(_that.voiceFilePath,_that.durationSeconds);case _ProfileFieldsUpdateRequested() when profileFieldsUpdateRequested != null:
return profileFieldsUpdateRequested(_that.target,_that.fields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function( String avatarFilePath)  avatarUpdateRequested,required TResult Function( String aboutMe)  aboutMeUpdateRequested,required TResult Function( String voiceFilePath,  int durationSeconds)  voiceIntroUpdateRequested,required TResult Function( ListenerProfileSavingTarget target,  Map<String, dynamic> fields)  profileFieldsUpdateRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RefreshRequested():
return refreshRequested();case _AvatarUpdateRequested():
return avatarUpdateRequested(_that.avatarFilePath);case _AboutMeUpdateRequested():
return aboutMeUpdateRequested(_that.aboutMe);case _VoiceIntroUpdateRequested():
return voiceIntroUpdateRequested(_that.voiceFilePath,_that.durationSeconds);case _ProfileFieldsUpdateRequested():
return profileFieldsUpdateRequested(_that.target,_that.fields);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function( String avatarFilePath)?  avatarUpdateRequested,TResult? Function( String aboutMe)?  aboutMeUpdateRequested,TResult? Function( String voiceFilePath,  int durationSeconds)?  voiceIntroUpdateRequested,TResult? Function( ListenerProfileSavingTarget target,  Map<String, dynamic> fields)?  profileFieldsUpdateRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _AvatarUpdateRequested() when avatarUpdateRequested != null:
return avatarUpdateRequested(_that.avatarFilePath);case _AboutMeUpdateRequested() when aboutMeUpdateRequested != null:
return aboutMeUpdateRequested(_that.aboutMe);case _VoiceIntroUpdateRequested() when voiceIntroUpdateRequested != null:
return voiceIntroUpdateRequested(_that.voiceFilePath,_that.durationSeconds);case _ProfileFieldsUpdateRequested() when profileFieldsUpdateRequested != null:
return profileFieldsUpdateRequested(_that.target,_that.fields);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerProfileEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerProfileEvent.started()';
}


}




/// @nodoc


class _RefreshRequested implements ListenerProfileEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerProfileEvent.refreshRequested()';
}


}




/// @nodoc


class _AvatarUpdateRequested implements ListenerProfileEvent {
  const _AvatarUpdateRequested({required this.avatarFilePath});
  

 final  String avatarFilePath;

/// Create a copy of ListenerProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvatarUpdateRequestedCopyWith<_AvatarUpdateRequested> get copyWith => __$AvatarUpdateRequestedCopyWithImpl<_AvatarUpdateRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvatarUpdateRequested&&(identical(other.avatarFilePath, avatarFilePath) || other.avatarFilePath == avatarFilePath));
}


@override
int get hashCode => Object.hash(runtimeType,avatarFilePath);

@override
String toString() {
  return 'ListenerProfileEvent.avatarUpdateRequested(avatarFilePath: $avatarFilePath)';
}


}

/// @nodoc
abstract mixin class _$AvatarUpdateRequestedCopyWith<$Res> implements $ListenerProfileEventCopyWith<$Res> {
  factory _$AvatarUpdateRequestedCopyWith(_AvatarUpdateRequested value, $Res Function(_AvatarUpdateRequested) _then) = __$AvatarUpdateRequestedCopyWithImpl;
@useResult
$Res call({
 String avatarFilePath
});




}
/// @nodoc
class __$AvatarUpdateRequestedCopyWithImpl<$Res>
    implements _$AvatarUpdateRequestedCopyWith<$Res> {
  __$AvatarUpdateRequestedCopyWithImpl(this._self, this._then);

  final _AvatarUpdateRequested _self;
  final $Res Function(_AvatarUpdateRequested) _then;

/// Create a copy of ListenerProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? avatarFilePath = null,}) {
  return _then(_AvatarUpdateRequested(
avatarFilePath: null == avatarFilePath ? _self.avatarFilePath : avatarFilePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AboutMeUpdateRequested implements ListenerProfileEvent {
  const _AboutMeUpdateRequested({required this.aboutMe});
  

 final  String aboutMe;

/// Create a copy of ListenerProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AboutMeUpdateRequestedCopyWith<_AboutMeUpdateRequested> get copyWith => __$AboutMeUpdateRequestedCopyWithImpl<_AboutMeUpdateRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AboutMeUpdateRequested&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe));
}


@override
int get hashCode => Object.hash(runtimeType,aboutMe);

@override
String toString() {
  return 'ListenerProfileEvent.aboutMeUpdateRequested(aboutMe: $aboutMe)';
}


}

/// @nodoc
abstract mixin class _$AboutMeUpdateRequestedCopyWith<$Res> implements $ListenerProfileEventCopyWith<$Res> {
  factory _$AboutMeUpdateRequestedCopyWith(_AboutMeUpdateRequested value, $Res Function(_AboutMeUpdateRequested) _then) = __$AboutMeUpdateRequestedCopyWithImpl;
@useResult
$Res call({
 String aboutMe
});




}
/// @nodoc
class __$AboutMeUpdateRequestedCopyWithImpl<$Res>
    implements _$AboutMeUpdateRequestedCopyWith<$Res> {
  __$AboutMeUpdateRequestedCopyWithImpl(this._self, this._then);

  final _AboutMeUpdateRequested _self;
  final $Res Function(_AboutMeUpdateRequested) _then;

/// Create a copy of ListenerProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? aboutMe = null,}) {
  return _then(_AboutMeUpdateRequested(
aboutMe: null == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _VoiceIntroUpdateRequested implements ListenerProfileEvent {
  const _VoiceIntroUpdateRequested({required this.voiceFilePath, required this.durationSeconds});
  

 final  String voiceFilePath;
 final  int durationSeconds;

/// Create a copy of ListenerProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceIntroUpdateRequestedCopyWith<_VoiceIntroUpdateRequested> get copyWith => __$VoiceIntroUpdateRequestedCopyWithImpl<_VoiceIntroUpdateRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceIntroUpdateRequested&&(identical(other.voiceFilePath, voiceFilePath) || other.voiceFilePath == voiceFilePath)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,voiceFilePath,durationSeconds);

@override
String toString() {
  return 'ListenerProfileEvent.voiceIntroUpdateRequested(voiceFilePath: $voiceFilePath, durationSeconds: $durationSeconds)';
}


}

/// @nodoc
abstract mixin class _$VoiceIntroUpdateRequestedCopyWith<$Res> implements $ListenerProfileEventCopyWith<$Res> {
  factory _$VoiceIntroUpdateRequestedCopyWith(_VoiceIntroUpdateRequested value, $Res Function(_VoiceIntroUpdateRequested) _then) = __$VoiceIntroUpdateRequestedCopyWithImpl;
@useResult
$Res call({
 String voiceFilePath, int durationSeconds
});




}
/// @nodoc
class __$VoiceIntroUpdateRequestedCopyWithImpl<$Res>
    implements _$VoiceIntroUpdateRequestedCopyWith<$Res> {
  __$VoiceIntroUpdateRequestedCopyWithImpl(this._self, this._then);

  final _VoiceIntroUpdateRequested _self;
  final $Res Function(_VoiceIntroUpdateRequested) _then;

/// Create a copy of ListenerProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? voiceFilePath = null,Object? durationSeconds = null,}) {
  return _then(_VoiceIntroUpdateRequested(
voiceFilePath: null == voiceFilePath ? _self.voiceFilePath : voiceFilePath // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ProfileFieldsUpdateRequested implements ListenerProfileEvent {
  const _ProfileFieldsUpdateRequested({required this.target, required final  Map<String, dynamic> fields}): _fields = fields;
  

 final  ListenerProfileSavingTarget target;
 final  Map<String, dynamic> _fields;
 Map<String, dynamic> get fields {
  if (_fields is EqualUnmodifiableMapView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fields);
}


/// Create a copy of ListenerProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileFieldsUpdateRequestedCopyWith<_ProfileFieldsUpdateRequested> get copyWith => __$ProfileFieldsUpdateRequestedCopyWithImpl<_ProfileFieldsUpdateRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileFieldsUpdateRequested&&(identical(other.target, target) || other.target == target)&&const DeepCollectionEquality().equals(other._fields, _fields));
}


@override
int get hashCode => Object.hash(runtimeType,target,const DeepCollectionEquality().hash(_fields));

@override
String toString() {
  return 'ListenerProfileEvent.profileFieldsUpdateRequested(target: $target, fields: $fields)';
}


}

/// @nodoc
abstract mixin class _$ProfileFieldsUpdateRequestedCopyWith<$Res> implements $ListenerProfileEventCopyWith<$Res> {
  factory _$ProfileFieldsUpdateRequestedCopyWith(_ProfileFieldsUpdateRequested value, $Res Function(_ProfileFieldsUpdateRequested) _then) = __$ProfileFieldsUpdateRequestedCopyWithImpl;
@useResult
$Res call({
 ListenerProfileSavingTarget target, Map<String, dynamic> fields
});




}
/// @nodoc
class __$ProfileFieldsUpdateRequestedCopyWithImpl<$Res>
    implements _$ProfileFieldsUpdateRequestedCopyWith<$Res> {
  __$ProfileFieldsUpdateRequestedCopyWithImpl(this._self, this._then);

  final _ProfileFieldsUpdateRequested _self;
  final $Res Function(_ProfileFieldsUpdateRequested) _then;

/// Create a copy of ListenerProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? target = null,Object? fields = null,}) {
  return _then(_ProfileFieldsUpdateRequested(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ListenerProfileSavingTarget,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$ListenerProfileState {

 ListenerProfileStatus get status; ListenerProfile? get profile; String get errorMessage; bool get isUploadingAvatar; bool get isSavingAboutMe; ListenerProfileSavingTarget? get savingProfileField; bool get isUploadingVoiceIntro; String? get pendingAvatarFilePath; String? get pendingVoiceFilePath; int? get pendingVoiceDurationSeconds; int? get avatarCacheToken; String get updateErrorMessage;
/// Create a copy of ListenerProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerProfileStateCopyWith<ListenerProfileState> get copyWith => _$ListenerProfileStateCopyWithImpl<ListenerProfileState>(this as ListenerProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isUploadingAvatar, isUploadingAvatar) || other.isUploadingAvatar == isUploadingAvatar)&&(identical(other.isSavingAboutMe, isSavingAboutMe) || other.isSavingAboutMe == isSavingAboutMe)&&(identical(other.savingProfileField, savingProfileField) || other.savingProfileField == savingProfileField)&&(identical(other.isUploadingVoiceIntro, isUploadingVoiceIntro) || other.isUploadingVoiceIntro == isUploadingVoiceIntro)&&(identical(other.pendingAvatarFilePath, pendingAvatarFilePath) || other.pendingAvatarFilePath == pendingAvatarFilePath)&&(identical(other.pendingVoiceFilePath, pendingVoiceFilePath) || other.pendingVoiceFilePath == pendingVoiceFilePath)&&(identical(other.pendingVoiceDurationSeconds, pendingVoiceDurationSeconds) || other.pendingVoiceDurationSeconds == pendingVoiceDurationSeconds)&&(identical(other.avatarCacheToken, avatarCacheToken) || other.avatarCacheToken == avatarCacheToken)&&(identical(other.updateErrorMessage, updateErrorMessage) || other.updateErrorMessage == updateErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,profile,errorMessage,isUploadingAvatar,isSavingAboutMe,savingProfileField,isUploadingVoiceIntro,pendingAvatarFilePath,pendingVoiceFilePath,pendingVoiceDurationSeconds,avatarCacheToken,updateErrorMessage);

@override
String toString() {
  return 'ListenerProfileState(status: $status, profile: $profile, errorMessage: $errorMessage, isUploadingAvatar: $isUploadingAvatar, isSavingAboutMe: $isSavingAboutMe, savingProfileField: $savingProfileField, isUploadingVoiceIntro: $isUploadingVoiceIntro, pendingAvatarFilePath: $pendingAvatarFilePath, pendingVoiceFilePath: $pendingVoiceFilePath, pendingVoiceDurationSeconds: $pendingVoiceDurationSeconds, avatarCacheToken: $avatarCacheToken, updateErrorMessage: $updateErrorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerProfileStateCopyWith<$Res>  {
  factory $ListenerProfileStateCopyWith(ListenerProfileState value, $Res Function(ListenerProfileState) _then) = _$ListenerProfileStateCopyWithImpl;
@useResult
$Res call({
 ListenerProfileStatus status, ListenerProfile? profile, String errorMessage, bool isUploadingAvatar, bool isSavingAboutMe, ListenerProfileSavingTarget? savingProfileField, bool isUploadingVoiceIntro, String? pendingAvatarFilePath, String? pendingVoiceFilePath, int? pendingVoiceDurationSeconds, int? avatarCacheToken, String updateErrorMessage
});




}
/// @nodoc
class _$ListenerProfileStateCopyWithImpl<$Res>
    implements $ListenerProfileStateCopyWith<$Res> {
  _$ListenerProfileStateCopyWithImpl(this._self, this._then);

  final ListenerProfileState _self;
  final $Res Function(ListenerProfileState) _then;

/// Create a copy of ListenerProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? profile = freezed,Object? errorMessage = null,Object? isUploadingAvatar = null,Object? isSavingAboutMe = null,Object? savingProfileField = freezed,Object? isUploadingVoiceIntro = null,Object? pendingAvatarFilePath = freezed,Object? pendingVoiceFilePath = freezed,Object? pendingVoiceDurationSeconds = freezed,Object? avatarCacheToken = freezed,Object? updateErrorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerProfileStatus,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ListenerProfile?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isUploadingAvatar: null == isUploadingAvatar ? _self.isUploadingAvatar : isUploadingAvatar // ignore: cast_nullable_to_non_nullable
as bool,isSavingAboutMe: null == isSavingAboutMe ? _self.isSavingAboutMe : isSavingAboutMe // ignore: cast_nullable_to_non_nullable
as bool,savingProfileField: freezed == savingProfileField ? _self.savingProfileField : savingProfileField // ignore: cast_nullable_to_non_nullable
as ListenerProfileSavingTarget?,isUploadingVoiceIntro: null == isUploadingVoiceIntro ? _self.isUploadingVoiceIntro : isUploadingVoiceIntro // ignore: cast_nullable_to_non_nullable
as bool,pendingAvatarFilePath: freezed == pendingAvatarFilePath ? _self.pendingAvatarFilePath : pendingAvatarFilePath // ignore: cast_nullable_to_non_nullable
as String?,pendingVoiceFilePath: freezed == pendingVoiceFilePath ? _self.pendingVoiceFilePath : pendingVoiceFilePath // ignore: cast_nullable_to_non_nullable
as String?,pendingVoiceDurationSeconds: freezed == pendingVoiceDurationSeconds ? _self.pendingVoiceDurationSeconds : pendingVoiceDurationSeconds // ignore: cast_nullable_to_non_nullable
as int?,avatarCacheToken: freezed == avatarCacheToken ? _self.avatarCacheToken : avatarCacheToken // ignore: cast_nullable_to_non_nullable
as int?,updateErrorMessage: null == updateErrorMessage ? _self.updateErrorMessage : updateErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerProfileState].
extension ListenerProfileStatePatterns on ListenerProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerProfileStatus status,  ListenerProfile? profile,  String errorMessage,  bool isUploadingAvatar,  bool isSavingAboutMe,  ListenerProfileSavingTarget? savingProfileField,  bool isUploadingVoiceIntro,  String? pendingAvatarFilePath,  String? pendingVoiceFilePath,  int? pendingVoiceDurationSeconds,  int? avatarCacheToken,  String updateErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerProfileState() when $default != null:
return $default(_that.status,_that.profile,_that.errorMessage,_that.isUploadingAvatar,_that.isSavingAboutMe,_that.savingProfileField,_that.isUploadingVoiceIntro,_that.pendingAvatarFilePath,_that.pendingVoiceFilePath,_that.pendingVoiceDurationSeconds,_that.avatarCacheToken,_that.updateErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerProfileStatus status,  ListenerProfile? profile,  String errorMessage,  bool isUploadingAvatar,  bool isSavingAboutMe,  ListenerProfileSavingTarget? savingProfileField,  bool isUploadingVoiceIntro,  String? pendingAvatarFilePath,  String? pendingVoiceFilePath,  int? pendingVoiceDurationSeconds,  int? avatarCacheToken,  String updateErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileState():
return $default(_that.status,_that.profile,_that.errorMessage,_that.isUploadingAvatar,_that.isSavingAboutMe,_that.savingProfileField,_that.isUploadingVoiceIntro,_that.pendingAvatarFilePath,_that.pendingVoiceFilePath,_that.pendingVoiceDurationSeconds,_that.avatarCacheToken,_that.updateErrorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerProfileStatus status,  ListenerProfile? profile,  String errorMessage,  bool isUploadingAvatar,  bool isSavingAboutMe,  ListenerProfileSavingTarget? savingProfileField,  bool isUploadingVoiceIntro,  String? pendingAvatarFilePath,  String? pendingVoiceFilePath,  int? pendingVoiceDurationSeconds,  int? avatarCacheToken,  String updateErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerProfileState() when $default != null:
return $default(_that.status,_that.profile,_that.errorMessage,_that.isUploadingAvatar,_that.isSavingAboutMe,_that.savingProfileField,_that.isUploadingVoiceIntro,_that.pendingAvatarFilePath,_that.pendingVoiceFilePath,_that.pendingVoiceDurationSeconds,_that.avatarCacheToken,_that.updateErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerProfileState extends ListenerProfileState {
  const _ListenerProfileState({this.status = ListenerProfileStatus.initial, this.profile, this.errorMessage = '', this.isUploadingAvatar = false, this.isSavingAboutMe = false, this.savingProfileField, this.isUploadingVoiceIntro = false, this.pendingAvatarFilePath, this.pendingVoiceFilePath, this.pendingVoiceDurationSeconds, this.avatarCacheToken, this.updateErrorMessage = ''}): super._();
  

@override@JsonKey() final  ListenerProfileStatus status;
@override final  ListenerProfile? profile;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  bool isUploadingAvatar;
@override@JsonKey() final  bool isSavingAboutMe;
@override final  ListenerProfileSavingTarget? savingProfileField;
@override@JsonKey() final  bool isUploadingVoiceIntro;
@override final  String? pendingAvatarFilePath;
@override final  String? pendingVoiceFilePath;
@override final  int? pendingVoiceDurationSeconds;
@override final  int? avatarCacheToken;
@override@JsonKey() final  String updateErrorMessage;

/// Create a copy of ListenerProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerProfileStateCopyWith<_ListenerProfileState> get copyWith => __$ListenerProfileStateCopyWithImpl<_ListenerProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isUploadingAvatar, isUploadingAvatar) || other.isUploadingAvatar == isUploadingAvatar)&&(identical(other.isSavingAboutMe, isSavingAboutMe) || other.isSavingAboutMe == isSavingAboutMe)&&(identical(other.savingProfileField, savingProfileField) || other.savingProfileField == savingProfileField)&&(identical(other.isUploadingVoiceIntro, isUploadingVoiceIntro) || other.isUploadingVoiceIntro == isUploadingVoiceIntro)&&(identical(other.pendingAvatarFilePath, pendingAvatarFilePath) || other.pendingAvatarFilePath == pendingAvatarFilePath)&&(identical(other.pendingVoiceFilePath, pendingVoiceFilePath) || other.pendingVoiceFilePath == pendingVoiceFilePath)&&(identical(other.pendingVoiceDurationSeconds, pendingVoiceDurationSeconds) || other.pendingVoiceDurationSeconds == pendingVoiceDurationSeconds)&&(identical(other.avatarCacheToken, avatarCacheToken) || other.avatarCacheToken == avatarCacheToken)&&(identical(other.updateErrorMessage, updateErrorMessage) || other.updateErrorMessage == updateErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,profile,errorMessage,isUploadingAvatar,isSavingAboutMe,savingProfileField,isUploadingVoiceIntro,pendingAvatarFilePath,pendingVoiceFilePath,pendingVoiceDurationSeconds,avatarCacheToken,updateErrorMessage);

@override
String toString() {
  return 'ListenerProfileState(status: $status, profile: $profile, errorMessage: $errorMessage, isUploadingAvatar: $isUploadingAvatar, isSavingAboutMe: $isSavingAboutMe, savingProfileField: $savingProfileField, isUploadingVoiceIntro: $isUploadingVoiceIntro, pendingAvatarFilePath: $pendingAvatarFilePath, pendingVoiceFilePath: $pendingVoiceFilePath, pendingVoiceDurationSeconds: $pendingVoiceDurationSeconds, avatarCacheToken: $avatarCacheToken, updateErrorMessage: $updateErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerProfileStateCopyWith<$Res> implements $ListenerProfileStateCopyWith<$Res> {
  factory _$ListenerProfileStateCopyWith(_ListenerProfileState value, $Res Function(_ListenerProfileState) _then) = __$ListenerProfileStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerProfileStatus status, ListenerProfile? profile, String errorMessage, bool isUploadingAvatar, bool isSavingAboutMe, ListenerProfileSavingTarget? savingProfileField, bool isUploadingVoiceIntro, String? pendingAvatarFilePath, String? pendingVoiceFilePath, int? pendingVoiceDurationSeconds, int? avatarCacheToken, String updateErrorMessage
});




}
/// @nodoc
class __$ListenerProfileStateCopyWithImpl<$Res>
    implements _$ListenerProfileStateCopyWith<$Res> {
  __$ListenerProfileStateCopyWithImpl(this._self, this._then);

  final _ListenerProfileState _self;
  final $Res Function(_ListenerProfileState) _then;

/// Create a copy of ListenerProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? profile = freezed,Object? errorMessage = null,Object? isUploadingAvatar = null,Object? isSavingAboutMe = null,Object? savingProfileField = freezed,Object? isUploadingVoiceIntro = null,Object? pendingAvatarFilePath = freezed,Object? pendingVoiceFilePath = freezed,Object? pendingVoiceDurationSeconds = freezed,Object? avatarCacheToken = freezed,Object? updateErrorMessage = null,}) {
  return _then(_ListenerProfileState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerProfileStatus,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ListenerProfile?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isUploadingAvatar: null == isUploadingAvatar ? _self.isUploadingAvatar : isUploadingAvatar // ignore: cast_nullable_to_non_nullable
as bool,isSavingAboutMe: null == isSavingAboutMe ? _self.isSavingAboutMe : isSavingAboutMe // ignore: cast_nullable_to_non_nullable
as bool,savingProfileField: freezed == savingProfileField ? _self.savingProfileField : savingProfileField // ignore: cast_nullable_to_non_nullable
as ListenerProfileSavingTarget?,isUploadingVoiceIntro: null == isUploadingVoiceIntro ? _self.isUploadingVoiceIntro : isUploadingVoiceIntro // ignore: cast_nullable_to_non_nullable
as bool,pendingAvatarFilePath: freezed == pendingAvatarFilePath ? _self.pendingAvatarFilePath : pendingAvatarFilePath // ignore: cast_nullable_to_non_nullable
as String?,pendingVoiceFilePath: freezed == pendingVoiceFilePath ? _self.pendingVoiceFilePath : pendingVoiceFilePath // ignore: cast_nullable_to_non_nullable
as String?,pendingVoiceDurationSeconds: freezed == pendingVoiceDurationSeconds ? _self.pendingVoiceDurationSeconds : pendingVoiceDurationSeconds // ignore: cast_nullable_to_non_nullable
as int?,avatarCacheToken: freezed == avatarCacheToken ? _self.avatarCacheToken : avatarCacheToken // ignore: cast_nullable_to_non_nullable
as int?,updateErrorMessage: null == updateErrorMessage ? _self.updateErrorMessage : updateErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
