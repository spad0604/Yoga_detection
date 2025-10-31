// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practice_session_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PracticeSessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) startSession,
    required TResult Function(String poseCode, String imagePath,
            int? timeSpentSeconds, String? landmarkData)
        submitPose,
    required TResult Function() skipPose,
    required TResult Function() completeSession,
    required TResult Function() abandonSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? startSession,
    TResult? Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult? Function()? skipPose,
    TResult? Function()? completeSession,
    TResult? Function()? abandonSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? startSession,
    TResult Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult Function()? skipPose,
    TResult Function()? completeSession,
    TResult Function()? abandonSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PracticeSessionStartSession value) startSession,
    required TResult Function(PracticeSessionSubmitPose value) submitPose,
    required TResult Function(PracticeSessionSkipPose value) skipPose,
    required TResult Function(PracticeSessionCompleteSession value)
        completeSession,
    required TResult Function(PracticeSessionAbandonSession value)
        abandonSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PracticeSessionStartSession value)? startSession,
    TResult? Function(PracticeSessionSubmitPose value)? submitPose,
    TResult? Function(PracticeSessionSkipPose value)? skipPose,
    TResult? Function(PracticeSessionCompleteSession value)? completeSession,
    TResult? Function(PracticeSessionAbandonSession value)? abandonSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PracticeSessionStartSession value)? startSession,
    TResult Function(PracticeSessionSubmitPose value)? submitPose,
    TResult Function(PracticeSessionSkipPose value)? skipPose,
    TResult Function(PracticeSessionCompleteSession value)? completeSession,
    TResult Function(PracticeSessionAbandonSession value)? abandonSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PracticeSessionEventCopyWith<$Res> {
  factory $PracticeSessionEventCopyWith(PracticeSessionEvent value,
          $Res Function(PracticeSessionEvent) then) =
      _$PracticeSessionEventCopyWithImpl<$Res, PracticeSessionEvent>;
}

/// @nodoc
class _$PracticeSessionEventCopyWithImpl<$Res,
        $Val extends PracticeSessionEvent>
    implements $PracticeSessionEventCopyWith<$Res> {
  _$PracticeSessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PracticeSessionStartSessionImplCopyWith<$Res> {
  factory _$$PracticeSessionStartSessionImplCopyWith(
          _$PracticeSessionStartSessionImpl value,
          $Res Function(_$PracticeSessionStartSessionImpl) then) =
      __$$PracticeSessionStartSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String routineId});
}

/// @nodoc
class __$$PracticeSessionStartSessionImplCopyWithImpl<$Res>
    extends _$PracticeSessionEventCopyWithImpl<$Res,
        _$PracticeSessionStartSessionImpl>
    implements _$$PracticeSessionStartSessionImplCopyWith<$Res> {
  __$$PracticeSessionStartSessionImplCopyWithImpl(
      _$PracticeSessionStartSessionImpl _value,
      $Res Function(_$PracticeSessionStartSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routineId = null,
  }) {
    return _then(_$PracticeSessionStartSessionImpl(
      null == routineId
          ? _value.routineId
          : routineId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PracticeSessionStartSessionImpl implements PracticeSessionStartSession {
  const _$PracticeSessionStartSessionImpl(this.routineId);

  @override
  final String routineId;

  @override
  String toString() {
    return 'PracticeSessionEvent.startSession(routineId: $routineId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PracticeSessionStartSessionImpl &&
            (identical(other.routineId, routineId) ||
                other.routineId == routineId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, routineId);

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PracticeSessionStartSessionImplCopyWith<_$PracticeSessionStartSessionImpl>
      get copyWith => __$$PracticeSessionStartSessionImplCopyWithImpl<
          _$PracticeSessionStartSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) startSession,
    required TResult Function(String poseCode, String imagePath,
            int? timeSpentSeconds, String? landmarkData)
        submitPose,
    required TResult Function() skipPose,
    required TResult Function() completeSession,
    required TResult Function() abandonSession,
  }) {
    return startSession(routineId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? startSession,
    TResult? Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult? Function()? skipPose,
    TResult? Function()? completeSession,
    TResult? Function()? abandonSession,
  }) {
    return startSession?.call(routineId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? startSession,
    TResult Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult Function()? skipPose,
    TResult Function()? completeSession,
    TResult Function()? abandonSession,
    required TResult orElse(),
  }) {
    if (startSession != null) {
      return startSession(routineId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PracticeSessionStartSession value) startSession,
    required TResult Function(PracticeSessionSubmitPose value) submitPose,
    required TResult Function(PracticeSessionSkipPose value) skipPose,
    required TResult Function(PracticeSessionCompleteSession value)
        completeSession,
    required TResult Function(PracticeSessionAbandonSession value)
        abandonSession,
  }) {
    return startSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PracticeSessionStartSession value)? startSession,
    TResult? Function(PracticeSessionSubmitPose value)? submitPose,
    TResult? Function(PracticeSessionSkipPose value)? skipPose,
    TResult? Function(PracticeSessionCompleteSession value)? completeSession,
    TResult? Function(PracticeSessionAbandonSession value)? abandonSession,
  }) {
    return startSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PracticeSessionStartSession value)? startSession,
    TResult Function(PracticeSessionSubmitPose value)? submitPose,
    TResult Function(PracticeSessionSkipPose value)? skipPose,
    TResult Function(PracticeSessionCompleteSession value)? completeSession,
    TResult Function(PracticeSessionAbandonSession value)? abandonSession,
    required TResult orElse(),
  }) {
    if (startSession != null) {
      return startSession(this);
    }
    return orElse();
  }
}

