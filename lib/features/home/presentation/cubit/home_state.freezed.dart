// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 DashboardModel? get stats; String? get statsError; List<ChartsModel>? get students; String? get studentsError; List<ChartsModel>? get attendance; String? get attendanceError; List<ChartsModel>? get performance; String? get performanceError;// List<ExamModel>? exams,
// String? examsError,
 bool get isLoading;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.statsError, statsError) || other.statsError == statsError)&&const DeepCollectionEquality().equals(other.students, students)&&(identical(other.studentsError, studentsError) || other.studentsError == studentsError)&&const DeepCollectionEquality().equals(other.attendance, attendance)&&(identical(other.attendanceError, attendanceError) || other.attendanceError == attendanceError)&&const DeepCollectionEquality().equals(other.performance, performance)&&(identical(other.performanceError, performanceError) || other.performanceError == performanceError)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,stats,statsError,const DeepCollectionEquality().hash(students),studentsError,const DeepCollectionEquality().hash(attendance),attendanceError,const DeepCollectionEquality().hash(performance),performanceError,isLoading);

@override
String toString() {
  return 'HomeState(stats: $stats, statsError: $statsError, students: $students, studentsError: $studentsError, attendance: $attendance, attendanceError: $attendanceError, performance: $performance, performanceError: $performanceError, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 DashboardModel? stats, String? statsError, List<ChartsModel>? students, String? studentsError, List<ChartsModel>? attendance, String? attendanceError, List<ChartsModel>? performance, String? performanceError, bool isLoading
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stats = freezed,Object? statsError = freezed,Object? students = freezed,Object? studentsError = freezed,Object? attendance = freezed,Object? attendanceError = freezed,Object? performance = freezed,Object? performanceError = freezed,Object? isLoading = null,}) {
  return _then(_self.copyWith(
stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as DashboardModel?,statsError: freezed == statsError ? _self.statsError : statsError // ignore: cast_nullable_to_non_nullable
as String?,students: freezed == students ? _self.students : students // ignore: cast_nullable_to_non_nullable
as List<ChartsModel>?,studentsError: freezed == studentsError ? _self.studentsError : studentsError // ignore: cast_nullable_to_non_nullable
as String?,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<ChartsModel>?,attendanceError: freezed == attendanceError ? _self.attendanceError : attendanceError // ignore: cast_nullable_to_non_nullable
as String?,performance: freezed == performance ? _self.performance : performance // ignore: cast_nullable_to_non_nullable
as List<ChartsModel>?,performanceError: freezed == performanceError ? _self.performanceError : performanceError // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DashboardModel? stats,  String? statsError,  List<ChartsModel>? students,  String? studentsError,  List<ChartsModel>? attendance,  String? attendanceError,  List<ChartsModel>? performance,  String? performanceError,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.stats,_that.statsError,_that.students,_that.studentsError,_that.attendance,_that.attendanceError,_that.performance,_that.performanceError,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DashboardModel? stats,  String? statsError,  List<ChartsModel>? students,  String? studentsError,  List<ChartsModel>? attendance,  String? attendanceError,  List<ChartsModel>? performance,  String? performanceError,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.stats,_that.statsError,_that.students,_that.studentsError,_that.attendance,_that.attendanceError,_that.performance,_that.performanceError,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DashboardModel? stats,  String? statsError,  List<ChartsModel>? students,  String? studentsError,  List<ChartsModel>? attendance,  String? attendanceError,  List<ChartsModel>? performance,  String? performanceError,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.stats,_that.statsError,_that.students,_that.studentsError,_that.attendance,_that.attendanceError,_that.performance,_that.performanceError,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.stats, this.statsError, final  List<ChartsModel>? students, this.studentsError, final  List<ChartsModel>? attendance, this.attendanceError, final  List<ChartsModel>? performance, this.performanceError, this.isLoading = false}): _students = students,_attendance = attendance,_performance = performance;
  

@override final  DashboardModel? stats;
@override final  String? statsError;
 final  List<ChartsModel>? _students;
@override List<ChartsModel>? get students {
  final value = _students;
  if (value == null) return null;
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? studentsError;
 final  List<ChartsModel>? _attendance;
@override List<ChartsModel>? get attendance {
  final value = _attendance;
  if (value == null) return null;
  if (_attendance is EqualUnmodifiableListView) return _attendance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? attendanceError;
 final  List<ChartsModel>? _performance;
@override List<ChartsModel>? get performance {
  final value = _performance;
  if (value == null) return null;
  if (_performance is EqualUnmodifiableListView) return _performance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? performanceError;
// List<ExamModel>? exams,
// String? examsError,
@override@JsonKey() final  bool isLoading;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.statsError, statsError) || other.statsError == statsError)&&const DeepCollectionEquality().equals(other._students, _students)&&(identical(other.studentsError, studentsError) || other.studentsError == studentsError)&&const DeepCollectionEquality().equals(other._attendance, _attendance)&&(identical(other.attendanceError, attendanceError) || other.attendanceError == attendanceError)&&const DeepCollectionEquality().equals(other._performance, _performance)&&(identical(other.performanceError, performanceError) || other.performanceError == performanceError)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,stats,statsError,const DeepCollectionEquality().hash(_students),studentsError,const DeepCollectionEquality().hash(_attendance),attendanceError,const DeepCollectionEquality().hash(_performance),performanceError,isLoading);

@override
String toString() {
  return 'HomeState(stats: $stats, statsError: $statsError, students: $students, studentsError: $studentsError, attendance: $attendance, attendanceError: $attendanceError, performance: $performance, performanceError: $performanceError, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 DashboardModel? stats, String? statsError, List<ChartsModel>? students, String? studentsError, List<ChartsModel>? attendance, String? attendanceError, List<ChartsModel>? performance, String? performanceError, bool isLoading
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stats = freezed,Object? statsError = freezed,Object? students = freezed,Object? studentsError = freezed,Object? attendance = freezed,Object? attendanceError = freezed,Object? performance = freezed,Object? performanceError = freezed,Object? isLoading = null,}) {
  return _then(_HomeState(
stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as DashboardModel?,statsError: freezed == statsError ? _self.statsError : statsError // ignore: cast_nullable_to_non_nullable
as String?,students: freezed == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<ChartsModel>?,studentsError: freezed == studentsError ? _self.studentsError : studentsError // ignore: cast_nullable_to_non_nullable
as String?,attendance: freezed == attendance ? _self._attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<ChartsModel>?,attendanceError: freezed == attendanceError ? _self.attendanceError : attendanceError // ignore: cast_nullable_to_non_nullable
as String?,performance: freezed == performance ? _self._performance : performance // ignore: cast_nullable_to_non_nullable
as List<ChartsModel>?,performanceError: freezed == performanceError ? _self.performanceError : performanceError // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
