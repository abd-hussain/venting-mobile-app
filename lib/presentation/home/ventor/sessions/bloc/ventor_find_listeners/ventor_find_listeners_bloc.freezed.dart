// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ventor_find_listeners_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VentorFindListenersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFindListenersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorFindListenersEvent()';
}


}

/// @nodoc
class $VentorFindListenersEventCopyWith<$Res>  {
$VentorFindListenersEventCopyWith(VentorFindListenersEvent _, $Res Function(VentorFindListenersEvent) __);
}


/// Adds pattern-matching-related methods to [VentorFindListenersEvent].
extension VentorFindListenersEventPatterns on VentorFindListenersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _QueryChanged value)?  queryChanged,TResult Function( _TopicChanged value)?  topicChanged,TResult Function( _FiltersChanged value)?  filtersChanged,TResult Function( _FavoriteToggled value)?  favoriteToggled,TResult Function( _ListenerFavoriteUpdated value)?  listenerFavoriteUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _TopicChanged() when topicChanged != null:
return topicChanged(_that);case _FiltersChanged() when filtersChanged != null:
return filtersChanged(_that);case _FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case _ListenerFavoriteUpdated() when listenerFavoriteUpdated != null:
return listenerFavoriteUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _QueryChanged value)  queryChanged,required TResult Function( _TopicChanged value)  topicChanged,required TResult Function( _FiltersChanged value)  filtersChanged,required TResult Function( _FavoriteToggled value)  favoriteToggled,required TResult Function( _ListenerFavoriteUpdated value)  listenerFavoriteUpdated,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _RefreshRequested():
return refreshRequested(_that);case _QueryChanged():
return queryChanged(_that);case _TopicChanged():
return topicChanged(_that);case _FiltersChanged():
return filtersChanged(_that);case _FavoriteToggled():
return favoriteToggled(_that);case _ListenerFavoriteUpdated():
return listenerFavoriteUpdated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _QueryChanged value)?  queryChanged,TResult? Function( _TopicChanged value)?  topicChanged,TResult? Function( _FiltersChanged value)?  filtersChanged,TResult? Function( _FavoriteToggled value)?  favoriteToggled,TResult? Function( _ListenerFavoriteUpdated value)?  listenerFavoriteUpdated,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _TopicChanged() when topicChanged != null:
return topicChanged(_that);case _FiltersChanged() when filtersChanged != null:
return filtersChanged(_that);case _FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case _ListenerFavoriteUpdated() when listenerFavoriteUpdated != null:
return listenerFavoriteUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function()?  refreshRequested,TResult Function( String query)?  queryChanged,TResult Function( int topicIndex)?  topicChanged,TResult Function( VentorSessionFilters filters)?  filtersChanged,TResult Function( String listenerId)?  favoriteToggled,TResult Function( VentorFindListener listener)?  listenerFavoriteUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _TopicChanged() when topicChanged != null:
return topicChanged(_that.topicIndex);case _FiltersChanged() when filtersChanged != null:
return filtersChanged(_that.filters);case _FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that.listenerId);case _ListenerFavoriteUpdated() when listenerFavoriteUpdated != null:
return listenerFavoriteUpdated(_that.listener);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function()  refreshRequested,required TResult Function( String query)  queryChanged,required TResult Function( int topicIndex)  topicChanged,required TResult Function( VentorSessionFilters filters)  filtersChanged,required TResult Function( String listenerId)  favoriteToggled,required TResult Function( VentorFindListener listener)  listenerFavoriteUpdated,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _RefreshRequested():
return refreshRequested();case _QueryChanged():
return queryChanged(_that.query);case _TopicChanged():
return topicChanged(_that.topicIndex);case _FiltersChanged():
return filtersChanged(_that.filters);case _FavoriteToggled():
return favoriteToggled(_that.listenerId);case _ListenerFavoriteUpdated():
return listenerFavoriteUpdated(_that.listener);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function()?  refreshRequested,TResult? Function( String query)?  queryChanged,TResult? Function( int topicIndex)?  topicChanged,TResult? Function( VentorSessionFilters filters)?  filtersChanged,TResult? Function( String listenerId)?  favoriteToggled,TResult? Function( VentorFindListener listener)?  listenerFavoriteUpdated,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _TopicChanged() when topicChanged != null:
return topicChanged(_that.topicIndex);case _FiltersChanged() when filtersChanged != null:
return filtersChanged(_that.filters);case _FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that.listenerId);case _ListenerFavoriteUpdated() when listenerFavoriteUpdated != null:
return listenerFavoriteUpdated(_that.listener);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VentorFindListenersEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorFindListenersEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements VentorFindListenersEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorFindListenersEvent.retryLoad()';
}


}




