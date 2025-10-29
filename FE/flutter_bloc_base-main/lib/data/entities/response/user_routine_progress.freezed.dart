// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_routine_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRoutineProgress _$UserRoutineProgressFromJson(Map<String, dynamic> json) {
  return _UserRoutineProgress.fromJson(json);
}

/// @nodoc
mixin _$UserRoutineProgress {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get routineId => throw _privateConstructorUsedError;
  String? get routineName => throw _privateConstructorUsedError;
  String? get routineImageUrl => throw _privateConstructorUsedError;
  List<String> get completedPoses => throw _privateConstructorUsedError;
  int get totalPoses => throw _privateConstructorUsedError;
  int get currentPoseIndex => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  double get completionPercentage => throw _privateConstructorUsedError;
  int get totalTimeSpentSeconds => throw _privateConstructorUsedError;
  double? get averageScore => throw _privateConstructorUsedError;
  DateTime? get lastPracticedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserRoutineProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRoutineProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoutineProgressCopyWith<UserRoutineProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoutineProgressCopyWith<$Res> {
  factory $UserRoutineProgressCopyWith(
          UserRoutineProgress value, $Res Function(UserRoutineProgress) then) =
      _$UserRoutineProgressCopyWithImpl<$Res, UserRoutineProgress>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String routineId,
      String? routineName,
      String? routineImageUrl,
      List<String> completedPoses,
      int totalPoses,
      int currentPoseIndex,
      bool isCompleted,
      double completionPercentage,
      int totalTimeSpentSeconds,
      double? averageScore,
      DateTime? lastPracticedAt,
      DateTime? completedAt,
      DateTime? createdAt});
}

/// @nodoc
class _$UserRoutineProgressCopyWithImpl<$Res, $Val extends UserRoutineProgress>
    implements $UserRoutineProgressCopyWith<$Res> {
  _$UserRoutineProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRoutineProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? routineId = null,
    Object? routineName = freezed,
    Object? routineImageUrl = freezed,
    Object? completedPoses = null,
    Object? totalPoses = null,
    Object? currentPoseIndex = null,
    Object? isCompleted = null,
    Object? completionPercentage = null,
    Object? totalTimeSpentSeconds = null,
    Object? averageScore = freezed,
    Object? lastPracticedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      routineId: null == routineId
          ? _value.routineId
          : routineId // ignore: cast_nullable_to_non_nullable
              as String,
      routineName: freezed == routineName
          ? _value.routineName
          : routineName // ignore: cast_nullable_to_non_nullable
              as String?,
      routineImageUrl: freezed == routineImageUrl
          ? _value.routineImageUrl
          : routineImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      completedPoses: null == completedPoses
          ? _value.completedPoses
          : completedPoses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalPoses: null == totalPoses
          ? _value.totalPoses
          : totalPoses // ignore: cast_nullable_to_non_nullable
              as int,
      currentPoseIndex: null == currentPoseIndex
          ? _value.currentPoseIndex
          : currentPoseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      totalTimeSpentSeconds: null == totalTimeSpentSeconds
          ? _value.totalTimeSpentSeconds
          : totalTimeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      lastPracticedAt: freezed == lastPracticedAt
          ? _value.lastPracticedAt
          : lastPracticedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoutineProgressImplCopyWith<$Res>
    implements $UserRoutineProgressCopyWith<$Res> {
  factory _$$UserRoutineProgressImplCopyWith(_$UserRoutineProgressImpl value,
          $Res Function(_$UserRoutineProgressImpl) then) =
      __$$UserRoutineProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String routineId,
      String? routineName,
      String? routineImageUrl,
      List<String> completedPoses,
      int totalPoses,
      int currentPoseIndex,
      bool isCompleted,
      double completionPercentage,
      int totalTimeSpentSeconds,
      double? averageScore,
      DateTime? lastPracticedAt,
      DateTime? completedAt,
      DateTime? createdAt});
}

