// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorNotificationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorNotificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorNotificationsEvent()';
}


}

/// @nodoc
class $VentorNotificationsEventCopyWith<$Res>  {
$VentorNotificationsEventCopyWith(VentorNotificationsEvent _, $Res Function(VentorNotificationsEvent) __);
}


/// Adds pattern-matching-related methods to [VentorNotificationsEvent].
extension VentorNotificationsEventPatterns on VentorNotificationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _UnreadOnlyFilterChanged value)?  unreadOnlyFilterChanged,TResult Function( _MarkAllAsReadRequested value)?  markAllAsReadRequested,TResult Function( _NotificationTapped value)?  notificationTapped,TResult Function( _DeleteRequested value)?  deleteRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _UnreadOnlyFilterChanged() when unreadOnlyFilterChanged != null:
return unreadOnlyFilterChanged(_that);case _MarkAllAsReadRequested() when markAllAsReadRequested != null:
return markAllAsReadRequested(_that);case _NotificationTapped() when notificationTapped != null:
return notificationTapped(_that);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _UnreadOnlyFilterChanged value)  unreadOnlyFilterChanged,required TResult Function( _MarkAllAsReadRequested value)  markAllAsReadRequested,required TResult Function( _NotificationTapped value)  notificationTapped,required TResult Function( _DeleteRequested value)  deleteRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _UnreadOnlyFilterChanged():
return unreadOnlyFilterChanged(_that);case _MarkAllAsReadRequested():
return markAllAsReadRequested(_that);case _NotificationTapped():
return notificationTapped(_that);case _DeleteRequested():
return deleteRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _UnreadOnlyFilterChanged value)?  unreadOnlyFilterChanged,TResult? Function( _MarkAllAsReadRequested value)?  markAllAsReadRequested,TResult? Function( _NotificationTapped value)?  notificationTapped,TResult? Function( _DeleteRequested value)?  deleteRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _UnreadOnlyFilterChanged() when unreadOnlyFilterChanged != null:
return unreadOnlyFilterChanged(_that);case _MarkAllAsReadRequested() when markAllAsReadRequested != null:
return markAllAsReadRequested(_that);case _NotificationTapped() when notificationTapped != null:
return notificationTapped(_that);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function( bool unreadOnly)?  unreadOnlyFilterChanged,TResult Function()?  markAllAsReadRequested,TResult Function( String notificationId)?  notificationTapped,TResult Function( String notificationId)?  deleteRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _UnreadOnlyFilterChanged() when unreadOnlyFilterChanged != null:
return unreadOnlyFilterChanged(_that.unreadOnly);case _MarkAllAsReadRequested() when markAllAsReadRequested != null:
return markAllAsReadRequested();case _NotificationTapped() when notificationTapped != null:
return notificationTapped(_that.notificationId);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that.notificationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function( bool unreadOnly)  unreadOnlyFilterChanged,required TResult Function()  markAllAsReadRequested,required TResult Function( String notificationId)  notificationTapped,required TResult Function( String notificationId)  deleteRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _UnreadOnlyFilterChanged():
return unreadOnlyFilterChanged(_that.unreadOnly);case _MarkAllAsReadRequested():
return markAllAsReadRequested();case _NotificationTapped():
return notificationTapped(_that.notificationId);case _DeleteRequested():
return deleteRequested(_that.notificationId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function( bool unreadOnly)?  unreadOnlyFilterChanged,TResult? Function()?  markAllAsReadRequested,TResult? Function( String notificationId)?  notificationTapped,TResult? Function( String notificationId)?  deleteRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _UnreadOnlyFilterChanged() when unreadOnlyFilterChanged != null:
return unreadOnlyFilterChanged(_that.unreadOnly);case _MarkAllAsReadRequested() when markAllAsReadRequested != null:
return markAllAsReadRequested();case _NotificationTapped() when notificationTapped != null:
return notificationTapped(_that.notificationId);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that.notificationId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorNotificationsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorNotificationsEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements VentorNotificationsEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorNotificationsEvent.retryLoad()';
}


}




/// @nodoc


class _UnreadOnlyFilterChanged implements VentorNotificationsEvent {
  const _UnreadOnlyFilterChanged({required this.unreadOnly});
  

 final  bool unreadOnly;

/// Create a copy of VentorNotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnreadOnlyFilterChangedCopyWith<_UnreadOnlyFilterChanged> get copyWith => __$UnreadOnlyFilterChangedCopyWithImpl<_UnreadOnlyFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnreadOnlyFilterChanged&&(identical(other.unreadOnly, unreadOnly) || other.unreadOnly == unreadOnly));
}


@override
int get hashCode => Object.hash(runtimeType,unreadOnly);

@override
String toString() {
  return 'VentorNotificationsEvent.unreadOnlyFilterChanged(unreadOnly: $unreadOnly)';
}


}

