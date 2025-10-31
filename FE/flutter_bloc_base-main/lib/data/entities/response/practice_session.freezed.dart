// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practice_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PracticeSession _$PracticeSessionFromJson(Map<String, dynamic> json) {
  return _PracticeSession.fromJson(json);
}

/// @nodoc
mixin _$PracticeSession {
  @JsonKey(name: 'sessionId')
  String get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'routineId')
  String get routineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'routineName')
  String get routineName => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  SessionStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentPoseIndex')
  int get currentPoseIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPoses')
  int get totalPoses => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentPoseCode')
  String? get currentPoseCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentPoseName')
  String? get currentPoseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentPoseDescription')
  String? get currentPoseDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentPoseImageUrl')
  String? get currentPoseImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentPoseDurationSeconds')
  int? get currentPoseDurationSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'allPoses')
  List<RoutinePoseInfo> get allPoses => throw _privateConstructorUsedError;
  @JsonKey(name: 'completedPoses')
  List<PoseSubmissionResult> get completedPoses =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'averageScore')
  double get averageScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTimeSpentSeconds')
  int get totalTimeSpentSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'startedAt')
  DateTime get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completedAt')
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this PracticeSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PracticeSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PracticeSessionCopyWith<PracticeSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PracticeSessionCopyWith<$Res> {
  factory $PracticeSessionCopyWith(
          PracticeSession value, $Res Function(PracticeSession) then) =
      _$PracticeSessionCopyWithImpl<$Res, PracticeSession>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sessionId') String sessionId,
      @JsonKey(name: 'routineId') String routineId,
      @JsonKey(name: 'routineName') String routineName,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'status') SessionStatus status,
      @JsonKey(name: 'currentPoseIndex') int currentPoseIndex,
      @JsonKey(name: 'totalPoses') int totalPoses,
      @JsonKey(name: 'currentPoseCode') String? currentPoseCode,
      @JsonKey(name: 'currentPoseName') String? currentPoseName,
      @JsonKey(name: 'currentPoseDescription') String? currentPoseDescription,
      @JsonKey(name: 'currentPoseImageUrl') String? currentPoseImageUrl,
      @JsonKey(name: 'currentPoseDurationSeconds')
      int? currentPoseDurationSeconds,
      @JsonKey(name: 'allPoses') List<RoutinePoseInfo> allPoses,
      @JsonKey(name: 'completedPoses')
      List<PoseSubmissionResult> completedPoses,
      @JsonKey(name: 'averageScore') double averageScore,
      @JsonKey(name: 'totalTimeSpentSeconds') int totalTimeSpentSeconds,
      @JsonKey(name: 'startedAt') DateTime startedAt,
      @JsonKey(name: 'completedAt') DateTime? completedAt});
}