abstract class PracticeSessionStartSession implements PracticeSessionEvent {
  const factory PracticeSessionStartSession(final String routineId) =
      _$PracticeSessionStartSessionImpl;

  String get routineId;

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PracticeSessionStartSessionImplCopyWith<_$PracticeSessionStartSessionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PracticeSessionSubmitPoseImplCopyWith<$Res> {
  factory _$$PracticeSessionSubmitPoseImplCopyWith(
          _$PracticeSessionSubmitPoseImpl value,
          $Res Function(_$PracticeSessionSubmitPoseImpl) then) =
      __$$PracticeSessionSubmitPoseImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String poseCode,
      String imagePath,
      int? timeSpentSeconds,
      String? landmarkData});
}

/// @nodoc
class __$$PracticeSessionSubmitPoseImplCopyWithImpl<$Res>
    extends _$PracticeSessionEventCopyWithImpl<$Res,
        _$PracticeSessionSubmitPoseImpl>
    implements _$$PracticeSessionSubmitPoseImplCopyWith<$Res> {
  __$$PracticeSessionSubmitPoseImplCopyWithImpl(
      _$PracticeSessionSubmitPoseImpl _value,
      $Res Function(_$PracticeSessionSubmitPoseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseCode = null,
    Object? imagePath = null,
    Object? timeSpentSeconds = freezed,
    Object? landmarkData = freezed,
  }) {
    return _then(_$PracticeSessionSubmitPoseImpl(
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      timeSpentSeconds: freezed == timeSpentSeconds
          ? _value.timeSpentSeconds
          : timeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      landmarkData: freezed == landmarkData
          ? _value.landmarkData
          : landmarkData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PracticeSessionSubmitPoseImpl implements PracticeSessionSubmitPose {
  const _$PracticeSessionSubmitPoseImpl(
      {required this.poseCode,
      required this.imagePath,
      this.timeSpentSeconds,
      this.landmarkData});

  @override
  final String poseCode;
  @override
  final String imagePath;
  @override
  final int? timeSpentSeconds;
  @override
  final String? landmarkData;

  @override
  String toString() {
    return 'PracticeSessionEvent.submitPose(poseCode: $poseCode, imagePath: $imagePath, timeSpentSeconds: $timeSpentSeconds, landmarkData: $landmarkData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PracticeSessionSubmitPoseImpl &&
            (identical(other.poseCode, poseCode) ||
                other.poseCode == poseCode) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.timeSpentSeconds, timeSpentSeconds) ||
                other.timeSpentSeconds == timeSpentSeconds) &&
            (identical(other.landmarkData, landmarkData) ||
                other.landmarkData == landmarkData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, poseCode, imagePath, timeSpentSeconds, landmarkData);

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PracticeSessionSubmitPoseImplCopyWith<_$PracticeSessionSubmitPoseImpl>
      get copyWith => __$$PracticeSessionSubmitPoseImplCopyWithImpl<
          _$PracticeSessionSubmitPoseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) startSession,
    required TResult Function(String poseCode, String imagePath,
            int? timeSpentSeconds, String? landmarkData)
        submitPose,
    required TResult Function() skipPose,
    required TResult Function() completeSession,
    required TResult Function() abandonSession,
  }) {
    return submitPose(poseCode, imagePath, timeSpentSeconds, landmarkData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? startSession,
    TResult? Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult? Function()? skipPose,
    TResult? Function()? completeSession,
    TResult? Function()? abandonSession,
  }) {
    return submitPose?.call(
        poseCode, imagePath, timeSpentSeconds, landmarkData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? startSession,
    TResult Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult Function()? skipPose,
    TResult Function()? completeSession,
    TResult Function()? abandonSession,
    required TResult orElse(),
  }) {
    if (submitPose != null) {
      return submitPose(poseCode, imagePath, timeSpentSeconds, landmarkData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PracticeSessionStartSession value) startSession,
    required TResult Function(PracticeSessionSubmitPose value) submitPose,
    required TResult Function(PracticeSessionSkipPose value) skipPose,
    required TResult Function(PracticeSessionCompleteSession value)
        completeSession,
    required TResult Function(PracticeSessionAbandonSession value)
        abandonSession,
  }) {
    return submitPose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PracticeSessionStartSession value)? startSession,
    TResult? Function(PracticeSessionSubmitPose value)? submitPose,
    TResult? Function(PracticeSessionSkipPose value)? skipPose,
    TResult? Function(PracticeSessionCompleteSession value)? completeSession,
    TResult? Function(PracticeSessionAbandonSession value)? abandonSession,
  }) {
    return submitPose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PracticeSessionStartSession value)? startSession,
    TResult Function(PracticeSessionSubmitPose value)? submitPose,
    TResult Function(PracticeSessionSkipPose value)? skipPose,
    TResult Function(PracticeSessionCompleteSession value)? completeSession,
    TResult Function(PracticeSessionAbandonSession value)? abandonSession,
    required TResult orElse(),
  }) {
    if (submitPose != null) {
      return submitPose(this);
    }
    return orElse();
  }
}

