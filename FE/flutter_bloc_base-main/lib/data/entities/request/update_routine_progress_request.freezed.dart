// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_routine_progress_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateRoutineProgressRequest _$UpdateRoutineProgressRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateRoutineProgressRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateRoutineProgressRequest {
  String get routineId => throw _privateConstructorUsedError;
  String get completedPoseCode => throw _privateConstructorUsedError;
  double? get poseScore => throw _privateConstructorUsedError;
  int? get timeSpentSeconds => throw _privateConstructorUsedError;

  /// Serializes this UpdateRoutineProgressRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateRoutineProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateRoutineProgressRequestCopyWith<UpdateRoutineProgressRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateRoutineProgressRequestCopyWith<$Res> {
  factory $UpdateRoutineProgressRequestCopyWith(
          UpdateRoutineProgressRequest value,
          $Res Function(UpdateRoutineProgressRequest) then) =
      _$UpdateRoutineProgressRequestCopyWithImpl<$Res,
          UpdateRoutineProgressRequest>;
  @useResult
  $Res call(
      {String routineId,
      String completedPoseCode,
      double? poseScore,
      int? timeSpentSeconds});
}

/// @nodoc
class _$UpdateRoutineProgressRequestCopyWithImpl<$Res,
        $Val extends UpdateRoutineProgressRequest>
    implements $UpdateRoutineProgressRequestCopyWith<$Res> {
  _$UpdateRoutineProgressRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateRoutineProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routineId = null,
    Object? completedPoseCode = null,
    Object? poseScore = freezed,
    Object? timeSpentSeconds = freezed,
  }) {
    return _then(_value.copyWith(
      routineId: null == routineId
          ? _value.routineId
          : routineId // ignore: cast_nullable_to_non_nullable
              as String,
      completedPoseCode: null == completedPoseCode
          ? _value.completedPoseCode
          : completedPoseCode // ignore: cast_nullable_to_non_nullable
              as String,
      poseScore: freezed == poseScore
          ? _value.poseScore
          : poseScore // ignore: cast_nullable_to_non_nullable
              as double?,
      timeSpentSeconds: freezed == timeSpentSeconds
          ? _value.timeSpentSeconds
          : timeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateRoutineProgressRequestImplCopyWith<$Res>
    implements $UpdateRoutineProgressRequestCopyWith<$Res> {
  factory _$$UpdateRoutineProgressRequestImplCopyWith(
          _$UpdateRoutineProgressRequestImpl value,
          $Res Function(_$UpdateRoutineProgressRequestImpl) then) =
      __$$UpdateRoutineProgressRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String routineId,
      String completedPoseCode,
      double? poseScore,
      int? timeSpentSeconds});
}

/// @nodoc
class __$$UpdateRoutineProgressRequestImplCopyWithImpl<$Res>
    extends _$UpdateRoutineProgressRequestCopyWithImpl<$Res,
        _$UpdateRoutineProgressRequestImpl>
    implements _$$UpdateRoutineProgressRequestImplCopyWith<$Res> {
  __$$UpdateRoutineProgressRequestImplCopyWithImpl(
      _$UpdateRoutineProgressRequestImpl _value,
      $Res Function(_$UpdateRoutineProgressRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateRoutineProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routineId = null,
    Object? completedPoseCode = null,
    Object? poseScore = freezed,
    Object? timeSpentSeconds = freezed,
  }) {
    return _then(_$UpdateRoutineProgressRequestImpl(
      routineId: null == routineId
          ? _value.routineId
          : routineId // ignore: cast_nullable_to_non_nullable
              as String,
      completedPoseCode: null == completedPoseCode
          ? _value.completedPoseCode
          : completedPoseCode // ignore: cast_nullable_to_non_nullable
              as String,
      poseScore: freezed == poseScore
          ? _value.poseScore
          : poseScore // ignore: cast_nullable_to_non_nullable
              as double?,
      timeSpentSeconds: freezed == timeSpentSeconds
          ? _value.timeSpentSeconds
          : timeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateRoutineProgressRequestImpl
    implements _UpdateRoutineProgressRequest {
  const _$UpdateRoutineProgressRequestImpl(
      {required this.routineId,
      required this.completedPoseCode,
      this.poseScore,
      this.timeSpentSeconds});

  factory _$UpdateRoutineProgressRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateRoutineProgressRequestImplFromJson(json);

  @override
  final String routineId;
  @override
  final String completedPoseCode;
  @override
  final double? poseScore;
  @override
  final int? timeSpentSeconds;

  @override
  String toString() {
    return 'UpdateRoutineProgressRequest(routineId: $routineId, completedPoseCode: $completedPoseCode, poseScore: $poseScore, timeSpentSeconds: $timeSpentSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRoutineProgressRequestImpl &&
            (identical(other.routineId, routineId) ||
                other.routineId == routineId) &&
            (identical(other.completedPoseCode, completedPoseCode) ||
                other.completedPoseCode == completedPoseCode) &&
            (identical(other.poseScore, poseScore) ||
                other.poseScore == poseScore) &&
            (identical(other.timeSpentSeconds, timeSpentSeconds) ||
                other.timeSpentSeconds == timeSpentSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, routineId, completedPoseCode, poseScore, timeSpentSeconds);

  /// Create a copy of UpdateRoutineProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRoutineProgressRequestImplCopyWith<
          _$UpdateRoutineProgressRequestImpl>
      get copyWith => __$$UpdateRoutineProgressRequestImplCopyWithImpl<
          _$UpdateRoutineProgressRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateRoutineProgressRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateRoutineProgressRequest
    implements UpdateRoutineProgressRequest {
  const factory _UpdateRoutineProgressRequest(
      {required final String routineId,
      required final String completedPoseCode,
      final double? poseScore,
      final int? timeSpentSeconds}) = _$UpdateRoutineProgressRequestImpl;

  factory _UpdateRoutineProgressRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateRoutineProgressRequestImpl.fromJson;

  @override
  String get routineId;
  @override
  String get completedPoseCode;
  @override
  double? get poseScore;
  @override
  int? get timeSpentSeconds;

  /// Create a copy of UpdateRoutineProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRoutineProgressRequestImplCopyWith<
          _$UpdateRoutineProgressRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