/// @nodoc
class _$PracticeSessionCopyWithImpl<$Res, $Val extends PracticeSession>
    implements $PracticeSessionCopyWith<$Res> {
  _$PracticeSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PracticeSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? routineId = null,
    Object? routineName = null,
    Object? userId = null,
    Object? status = null,
    Object? currentPoseIndex = null,
    Object? totalPoses = null,
    Object? currentPoseCode = freezed,
    Object? currentPoseName = freezed,
    Object? currentPoseDescription = freezed,
    Object? currentPoseImageUrl = freezed,
    Object? currentPoseDurationSeconds = freezed,
    Object? allPoses = null,
    Object? completedPoses = null,
    Object? averageScore = null,
    Object? totalTimeSpentSeconds = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      routineId: null == routineId
          ? _value.routineId
          : routineId // ignore: cast_nullable_to_non_nullable
              as String,
      routineName: null == routineName
          ? _value.routineName
          : routineName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      currentPoseIndex: null == currentPoseIndex
          ? _value.currentPoseIndex
          : currentPoseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoses: null == totalPoses
          ? _value.totalPoses
          : totalPoses // ignore: cast_nullable_to_non_nullable
              as int,
      currentPoseCode: freezed == currentPoseCode
          ? _value.currentPoseCode
          : currentPoseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoseName: freezed == currentPoseName
          ? _value.currentPoseName
          : currentPoseName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoseDescription: freezed == currentPoseDescription
          ? _value.currentPoseDescription
          : currentPoseDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoseImageUrl: freezed == currentPoseImageUrl
          ? _value.currentPoseImageUrl
          : currentPoseImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoseDurationSeconds: freezed == currentPoseDurationSeconds
          ? _value.currentPoseDurationSeconds
          : currentPoseDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      allPoses: null == allPoses
          ? _value.allPoses
          : allPoses // ignore: cast_nullable_to_non_nullable
              as List<RoutinePoseInfo>,
      completedPoses: null == completedPoses
          ? _value.completedPoses
          : completedPoses // ignore: cast_nullable_to_non_nullable
              as List<PoseSubmissionResult>,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      totalTimeSpentSeconds: null == totalTimeSpentSeconds
          ? _value.totalTimeSpentSeconds
          : totalTimeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PracticeSessionImplCopyWith<$Res>
    implements $PracticeSessionCopyWith<$Res> {
  factory _$$PracticeSessionImplCopyWith(_$PracticeSessionImpl value,
          $Res Function(_$PracticeSessionImpl) then) =
      __$$PracticeSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sessionId') String sessionId,
      @JsonKey(name: 'routineId') String routineId,
      @JsonKey(name: 'routineName') String routineName,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'status') SessionStatus status,
      @JsonKey(name: 'currentPoseIndex') int currentPoseIndex,
      @JsonKey(name: 'totalPoses') int totalPoses,
      @JsonKey(name: 'currentPoseCode') String? currentPoseCode,
      @JsonKey(name: 'currentPoseName') String? currentPoseName,
      @JsonKey(name: 'currentPoseDescription') String? currentPoseDescription,
      @JsonKey(name: 'currentPoseImageUrl') String? currentPoseImageUrl,
      @JsonKey(name: 'currentPoseDurationSeconds')
      int? currentPoseDurationSeconds,
      @JsonKey(name: 'allPoses') List<RoutinePoseInfo> allPoses,
      @JsonKey(name: 'completedPoses')
      List<PoseSubmissionResult> completedPoses,
      @JsonKey(name: 'averageScore') double averageScore,
      @JsonKey(name: 'totalTimeSpentSeconds') int totalTimeSpentSeconds,
      @JsonKey(name: 'startedAt') DateTime startedAt,
      @JsonKey(name: 'completedAt') DateTime? completedAt});
}

