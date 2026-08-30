// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_payout_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerPayoutHistoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutHistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPayoutHistoryEvent()';
}


}

/// @nodoc
class $ListenerPayoutHistoryEventCopyWith<$Res>  {
$ListenerPayoutHistoryEventCopyWith(ListenerPayoutHistoryEvent _, $Res Function(ListenerPayoutHistoryEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerPayoutHistoryEvent].
extension ListenerPayoutHistoryEventPatterns on ListenerPayoutHistoryEvent {
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


class _Started implements ListenerPayoutHistoryEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPayoutHistoryEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements ListenerPayoutHistoryEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerPayoutHistoryEvent.retryLoad()';
}


}




/// @nodoc
mixin _$ListenerPayoutHistoryState {

 ListenerPayoutHistoryLoadStatus get status; List<ListenerPayoutHistoryEntry> get items; String get errorMessage;
/// Create a copy of ListenerPayoutHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerPayoutHistoryStateCopyWith<ListenerPayoutHistoryState> get copyWith => _$ListenerPayoutHistoryStateCopyWithImpl<ListenerPayoutHistoryState>(this as ListenerPayoutHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerPayoutHistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),errorMessage);

@override
String toString() {
  return 'ListenerPayoutHistoryState(status: $status, items: $items, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerPayoutHistoryStateCopyWith<$Res>  {
  factory $ListenerPayoutHistoryStateCopyWith(ListenerPayoutHistoryState value, $Res Function(ListenerPayoutHistoryState) _then) = _$ListenerPayoutHistoryStateCopyWithImpl;
@useResult
$Res call({
 ListenerPayoutHistoryLoadStatus status, List<ListenerPayoutHistoryEntry> items, String errorMessage
});




}
/// @nodoc
class _$ListenerPayoutHistoryStateCopyWithImpl<$Res>
    implements $ListenerPayoutHistoryStateCopyWith<$Res> {
  _$ListenerPayoutHistoryStateCopyWithImpl(this._self, this._then);

  final ListenerPayoutHistoryState _self;
  final $Res Function(ListenerPayoutHistoryState) _then;

/// Create a copy of ListenerPayoutHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerPayoutHistoryLoadStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerPayoutHistoryEntry>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerPayoutHistoryState].
extension ListenerPayoutHistoryStatePatterns on ListenerPayoutHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerPayoutHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerPayoutHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerPayoutHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerPayoutHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerPayoutHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerPayoutHistoryLoadStatus status,  List<ListenerPayoutHistoryEntry> items,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerPayoutHistoryState() when $default != null:
return $default(_that.status,_that.items,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerPayoutHistoryLoadStatus status,  List<ListenerPayoutHistoryEntry> items,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutHistoryState():
return $default(_that.status,_that.items,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerPayoutHistoryLoadStatus status,  List<ListenerPayoutHistoryEntry> items,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerPayoutHistoryState() when $default != null:
return $default(_that.status,_that.items,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerPayoutHistoryState extends ListenerPayoutHistoryState {
  const _ListenerPayoutHistoryState({this.status = ListenerPayoutHistoryLoadStatus.initial, final  List<ListenerPayoutHistoryEntry> items = const <ListenerPayoutHistoryEntry>[], this.errorMessage = ''}): _items = items,super._();
  

@override@JsonKey() final  ListenerPayoutHistoryLoadStatus status;
 final  List<ListenerPayoutHistoryEntry> _items;
@override@JsonKey() List<ListenerPayoutHistoryEntry> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerPayoutHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerPayoutHistoryStateCopyWith<_ListenerPayoutHistoryState> get copyWith => __$ListenerPayoutHistoryStateCopyWithImpl<_ListenerPayoutHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerPayoutHistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),errorMessage);

@override
String toString() {
  return 'ListenerPayoutHistoryState(status: $status, items: $items, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerPayoutHistoryStateCopyWith<$Res> implements $ListenerPayoutHistoryStateCopyWith<$Res> {
  factory _$ListenerPayoutHistoryStateCopyWith(_ListenerPayoutHistoryState value, $Res Function(_ListenerPayoutHistoryState) _then) = __$ListenerPayoutHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerPayoutHistoryLoadStatus status, List<ListenerPayoutHistoryEntry> items, String errorMessage
});




}
/// @nodoc
class __$ListenerPayoutHistoryStateCopyWithImpl<$Res>
    implements _$ListenerPayoutHistoryStateCopyWith<$Res> {
  __$ListenerPayoutHistoryStateCopyWithImpl(this._self, this._then);

  final _ListenerPayoutHistoryState _self;
  final $Res Function(_ListenerPayoutHistoryState) _then;

/// Create a copy of ListenerPayoutHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? errorMessage = null,}) {
  return _then(_ListenerPayoutHistoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerPayoutHistoryLoadStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerPayoutHistoryEntry>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