/// @nodoc


class _RefreshRequested implements VentorFindListenersEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VentorFindListenersEvent.refreshRequested()';
}


}




/// @nodoc


class _QueryChanged implements VentorFindListenersEvent {
  const _QueryChanged(this.query);
  

 final  String query;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryChangedCopyWith<_QueryChanged> get copyWith => __$QueryChangedCopyWithImpl<_QueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'VentorFindListenersEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$QueryChangedCopyWith<$Res> implements $VentorFindListenersEventCopyWith<$Res> {
  factory _$QueryChangedCopyWith(_QueryChanged value, $Res Function(_QueryChanged) _then) = __$QueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$QueryChangedCopyWithImpl<$Res>
    implements _$QueryChangedCopyWith<$Res> {
  __$QueryChangedCopyWithImpl(this._self, this._then);

  final _QueryChanged _self;
  final $Res Function(_QueryChanged) _then;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_QueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TopicChanged implements VentorFindListenersEvent {
  const _TopicChanged(this.topicIndex);
  

 final  int topicIndex;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicChangedCopyWith<_TopicChanged> get copyWith => __$TopicChangedCopyWithImpl<_TopicChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicChanged&&(identical(other.topicIndex, topicIndex) || other.topicIndex == topicIndex));
}


@override
int get hashCode => Object.hash(runtimeType,topicIndex);

@override
String toString() {
  return 'VentorFindListenersEvent.topicChanged(topicIndex: $topicIndex)';
}


}

/// @nodoc
abstract mixin class _$TopicChangedCopyWith<$Res> implements $VentorFindListenersEventCopyWith<$Res> {
  factory _$TopicChangedCopyWith(_TopicChanged value, $Res Function(_TopicChanged) _then) = __$TopicChangedCopyWithImpl;
@useResult
$Res call({
 int topicIndex
});




}
/// @nodoc
class __$TopicChangedCopyWithImpl<$Res>
    implements _$TopicChangedCopyWith<$Res> {
  __$TopicChangedCopyWithImpl(this._self, this._then);

  final _TopicChanged _self;
  final $Res Function(_TopicChanged) _then;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? topicIndex = null,}) {
  return _then(_TopicChanged(
null == topicIndex ? _self.topicIndex : topicIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FiltersChanged implements VentorFindListenersEvent {
  const _FiltersChanged(this.filters);
  

 final  VentorSessionFilters filters;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FiltersChangedCopyWith<_FiltersChanged> get copyWith => __$FiltersChangedCopyWithImpl<_FiltersChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FiltersChanged&&(identical(other.filters, filters) || other.filters == filters));
}


@override
int get hashCode => Object.hash(runtimeType,filters);

@override
String toString() {
  return 'VentorFindListenersEvent.filtersChanged(filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$FiltersChangedCopyWith<$Res> implements $VentorFindListenersEventCopyWith<$Res> {
  factory _$FiltersChangedCopyWith(_FiltersChanged value, $Res Function(_FiltersChanged) _then) = __$FiltersChangedCopyWithImpl;
@useResult
$Res call({
 VentorSessionFilters filters
});




}
/// @nodoc
class __$FiltersChangedCopyWithImpl<$Res>
    implements _$FiltersChangedCopyWith<$Res> {
  __$FiltersChangedCopyWithImpl(this._self, this._then);

  final _FiltersChanged _self;
  final $Res Function(_FiltersChanged) _then;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filters = null,}) {
  return _then(_FiltersChanged(
null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as VentorSessionFilters,
  ));
}


}

/// @nodoc


class _FavoriteToggled implements VentorFindListenersEvent {
  const _FavoriteToggled({required this.listenerId});
  

