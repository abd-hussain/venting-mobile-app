// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listener_reviews_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListenerReviewsResponseModel {

 String get status; ListenerReviewsData get data;
/// Create a copy of ListenerReviewsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerReviewsResponseModelCopyWith<ListenerReviewsResponseModel> get copyWith => _$ListenerReviewsResponseModelCopyWithImpl<ListenerReviewsResponseModel>(this as ListenerReviewsResponseModel, _$identity);

  /// Serializes this ListenerReviewsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerReviewsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerReviewsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $ListenerReviewsResponseModelCopyWith<$Res>  {
  factory $ListenerReviewsResponseModelCopyWith(ListenerReviewsResponseModel value, $Res Function(ListenerReviewsResponseModel) _then) = _$ListenerReviewsResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, ListenerReviewsData data
});


$ListenerReviewsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ListenerReviewsResponseModelCopyWithImpl<$Res>
    implements $ListenerReviewsResponseModelCopyWith<$Res> {
  _$ListenerReviewsResponseModelCopyWithImpl(this._self, this._then);

  final ListenerReviewsResponseModel _self;
  final $Res Function(ListenerReviewsResponseModel) _then;

/// Create a copy of ListenerReviewsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerReviewsData,
  ));
}
/// Create a copy of ListenerReviewsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerReviewsDataCopyWith<$Res> get data {
  
  return $ListenerReviewsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListenerReviewsResponseModel].