/// @nodoc
class __$$UserRoutineProgressImplCopyWithImpl<$Res>
    extends _$UserRoutineProgressCopyWithImpl<$Res, _$UserRoutineProgressImpl>
    implements _$$UserRoutineProgressImplCopyWith<$Res> {
  __$$UserRoutineProgressImplCopyWithImpl(_$UserRoutineProgressImpl _value,
      $Res Function(_$UserRoutineProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRoutineProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? routineId = null,
    Object? routineName = freezed,
    Object? routineImageUrl = freezed,
    Object? completedPoses = null,
    Object? totalPoses = null,
    Object? currentPoseIndex = null,
    Object? isCompleted = null,
    Object? completionPercentage = null,
    Object? totalTimeSpentSeconds = null,
    Object? averageScore = freezed,
    Object? lastPracticedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserRoutineProgressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      routineId: null == routineId
          ? _value.routineId
          : routineId // ignore: cast_nullable_to_non_nullable
              as String,
      routineName: freezed == routineName
          ? _value.routineName
          : routineName // ignore: cast_nullable_to_non_nullable
              as String?,
      routineImageUrl: freezed == routineImageUrl
          ? _value.routineImageUrl
          : routineImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      completedPoses: null == completedPoses
          ? _value._completedPoses
          : completedPoses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalPoses: null == totalPoses
          ? _value.totalPoses
          : totalPoses // ignore: cast_nullable_to_non_nullable
              as int,
      currentPoseIndex: null == currentPoseIndex
          ? _value.currentPoseIndex
          : currentPoseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      totalTimeSpentSeconds: null == totalTimeSpentSeconds
          ? _value.totalTimeSpentSeconds
          : totalTimeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      lastPracticedAt: freezed == lastPracticedAt
          ? _value.lastPracticedAt
          : lastPracticedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoutineProgressImpl implements _UserRoutineProgress {
  const _$UserRoutineProgressImpl(
      {required this.id,
      required this.userId,
      required this.routineId,
      this.routineName,
      this.routineImageUrl,
      final List<String> completedPoses = const [],
      required this.totalPoses,
      this.currentPoseIndex = 0,
      this.isCompleted = false,
      this.completionPercentage = 0.0,
      this.totalTimeSpentSeconds = 0,
      this.averageScore,
      this.lastPracticedAt,
      this.completedAt,
      this.createdAt})
      : _completedPoses = completedPoses;

  factory _$UserRoutineProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoutineProgressImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String routineId;
  @override
  final String? routineName;
  @override
  final String? routineImageUrl;
  final List<String> _completedPoses;
  @override
  @JsonKey()
  List<String> get completedPoses {
    if (_completedPoses is EqualUnmodifiableListView) return _completedPoses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedPoses);
  }

  @override
  final int totalPoses;
  @override
  @JsonKey()
  final int currentPoseIndex;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final double completionPercentage;
  @override
  @JsonKey()
  final int totalTimeSpentSeconds;
  @override
  final double? averageScore;
  @override
  final DateTime? lastPracticedAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'UserRoutineProgress(id: $id, userId: $userId, routineId: $routineId, routineName: $routineName, routineImageUrl: $routineImageUrl, completedPoses: $completedPoses, totalPoses: $totalPoses, currentPoseIndex: $currentPoseIndex, isCompleted: $isCompleted, completionPercentage: $completionPercentage, totalTimeSpentSeconds: $totalTimeSpentSeconds, averageScore: $averageScore, lastPracticedAt: $lastPracticedAt, completedAt: $completedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoutineProgressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.routineId, routineId) ||
                other.routineId == routineId) &&
            (identical(other.routineName, routineName) ||
                other.routineName == routineName) &&
            (identical(other.routineImageUrl, routineImageUrl) ||
                other.routineImageUrl == routineImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._completedPoses, _completedPoses) &&
            (identical(other.totalPoses, totalPoses) ||
                other.totalPoses == totalPoses) &&
            (identical(other.currentPoseIndex, currentPoseIndex) ||
                other.currentPoseIndex == currentPoseIndex) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage) &&
            (identical(other.totalTimeSpentSeconds, totalTimeSpentSeconds) ||
                other.totalTimeSpentSeconds == totalTimeSpentSeconds) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.lastPracticedAt, lastPracticedAt) ||
                other.lastPracticedAt == lastPracticedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      routineId,
      routineName,
      routineImageUrl,
      const DeepCollectionEquality().hash(_completedPoses),
      totalPoses,
      currentPoseIndex,
      isCompleted,
      completionPercentage,
      totalTimeSpentSeconds,
      averageScore,
      lastPracticedAt,
      completedAt,
      createdAt);

  /// Create a copy of UserRoutineProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoutineProgressImplCopyWith<_$UserRoutineProgressImpl> get copyWith =>
      __$$UserRoutineProgressImplCopyWithImpl<_$UserRoutineProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoutineProgressImplToJson(
      this,
    );
  }
}