abstract class PracticeSessionSubmitPose implements PracticeSessionEvent {
  const factory PracticeSessionSubmitPose(
      {required final String poseCode,
      required final String imagePath,
      final int? timeSpentSeconds,
      final String? landmarkData}) = _$PracticeSessionSubmitPoseImpl;

  String get poseCode;
  String get imagePath;
  int? get timeSpentSeconds;
  String? get landmarkData;

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PracticeSessionSubmitPoseImplCopyWith<_$PracticeSessionSubmitPoseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PracticeSessionSkipPoseImplCopyWith<$Res> {
  factory _$$PracticeSessionSkipPoseImplCopyWith(
          _$PracticeSessionSkipPoseImpl value,
          $Res Function(_$PracticeSessionSkipPoseImpl) then) =
      __$$PracticeSessionSkipPoseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PracticeSessionSkipPoseImplCopyWithImpl<$Res>
    extends _$PracticeSessionEventCopyWithImpl<$Res,
        _$PracticeSessionSkipPoseImpl>
    implements _$$PracticeSessionSkipPoseImplCopyWith<$Res> {
  __$$PracticeSessionSkipPoseImplCopyWithImpl(
      _$PracticeSessionSkipPoseImpl _value,
      $Res Function(_$PracticeSessionSkipPoseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PracticeSessionSkipPoseImpl implements PracticeSessionSkipPose {
  const _$PracticeSessionSkipPoseImpl();

  @override
  String toString() {
    return 'PracticeSessionEvent.skipPose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PracticeSessionSkipPoseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) startSession,
    required TResult Function(String poseCode, String imagePath,
            int? timeSpentSeconds, String? landmarkData)
        submitPose,
    required TResult Function() skipPose,
    required TResult Function() completeSession,
    required TResult Function() abandonSession,
  }) {
    return skipPose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? startSession,
    TResult? Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult? Function()? skipPose,
    TResult? Function()? completeSession,
    TResult? Function()? abandonSession,
  }) {
    return skipPose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? startSession,
    TResult Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult Function()? skipPose,
    TResult Function()? completeSession,
    TResult Function()? abandonSession,
    required TResult orElse(),
  }) {
    if (skipPose != null) {
      return skipPose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PracticeSessionStartSession value) startSession,
    required TResult Function(PracticeSessionSubmitPose value) submitPose,
    required TResult Function(PracticeSessionSkipPose value) skipPose,
    required TResult Function(PracticeSessionCompleteSession value)
        completeSession,
    required TResult Function(PracticeSessionAbandonSession value)
        abandonSession,
  }) {
    return skipPose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PracticeSessionStartSession value)? startSession,
    TResult? Function(PracticeSessionSubmitPose value)? submitPose,
    TResult? Function(PracticeSessionSkipPose value)? skipPose,
    TResult? Function(PracticeSessionCompleteSession value)? completeSession,
    TResult? Function(PracticeSessionAbandonSession value)? abandonSession,
  }) {
    return skipPose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PracticeSessionStartSession value)? startSession,
    TResult Function(PracticeSessionSubmitPose value)? submitPose,
    TResult Function(PracticeSessionSkipPose value)? skipPose,
    TResult Function(PracticeSessionCompleteSession value)? completeSession,
    TResult Function(PracticeSessionAbandonSession value)? abandonSession,
    required TResult orElse(),
  }) {
    if (skipPose != null) {
      return skipPose(this);
    }
    return orElse();
  }
}

