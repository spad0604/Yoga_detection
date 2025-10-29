// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_routine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YogaRoutine _$YogaRoutineFromJson(Map<String, dynamic> json) {
  return _YogaRoutine.fromJson(json);
}

/// @nodoc
mixin _$YogaRoutine {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  int? get estimatedCalories => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  int? get totalPoses => throw _privateConstructorUsedError;
  List<RoutinePose>? get poses => throw _privateConstructorUsedError;
  UserRoutineProgressInfo? get userProgress =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this YogaRoutine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YogaRoutine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YogaRoutineCopyWith<YogaRoutine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YogaRoutineCopyWith<$Res> {
  factory $YogaRoutineCopyWith(
          YogaRoutine value, $Res Function(YogaRoutine) then) =
      _$YogaRoutineCopyWithImpl<$Res, YogaRoutine>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? level,
      int? durationMinutes,
      int? estimatedCalories,
      String? imageUrl,
      List<String>? tags,
      bool isPremium,
      int? totalPoses,
      List<RoutinePose>? poses,
      UserRoutineProgressInfo? userProgress,
      DateTime? createdAt,
      DateTime? updatedAt});

  $UserRoutineProgressInfoCopyWith<$Res>? get userProgress;
}

/// @nodoc
class _$YogaRoutineCopyWithImpl<$Res, $Val extends YogaRoutine>
    implements $YogaRoutineCopyWith<$Res> {
  _$YogaRoutineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YogaRoutine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? level = freezed,
    Object? durationMinutes = freezed,
    Object? estimatedCalories = freezed,
    Object? imageUrl = freezed,
    Object? tags = freezed,
    Object? isPremium = null,
    Object? totalPoses = freezed,
    Object? poses = freezed,
    Object? userProgress = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      estimatedCalories: freezed == estimatedCalories
          ? _value.estimatedCalories
          : estimatedCalories // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPoses: freezed == totalPoses
          ? _value.totalPoses
          : totalPoses // ignore: cast_nullable_to_non_nullable
              as int?,
      poses: freezed == poses
          ? _value.poses
          : poses // ignore: cast_nullable_to_non_nullable
              as List<RoutinePose>?,
      userProgress: freezed == userProgress
          ? _value.userProgress
          : userProgress // ignore: cast_nullable_to_non_nullable
              as UserRoutineProgressInfo?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of YogaRoutine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserRoutineProgressInfoCopyWith<$Res>? get userProgress {
    if (_value.userProgress == null) {
      return null;
    }

    return $UserRoutineProgressInfoCopyWith<$Res>(_value.userProgress!,
        (value) {
      return _then(_value.copyWith(userProgress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$YogaRoutineImplCopyWith<$Res>
    implements $YogaRoutineCopyWith<$Res> {
  factory _$$YogaRoutineImplCopyWith(
          _$YogaRoutineImpl value, $Res Function(_$YogaRoutineImpl) then) =
      __$$YogaRoutineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? level,
      int? durationMinutes,
      int? estimatedCalories,
      String? imageUrl,
      List<String>? tags,
      bool isPremium,
      int? totalPoses,
      List<RoutinePose>? poses,
      UserRoutineProgressInfo? userProgress,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $UserRoutineProgressInfoCopyWith<$Res>? get userProgress;
}

/// @nodoc
class __$$YogaRoutineImplCopyWithImpl<$Res>
    extends _$YogaRoutineCopyWithImpl<$Res, _$YogaRoutineImpl>
    implements _$$YogaRoutineImplCopyWith<$Res> {
  __$$YogaRoutineImplCopyWithImpl(
      _$YogaRoutineImpl _value, $Res Function(_$YogaRoutineImpl) _then)
      : super(_value, _then);

  /// Create a copy of YogaRoutine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? level = freezed,
    Object? durationMinutes = freezed,
    Object? estimatedCalories = freezed,
    Object? imageUrl = freezed,
    Object? tags = freezed,
    Object? isPremium = null,
    Object? totalPoses = freezed,
    Object? poses = freezed,
    Object? userProgress = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$YogaRoutineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      estimatedCalories: freezed == estimatedCalories
          ? _value.estimatedCalories
          : estimatedCalories // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPoses: freezed == totalPoses
          ? _value.totalPoses
          : totalPoses // ignore: cast_nullable_to_non_nullable
              as int?,
      poses: freezed == poses
          ? _value._poses
          : poses // ignore: cast_nullable_to_non_nullable
              as List<RoutinePose>?,
      userProgress: freezed == userProgress
          ? _value.userProgress
          : userProgress // ignore: cast_nullable_to_non_nullable
              as UserRoutineProgressInfo?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YogaRoutineImpl implements _YogaRoutine {
  const _$YogaRoutineImpl(
      {required this.id,
      required this.name,
      this.description,
      this.level,
      this.durationMinutes,
      this.estimatedCalories,
      this.imageUrl,
      final List<String>? tags,
      this.isPremium = false,
      this.totalPoses,
      final List<RoutinePose>? poses,
      this.userProgress,
      this.createdAt,
      this.updatedAt})
      : _tags = tags,
        _poses = poses;

  factory _$YogaRoutineImpl.fromJson(Map<String, dynamic> json) =>
      _$$YogaRoutineImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? level;
  @override
  final int? durationMinutes;
  @override
  final int? estimatedCalories;
  @override
  final String? imageUrl;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isPremium;
  @override
  final int? totalPoses;
  final List<RoutinePose>? _poses;
  @override
  List<RoutinePose>? get poses {
    final value = _poses;
    if (value == null) return null;
    if (_poses is EqualUnmodifiableListView) return _poses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserRoutineProgressInfo? userProgress;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'YogaRoutine(id: $id, name: $name, description: $description, level: $level, durationMinutes: $durationMinutes, estimatedCalories: $estimatedCalories, imageUrl: $imageUrl, tags: $tags, isPremium: $isPremium, totalPoses: $totalPoses, poses: $poses, userProgress: $userProgress, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YogaRoutineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.estimatedCalories, estimatedCalories) ||
                other.estimatedCalories == estimatedCalories) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.totalPoses, totalPoses) ||
                other.totalPoses == totalPoses) &&
            const DeepCollectionEquality().equals(other._poses, _poses) &&
            (identical(other.userProgress, userProgress) ||
                other.userProgress == userProgress) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      level,
      durationMinutes,
      estimatedCalories,
      imageUrl,
      const DeepCollectionEquality().hash(_tags),
      isPremium,
      totalPoses,
      const DeepCollectionEquality().hash(_poses),
      userProgress,
      createdAt,
      updatedAt);

  /// Create a copy of YogaRoutine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YogaRoutineImplCopyWith<_$YogaRoutineImpl> get copyWith =>
      __$$YogaRoutineImplCopyWithImpl<_$YogaRoutineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YogaRoutineImplToJson(
      this,
    );
  }
}

abstract class _YogaRoutine implements YogaRoutine {
  const factory _YogaRoutine(
      {required final String id,
      required final String name,
      final String? description,
      final String? level,
      final int? durationMinutes,
      final int? estimatedCalories,
      final String? imageUrl,
      final List<String>? tags,
      final bool isPremium,
      final int? totalPoses,
      final List<RoutinePose>? poses,
      final UserRoutineProgressInfo? userProgress,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$YogaRoutineImpl;

  factory _YogaRoutine.fromJson(Map<String, dynamic> json) =
      _$YogaRoutineImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get level;
  @override
  int? get durationMinutes;
  @override
  int? get estimatedCalories;
  @override
  String? get imageUrl;
  @override
  List<String>? get tags;
  @override
  bool get isPremium;
  @override
  int? get totalPoses;
  @override
  List<RoutinePose>? get poses;
  @override
  UserRoutineProgressInfo? get userProgress;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of YogaRoutine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YogaRoutineImplCopyWith<_$YogaRoutineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoutinePose _$RoutinePoseFromJson(Map<String, dynamic> json) {
  return _RoutinePose.fromJson(json);
}

/// @nodoc
mixin _$RoutinePose {
  String get id => throw _privateConstructorUsedError;
  String get poseCode => throw _privateConstructorUsedError;
  String? get poseName => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  int get repetitions => throw _privateConstructorUsedError;
  int get restAfterSeconds => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;
  String? get poseImageUrl => throw _privateConstructorUsedError;
  String? get poseDescription => throw _privateConstructorUsedError;

  /// Serializes this RoutinePose to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoutinePose
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoutinePoseCopyWith<RoutinePose> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutinePoseCopyWith<$Res> {
  factory $RoutinePoseCopyWith(
          RoutinePose value, $Res Function(RoutinePose) then) =
      _$RoutinePoseCopyWithImpl<$Res, RoutinePose>;
  @useResult
  $Res call(
      {String id,
      String poseCode,
      String? poseName,
      int orderIndex,
      int? durationSeconds,
      int repetitions,
      int restAfterSeconds,
      String? instructions,
      String? poseImageUrl,
      String? poseDescription});
}

/// @nodoc
class _$RoutinePoseCopyWithImpl<$Res, $Val extends RoutinePose>
    implements $RoutinePoseCopyWith<$Res> {
  _$RoutinePoseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoutinePose
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poseCode = null,
    Object? poseName = freezed,
    Object? orderIndex = null,
    Object? durationSeconds = freezed,
    Object? repetitions = null,
    Object? restAfterSeconds = null,
    Object? instructions = freezed,
    Object? poseImageUrl = freezed,
    Object? poseDescription = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      poseName: freezed == poseName
          ? _value.poseName
          : poseName // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      repetitions: null == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int,
      restAfterSeconds: null == restAfterSeconds
          ? _value.restAfterSeconds
          : restAfterSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      poseImageUrl: freezed == poseImageUrl
          ? _value.poseImageUrl
          : poseImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      poseDescription: freezed == poseDescription
          ? _value.poseDescription
          : poseDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutinePoseImplCopyWith<$Res>
    implements $RoutinePoseCopyWith<$Res> {
  factory _$$RoutinePoseImplCopyWith(
          _$RoutinePoseImpl value, $Res Function(_$RoutinePoseImpl) then) =
      __$$RoutinePoseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String poseCode,
      String? poseName,
      int orderIndex,
      int? durationSeconds,
      int repetitions,
      int restAfterSeconds,
      String? instructions,
      String? poseImageUrl,
      String? poseDescription});
}

/// @nodoc
class __$$RoutinePoseImplCopyWithImpl<$Res>
    extends _$RoutinePoseCopyWithImpl<$Res, _$RoutinePoseImpl>
    implements _$$RoutinePoseImplCopyWith<$Res> {
  __$$RoutinePoseImplCopyWithImpl(
      _$RoutinePoseImpl _value, $Res Function(_$RoutinePoseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoutinePose
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poseCode = null,
    Object? poseName = freezed,
    Object? orderIndex = null,
    Object? durationSeconds = freezed,
    Object? repetitions = null,
    Object? restAfterSeconds = null,
    Object? instructions = freezed,
    Object? poseImageUrl = freezed,
    Object? poseDescription = freezed,
  }) {
    return _then(_$RoutinePoseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      poseName: freezed == poseName
          ? _value.poseName
          : poseName // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      repetitions: null == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int,
      restAfterSeconds: null == restAfterSeconds
          ? _value.restAfterSeconds
          : restAfterSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      poseImageUrl: freezed == poseImageUrl
          ? _value.poseImageUrl
          : poseImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      poseDescription: freezed == poseDescription
          ? _value.poseDescription
          : poseDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoutinePoseImpl implements _RoutinePose {
  const _$RoutinePoseImpl(
      {required this.id,
      required this.poseCode,
      this.poseName,
      required this.orderIndex,
      this.durationSeconds,
      this.repetitions = 1,
      this.restAfterSeconds = 5,
      this.instructions,
      this.poseImageUrl,
      this.poseDescription});

  factory _$RoutinePoseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutinePoseImplFromJson(json);

  @override
  final String id;
  @override
  final String poseCode;
  @override
  final String? poseName;
  @override
  final int orderIndex;
  @override
  final int? durationSeconds;
  @override
  @JsonKey()
  final int repetitions;
  @override
  @JsonKey()
  final int restAfterSeconds;
  @override
  final String? instructions;
  @override
  final String? poseImageUrl;
  @override
  final String? poseDescription;

  @override
  String toString() {
    return 'RoutinePose(id: $id, poseCode: $poseCode, poseName: $poseName, orderIndex: $orderIndex, durationSeconds: $durationSeconds, repetitions: $repetitions, restAfterSeconds: $restAfterSeconds, instructions: $instructions, poseImageUrl: $poseImageUrl, poseDescription: $poseDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutinePoseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poseCode, poseCode) ||
                other.poseCode == poseCode) &&
            (identical(other.poseName, poseName) ||
                other.poseName == poseName) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.repetitions, repetitions) ||
                other.repetitions == repetitions) &&
            (identical(other.restAfterSeconds, restAfterSeconds) ||
                other.restAfterSeconds == restAfterSeconds) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.poseImageUrl, poseImageUrl) ||
                other.poseImageUrl == poseImageUrl) &&
            (identical(other.poseDescription, poseDescription) ||
                other.poseDescription == poseDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      poseCode,
      poseName,
      orderIndex,
      durationSeconds,
      repetitions,
      restAfterSeconds,
      instructions,
      poseImageUrl,
      poseDescription);

  /// Create a copy of RoutinePose
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutinePoseImplCopyWith<_$RoutinePoseImpl> get copyWith =>
      __$$RoutinePoseImplCopyWithImpl<_$RoutinePoseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoutinePoseImplToJson(
      this,
    );
  }
}

abstract class _RoutinePose implements RoutinePose {
  const factory _RoutinePose(
      {required final String id,
      required final String poseCode,
      final String? poseName,
      required final int orderIndex,
      final int? durationSeconds,
      final int repetitions,
      final int restAfterSeconds,
      final String? instructions,
      final String? poseImageUrl,
      final String? poseDescription}) = _$RoutinePoseImpl;

  factory _RoutinePose.fromJson(Map<String, dynamic> json) =
      _$RoutinePoseImpl.fromJson;

  @override
  String get id;
  @override
  String get poseCode;
  @override
  String? get poseName;
  @override
  int get orderIndex;
  @override
  int? get durationSeconds;
  @override
  int get repetitions;
  @override
  int get restAfterSeconds;
  @override
  String? get instructions;
  @override
  String? get poseImageUrl;
  @override
  String? get poseDescription;

  /// Create a copy of RoutinePose
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutinePoseImplCopyWith<_$RoutinePoseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRoutineProgressInfo _$UserRoutineProgressInfoFromJson(
    Map<String, dynamic> json) {
  return _UserRoutineProgressInfo.fromJson(json);
}

/// @nodoc
mixin _$UserRoutineProgressInfo {
  double get completionPercentage => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  int get currentPoseIndex => throw _privateConstructorUsedError;
  DateTime? get lastPracticedAt => throw _privateConstructorUsedError;
  double? get averageScore => throw _privateConstructorUsedError;

  /// Serializes this UserRoutineProgressInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRoutineProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoutineProgressInfoCopyWith<UserRoutineProgressInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoutineProgressInfoCopyWith<$Res> {
  factory $UserRoutineProgressInfoCopyWith(UserRoutineProgressInfo value,
          $Res Function(UserRoutineProgressInfo) then) =
      _$UserRoutineProgressInfoCopyWithImpl<$Res, UserRoutineProgressInfo>;
  @useResult
  $Res call(
      {double completionPercentage,
      bool isCompleted,
      int currentPoseIndex,
      DateTime? lastPracticedAt,
      double? averageScore});
}

/// @nodoc
class _$UserRoutineProgressInfoCopyWithImpl<$Res,
        $Val extends UserRoutineProgressInfo>
    implements $UserRoutineProgressInfoCopyWith<$Res> {
  _$UserRoutineProgressInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRoutineProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completionPercentage = null,
    Object? isCompleted = null,
    Object? currentPoseIndex = null,
    Object? lastPracticedAt = freezed,
    Object? averageScore = freezed,
  }) {
    return _then(_value.copyWith(
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPoseIndex: null == currentPoseIndex
          ? _value.currentPoseIndex
          : currentPoseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lastPracticedAt: freezed == lastPracticedAt
          ? _value.lastPracticedAt
          : lastPracticedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoutineProgressInfoImplCopyWith<$Res>
    implements $UserRoutineProgressInfoCopyWith<$Res> {
  factory _$$UserRoutineProgressInfoImplCopyWith(
          _$UserRoutineProgressInfoImpl value,
          $Res Function(_$UserRoutineProgressInfoImpl) then) =
      __$$UserRoutineProgressInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double completionPercentage,
      bool isCompleted,
      int currentPoseIndex,
      DateTime? lastPracticedAt,
      double? averageScore});
}

/// @nodoc
class __$$UserRoutineProgressInfoImplCopyWithImpl<$Res>
    extends _$UserRoutineProgressInfoCopyWithImpl<$Res,
        _$UserRoutineProgressInfoImpl>
    implements _$$UserRoutineProgressInfoImplCopyWith<$Res> {
  __$$UserRoutineProgressInfoImplCopyWithImpl(
      _$UserRoutineProgressInfoImpl _value,
      $Res Function(_$UserRoutineProgressInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRoutineProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completionPercentage = null,
    Object? isCompleted = null,
    Object? currentPoseIndex = null,
    Object? lastPracticedAt = freezed,
    Object? averageScore = freezed,
  }) {
    return _then(_$UserRoutineProgressInfoImpl(
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPoseIndex: null == currentPoseIndex
          ? _value.currentPoseIndex
          : currentPoseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lastPracticedAt: freezed == lastPracticedAt
          ? _value.lastPracticedAt
          : lastPracticedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoutineProgressInfoImpl implements _UserRoutineProgressInfo {
  const _$UserRoutineProgressInfoImpl(
      {this.completionPercentage = 0.0,
      this.isCompleted = false,
      this.currentPoseIndex = 0,
      this.lastPracticedAt,
      this.averageScore});

  factory _$UserRoutineProgressInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoutineProgressInfoImplFromJson(json);

  @override
  @JsonKey()
  final double completionPercentage;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final int currentPoseIndex;
  @override
  final DateTime? lastPracticedAt;
  @override
  final double? averageScore;

  @override
  String toString() {
    return 'UserRoutineProgressInfo(completionPercentage: $completionPercentage, isCompleted: $isCompleted, currentPoseIndex: $currentPoseIndex, lastPracticedAt: $lastPracticedAt, averageScore: $averageScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoutineProgressInfoImpl &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.currentPoseIndex, currentPoseIndex) ||
                other.currentPoseIndex == currentPoseIndex) &&
            (identical(other.lastPracticedAt, lastPracticedAt) ||
                other.lastPracticedAt == lastPracticedAt) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, completionPercentage,
      isCompleted, currentPoseIndex, lastPracticedAt, averageScore);

  /// Create a copy of UserRoutineProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoutineProgressInfoImplCopyWith<_$UserRoutineProgressInfoImpl>
      get copyWith => __$$UserRoutineProgressInfoImplCopyWithImpl<
          _$UserRoutineProgressInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoutineProgressInfoImplToJson(
      this,
    );
  }
}

abstract class _UserRoutineProgressInfo implements UserRoutineProgressInfo {
  const factory _UserRoutineProgressInfo(
      {final double completionPercentage,
      final bool isCompleted,
      final int currentPoseIndex,
      final DateTime? lastPracticedAt,
      final double? averageScore}) = _$UserRoutineProgressInfoImpl;

  factory _UserRoutineProgressInfo.fromJson(Map<String, dynamic> json) =
      _$UserRoutineProgressInfoImpl.fromJson;

  @override
  double get completionPercentage;
  @override
  bool get isCompleted;
  @override
  int get currentPoseIndex;
  @override
  DateTime? get lastPracticedAt;
  @override
  double? get averageScore;

  /// Create a copy of UserRoutineProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoutineProgressInfoImplCopyWith<_$UserRoutineProgressInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
