// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerNotificationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNotificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerNotificationsEvent()';
}


}

/// @nodoc
class $ListenerNotificationsEventCopyWith<$Res>  {
$ListenerNotificationsEventCopyWith(ListenerNotificationsEvent _, $Res Function(ListenerNotificationsEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerNotificationsEvent].
extension ListenerNotificationsEventPatterns on ListenerNotificationsEvent {
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


class _Started implements ListenerNotificationsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerNotificationsEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements ListenerNotificationsEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerNotificationsEvent.retryLoad()';
}


}




/// @nodoc


class _UnreadOnlyFilterChanged implements ListenerNotificationsEvent {
  const _UnreadOnlyFilterChanged({required this.unreadOnly});
  

 final  bool unreadOnly;

/// Create a copy of ListenerNotificationsEvent
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
  return 'ListenerNotificationsEvent.unreadOnlyFilterChanged(unreadOnly: $unreadOnly)';
}


}

/// @nodoc
abstract mixin class _$UnreadOnlyFilterChangedCopyWith<$Res> implements $ListenerNotificationsEventCopyWith<$Res> {
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

/// Create a copy of ListenerNotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unreadOnly = null,}) {
  return _then(_UnreadOnlyFilterChanged(
unreadOnly: null == unreadOnly ? _self.unreadOnly : unreadOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _MarkAllAsReadRequested implements ListenerNotificationsEvent {
  const _MarkAllAsReadRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAllAsReadRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerNotificationsEvent.markAllAsReadRequested()';
}


}




/// @nodoc


class _NotificationTapped implements ListenerNotificationsEvent {
  const _NotificationTapped({required this.notificationId});
  

 final  String notificationId;

/// Create a copy of ListenerNotificationsEvent
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
  return 'ListenerNotificationsEvent.notificationTapped(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class _$NotificationTappedCopyWith<$Res> implements $ListenerNotificationsEventCopyWith<$Res> {
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

/// Create a copy of ListenerNotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(_NotificationTapped(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteRequested implements ListenerNotificationsEvent {
  const _DeleteRequested({required this.notificationId});
  

 final  String notificationId;

/// Create a copy of ListenerNotificationsEvent
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
  return 'ListenerNotificationsEvent.deleteRequested(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class _$DeleteRequestedCopyWith<$Res> implements $ListenerNotificationsEventCopyWith<$Res> {
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

/// Create a copy of ListenerNotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(_DeleteRequested(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ListenerNotificationsState {

 ListenerNotificationsStatus get status; List<ListenerNotification> get items; bool get unreadOnly; bool get isMarkingAllAsRead; String? get deletingNotificationId; String get errorMessage;
/// Create a copy of ListenerNotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerNotificationsStateCopyWith<ListenerNotificationsState> get copyWith => _$ListenerNotificationsStateCopyWithImpl<ListenerNotificationsState>(this as ListenerNotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerNotificationsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.unreadOnly, unreadOnly) || other.unreadOnly == unreadOnly)&&(identical(other.isMarkingAllAsRead, isMarkingAllAsRead) || other.isMarkingAllAsRead == isMarkingAllAsRead)&&(identical(other.deletingNotificationId, deletingNotificationId) || other.deletingNotificationId == deletingNotificationId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),unreadOnly,isMarkingAllAsRead,deletingNotificationId,errorMessage);

@override
String toString() {
  return 'ListenerNotificationsState(status: $status, items: $items, unreadOnly: $unreadOnly, isMarkingAllAsRead: $isMarkingAllAsRead, deletingNotificationId: $deletingNotificationId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerNotificationsStateCopyWith<$Res>  {
  factory $ListenerNotificationsStateCopyWith(ListenerNotificationsState value, $Res Function(ListenerNotificationsState) _then) = _$ListenerNotificationsStateCopyWithImpl;
@useResult
$Res call({
 ListenerNotificationsStatus status, List<ListenerNotification> items, bool unreadOnly, bool isMarkingAllAsRead, String? deletingNotificationId, String errorMessage
});




}
/// @nodoc
class _$ListenerNotificationsStateCopyWithImpl<$Res>
    implements $ListenerNotificationsStateCopyWith<$Res> {
  _$ListenerNotificationsStateCopyWithImpl(this._self, this._then);

  final ListenerNotificationsState _self;
  final $Res Function(ListenerNotificationsState) _then;

/// Create a copy of ListenerNotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? unreadOnly = null,Object? isMarkingAllAsRead = null,Object? deletingNotificationId = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerNotificationsStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerNotification>,unreadOnly: null == unreadOnly ? _self.unreadOnly : unreadOnly // ignore: cast_nullable_to_non_nullable
as bool,isMarkingAllAsRead: null == isMarkingAllAsRead ? _self.isMarkingAllAsRead : isMarkingAllAsRead // ignore: cast_nullable_to_non_nullable
as bool,deletingNotificationId: freezed == deletingNotificationId ? _self.deletingNotificationId : deletingNotificationId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerNotificationsState].
extension ListenerNotificationsStatePatterns on ListenerNotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerNotificationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerNotificationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerNotificationsState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerNotificationsState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerNotificationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerNotificationsStatus status,  List<ListenerNotification> items,  bool unreadOnly,  bool isMarkingAllAsRead,  String? deletingNotificationId,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerNotificationsState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerNotificationsStatus status,  List<ListenerNotification> items,  bool unreadOnly,  bool isMarkingAllAsRead,  String? deletingNotificationId,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationsState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerNotificationsStatus status,  List<ListenerNotification> items,  bool unreadOnly,  bool isMarkingAllAsRead,  String? deletingNotificationId,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerNotificationsState() when $default != null:
return $default(_that.status,_that.items,_that.unreadOnly,_that.isMarkingAllAsRead,_that.deletingNotificationId,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerNotificationsState extends ListenerNotificationsState {
  const _ListenerNotificationsState({this.status = ListenerNotificationsStatus.initial, final  List<ListenerNotification> items = const <ListenerNotification>[], this.unreadOnly = false, this.isMarkingAllAsRead = false, this.deletingNotificationId, this.errorMessage = ''}): _items = items,super._();
  

@override@JsonKey() final  ListenerNotificationsStatus status;
 final  List<ListenerNotification> _items;
@override@JsonKey() List<ListenerNotification> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool unreadOnly;
@override@JsonKey() final  bool isMarkingAllAsRead;
@override final  String? deletingNotificationId;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerNotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerNotificationsStateCopyWith<_ListenerNotificationsState> get copyWith => __$ListenerNotificationsStateCopyWithImpl<_ListenerNotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerNotificationsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.unreadOnly, unreadOnly) || other.unreadOnly == unreadOnly)&&(identical(other.isMarkingAllAsRead, isMarkingAllAsRead) || other.isMarkingAllAsRead == isMarkingAllAsRead)&&(identical(other.deletingNotificationId, deletingNotificationId) || other.deletingNotificationId == deletingNotificationId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),unreadOnly,isMarkingAllAsRead,deletingNotificationId,errorMessage);

@override
String toString() {
  return 'ListenerNotificationsState(status: $status, items: $items, unreadOnly: $unreadOnly, isMarkingAllAsRead: $isMarkingAllAsRead, deletingNotificationId: $deletingNotificationId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerNotificationsStateCopyWith<$Res> implements $ListenerNotificationsStateCopyWith<$Res> {
  factory _$ListenerNotificationsStateCopyWith(_ListenerNotificationsState value, $Res Function(_ListenerNotificationsState) _then) = __$ListenerNotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerNotificationsStatus status, List<ListenerNotification> items, bool unreadOnly, bool isMarkingAllAsRead, String? deletingNotificationId, String errorMessage
});




}
/// @nodoc
class __$ListenerNotificationsStateCopyWithImpl<$Res>
    implements _$ListenerNotificationsStateCopyWith<$Res> {
  __$ListenerNotificationsStateCopyWithImpl(this._self, this._then);

  final _ListenerNotificationsState _self;
  final $Res Function(_ListenerNotificationsState) _then;

/// Create a copy of ListenerNotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? unreadOnly = null,Object? isMarkingAllAsRead = null,Object? deletingNotificationId = freezed,Object? errorMessage = null,}) {
  return _then(_ListenerNotificationsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerNotificationsStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerNotification>,unreadOnly: null == unreadOnly ? _self.unreadOnly : unreadOnly // ignore: cast_nullable_to_non_nullable
as bool,isMarkingAllAsRead: null == isMarkingAllAsRead ? _self.isMarkingAllAsRead : isMarkingAllAsRead // ignore: cast_nullable_to_non_nullable
as bool,deletingNotificationId: freezed == deletingNotificationId ? _self.deletingNotificationId : deletingNotificationId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