abstract class PracticeSessionSkipPose implements PracticeSessionEvent {
  const factory PracticeSessionSkipPose() = _$PracticeSessionSkipPoseImpl;
}

/// @nodoc
abstract class _$$PracticeSessionCompleteSessionImplCopyWith<$Res> {
  factory _$$PracticeSessionCompleteSessionImplCopyWith(
          _$PracticeSessionCompleteSessionImpl value,
          $Res Function(_$PracticeSessionCompleteSessionImpl) then) =
      __$$PracticeSessionCompleteSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PracticeSessionCompleteSessionImplCopyWithImpl<$Res>
    extends _$PracticeSessionEventCopyWithImpl<$Res,
        _$PracticeSessionCompleteSessionImpl>
    implements _$$PracticeSessionCompleteSessionImplCopyWith<$Res> {
  __$$PracticeSessionCompleteSessionImplCopyWithImpl(
      _$PracticeSessionCompleteSessionImpl _value,
      $Res Function(_$PracticeSessionCompleteSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PracticeSessionCompleteSessionImpl
    implements PracticeSessionCompleteSession {
  const _$PracticeSessionCompleteSessionImpl();

  @override
  String toString() {
    return 'PracticeSessionEvent.completeSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PracticeSessionCompleteSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) startSession,
    required TResult Function(String poseCode, String imagePath,
            int? timeSpentSeconds, String? landmarkData)
        submitPose,
    required TResult Function() skipPose,
    required TResult Function() completeSession,
    required TResult Function() abandonSession,
  }) {
    return completeSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? startSession,
    TResult? Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult? Function()? skipPose,
    TResult? Function()? completeSession,
    TResult? Function()? abandonSession,
  }) {
    return completeSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? startSession,
    TResult Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult Function()? skipPose,
    TResult Function()? completeSession,
    TResult Function()? abandonSession,
    required TResult orElse(),
  }) {
    if (completeSession != null) {
      return completeSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PracticeSessionStartSession value) startSession,
    required TResult Function(PracticeSessionSubmitPose value) submitPose,
    required TResult Function(PracticeSessionSkipPose value) skipPose,
    required TResult Function(PracticeSessionCompleteSession value)
        completeSession,
    required TResult Function(PracticeSessionAbandonSession value)
        abandonSession,
  }) {
    return completeSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PracticeSessionStartSession value)? startSession,
    TResult? Function(PracticeSessionSubmitPose value)? submitPose,
    TResult? Function(PracticeSessionSkipPose value)? skipPose,
    TResult? Function(PracticeSessionCompleteSession value)? completeSession,
    TResult? Function(PracticeSessionAbandonSession value)? abandonSession,
  }) {
    return completeSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PracticeSessionStartSession value)? startSession,
    TResult Function(PracticeSessionSubmitPose value)? submitPose,
    TResult Function(PracticeSessionSkipPose value)? skipPose,
    TResult Function(PracticeSessionCompleteSession value)? completeSession,
    TResult Function(PracticeSessionAbandonSession value)? abandonSession,
    required TResult orElse(),
  }) {
    if (completeSession != null) {
      return completeSession(this);
    }
    return orElse();
  }
}

