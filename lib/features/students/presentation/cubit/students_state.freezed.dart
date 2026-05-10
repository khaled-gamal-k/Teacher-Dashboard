// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'students_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentsState {

 List<StudentModel> get students; List<ClassesModel> get classes; bool get isLoading; int get currentPage; int get totalPages; int get total; String? get error;
/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentsStateCopyWith<StudentsState> get copyWith => _$StudentsStateCopyWithImpl<StudentsState>(this as StudentsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentsState&&const DeepCollectionEquality().equals(other.students, students)&&const DeepCollectionEquality().equals(other.classes, classes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(students),const DeepCollectionEquality().hash(classes),isLoading,currentPage,totalPages,total,error);

@override
String toString() {
  return 'StudentsState(students: $students, classes: $classes, isLoading: $isLoading, currentPage: $currentPage, totalPages: $totalPages, total: $total, error: $error)';
}


}

/// @nodoc
abstract mixin class $StudentsStateCopyWith<$Res>  {
  factory $StudentsStateCopyWith(StudentsState value, $Res Function(StudentsState) _then) = _$StudentsStateCopyWithImpl;
@useResult
$Res call({
 List<StudentModel> students, List<ClassesModel> classes, bool isLoading, int currentPage, int totalPages, int total, String? error
});




}
/// @nodoc
class _$StudentsStateCopyWithImpl<$Res>
    implements $StudentsStateCopyWith<$Res> {
  _$StudentsStateCopyWithImpl(this._self, this._then);

  final StudentsState _self;
  final $Res Function(StudentsState) _then;

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? students = null,Object? classes = null,Object? isLoading = null,Object? currentPage = null,Object? totalPages = null,Object? total = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
students: null == students ? _self.students : students // ignore: cast_nullable_to_non_nullable
as List<StudentModel>,classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as List<ClassesModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentsState].
extension StudentsStatePatterns on StudentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentsState value)  $default,){
final _that = this;
switch (_that) {
case _StudentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentsState value)?  $default,){
final _that = this;
switch (_that) {
case _StudentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StudentModel> students,  List<ClassesModel> classes,  bool isLoading,  int currentPage,  int totalPages,  int total,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentsState() when $default != null:
return $default(_that.students,_that.classes,_that.isLoading,_that.currentPage,_that.totalPages,_that.total,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StudentModel> students,  List<ClassesModel> classes,  bool isLoading,  int currentPage,  int totalPages,  int total,  String? error)  $default,) {final _that = this;
switch (_that) {
case _StudentsState():
return $default(_that.students,_that.classes,_that.isLoading,_that.currentPage,_that.totalPages,_that.total,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StudentModel> students,  List<ClassesModel> classes,  bool isLoading,  int currentPage,  int totalPages,  int total,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _StudentsState() when $default != null:
return $default(_that.students,_that.classes,_that.isLoading,_that.currentPage,_that.totalPages,_that.total,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _StudentsState implements StudentsState {
  const _StudentsState({final  List<StudentModel> students = const [], final  List<ClassesModel> classes = const [], this.isLoading = false, this.currentPage = 1, this.totalPages = 1, this.total = 0, this.error}): _students = students,_classes = classes;
  

 final  List<StudentModel> _students;
@override@JsonKey() List<StudentModel> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}

 final  List<ClassesModel> _classes;
@override@JsonKey() List<ClassesModel> get classes {
  if (_classes is EqualUnmodifiableListView) return _classes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_classes);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  int total;
@override final  String? error;

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentsStateCopyWith<_StudentsState> get copyWith => __$StudentsStateCopyWithImpl<_StudentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentsState&&const DeepCollectionEquality().equals(other._students, _students)&&const DeepCollectionEquality().equals(other._classes, _classes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_students),const DeepCollectionEquality().hash(_classes),isLoading,currentPage,totalPages,total,error);

@override
String toString() {
  return 'StudentsState(students: $students, classes: $classes, isLoading: $isLoading, currentPage: $currentPage, totalPages: $totalPages, total: $total, error: $error)';
}


}

/// @nodoc
abstract mixin class _$StudentsStateCopyWith<$Res> implements $StudentsStateCopyWith<$Res> {
  factory _$StudentsStateCopyWith(_StudentsState value, $Res Function(_StudentsState) _then) = __$StudentsStateCopyWithImpl;
@override @useResult
$Res call({
 List<StudentModel> students, List<ClassesModel> classes, bool isLoading, int currentPage, int totalPages, int total, String? error
});




}
/// @nodoc
class __$StudentsStateCopyWithImpl<$Res>
    implements _$StudentsStateCopyWith<$Res> {
  __$StudentsStateCopyWithImpl(this._self, this._then);

  final _StudentsState _self;
  final $Res Function(_StudentsState) _then;

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? students = null,Object? classes = null,Object? isLoading = null,Object? currentPage = null,Object? totalPages = null,Object? total = null,Object? error = freezed,}) {
  return _then(_StudentsState(
students: null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<StudentModel>,classes: null == classes ? _self._classes : classes // ignore: cast_nullable_to_non_nullable
as List<ClassesModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