extension ListenerReviewsResponseModelPatterns on ListenerReviewsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerReviewsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerReviewsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerReviewsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ListenerReviewsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerReviewsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerReviewsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  ListenerReviewsData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerReviewsResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  ListenerReviewsData data)  $default,) {final _that = this;
switch (_that) {
case _ListenerReviewsResponseModel():
return $default(_that.status,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  ListenerReviewsData data)?  $default,) {final _that = this;
switch (_that) {
case _ListenerReviewsResponseModel() when $default != null:
return $default(_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerReviewsResponseModel implements ListenerReviewsResponseModel {
  const _ListenerReviewsResponseModel({required this.status, required this.data});
  factory _ListenerReviewsResponseModel.fromJson(Map<String, dynamic> json) => _$ListenerReviewsResponseModelFromJson(json);

@override final  String status;
@override final  ListenerReviewsData data;

/// Create a copy of ListenerReviewsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerReviewsResponseModelCopyWith<_ListenerReviewsResponseModel> get copyWith => __$ListenerReviewsResponseModelCopyWithImpl<_ListenerReviewsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerReviewsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerReviewsResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,data);

@override
String toString() {
  return 'ListenerReviewsResponseModel(status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListenerReviewsResponseModelCopyWith<$Res> implements $ListenerReviewsResponseModelCopyWith<$Res> {
  factory _$ListenerReviewsResponseModelCopyWith(_ListenerReviewsResponseModel value, $Res Function(_ListenerReviewsResponseModel) _then) = __$ListenerReviewsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, ListenerReviewsData data
});


@override $ListenerReviewsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ListenerReviewsResponseModelCopyWithImpl<$Res>
    implements _$ListenerReviewsResponseModelCopyWith<$Res> {
  __$ListenerReviewsResponseModelCopyWithImpl(this._self, this._then);

  final _ListenerReviewsResponseModel _self;
  final $Res Function(_ListenerReviewsResponseModel) _then;

/// Create a copy of ListenerReviewsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = null,}) {
  return _then(_ListenerReviewsResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ListenerReviewsData,
  ));
}

/// Create a copy of ListenerReviewsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListenerReviewsDataCopyWith<$Res> get data {
  
  return $ListenerReviewsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListenerReviewsData {

 double get rating; int get review_count; List<ListenerReviewItem> get items;
/// Create a copy of ListenerReviewsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerReviewsDataCopyWith<ListenerReviewsData> get copyWith => _$ListenerReviewsDataCopyWithImpl<ListenerReviewsData>(this as ListenerReviewsData, _$identity);

  /// Serializes this ListenerReviewsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerReviewsData&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.review_count, review_count) || other.review_count == review_count)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rating,review_count,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ListenerReviewsData(rating: $rating, review_count: $review_count, items: $items)';
}


}

/// @nodoc
abstract mixin class $ListenerReviewsDataCopyWith<$Res>  {
  factory $ListenerReviewsDataCopyWith(ListenerReviewsData value, $Res Function(ListenerReviewsData) _then) = _$ListenerReviewsDataCopyWithImpl;
@useResult
$Res call({
 double rating, int review_count, List<ListenerReviewItem> items
});




}
/// @nodoc
class _$ListenerReviewsDataCopyWithImpl<$Res>
    implements $ListenerReviewsDataCopyWith<$Res> {
  _$ListenerReviewsDataCopyWithImpl(this._self, this._then);

  final ListenerReviewsData _self;
  final $Res Function(ListenerReviewsData) _then;

/// Create a copy of ListenerReviewsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rating = null,Object? review_count = null,Object? items = null,}) {
  return _then(_self.copyWith(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,review_count: null == review_count ? _self.review_count : review_count // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerReviewItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerReviewsData].
extension ListenerReviewsDataPatterns on ListenerReviewsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerReviewsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerReviewsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerReviewsData value)  $default,){
final _that = this;
switch (_that) {
case _ListenerReviewsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerReviewsData value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerReviewsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double rating,  int review_count,  List<ListenerReviewItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerReviewsData() when $default != null:
return $default(_that.rating,_that.review_count,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double rating,  int review_count,  List<ListenerReviewItem> items)  $default,) {final _that = this;
switch (_that) {
case _ListenerReviewsData():
return $default(_that.rating,_that.review_count,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double rating,  int review_count,  List<ListenerReviewItem> items)?  $default,) {final _that = this;
switch (_that) {
case _ListenerReviewsData() when $default != null:
return $default(_that.rating,_that.review_count,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerReviewsData implements ListenerReviewsData {
  const _ListenerReviewsData({this.rating = 0.0, this.review_count = 0, final  List<ListenerReviewItem> items = const <ListenerReviewItem>[]}): _items = items;
  factory _ListenerReviewsData.fromJson(Map<String, dynamic> json) => _$ListenerReviewsDataFromJson(json);

@override@JsonKey() final  double rating;
@override@JsonKey() final  int review_count;
 final  List<ListenerReviewItem> _items;
@override@JsonKey() List<ListenerReviewItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ListenerReviewsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerReviewsDataCopyWith<_ListenerReviewsData> get copyWith => __$ListenerReviewsDataCopyWithImpl<_ListenerReviewsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerReviewsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerReviewsData&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.review_count, review_count) || other.review_count == review_count)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rating,review_count,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ListenerReviewsData(rating: $rating, review_count: $review_count, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ListenerReviewsDataCopyWith<$Res> implements $ListenerReviewsDataCopyWith<$Res> {
  factory _$ListenerReviewsDataCopyWith(_ListenerReviewsData value, $Res Function(_ListenerReviewsData) _then) = __$ListenerReviewsDataCopyWithImpl;
@override @useResult
$Res call({
 double rating, int review_count, List<ListenerReviewItem> items
});




}
/// @nodoc
class __$ListenerReviewsDataCopyWithImpl<$Res>
    implements _$ListenerReviewsDataCopyWith<$Res> {
  __$ListenerReviewsDataCopyWithImpl(this._self, this._then);

  final _ListenerReviewsData _self;
  final $Res Function(_ListenerReviewsData) _then;

/// Create a copy of ListenerReviewsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rating = null,Object? review_count = null,Object? items = null,}) {
  return _then(_ListenerReviewsData(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,review_count: null == review_count ? _self.review_count : review_count // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ListenerReviewItem>,
  ));
}


}


/// @nodoc
mixin _$ListenerReviewItem {

 String get id; String get reviewer_name; int get rating; String get comment; String get created_at;
/// Create a copy of ListenerReviewItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListenerReviewItemCopyWith<ListenerReviewItem> get copyWith => _$ListenerReviewItemCopyWithImpl<ListenerReviewItem>(this as ListenerReviewItem, _$identity);

  /// Serializes this ListenerReviewItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListenerReviewItem&&(identical(other.id, id) || other.id == id)&&(identical(other.reviewer_name, reviewer_name) || other.reviewer_name == reviewer_name)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.created_at, created_at) || other.created_at == created_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reviewer_name,rating,comment,created_at);

@override
String toString() {
  return 'ListenerReviewItem(id: $id, reviewer_name: $reviewer_name, rating: $rating, comment: $comment, created_at: $created_at)';
}


}

/// @nodoc
abstract mixin class $ListenerReviewItemCopyWith<$Res>  {
  factory $ListenerReviewItemCopyWith(ListenerReviewItem value, $Res Function(ListenerReviewItem) _then) = _$ListenerReviewItemCopyWithImpl;
@useResult
$Res call({
 String id, String reviewer_name, int rating, String comment, String created_at
});




}
/// @nodoc
class _$ListenerReviewItemCopyWithImpl<$Res>
    implements $ListenerReviewItemCopyWith<$Res> {
  _$ListenerReviewItemCopyWithImpl(this._self, this._then);

  final ListenerReviewItem _self;
  final $Res Function(ListenerReviewItem) _then;

/// Create a copy of ListenerReviewItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reviewer_name = null,Object? rating = null,Object? comment = null,Object? created_at = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reviewer_name: null == reviewer_name ? _self.reviewer_name : reviewer_name // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,created_at: null == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListenerReviewItem].
extension ListenerReviewItemPatterns on ListenerReviewItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListenerReviewItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListenerReviewItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListenerReviewItem value)  $default,){
final _that = this;
switch (_that) {
case _ListenerReviewItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListenerReviewItem value)?  $default,){
final _that = this;
switch (_that) {
case _ListenerReviewItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reviewer_name,  int rating,  String comment,  String created_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListenerReviewItem() when $default != null:
return $default(_that.id,_that.reviewer_name,_that.rating,_that.comment,_that.created_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reviewer_name,  int rating,  String comment,  String created_at)  $default,) {final _that = this;
switch (_that) {
case _ListenerReviewItem():
return $default(_that.id,_that.reviewer_name,_that.rating,_that.comment,_that.created_at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reviewer_name,  int rating,  String comment,  String created_at)?  $default,) {final _that = this;
switch (_that) {
case _ListenerReviewItem() when $default != null:
return $default(_that.id,_that.reviewer_name,_that.rating,_that.comment,_that.created_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListenerReviewItem implements ListenerReviewItem {
  const _ListenerReviewItem({this.id = '', this.reviewer_name = '', this.rating = 0, this.comment = '', this.created_at = ''});
  factory _ListenerReviewItem.fromJson(Map<String, dynamic> json) => _$ListenerReviewItemFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String reviewer_name;
@override@JsonKey() final  int rating;
@override@JsonKey() final  String comment;
@override@JsonKey() final  String created_at;

/// Create a copy of ListenerReviewItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListenerReviewItemCopyWith<_ListenerReviewItem> get copyWith => __$ListenerReviewItemCopyWithImpl<_ListenerReviewItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListenerReviewItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListenerReviewItem&&(identical(other.id, id) || other.id == id)&&(identical(other.reviewer_name, reviewer_name) || other.reviewer_name == reviewer_name)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.created_at, created_at) || other.created_at == created_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reviewer_name,rating,comment,created_at);

@override
String toString() {
  return 'ListenerReviewItem(id: $id, reviewer_name: $reviewer_name, rating: $rating, comment: $comment, created_at: $created_at)';
}


}

/// @nodoc
abstract mixin class _$ListenerReviewItemCopyWith<$Res> implements $ListenerReviewItemCopyWith<$Res> {
  factory _$ListenerReviewItemCopyWith(_ListenerReviewItem value, $Res Function(_ListenerReviewItem) _then) = __$ListenerReviewItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String reviewer_name, int rating, String comment, String created_at
});




}
/// @nodoc
class __$ListenerReviewItemCopyWithImpl<$Res>
    implements _$ListenerReviewItemCopyWith<$Res> {
  __$ListenerReviewItemCopyWithImpl(this._self, this._then);

  final _ListenerReviewItem _self;
  final $Res Function(_ListenerReviewItem) _then;

/// Create a copy of ListenerReviewItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reviewer_name = null,Object? rating = null,Object? comment = null,Object? created_at = null,}) {
  return _then(_ListenerReviewItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reviewer_name: null == reviewer_name ? _self.reviewer_name : reviewer_name // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,created_at: null == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