/// @nodoc
class __$$PracticeSessionImplCopyWithImpl<$Res>
    extends _$PracticeSessionCopyWithImpl<$Res, _$PracticeSessionImpl>
    implements _$$PracticeSessionImplCopyWith<$Res> {
  __$$PracticeSessionImplCopyWithImpl(
      _$PracticeSessionImpl _value, $Res Function(_$PracticeSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PracticeSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? routineId = null,
    Object? routineName = null,
    Object? userId = null,
    Object? status = null,
    Object? currentPoseIndex = null,
    Object? totalPoses = null,
    Object? currentPoseCode = freezed,
    Object? currentPoseName = freezed,
    Object? currentPoseDescription = freezed,
    Object? currentPoseImageUrl = freezed,
    Object? currentPoseDurationSeconds = freezed,
    Object? allPoses = null,
    Object? completedPoses = null,
    Object? averageScore = null,
    Object? totalTimeSpentSeconds = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_$PracticeSessionImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      routineId: null == routineId
          ? _value.routineId
          : routineId // ignore: cast_nullable_to_non_nullable
              as String,
      routineName: null == routineName
          ? _value.routineName
          : routineName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      currentPoseIndex: null == currentPoseIndex
          ? _value.currentPoseIndex
          : currentPoseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoses: null == totalPoses
          ? _value.totalPoses
          : totalPoses // ignore: cast_nullable_to_non_nullable
              as int,
      currentPoseCode: freezed == currentPoseCode
          ? _value.currentPoseCode
          : currentPoseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoseName: freezed == currentPoseName
          ? _value.currentPoseName
          : currentPoseName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoseDescription: freezed == currentPoseDescription
          ? _value.currentPoseDescription
          : currentPoseDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoseImageUrl: freezed == currentPoseImageUrl
          ? _value.currentPoseImageUrl
          : currentPoseImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoseDurationSeconds: freezed == currentPoseDurationSeconds
          ? _value.currentPoseDurationSeconds
          : currentPoseDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      allPoses: null == allPoses
          ? _value._allPoses
          : allPoses // ignore: cast_nullable_to_non_nullable
              as List<RoutinePoseInfo>,
      completedPoses: null == completedPoses
          ? _value._completedPoses
          : completedPoses // ignore: cast_nullable_to_non_nullable
              as List<PoseSubmissionResult>,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      totalTimeSpentSeconds: null == totalTimeSpentSeconds
          ? _value.totalTimeSpentSeconds
          : totalTimeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PracticeSessionImpl implements _PracticeSession {
  const _$PracticeSessionImpl(
      {@JsonKey(name: 'sessionId') required this.sessionId,
      @JsonKey(name: 'routineId') required this.routineId,
      @JsonKey(name: 'routineName') required this.routineName,
      @JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'currentPoseIndex') required this.currentPoseIndex,
      @JsonKey(name: 'totalPoses') required this.totalPoses,
      @JsonKey(name: 'currentPoseCode') this.currentPoseCode,
      @JsonKey(name: 'currentPoseName') this.currentPoseName,
      @JsonKey(name: 'currentPoseDescription') this.currentPoseDescription,
      @JsonKey(name: 'currentPoseImageUrl') this.currentPoseImageUrl,
      @JsonKey(name: 'currentPoseDurationSeconds')
      this.currentPoseDurationSeconds,
      @JsonKey(name: 'allPoses')
      final List<RoutinePoseInfo> allPoses = const [],
      @JsonKey(name: 'completedPoses')
      final List<PoseSubmissionResult> completedPoses = const [],
      @JsonKey(name: 'averageScore') this.averageScore = 0.0,
      @JsonKey(name: 'totalTimeSpentSeconds') this.totalTimeSpentSeconds = 0,
      @JsonKey(name: 'startedAt') required this.startedAt,
      @JsonKey(name: 'completedAt') this.completedAt})
      : _allPoses = allPoses,
        _completedPoses = completedPoses;

  factory _$PracticeSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PracticeSessionImplFromJson(json);

  @override
  @JsonKey(name: 'sessionId')
  final String sessionId;
  @override
  @JsonKey(name: 'routineId')
  final String routineId;
  @override
  @JsonKey(name: 'routineName')
  final String routineName;
  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'status')
  final SessionStatus status;
  @override
  @JsonKey(name: 'currentPoseIndex')
  final int currentPoseIndex;
  @override
  @JsonKey(name: 'totalPoses')
  final int totalPoses;
  @override
  @JsonKey(name: 'currentPoseCode')
  final String? currentPoseCode;
  @override
  @JsonKey(name: 'currentPoseName')
  final String? currentPoseName;
  @override
  @JsonKey(name: 'currentPoseDescription')
  final String? currentPoseDescription;
  @override
  @JsonKey(name: 'currentPoseImageUrl')
  final String? currentPoseImageUrl;
  @override
  @JsonKey(name: 'currentPoseDurationSeconds')
  final int? currentPoseDurationSeconds;
  final List<RoutinePoseInfo> _allPoses;
  @override
  @JsonKey(name: 'allPoses')
  List<RoutinePoseInfo> get allPoses {
    if (_allPoses is EqualUnmodifiableListView) return _allPoses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allPoses);
  }

  final List<PoseSubmissionResult> _completedPoses;
  @override
  @JsonKey(name: 'completedPoses')
  List<PoseSubmissionResult> get completedPoses {
    if (_completedPoses is EqualUnmodifiableListView) return _completedPoses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedPoses);
  }

  @override
  @JsonKey(name: 'averageScore')
  final double averageScore;
  @override
  @JsonKey(name: 'totalTimeSpentSeconds')
  final int totalTimeSpentSeconds;
  @override
  @JsonKey(name: 'startedAt')
  final DateTime startedAt;
  @override
  @JsonKey(name: 'completedAt')
  final DateTime? completedAt;

  @override
  String toString() {
    return 'PracticeSession(sessionId: $sessionId, routineId: $routineId, routineName: $routineName, userId: $userId, status: $status, currentPoseIndex: $currentPoseIndex, totalPoses: $totalPoses, currentPoseCode: $currentPoseCode, currentPoseName: $currentPoseName, currentPoseDescription: $currentPoseDescription, currentPoseImageUrl: $currentPoseImageUrl, currentPoseDurationSeconds: $currentPoseDurationSeconds, allPoses: $allPoses, completedPoses: $completedPoses, averageScore: $averageScore, totalTimeSpentSeconds: $totalTimeSpentSeconds, startedAt: $startedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PracticeSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.routineId, routineId) ||
                other.routineId == routineId) &&
            (identical(other.routineName, routineName) ||
                other.routineName == routineName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentPoseIndex, currentPoseIndex) ||
                other.currentPoseIndex == currentPoseIndex) &&
            (identical(other.totalPoses, totalPoses) ||
                other.totalPoses == totalPoses) &&
            (identical(other.currentPoseCode, currentPoseCode) ||
                other.currentPoseCode == currentPoseCode) &&
            (identical(other.currentPoseName, currentPoseName) ||
                other.currentPoseName == currentPoseName) &&
            (identical(other.currentPoseDescription, currentPoseDescription) ||
                other.currentPoseDescription == currentPoseDescription) &&
            (identical(other.currentPoseImageUrl, currentPoseImageUrl) ||
                other.currentPoseImageUrl == currentPoseImageUrl) &&
            (identical(other.currentPoseDurationSeconds,
                    currentPoseDurationSeconds) ||
                other.currentPoseDurationSeconds ==
                    currentPoseDurationSeconds) &&
            const DeepCollectionEquality().equals(other._allPoses, _allPoses) &&
            const DeepCollectionEquality()
                .equals(other._completedPoses, _completedPoses) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.totalTimeSpentSeconds, totalTimeSpentSeconds) ||
                other.totalTimeSpentSeconds == totalTimeSpentSeconds) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      routineId,
      routineName,
      userId,
      status,
      currentPoseIndex,
      totalPoses,
      currentPoseCode,
      currentPoseName,
      currentPoseDescription,
      currentPoseImageUrl,
      currentPoseDurationSeconds,
      const DeepCollectionEquality().hash(_allPoses),
      const DeepCollectionEquality().hash(_completedPoses),
      averageScore,
      totalTimeSpentSeconds,
      startedAt,
      completedAt);

  /// Create a copy of PracticeSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PracticeSessionImplCopyWith<_$PracticeSessionImpl> get copyWith =>
      __$$PracticeSessionImplCopyWithImpl<_$PracticeSessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PracticeSessionImplToJson(
      this,
    );
  }
}