/// @nodoc
abstract mixin class _$UnreadOnlyFilterChangedCopyWith<$Res> implements $VentorNotificationsEventCopyWith<$Res> {
  factory _$UnreadOnlyFilterChangedCopyWith(_UnreadOnlyFilterChanged value, $Res Function(_UnreadOnlyFilterChanged) _then) = __$UnreadOnlyFilterChangedCopyWithImpl;
@useResult
$Res call({
 bool unreadOnly
});




}
/// @nodoc
class __$UnreadOnlyFilterChangedCopyWithImpl<$Res>
    implements _$UnreadOnlyFilterChangedCopyWith<$Res> {
  __$UnreadOnlyFilterChangedCopyWithImpl(this._self, this._then);

  final _UnreadOnlyFilterChanged _self;
  final $Res Function(_UnreadOnlyFilterChanged) _then;

/// Create a copy of VentorNotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unreadOnly = null,}) {
  return _then(_UnreadOnlyFilterChanged(
unreadOnly: null == unreadOnly ? _self.unreadOnly : unreadOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _MarkAllAsReadRequested implements VentorNotificationsEvent {
  const _MarkAllAsReadRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAllAsReadRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorNotificationsEvent.markAllAsReadRequested()';
}


}




/// @nodoc


class _NotificationTapped implements VentorNotificationsEvent {
  const _NotificationTapped({required this.notificationId});
  

 final  String notificationId;

/// Create a copy of VentorNotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationTappedCopyWith<_NotificationTapped> get copyWith => __$NotificationTappedCopyWithImpl<_NotificationTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationTapped&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}


@override
int get hashCode => Object.hash(runtimeType,notificationId);

@override
String toString() {
  return 'VentorNotificationsEvent.notificationTapped(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class _$NotificationTappedCopyWith<$Res> implements $VentorNotificationsEventCopyWith<$Res> {
  factory _$NotificationTappedCopyWith(_NotificationTapped value, $Res Function(_NotificationTapped) _then) = __$NotificationTappedCopyWithImpl;
@useResult
$Res call({
 String notificationId
});




}
/// @nodoc
class __$NotificationTappedCopyWithImpl<$Res>
    implements _$NotificationTappedCopyWith<$Res> {
  __$NotificationTappedCopyWithImpl(this._self, this._then);

  final _NotificationTapped _self;
  final $Res Function(_NotificationTapped) _then;

/// Create a copy of VentorNotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(_NotificationTapped(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteRequested implements VentorNotificationsEvent {
  const _DeleteRequested({required this.notificationId});
  

 final  String notificationId;

/// Create a copy of VentorNotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteRequestedCopyWith<_DeleteRequested> get copyWith => __$DeleteRequestedCopyWithImpl<_DeleteRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteRequested&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}


@override
int get hashCode => Object.hash(runtimeType,notificationId);

@override
String toString() {
  return 'VentorNotificationsEvent.deleteRequested(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class _$DeleteRequestedCopyWith<$Res> implements $VentorNotificationsEventCopyWith<$Res> {
  factory _$DeleteRequestedCopyWith(_DeleteRequested value, $Res Function(_DeleteRequested) _then) = __$DeleteRequestedCopyWithImpl;
@useResult
$Res call({
 String notificationId
});




}
/// @nodoc
class __$DeleteRequestedCopyWithImpl<$Res>
    implements _$DeleteRequestedCopyWith<$Res> {
  __$DeleteRequestedCopyWithImpl(this._self, this._then);

  final _DeleteRequested _self;
  final $Res Function(_DeleteRequested) _then;

/// Create a copy of VentorNotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(_DeleteRequested(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VentorNotificationsState {

 VentorNotificationsStatus get status; List<AppNotification> get items; bool get unreadOnly; bool get isMarkingAllAsRead; String? get deletingNotificationId; String get errorMessage;
/// Create a copy of VentorNotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorNotificationsStateCopyWith<VentorNotificationsState> get copyWith => _$VentorNotificationsStateCopyWithImpl<VentorNotificationsState>(this as VentorNotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorNotificationsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.unreadOnly, unreadOnly) || other.unreadOnly == unreadOnly)&&(identical(other.isMarkingAllAsRead, isMarkingAllAsRead) || other.isMarkingAllAsRead == isMarkingAllAsRead)&&(identical(other.deletingNotificationId, deletingNotificationId) || other.deletingNotificationId == deletingNotificationId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),unreadOnly,isMarkingAllAsRead,deletingNotificationId,errorMessage);

@override
String toString() {
  return 'VentorNotificationsState(status: $status, items: $items, unreadOnly: $unreadOnly, isMarkingAllAsRead: $isMarkingAllAsRead, deletingNotificationId: $deletingNotificationId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorNotificationsStateCopyWith<$Res>  {
  factory $VentorNotificationsStateCopyWith(VentorNotificationsState value, $Res Function(VentorNotificationsState) _then) = _$VentorNotificationsStateCopyWithImpl;
@useResult
$Res call({
 VentorNotificationsStatus status, List<AppNotification> items, bool unreadOnly, bool isMarkingAllAsRead, String? deletingNotificationId, String errorMessage
});




}
/// @nodoc
class _$VentorNotificationsStateCopyWithImpl<$Res>
    implements $VentorNotificationsStateCopyWith<$Res> {
  _$VentorNotificationsStateCopyWithImpl(this._self, this._then);

  final VentorNotificationsState _self;
  final $Res Function(VentorNotificationsState) _then;

/// Create a copy of VentorNotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? unreadOnly = null,Object? isMarkingAllAsRead = null,Object? deletingNotificationId = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorNotificationsStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AppNotification>,unreadOnly: null == unreadOnly ? _self.unreadOnly : unreadOnly // ignore: cast_nullable_to_non_nullable
as bool,isMarkingAllAsRead: null == isMarkingAllAsRead ? _self.isMarkingAllAsRead : isMarkingAllAsRead // ignore: cast_nullable_to_non_nullable
as bool,deletingNotificationId: freezed == deletingNotificationId ? _self.deletingNotificationId : deletingNotificationId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorNotificationsState].
extension VentorNotificationsStatePatterns on VentorNotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorNotificationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorNotificationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorNotificationsState value)  $default,){
final _that = this;
switch (_that) {
case _VentorNotificationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorNotificationsState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorNotificationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorNotificationsStatus status,  List<AppNotification> items,  bool unreadOnly,  bool isMarkingAllAsRead,  String? deletingNotificationId,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorNotificationsState() when $default != null:
return $default(_that.status,_that.items,_that.unreadOnly,_that.isMarkingAllAsRead,_that.deletingNotificationId,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorNotificationsStatus status,  List<AppNotification> items,  bool unreadOnly,  bool isMarkingAllAsRead,  String? deletingNotificationId,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorNotificationsState():
return $default(_that.status,_that.items,_that.unreadOnly,_that.isMarkingAllAsRead,_that.deletingNotificationId,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorNotificationsStatus status,  List<AppNotification> items,  bool unreadOnly,  bool isMarkingAllAsRead,  String? deletingNotificationId,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorNotificationsState() when $default != null:
return $default(_that.status,_that.items,_that.unreadOnly,_that.isMarkingAllAsRead,_that.deletingNotificationId,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorNotificationsState extends VentorNotificationsState {
  const _VentorNotificationsState({this.status = VentorNotificationsStatus.initial, final  List<AppNotification> items = const <AppNotification>[], this.unreadOnly = false, this.isMarkingAllAsRead = false, this.deletingNotificationId, this.errorMessage = ''}): _items = items,super._();
  

@override@JsonKey() final  VentorNotificationsStatus status;
 final  List<AppNotification> _items;
@override@JsonKey() List<AppNotification> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool unreadOnly;
@override@JsonKey() final  bool isMarkingAllAsRead;
@override final  String? deletingNotificationId;
@override@JsonKey() final  String errorMessage;

/// Create a copy of VentorNotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorNotificationsStateCopyWith<_VentorNotificationsState> get copyWith => __$VentorNotificationsStateCopyWithImpl<_VentorNotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorNotificationsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.unreadOnly, unreadOnly) || other.unreadOnly == unreadOnly)&&(identical(other.isMarkingAllAsRead, isMarkingAllAsRead) || other.isMarkingAllAsRead == isMarkingAllAsRead)&&(identical(other.deletingNotificationId, deletingNotificationId) || other.deletingNotificationId == deletingNotificationId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),unreadOnly,isMarkingAllAsRead,deletingNotificationId,errorMessage);

@override
String toString() {
  return 'VentorNotificationsState(status: $status, items: $items, unreadOnly: $unreadOnly, isMarkingAllAsRead: $isMarkingAllAsRead, deletingNotificationId: $deletingNotificationId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorNotificationsStateCopyWith<$Res> implements $VentorNotificationsStateCopyWith<$Res> {
  factory _$VentorNotificationsStateCopyWith(_VentorNotificationsState value, $Res Function(_VentorNotificationsState) _then) = __$VentorNotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 VentorNotificationsStatus status, List<AppNotification> items, bool unreadOnly, bool isMarkingAllAsRead, String? deletingNotificationId, String errorMessage
});




}
/// @nodoc
class __$VentorNotificationsStateCopyWithImpl<$Res>
    implements _$VentorNotificationsStateCopyWith<$Res> {
  __$VentorNotificationsStateCopyWithImpl(this._self, this._then);

  final _VentorNotificationsState _self;
  final $Res Function(_VentorNotificationsState) _then;

/// Create a copy of VentorNotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? unreadOnly = null,Object? isMarkingAllAsRead = null,Object? deletingNotificationId = freezed,Object? errorMessage = null,}) {
  return _then(_VentorNotificationsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorNotificationsStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AppNotification>,unreadOnly: null == unreadOnly ? _self.unreadOnly : unreadOnly // ignore: cast_nullable_to_non_nullable
as bool,isMarkingAllAsRead: null == isMarkingAllAsRead ? _self.isMarkingAllAsRead : isMarkingAllAsRead // ignore: cast_nullable_to_non_nullable
as bool,deletingNotificationId: freezed == deletingNotificationId ? _self.deletingNotificationId : deletingNotificationId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