 final  String listenerId;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteToggledCopyWith<_FavoriteToggled> get copyWith => __$FavoriteToggledCopyWithImpl<_FavoriteToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteToggled&&(identical(other.listenerId, listenerId) || other.listenerId == listenerId));
}


@override
int get hashCode => Object.hash(runtimeType,listenerId);

@override
String toString() {
  return 'VentorFindListenersEvent.favoriteToggled(listenerId: $listenerId)';
}


}

/// @nodoc
abstract mixin class _$FavoriteToggledCopyWith<$Res> implements $VentorFindListenersEventCopyWith<$Res> {
  factory _$FavoriteToggledCopyWith(_FavoriteToggled value, $Res Function(_FavoriteToggled) _then) = __$FavoriteToggledCopyWithImpl;
@useResult
$Res call({
 String listenerId
});




}
/// @nodoc
class __$FavoriteToggledCopyWithImpl<$Res>
    implements _$FavoriteToggledCopyWith<$Res> {
  __$FavoriteToggledCopyWithImpl(this._self, this._then);

  final _FavoriteToggled _self;
  final $Res Function(_FavoriteToggled) _then;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? listenerId = null,}) {
  return _then(_FavoriteToggled(
listenerId: null == listenerId ? _self.listenerId : listenerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ListenerFavoriteUpdated implements VentorFindListenersEvent {
  const _ListenerFavoriteUpdated(this.listener);
  

 final  VentorFindListener listener;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerFavoriteUpdatedCopyWith<_ListenerFavoriteUpdated> get copyWith => __$ListenerFavoriteUpdatedCopyWithImpl<_ListenerFavoriteUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerFavoriteUpdated&&(identical(other.listener, listener) || other.listener == listener));
}


@override
int get hashCode => Object.hash(runtimeType,listener);

@override
String toString() {
  return 'VentorFindListenersEvent.listenerFavoriteUpdated(listener: $listener)';
}


}

/// @nodoc
abstract mixin class _$ListenerFavoriteUpdatedCopyWith<$Res> implements $VentorFindListenersEventCopyWith<$Res> {
  factory _$ListenerFavoriteUpdatedCopyWith(_ListenerFavoriteUpdated value, $Res Function(_ListenerFavoriteUpdated) _then) = __$ListenerFavoriteUpdatedCopyWithImpl;
@useResult
$Res call({
 VentorFindListener listener
});




}
/// @nodoc
class __$ListenerFavoriteUpdatedCopyWithImpl<$Res>
    implements _$ListenerFavoriteUpdatedCopyWith<$Res> {
  __$ListenerFavoriteUpdatedCopyWithImpl(this._self, this._then);

  final _ListenerFavoriteUpdated _self;
  final $Res Function(_ListenerFavoriteUpdated) _then;

/// Create a copy of VentorFindListenersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? listener = null,}) {
  return _then(_ListenerFavoriteUpdated(
null == listener ? _self.listener : listener // ignore: cast_nullable_to_non_nullable
as VentorFindListener,
  ));
}


}

/// @nodoc
mixin _$VentorFindListenersState {

 VentorFindListenersStatus get status; List<VentorFindListener> get listeners; int get total; String get query; int get topicIndex; VentorSessionFilters get filters; bool get isRefreshing; Set<String> get favoriteUpdatingIds; String get errorMessage; String get favoriteErrorMessage;
/// Create a copy of VentorFindListenersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VentorFindListenersStateCopyWith<VentorFindListenersState> get copyWith => _$VentorFindListenersStateCopyWithImpl<VentorFindListenersState>(this as VentorFindListenersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VentorFindListenersState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.listeners, listeners)&&(identical(other.total, total) || other.total == total)&&(identical(other.query, query) || other.query == query)&&(identical(other.topicIndex, topicIndex) || other.topicIndex == topicIndex)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&const DeepCollectionEquality().equals(other.favoriteUpdatingIds, favoriteUpdatingIds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.favoriteErrorMessage, favoriteErrorMessage) || other.favoriteErrorMessage == favoriteErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(listeners),total,query,topicIndex,filters,isRefreshing,const DeepCollectionEquality().hash(favoriteUpdatingIds),errorMessage,favoriteErrorMessage);

@override
String toString() {
  return 'VentorFindListenersState(status: $status, listeners: $listeners, total: $total, query: $query, topicIndex: $topicIndex, filters: $filters, isRefreshing: $isRefreshing, favoriteUpdatingIds: $favoriteUpdatingIds, errorMessage: $errorMessage, favoriteErrorMessage: $favoriteErrorMessage)';
}


}