abstract class _UserRoutineProgress implements UserRoutineProgress {
  const factory _UserRoutineProgress(
      {required final String id,
      required final String userId,
      required final String routineId,
      final String? routineName,
      final String? routineImageUrl,
      final List<String> completedPoses,
      required final int totalPoses,
      final int currentPoseIndex,
      final bool isCompleted,
      final double completionPercentage,
      final int totalTimeSpentSeconds,
      final double? averageScore,
      final DateTime? lastPracticedAt,
      final DateTime? completedAt,
      final DateTime? createdAt}) = _$UserRoutineProgressImpl;

  factory _UserRoutineProgress.fromJson(Map<String, dynamic> json) =
      _$UserRoutineProgressImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get routineId;
  @override
  String? get routineName;
  @override
  String? get routineImageUrl;
  @override
  List<String> get completedPoses;
  @override
  int get totalPoses;
  @override
  int get currentPoseIndex;
  @override
  bool get isCompleted;
  @override
  double get completionPercentage;
  @override
  int get totalTimeSpentSeconds;
  @override
  double? get averageScore;
  @override
  DateTime? get lastPracticedAt;
  @override
  DateTime? get completedAt;
  @override
  DateTime? get createdAt;

  /// Create a copy of UserRoutineProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoutineProgressImplCopyWith<_$UserRoutineProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRoutineStatistics _$UserRoutineStatisticsFromJson(
    Map<String, dynamic> json) {
  return _UserRoutineStatistics.fromJson(json);
}

/// @nodoc
mixin _$UserRoutineStatistics {
  int get totalCompletedRoutines => throw _privateConstructorUsedError;
  double get averageScore => throw _privateConstructorUsedError;
  int get totalTimeSpentMinutes => throw _privateConstructorUsedError;
  int get inProgressRoutines => throw _privateConstructorUsedError;

  /// Serializes this UserRoutineStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRoutineStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoutineStatisticsCopyWith<UserRoutineStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoutineStatisticsCopyWith<$Res> {
  factory $UserRoutineStatisticsCopyWith(UserRoutineStatistics value,
          $Res Function(UserRoutineStatistics) then) =
      _$UserRoutineStatisticsCopyWithImpl<$Res, UserRoutineStatistics>;
  @useResult
  $Res call(
      {int totalCompletedRoutines,
      double averageScore,
      int totalTimeSpentMinutes,
      int inProgressRoutines});
}

