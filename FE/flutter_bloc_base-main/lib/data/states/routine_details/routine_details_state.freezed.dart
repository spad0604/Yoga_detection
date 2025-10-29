// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoutineDetailsState {
  YogaRoutine? get routine => throw _privateConstructorUsedError;
  UserRoutineProgress? get progress => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isStarting => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of RoutineDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoutineDetailsStateCopyWith<RoutineDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineDetailsStateCopyWith<$Res> {
  factory $RoutineDetailsStateCopyWith(
          RoutineDetailsState value, $Res Function(RoutineDetailsState) then) =
      _$RoutineDetailsStateCopyWithImpl<$Res, RoutineDetailsState>;
  @useResult
  $Res call(
      {YogaRoutine? routine,
      UserRoutineProgress? progress,
      bool isLoading,
      bool isStarting,
      String? error});

  $YogaRoutineCopyWith<$Res>? get routine;
  $UserRoutineProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class _$RoutineDetailsStateCopyWithImpl<$Res, $Val extends RoutineDetailsState>
    implements $RoutineDetailsStateCopyWith<$Res> {
  _$RoutineDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoutineDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routine = freezed,
    Object? progress = freezed,
    Object? isLoading = null,
    Object? isStarting = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      routine: freezed == routine
          ? _value.routine
          : routine // ignore: cast_nullable_to_non_nullable
              as YogaRoutine?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as UserRoutineProgress?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isStarting: null == isStarting
          ? _value.isStarting
          : isStarting // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of RoutineDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $YogaRoutineCopyWith<$Res>? get routine {
    if (_value.routine == null) {
      return null;
    }

    return $YogaRoutineCopyWith<$Res>(_value.routine!, (value) {
      return _then(_value.copyWith(routine: value) as $Val);
    });
  }

  /// Create a copy of RoutineDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserRoutineProgressCopyWith<$Res>? get progress {
    if (_value.progress == null) {
      return null;
    }

    return $UserRoutineProgressCopyWith<$Res>(_value.progress!, (value) {
      return _then(_value.copyWith(progress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoutineDetailsStateImplCopyWith<$Res>
    implements $RoutineDetailsStateCopyWith<$Res> {
  factory _$$RoutineDetailsStateImplCopyWith(_$RoutineDetailsStateImpl value,
          $Res Function(_$RoutineDetailsStateImpl) then) =
      __$$RoutineDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {YogaRoutine? routine,
      UserRoutineProgress? progress,
      bool isLoading,
      bool isStarting,
      String? error});

  @override
  $YogaRoutineCopyWith<$Res>? get routine;
  @override
  $UserRoutineProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class __$$RoutineDetailsStateImplCopyWithImpl<$Res>
    extends _$RoutineDetailsStateCopyWithImpl<$Res, _$RoutineDetailsStateImpl>
    implements _$$RoutineDetailsStateImplCopyWith<$Res> {
  __$$RoutineDetailsStateImplCopyWithImpl(_$RoutineDetailsStateImpl _value,
      $Res Function(_$RoutineDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoutineDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routine = freezed,
    Object? progress = freezed,
    Object? isLoading = null,
    Object? isStarting = null,
    Object? error = freezed,
  }) {
    return _then(_$RoutineDetailsStateImpl(
      routine: freezed == routine
          ? _value.routine
          : routine // ignore: cast_nullable_to_non_nullable
              as YogaRoutine?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as UserRoutineProgress?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isStarting: null == isStarting
          ? _value.isStarting
          : isStarting // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RoutineDetailsStateImpl implements _RoutineDetailsState {
  const _$RoutineDetailsStateImpl(
      {this.routine,
      this.progress,
      this.isLoading = false,
      this.isStarting = false,
      this.error});

  @override
  final YogaRoutine? routine;
  @override
  final UserRoutineProgress? progress;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isStarting;
  @override
  final String? error;

  @override
  String toString() {
    return 'RoutineDetailsState(routine: $routine, progress: $progress, isLoading: $isLoading, isStarting: $isStarting, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutineDetailsStateImpl &&
            (identical(other.routine, routine) || other.routine == routine) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isStarting, isStarting) ||
                other.isStarting == isStarting) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, routine, progress, isLoading, isStarting, error);

  /// Create a copy of RoutineDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutineDetailsStateImplCopyWith<_$RoutineDetailsStateImpl> get copyWith =>
      __$$RoutineDetailsStateImplCopyWithImpl<_$RoutineDetailsStateImpl>(
          this, _$identity);
}

abstract class _RoutineDetailsState implements RoutineDetailsState {
  const factory _RoutineDetailsState(
      {final YogaRoutine? routine,
      final UserRoutineProgress? progress,
      final bool isLoading,
      final bool isStarting,
      final String? error}) = _$RoutineDetailsStateImpl;

  @override
  YogaRoutine? get routine;
  @override
  UserRoutineProgress? get progress;
  @override
  bool get isLoading;
  @override
  bool get isStarting;
  @override
  String? get error;

  /// Create a copy of RoutineDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutineDetailsStateImplCopyWith<_$RoutineDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