abstract class _PracticeSession implements PracticeSession {
  const factory _PracticeSession(
      {@JsonKey(name: 'sessionId') required final String sessionId,
      @JsonKey(name: 'routineId') required final String routineId,
      @JsonKey(name: 'routineName') required final String routineName,
      @JsonKey(name: 'userId') required final String userId,
      @JsonKey(name: 'status') required final SessionStatus status,
      @JsonKey(name: 'currentPoseIndex') required final int currentPoseIndex,
      @JsonKey(name: 'totalPoses') required final int totalPoses,
      @JsonKey(name: 'currentPoseCode') final String? currentPoseCode,
      @JsonKey(name: 'currentPoseName') final String? currentPoseName,
      @JsonKey(name: 'currentPoseDescription')
      final String? currentPoseDescription,
      @JsonKey(name: 'currentPoseImageUrl') final String? currentPoseImageUrl,
      @JsonKey(name: 'currentPoseDurationSeconds')
      final int? currentPoseDurationSeconds,
      @JsonKey(name: 'allPoses') final List<RoutinePoseInfo> allPoses,
      @JsonKey(name: 'completedPoses')
      final List<PoseSubmissionResult> completedPoses,
      @JsonKey(name: 'averageScore') final double averageScore,
      @JsonKey(name: 'totalTimeSpentSeconds') final int totalTimeSpentSeconds,
      @JsonKey(name: 'startedAt') required final DateTime startedAt,
      @JsonKey(name: 'completedAt')
      final DateTime? completedAt}) = _$PracticeSessionImpl;

