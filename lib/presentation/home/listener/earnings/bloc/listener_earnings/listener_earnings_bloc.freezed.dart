// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_earnings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListenerEarningsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerEarningsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerEarningsEvent()';
}


}

/// @nodoc
class $ListenerEarningsEventCopyWith<$Res>  {
$ListenerEarningsEventCopyWith(ListenerEarningsEvent _, $Res Function(ListenerEarningsEvent) __);
}


/// Adds pattern-matching-related methods to [ListenerEarningsEvent].
extension ListenerEarningsEventPatterns on ListenerEarningsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RetryLoad value)?  retryLoad,TResult Function( _RefreshRequested value)?  refreshRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RetryLoad value)  retryLoad,required TResult Function( _RefreshRequested value)  refreshRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RetryLoad():
return retryLoad(_that);case _RefreshRequested():
return refreshRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RetryLoad value)?  retryLoad,TResult? Function( _RefreshRequested value)?  refreshRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RetryLoad() when retryLoad != null:
return retryLoad(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  retryLoad,TResult Function()?  refreshRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  retryLoad,required TResult Function()  refreshRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RetryLoad():
return retryLoad();case _RefreshRequested():
return refreshRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  retryLoad,TResult? Function()?  refreshRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RetryLoad() when retryLoad != null:
return retryLoad();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ListenerEarningsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerEarningsEvent.started()';
}


}




/// @nodoc


class _RetryLoad implements ListenerEarningsEvent {
  const _RetryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerEarningsEvent.retryLoad()';
}


}




/// @nodoc


class _RefreshRequested implements ListenerEarningsEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListenerEarningsEvent.refreshRequested()';
}


}




/// @nodoc
mixin _$ListenerEarningsState {

 ListenerEarningsStatus get status; ListenerEarningsOverview? get overview; bool get isProfileUnderReview; String get errorMessage;
/// Create a copy of ListenerEarningsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerEarningsStateCopyWith<ListenerEarningsState> get copyWith => _$ListenerEarningsStateCopyWithImpl<ListenerEarningsState>(this as ListenerEarningsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerEarningsState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.isProfileUnderReview, isProfileUnderReview) || other.isProfileUnderReview == isProfileUnderReview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,isProfileUnderReview,errorMessage);

@override
String toString() {
  return 'ListenerEarningsState(status: $status, overview: $overview, isProfileUnderReview: $isProfileUnderReview, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListenerEarningsStateCopyWith<$Res>  {
  factory $ListenerEarningsStateCopyWith(ListenerEarningsState value, $Res Function(ListenerEarningsState) _then) = _$ListenerEarningsStateCopyWithImpl;
@useResult
$Res call({
 ListenerEarningsStatus status, ListenerEarningsOverview? overview, bool isProfileUnderReview, String errorMessage
});




}
/// @nodoc
class _$ListenerEarningsStateCopyWithImpl<$Res>
    implements $ListenerEarningsStateCopyWith<$Res> {
  _$ListenerEarningsStateCopyWithImpl(this._self, this._then);

  final ListenerEarningsState _self;
  final $Res Function(ListenerEarningsState) _then;

/// Create a copy of ListenerEarningsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? overview = freezed,Object? isProfileUnderReview = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerEarningsStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as ListenerEarningsOverview?,isProfileUnderReview: null == isProfileUnderReview ? _self.isProfileUnderReview : isProfileUnderReview // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerEarningsState].
extension ListenerEarningsStatePatterns on ListenerEarningsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerEarningsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerEarningsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerEarningsState value)  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerEarningsState value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerEarningsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListenerEarningsStatus status,  ListenerEarningsOverview? overview,  bool isProfileUnderReview,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerEarningsState() when $default != null:
return $default(_that.status,_that.overview,_that.isProfileUnderReview,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListenerEarningsStatus status,  ListenerEarningsOverview? overview,  bool isProfileUnderReview,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsState():
return $default(_that.status,_that.overview,_that.isProfileUnderReview,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListenerEarningsStatus status,  ListenerEarningsOverview? overview,  bool isProfileUnderReview,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListenerEarningsState() when $default != null:
return $default(_that.status,_that.overview,_that.isProfileUnderReview,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListenerEarningsState extends ListenerEarningsState {
  const _ListenerEarningsState({this.status = ListenerEarningsStatus.initial, this.overview, this.isProfileUnderReview = false, this.errorMessage = ''}): super._();
  

@override@JsonKey() final  ListenerEarningsStatus status;
@override final  ListenerEarningsOverview? overview;
@override@JsonKey() final  bool isProfileUnderReview;
@override@JsonKey() final  String errorMessage;

/// Create a copy of ListenerEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerEarningsStateCopyWith<_ListenerEarningsState> get copyWith => __$ListenerEarningsStateCopyWithImpl<_ListenerEarningsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerEarningsState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.isProfileUnderReview, isProfileUnderReview) || other.isProfileUnderReview == isProfileUnderReview)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,isProfileUnderReview,errorMessage);

@override
String toString() {
  return 'ListenerEarningsState(status: $status, overview: $overview, isProfileUnderReview: $isProfileUnderReview, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListenerEarningsStateCopyWith<$Res> implements $ListenerEarningsStateCopyWith<$Res> {
  factory _$ListenerEarningsStateCopyWith(_ListenerEarningsState value, $Res Function(_ListenerEarningsState) _then) = __$ListenerEarningsStateCopyWithImpl;
@override @useResult
$Res call({
 ListenerEarningsStatus status, ListenerEarningsOverview? overview, bool isProfileUnderReview, String errorMessage
});




}
/// @nodoc
class __$ListenerEarningsStateCopyWithImpl<$Res>
    implements _$ListenerEarningsStateCopyWith<$Res> {
  __$ListenerEarningsStateCopyWithImpl(this._self, this._then);

  final _ListenerEarningsState _self;
  final $Res Function(_ListenerEarningsState) _then;

/// Create a copy of ListenerEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? overview = freezed,Object? isProfileUnderReview = null,Object? errorMessage = null,}) {
  return _then(_ListenerEarningsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ListenerEarningsStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as ListenerEarningsOverview?,isProfileUnderReview: null == isProfileUnderReview ? _self.isProfileUnderReview : isProfileUnderReview // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
