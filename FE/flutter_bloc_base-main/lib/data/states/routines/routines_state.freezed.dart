// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routines_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoutinesState {
  List<YogaRoutine> get routines => throw _privateConstructorUsedError;
  List<UserRoutineProgress> get inProgressRoutines =>
      throw _privateConstructorUsedError;
  List<UserRoutineProgress> get completedRoutines =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Create a copy of RoutinesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoutinesStateCopyWith<RoutinesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutinesStateCopyWith<$Res> {
  factory $RoutinesStateCopyWith(
          RoutinesState value, $Res Function(RoutinesState) then) =
      _$RoutinesStateCopyWithImpl<$Res, RoutinesState>;
  @useResult
  $Res call(
      {List<YogaRoutine> routines,
      List<UserRoutineProgress> inProgressRoutines,
      List<UserRoutineProgress> completedRoutines,
      bool isLoading,
      String? error,
      int currentPage,
      bool hasMore});
}

/// @nodoc
class _$RoutinesStateCopyWithImpl<$Res, $Val extends RoutinesState>
    implements $RoutinesStateCopyWith<$Res> {
  _$RoutinesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoutinesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routines = null,
    Object? inProgressRoutines = null,
    Object? completedRoutines = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? currentPage = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      routines: null == routines
          ? _value.routines
          : routines // ignore: cast_nullable_to_non_nullable
              as List<YogaRoutine>,
      inProgressRoutines: null == inProgressRoutines
          ? _value.inProgressRoutines
          : inProgressRoutines // ignore: cast_nullable_to_non_nullable
              as List<UserRoutineProgress>,
      completedRoutines: null == completedRoutines
          ? _value.completedRoutines
          : completedRoutines // ignore: cast_nullable_to_non_nullable
              as List<UserRoutineProgress>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutinesStateImplCopyWith<$Res>
    implements $RoutinesStateCopyWith<$Res> {
  factory _$$RoutinesStateImplCopyWith(
          _$RoutinesStateImpl value, $Res Function(_$RoutinesStateImpl) then) =
      __$$RoutinesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<YogaRoutine> routines,
      List<UserRoutineProgress> inProgressRoutines,
      List<UserRoutineProgress> completedRoutines,
      bool isLoading,
      String? error,
      int currentPage,
      bool hasMore});
}

/// @nodoc
class __$$RoutinesStateImplCopyWithImpl<$Res>
    extends _$RoutinesStateCopyWithImpl<$Res, _$RoutinesStateImpl>
    implements _$$RoutinesStateImplCopyWith<$Res> {
  __$$RoutinesStateImplCopyWithImpl(
      _$RoutinesStateImpl _value, $Res Function(_$RoutinesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoutinesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routines = null,
    Object? inProgressRoutines = null,
    Object? completedRoutines = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? currentPage = null,
    Object? hasMore = null,
  }) {
    return _then(_$RoutinesStateImpl(
      routines: null == routines
          ? _value._routines
          : routines // ignore: cast_nullable_to_non_nullable
              as List<YogaRoutine>,
      inProgressRoutines: null == inProgressRoutines
          ? _value._inProgressRoutines
          : inProgressRoutines // ignore: cast_nullable_to_non_nullable
              as List<UserRoutineProgress>,
      completedRoutines: null == completedRoutines
          ? _value._completedRoutines
          : completedRoutines // ignore: cast_nullable_to_non_nullable
              as List<UserRoutineProgress>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RoutinesStateImpl implements _RoutinesState {
  const _$RoutinesStateImpl(
      {final List<YogaRoutine> routines = const [],
      final List<UserRoutineProgress> inProgressRoutines = const [],
      final List<UserRoutineProgress> completedRoutines = const [],
      this.isLoading = false,
      this.error,
      this.currentPage = 0,
      this.hasMore = false})
      : _routines = routines,
        _inProgressRoutines = inProgressRoutines,
        _completedRoutines = completedRoutines;

  final List<YogaRoutine> _routines;
  @override
  @JsonKey()
  List<YogaRoutine> get routines {
    if (_routines is EqualUnmodifiableListView) return _routines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routines);
  }

  final List<UserRoutineProgress> _inProgressRoutines;
  @override
  @JsonKey()
  List<UserRoutineProgress> get inProgressRoutines {
    if (_inProgressRoutines is EqualUnmodifiableListView)
      return _inProgressRoutines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inProgressRoutines);
  }

  final List<UserRoutineProgress> _completedRoutines;
  @override
  @JsonKey()
  List<UserRoutineProgress> get completedRoutines {
    if (_completedRoutines is EqualUnmodifiableListView)
      return _completedRoutines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedRoutines);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasMore;

  @override
  String toString() {
    return 'RoutinesState(routines: $routines, inProgressRoutines: $inProgressRoutines, completedRoutines: $completedRoutines, isLoading: $isLoading, error: $error, currentPage: $currentPage, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutinesStateImpl &&
            const DeepCollectionEquality().equals(other._routines, _routines) &&
            const DeepCollectionEquality()
                .equals(other._inProgressRoutines, _inProgressRoutines) &&
            const DeepCollectionEquality()
                .equals(other._completedRoutines, _completedRoutines) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_routines),
      const DeepCollectionEquality().hash(_inProgressRoutines),
      const DeepCollectionEquality().hash(_completedRoutines),
      isLoading,
      error,
      currentPage,
      hasMore);

  /// Create a copy of RoutinesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutinesStateImplCopyWith<_$RoutinesStateImpl> get copyWith =>
      __$$RoutinesStateImplCopyWithImpl<_$RoutinesStateImpl>(this, _$identity);
}

abstract class _RoutinesState implements RoutinesState {
  const factory _RoutinesState(
      {final List<YogaRoutine> routines,
      final List<UserRoutineProgress> inProgressRoutines,
      final List<UserRoutineProgress> completedRoutines,
      final bool isLoading,
      final String? error,
      final int currentPage,
      final bool hasMore}) = _$RoutinesStateImpl;

  @override
  List<YogaRoutine> get routines;
  @override
  List<UserRoutineProgress> get inProgressRoutines;
  @override
  List<UserRoutineProgress> get completedRoutines;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  int get currentPage;
  @override
  bool get hasMore;

  /// Create a copy of RoutinesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutinesStateImplCopyWith<_$RoutinesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