/// @nodoc
class _$UserRoutineStatisticsCopyWithImpl<$Res,
        $Val extends UserRoutineStatistics>
    implements $UserRoutineStatisticsCopyWith<$Res> {
  _$UserRoutineStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRoutineStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCompletedRoutines = null,
    Object? averageScore = null,
    Object? totalTimeSpentMinutes = null,
    Object? inProgressRoutines = null,
  }) {
    return _then(_value.copyWith(
      totalCompletedRoutines: null == totalCompletedRoutines
          ? _value.totalCompletedRoutines
          : totalCompletedRoutines // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      totalTimeSpentMinutes: null == totalTimeSpentMinutes
          ? _value.totalTimeSpentMinutes
          : totalTimeSpentMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressRoutines: null == inProgressRoutines
          ? _value.inProgressRoutines
          : inProgressRoutines // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoutineStatisticsImplCopyWith<$Res>
    implements $UserRoutineStatisticsCopyWith<$Res> {
  factory _$$UserRoutineStatisticsImplCopyWith(
          _$UserRoutineStatisticsImpl value,
          $Res Function(_$UserRoutineStatisticsImpl) then) =
      __$$UserRoutineStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCompletedRoutines,
      double averageScore,
      int totalTimeSpentMinutes,
      int inProgressRoutines});
}

/// @nodoc
class __$$UserRoutineStatisticsImplCopyWithImpl<$Res>
    extends _$UserRoutineStatisticsCopyWithImpl<$Res,
        _$UserRoutineStatisticsImpl>
    implements _$$UserRoutineStatisticsImplCopyWith<$Res> {
  __$$UserRoutineStatisticsImplCopyWithImpl(_$UserRoutineStatisticsImpl _value,
      $Res Function(_$UserRoutineStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRoutineStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCompletedRoutines = null,
    Object? averageScore = null,
    Object? totalTimeSpentMinutes = null,
    Object? inProgressRoutines = null,
  }) {
    return _then(_$UserRoutineStatisticsImpl(
      totalCompletedRoutines: null == totalCompletedRoutines
          ? _value.totalCompletedRoutines
          : totalCompletedRoutines // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      totalTimeSpentMinutes: null == totalTimeSpentMinutes
          ? _value.totalTimeSpentMinutes
          : totalTimeSpentMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressRoutines: null == inProgressRoutines
          ? _value.inProgressRoutines
          : inProgressRoutines // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoutineStatisticsImpl implements _UserRoutineStatistics {
  const _$UserRoutineStatisticsImpl(
      {this.totalCompletedRoutines = 0,
      this.averageScore = 0.0,
      this.totalTimeSpentMinutes = 0,
      this.inProgressRoutines = 0});

  factory _$UserRoutineStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoutineStatisticsImplFromJson(json);

  @override
  @JsonKey()
  final int totalCompletedRoutines;
  @override
  @JsonKey()
  final double averageScore;
  @override
  @JsonKey()
  final int totalTimeSpentMinutes;
  @override
  @JsonKey()
  final int inProgressRoutines;

  @override
  String toString() {
    return 'UserRoutineStatistics(totalCompletedRoutines: $totalCompletedRoutines, averageScore: $averageScore, totalTimeSpentMinutes: $totalTimeSpentMinutes, inProgressRoutines: $inProgressRoutines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoutineStatisticsImpl &&
            (identical(other.totalCompletedRoutines, totalCompletedRoutines) ||
                other.totalCompletedRoutines == totalCompletedRoutines) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.totalTimeSpentMinutes, totalTimeSpentMinutes) ||
                other.totalTimeSpentMinutes == totalTimeSpentMinutes) &&
            (identical(other.inProgressRoutines, inProgressRoutines) ||
                other.inProgressRoutines == inProgressRoutines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalCompletedRoutines,
      averageScore, totalTimeSpentMinutes, inProgressRoutines);

  /// Create a copy of UserRoutineStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoutineStatisticsImplCopyWith<_$UserRoutineStatisticsImpl>
      get copyWith => __$$UserRoutineStatisticsImplCopyWithImpl<
          _$UserRoutineStatisticsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoutineStatisticsImplToJson(
      this,
    );
  }
}

abstract class _UserRoutineStatistics implements UserRoutineStatistics {
  const factory _UserRoutineStatistics(
      {final int totalCompletedRoutines,
      final double averageScore,
      final int totalTimeSpentMinutes,
      final int inProgressRoutines}) = _$UserRoutineStatisticsImpl;

  factory _UserRoutineStatistics.fromJson(Map<String, dynamic> json) =
      _$UserRoutineStatisticsImpl.fromJson;

  @override
  int get totalCompletedRoutines;
  @override
  double get averageScore;
  @override
  int get totalTimeSpentMinutes;
  @override
  int get inProgressRoutines;

  /// Create a copy of UserRoutineStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoutineStatisticsImplCopyWith<_$UserRoutineStatisticsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