  factory _PracticeSession.fromJson(Map<String, dynamic> json) =
      _$PracticeSessionImpl.fromJson;

  @override
  @JsonKey(name: 'sessionId')
  String get sessionId;
  @override
  @JsonKey(name: 'routineId')
  String get routineId;
  @override
  @JsonKey(name: 'routineName')
  String get routineName;
  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  @JsonKey(name: 'status')
  SessionStatus get status;
  @override
  @JsonKey(name: 'currentPoseIndex')
  int get currentPoseIndex;
  @override
  @JsonKey(name: 'totalPoses')
  int get totalPoses;
  @override
  @JsonKey(name: 'currentPoseCode')
  String? get currentPoseCode;
  @override
  @JsonKey(name: 'currentPoseName')
  String? get currentPoseName;
  @override
  @JsonKey(name: 'currentPoseDescription')
  String? get currentPoseDescription;
  @override
  @JsonKey(name: 'currentPoseImageUrl')
  String? get currentPoseImageUrl;
  @override
  @JsonKey(name: 'currentPoseDurationSeconds')
  int? get currentPoseDurationSeconds;
  @override
  @JsonKey(name: 'allPoses')
  List<RoutinePoseInfo> get allPoses;
  @override
  @JsonKey(name: 'completedPoses')
  List<PoseSubmissionResult> get completedPoses;
  @override
  @JsonKey(name: 'averageScore')
  double get averageScore;
  @override
  @JsonKey(name: 'totalTimeSpentSeconds')
  int get totalTimeSpentSeconds;
  @override
  @JsonKey(name: 'startedAt')
  DateTime get startedAt;
  @override
  @JsonKey(name: 'completedAt')
  DateTime? get completedAt;

  /// Create a copy of PracticeSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PracticeSessionImplCopyWith<_$PracticeSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoutinePoseInfo _$RoutinePoseInfoFromJson(Map<String, dynamic> json) {
  return _RoutinePoseInfo.fromJson(json);
}

/// @nodoc
mixin _$RoutinePoseInfo {
  @JsonKey(name: 'poseCode')
  String get poseCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'poseName')
  String get poseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderIndex')
  int get orderIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'durationSeconds')
  int? get durationSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCompleted')
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this RoutinePoseInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoutinePoseInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoutinePoseInfoCopyWith<RoutinePoseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutinePoseInfoCopyWith<$Res> {
  factory $RoutinePoseInfoCopyWith(
          RoutinePoseInfo value, $Res Function(RoutinePoseInfo) then) =
      _$RoutinePoseInfoCopyWithImpl<$Res, RoutinePoseInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'poseCode') String poseCode,
      @JsonKey(name: 'poseName') String poseName,
      @JsonKey(name: 'orderIndex') int orderIndex,
      @JsonKey(name: 'durationSeconds') int? durationSeconds,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'isCompleted') bool isCompleted});
}

