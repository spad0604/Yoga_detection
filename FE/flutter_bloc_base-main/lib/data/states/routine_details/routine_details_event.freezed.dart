// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoutineDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) loadRequested,
    required TResult Function() startRoutine,
    required TResult Function(String poseCode, double score, int timeSpent)
        poseCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? loadRequested,
    TResult? Function()? startRoutine,
    TResult? Function(String poseCode, double score, int timeSpent)?
        poseCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? loadRequested,
    TResult Function()? startRoutine,
    TResult Function(String poseCode, double score, int timeSpent)?
        poseCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoutineDetailsLoadRequested value) loadRequested,
    required TResult Function(RoutineDetailsStartRoutine value) startRoutine,
    required TResult Function(RoutineDetailsPoseCompleted value) poseCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RoutineDetailsLoadRequested value)? loadRequested,
    TResult? Function(RoutineDetailsStartRoutine value)? startRoutine,
    TResult? Function(RoutineDetailsPoseCompleted value)? poseCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoutineDetailsLoadRequested value)? loadRequested,
    TResult Function(RoutineDetailsStartRoutine value)? startRoutine,
    TResult Function(RoutineDetailsPoseCompleted value)? poseCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineDetailsEventCopyWith<$Res> {
  factory $RoutineDetailsEventCopyWith(
          RoutineDetailsEvent value, $Res Function(RoutineDetailsEvent) then) =
      _$RoutineDetailsEventCopyWithImpl<$Res, RoutineDetailsEvent>;
}

/// @nodoc
class _$RoutineDetailsEventCopyWithImpl<$Res, $Val extends RoutineDetailsEvent>
    implements $RoutineDetailsEventCopyWith<$Res> {
  _$RoutineDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoutineDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RoutineDetailsLoadRequestedImplCopyWith<$Res> {
  factory _$$RoutineDetailsLoadRequestedImplCopyWith(
          _$RoutineDetailsLoadRequestedImpl value,
          $Res Function(_$RoutineDetailsLoadRequestedImpl) then) =
      __$$RoutineDetailsLoadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String routineId});
}