/// @nodoc
abstract mixin class $VentorFindListenersStateCopyWith<$Res>  {
  factory $VentorFindListenersStateCopyWith(VentorFindListenersState value, $Res Function(VentorFindListenersState) _then) = _$VentorFindListenersStateCopyWithImpl;
@useResult
$Res call({
 VentorFindListenersStatus status, List<VentorFindListener> listeners, int total, String query, int topicIndex, VentorSessionFilters filters, bool isRefreshing, Set<String> favoriteUpdatingIds, String errorMessage, String favoriteErrorMessage
});




}
/// @nodoc
class _$VentorFindListenersStateCopyWithImpl<$Res>
    implements $VentorFindListenersStateCopyWith<$Res> {
  _$VentorFindListenersStateCopyWithImpl(this._self, this._then);

  final VentorFindListenersState _self;
  final $Res Function(VentorFindListenersState) _then;

/// Create a copy of VentorFindListenersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? listeners = null,Object? total = null,Object? query = null,Object? topicIndex = null,Object? filters = null,Object? isRefreshing = null,Object? favoriteUpdatingIds = null,Object? errorMessage = null,Object? favoriteErrorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorFindListenersStatus,listeners: null == listeners ? _self.listeners : listeners // ignore: cast_nullable_to_non_nullable
as List<VentorFindListener>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,topicIndex: null == topicIndex ? _self.topicIndex : topicIndex // ignore: cast_nullable_to_non_nullable
as int,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as VentorSessionFilters,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,favoriteUpdatingIds: null == favoriteUpdatingIds ? _self.favoriteUpdatingIds : favoriteUpdatingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,favoriteErrorMessage: null == favoriteErrorMessage ? _self.favoriteErrorMessage : favoriteErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VentorFindListenersState].
extension VentorFindListenersStatePatterns on VentorFindListenersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VentorFindListenersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VentorFindListenersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VentorFindListenersState value)  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VentorFindListenersState value)?  $default,){
final _that = this;
switch (_that) {
case _VentorFindListenersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VentorFindListenersStatus status,  List<VentorFindListener> listeners,  int total,  String query,  int topicIndex,  VentorSessionFilters filters,  bool isRefreshing,  Set<String> favoriteUpdatingIds,  String errorMessage,  String favoriteErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VentorFindListenersState() when $default != null:
return $default(_that.status,_that.listeners,_that.total,_that.query,_that.topicIndex,_that.filters,_that.isRefreshing,_that.favoriteUpdatingIds,_that.errorMessage,_that.favoriteErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VentorFindListenersStatus status,  List<VentorFindListener> listeners,  int total,  String query,  int topicIndex,  VentorSessionFilters filters,  bool isRefreshing,  Set<String> favoriteUpdatingIds,  String errorMessage,  String favoriteErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenersState():
return $default(_that.status,_that.listeners,_that.total,_that.query,_that.topicIndex,_that.filters,_that.isRefreshing,_that.favoriteUpdatingIds,_that.errorMessage,_that.favoriteErrorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VentorFindListenersStatus status,  List<VentorFindListener> listeners,  int total,  String query,  int topicIndex,  VentorSessionFilters filters,  bool isRefreshing,  Set<String> favoriteUpdatingIds,  String errorMessage,  String favoriteErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VentorFindListenersState() when $default != null:
return $default(_that.status,_that.listeners,_that.total,_that.query,_that.topicIndex,_that.filters,_that.isRefreshing,_that.favoriteUpdatingIds,_that.errorMessage,_that.favoriteErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VentorFindListenersState extends VentorFindListenersState {
  const _VentorFindListenersState({this.status = VentorFindListenersStatus.initial, final  List<VentorFindListener> listeners = const <VentorFindListener>[], this.total = 0, this.query = '', this.topicIndex = 0, this.filters = const VentorSessionFilters(), this.isRefreshing = false, final  Set<String> favoriteUpdatingIds = const <String>{}, this.errorMessage = '', this.favoriteErrorMessage = ''}): _listeners = listeners,_favoriteUpdatingIds = favoriteUpdatingIds,super._();
  

@override@JsonKey() final  VentorFindListenersStatus status;
 final  List<VentorFindListener> _listeners;
@override@JsonKey() List<VentorFindListener> get listeners {
  if (_listeners is EqualUnmodifiableListView) return _listeners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listeners);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  String query;
@override@JsonKey() final  int topicIndex;
@override@JsonKey() final  VentorSessionFilters filters;
@override@JsonKey() final  bool isRefreshing;
 final  Set<String> _favoriteUpdatingIds;
@override@JsonKey() Set<String> get favoriteUpdatingIds {
  if (_favoriteUpdatingIds is EqualUnmodifiableSetView) return _favoriteUpdatingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favoriteUpdatingIds);
}

@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String favoriteErrorMessage;

/// Create a copy of VentorFindListenersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VentorFindListenersStateCopyWith<_VentorFindListenersState> get copyWith => __$VentorFindListenersStateCopyWithImpl<_VentorFindListenersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VentorFindListenersState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._listeners, _listeners)&&(identical(other.total, total) || other.total == total)&&(identical(other.query, query) || other.query == query)&&(identical(other.topicIndex, topicIndex) || other.topicIndex == topicIndex)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&const DeepCollectionEquality().equals(other._favoriteUpdatingIds, _favoriteUpdatingIds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.favoriteErrorMessage, favoriteErrorMessage) || other.favoriteErrorMessage == favoriteErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_listeners),total,query,topicIndex,filters,isRefreshing,const DeepCollectionEquality().hash(_favoriteUpdatingIds),errorMessage,favoriteErrorMessage);

@override
String toString() {
  return 'VentorFindListenersState(status: $status, listeners: $listeners, total: $total, query: $query, topicIndex: $topicIndex, filters: $filters, isRefreshing: $isRefreshing, favoriteUpdatingIds: $favoriteUpdatingIds, errorMessage: $errorMessage, favoriteErrorMessage: $favoriteErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$VentorFindListenersStateCopyWith<$Res> implements $VentorFindListenersStateCopyWith<$Res> {
  factory _$VentorFindListenersStateCopyWith(_VentorFindListenersState value, $Res Function(_VentorFindListenersState) _then) = __$VentorFindListenersStateCopyWithImpl;
@override @useResult
$Res call({
 VentorFindListenersStatus status, List<VentorFindListener> listeners, int total, String query, int topicIndex, VentorSessionFilters filters, bool isRefreshing, Set<String> favoriteUpdatingIds, String errorMessage, String favoriteErrorMessage
});




}
/// @nodoc
class __$VentorFindListenersStateCopyWithImpl<$Res>
    implements _$VentorFindListenersStateCopyWith<$Res> {
  __$VentorFindListenersStateCopyWithImpl(this._self, this._then);

  final _VentorFindListenersState _self;
  final $Res Function(_VentorFindListenersState) _then;

/// Create a copy of VentorFindListenersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? listeners = null,Object? total = null,Object? query = null,Object? topicIndex = null,Object? filters = null,Object? isRefreshing = null,Object? favoriteUpdatingIds = null,Object? errorMessage = null,Object? favoriteErrorMessage = null,}) {
  return _then(_VentorFindListenersState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VentorFindListenersStatus,listeners: null == listeners ? _self._listeners : listeners // ignore: cast_nullable_to_non_nullable
as List<VentorFindListener>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,topicIndex: null == topicIndex ? _self.topicIndex : topicIndex // ignore: cast_nullable_to_non_nullable
as int,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as VentorSessionFilters,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,favoriteUpdatingIds: null == favoriteUpdatingIds ? _self._favoriteUpdatingIds : favoriteUpdatingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,favoriteErrorMessage: null == favoriteErrorMessage ? _self.favoriteErrorMessage : favoriteErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