/// @nodoc
class _$RoutinePoseInfoCopyWithImpl<$Res, $Val extends RoutinePoseInfo>
    implements $RoutinePoseInfoCopyWith<$Res> {
  _$RoutinePoseInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoutinePoseInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseCode = null,
    Object? poseName = null,
    Object? orderIndex = null,
    Object? durationSeconds = freezed,
    Object? imageUrl = freezed,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      poseName: null == poseName
          ? _value.poseName
          : poseName // ignore: cast_nullable_to_non_nullable
              as String,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutinePoseInfoImplCopyWith<$Res>
    implements $RoutinePoseInfoCopyWith<$Res> {
  factory _$$RoutinePoseInfoImplCopyWith(_$RoutinePoseInfoImpl value,
          $Res Function(_$RoutinePoseInfoImpl) then) =
      __$$RoutinePoseInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'poseCode') String poseCode,
      @JsonKey(name: 'poseName') String poseName,
      @JsonKey(name: 'orderIndex') int orderIndex,
      @JsonKey(name: 'durationSeconds') int? durationSeconds,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'isCompleted') bool isCompleted});
}

/// @nodoc
class __$$RoutinePoseInfoImplCopyWithImpl<$Res>
    extends _$RoutinePoseInfoCopyWithImpl<$Res, _$RoutinePoseInfoImpl>
    implements _$$RoutinePoseInfoImplCopyWith<$Res> {
  __$$RoutinePoseInfoImplCopyWithImpl(
      _$RoutinePoseInfoImpl _value, $Res Function(_$RoutinePoseInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoutinePoseInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseCode = null,
    Object? poseName = null,
    Object? orderIndex = null,
    Object? durationSeconds = freezed,
    Object? imageUrl = freezed,
    Object? isCompleted = null,
  }) {
    return _then(_$RoutinePoseInfoImpl(
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      poseName: null == poseName
          ? _value.poseName
          : poseName // ignore: cast_nullable_to_non_nullable
              as String,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoutinePoseInfoImpl implements _RoutinePoseInfo {
  const _$RoutinePoseInfoImpl(
      {@JsonKey(name: 'poseCode') required this.poseCode,
      @JsonKey(name: 'poseName') required this.poseName,
      @JsonKey(name: 'orderIndex') required this.orderIndex,
      @JsonKey(name: 'durationSeconds') this.durationSeconds,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'isCompleted') this.isCompleted = false});

  factory _$RoutinePoseInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutinePoseInfoImplFromJson(json);

  @override
  @JsonKey(name: 'poseCode')
  final String poseCode;
  @override
  @JsonKey(name: 'poseName')
  final String poseName;
  @override
  @JsonKey(name: 'orderIndex')
  final int orderIndex;
  @override
  @JsonKey(name: 'durationSeconds')
  final int? durationSeconds;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'isCompleted')
  final bool isCompleted;

  @override
  String toString() {
    return 'RoutinePoseInfo(poseCode: $poseCode, poseName: $poseName, orderIndex: $orderIndex, durationSeconds: $durationSeconds, imageUrl: $imageUrl, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutinePoseInfoImpl &&
            (identical(other.poseCode, poseCode) ||
                other.poseCode == poseCode) &&
            (identical(other.poseName, poseName) ||
                other.poseName == poseName) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poseCode, poseName, orderIndex,
      durationSeconds, imageUrl, isCompleted);

  /// Create a copy of RoutinePoseInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutinePoseInfoImplCopyWith<_$RoutinePoseInfoImpl> get copyWith =>
      __$$RoutinePoseInfoImplCopyWithImpl<_$RoutinePoseInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoutinePoseInfoImplToJson(
      this,
    );
  }
}

abstract class _RoutinePoseInfo implements RoutinePoseInfo {
  const factory _RoutinePoseInfo(
          {@JsonKey(name: 'poseCode') required final String poseCode,
          @JsonKey(name: 'poseName') required final String poseName,
          @JsonKey(name: 'orderIndex') required final int orderIndex,
          @JsonKey(name: 'durationSeconds') final int? durationSeconds,
          @JsonKey(name: 'imageUrl') final String? imageUrl,
          @JsonKey(name: 'isCompleted') final bool isCompleted}) =
      _$RoutinePoseInfoImpl;

  factory _RoutinePoseInfo.fromJson(Map<String, dynamic> json) =
      _$RoutinePoseInfoImpl.fromJson;

  @override
  @JsonKey(name: 'poseCode')
  String get poseCode;
  @override
  @JsonKey(name: 'poseName')
  String get poseName;
  @override
  @JsonKey(name: 'orderIndex')
  int get orderIndex;
  @override
  @JsonKey(name: 'durationSeconds')
  int? get durationSeconds;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'isCompleted')
  bool get isCompleted;

  /// Create a copy of RoutinePoseInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutinePoseInfoImplCopyWith<_$RoutinePoseInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PoseSubmissionResult _$PoseSubmissionResultFromJson(Map<String, dynamic> json) {
  return _PoseSubmissionResult.fromJson(json);
}