abstract class PracticeSessionCompleteSession implements PracticeSessionEvent {
  const factory PracticeSessionCompleteSession() =
      _$PracticeSessionCompleteSessionImpl;
}

/// @nodoc
abstract class _$$PracticeSessionAbandonSessionImplCopyWith<$Res> {
  factory _$$PracticeSessionAbandonSessionImplCopyWith(
          _$PracticeSessionAbandonSessionImpl value,
          $Res Function(_$PracticeSessionAbandonSessionImpl) then) =
      __$$PracticeSessionAbandonSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PracticeSessionAbandonSessionImplCopyWithImpl<$Res>
    extends _$PracticeSessionEventCopyWithImpl<$Res,
        _$PracticeSessionAbandonSessionImpl>
    implements _$$PracticeSessionAbandonSessionImplCopyWith<$Res> {
  __$$PracticeSessionAbandonSessionImplCopyWithImpl(
      _$PracticeSessionAbandonSessionImpl _value,
      $Res Function(_$PracticeSessionAbandonSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PracticeSessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PracticeSessionAbandonSessionImpl
    implements PracticeSessionAbandonSession {
  const _$PracticeSessionAbandonSessionImpl();

  @override
  String toString() {
    return 'PracticeSessionEvent.abandonSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PracticeSessionAbandonSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String routineId) startSession,
    required TResult Function(String poseCode, String imagePath,
            int? timeSpentSeconds, String? landmarkData)
        submitPose,
    required TResult Function() skipPose,
    required TResult Function() completeSession,
    required TResult Function() abandonSession,
  }) {
    return abandonSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String routineId)? startSession,
    TResult? Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult? Function()? skipPose,
    TResult? Function()? completeSession,
    TResult? Function()? abandonSession,
  }) {
    return abandonSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String routineId)? startSession,
    TResult Function(String poseCode, String imagePath, int? timeSpentSeconds,
            String? landmarkData)?
        submitPose,
    TResult Function()? skipPose,
    TResult Function()? completeSession,
    TResult Function()? abandonSession,
    required TResult orElse(),
  }) {
    if (abandonSession != null) {
      return abandonSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PracticeSessionStartSession value) startSession,
    required TResult Function(PracticeSessionSubmitPose value) submitPose,
    required TResult Function(PracticeSessionSkipPose value) skipPose,
    required TResult Function(PracticeSessionCompleteSession value)
        completeSession,
    required TResult Function(PracticeSessionAbandonSession value)
        abandonSession,
  }) {
    return abandonSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PracticeSessionStartSession value)? startSession,
    TResult? Function(PracticeSessionSubmitPose value)? submitPose,
    TResult? Function(PracticeSessionSkipPose value)? skipPose,
    TResult? Function(PracticeSessionCompleteSession value)? completeSession,
    TResult? Function(PracticeSessionAbandonSession value)? abandonSession,
  }) {
    return abandonSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PracticeSessionStartSession value)? startSession,
    TResult Function(PracticeSessionSubmitPose value)? submitPose,
    TResult Function(PracticeSessionSkipPose value)? skipPose,
    TResult Function(PracticeSessionCompleteSession value)? completeSession,
    TResult Function(PracticeSessionAbandonSession value)? abandonSession,
    required TResult orElse(),
  }) {
    if (abandonSession != null) {
      return abandonSession(this);
    }
    return orElse();
  }
}

abstract class PracticeSessionAbandonSession implements PracticeSessionEvent {
  const factory PracticeSessionAbandonSession() =
      _$PracticeSessionAbandonSessionImpl;
}