/// @nodoc
class __$$RoutineDetailsLoadRequestedImplCopyWithImpl<$Res>
    extends _$RoutineDetailsEventCopyWithImpl<$Res,
        _$RoutineDetailsLoadRequestedImpl>
    implements _$$RoutineDetailsLoadRequestedImplCopyWith<$Res> {
  __$$RoutineDetailsLoadRequestedImplCopyWithImpl(
      _$RoutineDetailsLoadRequestedImpl _value,
      $Res Function(_$RoutineDetailsLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoutineDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routineId = null,
  }) {
    return _then(_$RoutineDetailsLoadRequestedImpl(
      null == routineId
          ? _value.routineId
          : routineId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RoutineDetailsLoadRequestedImpl implements RoutineDetailsLoadRequested {
  const _$RoutineDetailsLoadRequestedImpl(this.routineId);

  @override
  final String routineId;

  @override
  String toString() {
    return 'RoutineDetailsEvent.loadRequested(routineId: $routineId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutineDetailsLoadRequestedImpl &&
            (identical(other.routineId, routineId) ||
                other.routineId == routineId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, routineId);

  /// Create a copy of RoutineDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutineDetailsLoadRequestedImplCopyWith<_$RoutineDetailsLoadRequestedImpl>
      get copyWith => __$$RoutineDetailsLoadRequestedImplCopyWithImpl<
          _$RoutineDetailsLoadRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) loadRequested,
    required TResult Function() startRoutine,
    required TResult Function(String poseCode, double score, int timeSpent)
        poseCompleted,
  }) {
    return loadRequested(routineId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? loadRequested,
    TResult? Function()? startRoutine,
    TResult? Function(String poseCode, double score, int timeSpent)?
        poseCompleted,
  }) {
    return loadRequested?.call(routineId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? loadRequested,
    TResult Function()? startRoutine,
    TResult Function(String poseCode, double score, int timeSpent)?
        poseCompleted,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(routineId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoutineDetailsLoadRequested value) loadRequested,
    required TResult Function(RoutineDetailsStartRoutine value) startRoutine,
    required TResult Function(RoutineDetailsPoseCompleted value) poseCompleted,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RoutineDetailsLoadRequested value)? loadRequested,
    TResult? Function(RoutineDetailsStartRoutine value)? startRoutine,
    TResult? Function(RoutineDetailsPoseCompleted value)? poseCompleted,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoutineDetailsLoadRequested value)? loadRequested,
    TResult Function(RoutineDetailsStartRoutine value)? startRoutine,
    TResult Function(RoutineDetailsPoseCompleted value)? poseCompleted,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class RoutineDetailsLoadRequested implements RoutineDetailsEvent {
  const factory RoutineDetailsLoadRequested(final String routineId) =
      _$RoutineDetailsLoadRequestedImpl;

  String get routineId;

  /// Create a copy of RoutineDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutineDetailsLoadRequestedImplCopyWith<_$RoutineDetailsLoadRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoutineDetailsStartRoutineImplCopyWith<$Res> {
  factory _$$RoutineDetailsStartRoutineImplCopyWith(
          _$RoutineDetailsStartRoutineImpl value,
          $Res Function(_$RoutineDetailsStartRoutineImpl) then) =
      __$$RoutineDetailsStartRoutineImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RoutineDetailsStartRoutineImplCopyWithImpl<$Res>
    extends _$RoutineDetailsEventCopyWithImpl<$Res,
        _$RoutineDetailsStartRoutineImpl>
    implements _$$RoutineDetailsStartRoutineImplCopyWith<$Res> {
  __$$RoutineDetailsStartRoutineImplCopyWithImpl(
      _$RoutineDetailsStartRoutineImpl _value,
      $Res Function(_$RoutineDetailsStartRoutineImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoutineDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RoutineDetailsStartRoutineImpl implements RoutineDetailsStartRoutine {
  const _$RoutineDetailsStartRoutineImpl();

  @override
  String toString() {
    return 'RoutineDetailsEvent.startRoutine()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutineDetailsStartRoutineImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) loadRequested,
    required TResult Function() startRoutine,
    required TResult Function(String poseCode, double score, int timeSpent)
        poseCompleted,
  }) {
    return startRoutine();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? loadRequested,
    TResult? Function()? startRoutine,
    TResult? Function(String poseCode, double score, int timeSpent)?
        poseCompleted,
  }) {
    return startRoutine?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? loadRequested,
    TResult Function()? startRoutine,
    TResult Function(String poseCode, double score, int timeSpent)?
        poseCompleted,
    required TResult orElse(),
  }) {
    if (startRoutine != null) {
      return startRoutine();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoutineDetailsLoadRequested value) loadRequested,
    required TResult Function(RoutineDetailsStartRoutine value) startRoutine,
    required TResult Function(RoutineDetailsPoseCompleted value) poseCompleted,
  }) {
    return startRoutine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RoutineDetailsLoadRequested value)? loadRequested,
    TResult? Function(RoutineDetailsStartRoutine value)? startRoutine,
    TResult? Function(RoutineDetailsPoseCompleted value)? poseCompleted,
  }) {
    return startRoutine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoutineDetailsLoadRequested value)? loadRequested,
    TResult Function(RoutineDetailsStartRoutine value)? startRoutine,
    TResult Function(RoutineDetailsPoseCompleted value)? poseCompleted,
    required TResult orElse(),
  }) {
    if (startRoutine != null) {
      return startRoutine(this);
    }
    return orElse();
  }
}

abstract class RoutineDetailsStartRoutine implements RoutineDetailsEvent {
  const factory RoutineDetailsStartRoutine() = _$RoutineDetailsStartRoutineImpl;
}