/// @nodoc
mixin _$PoseSubmissionResult {
  @JsonKey(name: 'poseCode')
  String get poseCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'poseName')
  String get poseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'score')
  double get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'feedback')
  String? get feedback => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeSpentSeconds')
  int get timeSpentSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'submittedAt')
  DateTime get submittedAt => throw _privateConstructorUsedError;

  /// Serializes this PoseSubmissionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoseSubmissionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoseSubmissionResultCopyWith<PoseSubmissionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoseSubmissionResultCopyWith<$Res> {
  factory $PoseSubmissionResultCopyWith(PoseSubmissionResult value,
          $Res Function(PoseSubmissionResult) then) =
      _$PoseSubmissionResultCopyWithImpl<$Res, PoseSubmissionResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'poseCode') String poseCode,
      @JsonKey(name: 'poseName') String poseName,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'score') double score,
      @JsonKey(name: 'feedback') String? feedback,
      @JsonKey(name: 'timeSpentSeconds') int timeSpentSeconds,
      @JsonKey(name: 'submittedAt') DateTime submittedAt});
}

/// @nodoc
class _$PoseSubmissionResultCopyWithImpl<$Res,
        $Val extends PoseSubmissionResult>
    implements $PoseSubmissionResultCopyWith<$Res> {
  _$PoseSubmissionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoseSubmissionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseCode = null,
    Object? poseName = null,
    Object? imageUrl = freezed,
    Object? score = null,
    Object? feedback = freezed,
    Object? timeSpentSeconds = null,
    Object? submittedAt = null,
  }) {
    return _then(_value.copyWith(
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      poseName: null == poseName
          ? _value.poseName
          : poseName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSpentSeconds: null == timeSpentSeconds
          ? _value.timeSpentSeconds
          : timeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      submittedAt: null == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoseSubmissionResultImplCopyWith<$Res>
    implements $PoseSubmissionResultCopyWith<$Res> {
  factory _$$PoseSubmissionResultImplCopyWith(_$PoseSubmissionResultImpl value,
          $Res Function(_$PoseSubmissionResultImpl) then) =
      __$$PoseSubmissionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'poseCode') String poseCode,
      @JsonKey(name: 'poseName') String poseName,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'score') double score,
      @JsonKey(name: 'feedback') String? feedback,
      @JsonKey(name: 'timeSpentSeconds') int timeSpentSeconds,
      @JsonKey(name: 'submittedAt') DateTime submittedAt});
}

/// @nodoc
class __$$PoseSubmissionResultImplCopyWithImpl<$Res>
    extends _$PoseSubmissionResultCopyWithImpl<$Res, _$PoseSubmissionResultImpl>
    implements _$$PoseSubmissionResultImplCopyWith<$Res> {
  __$$PoseSubmissionResultImplCopyWithImpl(_$PoseSubmissionResultImpl _value,
      $Res Function(_$PoseSubmissionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoseSubmissionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseCode = null,
    Object? poseName = null,
    Object? imageUrl = freezed,
    Object? score = null,
    Object? feedback = freezed,
    Object? timeSpentSeconds = null,
    Object? submittedAt = null,
  }) {
    return _then(_$PoseSubmissionResultImpl(
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      poseName: null == poseName
          ? _value.poseName
          : poseName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSpentSeconds: null == timeSpentSeconds
          ? _value.timeSpentSeconds
          : timeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      submittedAt: null == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoseSubmissionResultImpl implements _PoseSubmissionResult {
  const _$PoseSubmissionResultImpl(
      {@JsonKey(name: 'poseCode') required this.poseCode,
      @JsonKey(name: 'poseName') required this.poseName,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'score') this.score = 0.0,
      @JsonKey(name: 'feedback') this.feedback,
      @JsonKey(name: 'timeSpentSeconds') this.timeSpentSeconds = 0,
      @JsonKey(name: 'submittedAt') required this.submittedAt});

  factory _$PoseSubmissionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoseSubmissionResultImplFromJson(json);

  @override
  @JsonKey(name: 'poseCode')
  final String poseCode;
  @override
  @JsonKey(name: 'poseName')
  final String poseName;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'score')
  final double score;
  @override
  @JsonKey(name: 'feedback')
  final String? feedback;
  @override
  @JsonKey(name: 'timeSpentSeconds')
  final int timeSpentSeconds;
  @override
  @JsonKey(name: 'submittedAt')
  final DateTime submittedAt;

  @override
  String toString() {
    return 'PoseSubmissionResult(poseCode: $poseCode, poseName: $poseName, imageUrl: $imageUrl, score: $score, feedback: $feedback, timeSpentSeconds: $timeSpentSeconds, submittedAt: $submittedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoseSubmissionResultImpl &&
            (identical(other.poseCode, poseCode) ||
                other.poseCode == poseCode) &&
            (identical(other.poseName, poseName) ||
                other.poseName == poseName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.timeSpentSeconds, timeSpentSeconds) ||
                other.timeSpentSeconds == timeSpentSeconds) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poseCode, poseName, imageUrl,
      score, feedback, timeSpentSeconds, submittedAt);

  /// Create a copy of PoseSubmissionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoseSubmissionResultImplCopyWith<_$PoseSubmissionResultImpl>
      get copyWith =>
          __$$PoseSubmissionResultImplCopyWithImpl<_$PoseSubmissionResultImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoseSubmissionResultImplToJson(
      this,
    );
  }
}

abstract class _PoseSubmissionResult implements PoseSubmissionResult {
  const factory _PoseSubmissionResult(
          {@JsonKey(name: 'poseCode') required final String poseCode,
          @JsonKey(name: 'poseName') required final String poseName,
          @JsonKey(name: 'imageUrl') final String? imageUrl,
          @JsonKey(name: 'score') final double score,
          @JsonKey(name: 'feedback') final String? feedback,
          @JsonKey(name: 'timeSpentSeconds') final int timeSpentSeconds,
          @JsonKey(name: 'submittedAt') required final DateTime submittedAt}) =
      _$PoseSubmissionResultImpl;

  factory _PoseSubmissionResult.fromJson(Map<String, dynamic> json) =
      _$PoseSubmissionResultImpl.fromJson;

  @override
  @JsonKey(name: 'poseCode')
  String get poseCode;
  @override
  @JsonKey(name: 'poseName')
  String get poseName;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'score')
  double get score;
  @override
  @JsonKey(name: 'feedback')
  String? get feedback;
  @override
  @JsonKey(name: 'timeSpentSeconds')
  int get timeSpentSeconds;
  @override
  @JsonKey(name: 'submittedAt')
  DateTime get submittedAt;

  /// Create a copy of PoseSubmissionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoseSubmissionResultImplCopyWith<_$PoseSubmissionResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