/// @nodoc
abstract class _$$RoutineDetailsPoseCompletedImplCopyWith<$Res> {
  factory _$$RoutineDetailsPoseCompletedImplCopyWith(
          _$RoutineDetailsPoseCompletedImpl value,
          $Res Function(_$RoutineDetailsPoseCompletedImpl) then) =
      __$$RoutineDetailsPoseCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String poseCode, double score, int timeSpent});
}

/// @nodoc
class __$$RoutineDetailsPoseCompletedImplCopyWithImpl<$Res>
    extends _$RoutineDetailsEventCopyWithImpl<$Res,
        _$RoutineDetailsPoseCompletedImpl>
    implements _$$RoutineDetailsPoseCompletedImplCopyWith<$Res> {
  __$$RoutineDetailsPoseCompletedImplCopyWithImpl(
      _$RoutineDetailsPoseCompletedImpl _value,
      $Res Function(_$RoutineDetailsPoseCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoutineDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseCode = null,
    Object? score = null,
    Object? timeSpent = null,
  }) {
    return _then(_$RoutineDetailsPoseCompletedImpl(
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RoutineDetailsPoseCompletedImpl implements RoutineDetailsPoseCompleted {
  const _$RoutineDetailsPoseCompletedImpl(
      {required this.poseCode, required this.score, required this.timeSpent});

  @override
  final String poseCode;
  @override
  final double score;
  @override
  final int timeSpent;

  @override
  String toString() {
    return 'RoutineDetailsEvent.poseCompleted(poseCode: $poseCode, score: $score, timeSpent: $timeSpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutineDetailsPoseCompletedImpl &&
            (identical(other.poseCode, poseCode) ||
                other.poseCode == poseCode) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, poseCode, score, timeSpent);

  /// Create a copy of RoutineDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutineDetailsPoseCompletedImplCopyWith<_$RoutineDetailsPoseCompletedImpl>
      get copyWith => __$$RoutineDetailsPoseCompletedImplCopyWithImpl<
          _$RoutineDetailsPoseCompletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) loadRequested,
    required TResult Function() startRoutine,
    required TResult Function(String poseCode, double score, int timeSpent)
        poseCompleted,
  }) {
    return poseCompleted(poseCode, score, timeSpent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? loadRequested,
    TResult? Function()? startRoutine,
    TResult? Function(String poseCode, double score, int timeSpent)?
        poseCompleted,
  }) {
    return poseCompleted?.call(poseCode, score, timeSpent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? loadRequested,
    TResult Function()? startRoutine,
    TResult Function(String poseCode, double score, int timeSpent)?
        poseCompleted,
    required TResult orElse(),
  }) {
    if (poseCompleted != null) {
      return poseCompleted(poseCode, score, timeSpent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoutineDetailsLoadRequested value) loadRequested,
    required TResult Function(RoutineDetailsStartRoutine value) startRoutine,
    required TResult Function(RoutineDetailsPoseCompleted value) poseCompleted,
  }) {
    return poseCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RoutineDetailsLoadRequested value)? loadRequested,
    TResult? Function(RoutineDetailsStartRoutine value)? startRoutine,
    TResult? Function(RoutineDetailsPoseCompleted value)? poseCompleted,
  }) {
    return poseCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoutineDetailsLoadRequested value)? loadRequested,
    TResult Function(RoutineDetailsStartRoutine value)? startRoutine,
    TResult Function(RoutineDetailsPoseCompleted value)? poseCompleted,
    required TResult orElse(),
  }) {
    if (poseCompleted != null) {
      return poseCompleted(this);
    }
    return orElse();
  }
}

abstract class RoutineDetailsPoseCompleted implements RoutineDetailsEvent {
  const factory RoutineDetailsPoseCompleted(
      {required final String poseCode,
      required final double score,
      required final int timeSpent}) = _$RoutineDetailsPoseCompletedImpl;

  String get poseCode;
  double get score;
  int get timeSpent;

  /// Create a copy of RoutineDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutineDetailsPoseCompletedImplCopyWith<_$RoutineDetailsPoseCompletedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
