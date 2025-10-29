// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pose_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoseStatistics _$PoseStatisticsFromJson(Map<String, dynamic> json) {
  return _PoseStatistics.fromJson(json);
}

/// @nodoc
mixin _$PoseStatistics {
  @JsonKey(name: 'poseCode')
  String get poseCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'poseName')
  String get poseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalAttempts')
  int get totalAttempts => throw _privateConstructorUsedError;
  @JsonKey(name: 'averageScore')
  double get averageScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'highestScore')
  double get highestScore => throw _privateConstructorUsedError;

  /// Serializes this PoseStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoseStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoseStatisticsCopyWith<PoseStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoseStatisticsCopyWith<$Res> {
  factory $PoseStatisticsCopyWith(
          PoseStatistics value, $Res Function(PoseStatistics) then) =
      _$PoseStatisticsCopyWithImpl<$Res, PoseStatistics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'poseCode') String poseCode,
      @JsonKey(name: 'poseName') String poseName,
      @JsonKey(name: 'totalAttempts') int totalAttempts,
      @JsonKey(name: 'averageScore') double averageScore,
      @JsonKey(name: 'highestScore') double highestScore});
}

/// @nodoc
class _$PoseStatisticsCopyWithImpl<$Res, $Val extends PoseStatistics>
    implements $PoseStatisticsCopyWith<$Res> {
  _$PoseStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoseStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseCode = null,
    Object? poseName = null,
    Object? totalAttempts = null,
    Object? averageScore = null,
    Object? highestScore = null,
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
      totalAttempts: null == totalAttempts
          ? _value.totalAttempts
          : totalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      highestScore: null == highestScore
          ? _value.highestScore
          : highestScore // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoseStatisticsImplCopyWith<$Res>
    implements $PoseStatisticsCopyWith<$Res> {
  factory _$$PoseStatisticsImplCopyWith(_$PoseStatisticsImpl value,
          $Res Function(_$PoseStatisticsImpl) then) =
      __$$PoseStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'poseCode') String poseCode,
      @JsonKey(name: 'poseName') String poseName,
      @JsonKey(name: 'totalAttempts') int totalAttempts,
      @JsonKey(name: 'averageScore') double averageScore,
      @JsonKey(name: 'highestScore') double highestScore});
}

/// @nodoc
class __$$PoseStatisticsImplCopyWithImpl<$Res>
    extends _$PoseStatisticsCopyWithImpl<$Res, _$PoseStatisticsImpl>
    implements _$$PoseStatisticsImplCopyWith<$Res> {
  __$$PoseStatisticsImplCopyWithImpl(
      _$PoseStatisticsImpl _value, $Res Function(_$PoseStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoseStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseCode = null,
    Object? poseName = null,
    Object? totalAttempts = null,
    Object? averageScore = null,
    Object? highestScore = null,
  }) {
    return _then(_$PoseStatisticsImpl(
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      poseName: null == poseName
          ? _value.poseName
          : poseName // ignore: cast_nullable_to_non_nullable
              as String,
      totalAttempts: null == totalAttempts
          ? _value.totalAttempts
          : totalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      highestScore: null == highestScore
          ? _value.highestScore
          : highestScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoseStatisticsImpl implements _PoseStatistics {
  const _$PoseStatisticsImpl(
      {@JsonKey(name: 'poseCode') required this.poseCode,
      @JsonKey(name: 'poseName') required this.poseName,
      @JsonKey(name: 'totalAttempts') required this.totalAttempts,
      @JsonKey(name: 'averageScore') required this.averageScore,
      @JsonKey(name: 'highestScore') required this.highestScore});

  factory _$PoseStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoseStatisticsImplFromJson(json);

  @override
  @JsonKey(name: 'poseCode')
  final String poseCode;
  @override
  @JsonKey(name: 'poseName')
  final String poseName;
  @override
  @JsonKey(name: 'totalAttempts')
  final int totalAttempts;
  @override
  @JsonKey(name: 'averageScore')
  final double averageScore;
  @override
  @JsonKey(name: 'highestScore')
  final double highestScore;

  @override
  String toString() {
    return 'PoseStatistics(poseCode: $poseCode, poseName: $poseName, totalAttempts: $totalAttempts, averageScore: $averageScore, highestScore: $highestScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoseStatisticsImpl &&
            (identical(other.poseCode, poseCode) ||
                other.poseCode == poseCode) &&
            (identical(other.poseName, poseName) ||
                other.poseName == poseName) &&
            (identical(other.totalAttempts, totalAttempts) ||
                other.totalAttempts == totalAttempts) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.highestScore, highestScore) ||
                other.highestScore == highestScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poseCode, poseName,
      totalAttempts, averageScore, highestScore);

  /// Create a copy of PoseStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoseStatisticsImplCopyWith<_$PoseStatisticsImpl> get copyWith =>
      __$$PoseStatisticsImplCopyWithImpl<_$PoseStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoseStatisticsImplToJson(
      this,
    );
  }
}

abstract class _PoseStatistics implements PoseStatistics {
  const factory _PoseStatistics(
          {@JsonKey(name: 'poseCode') required final String poseCode,
          @JsonKey(name: 'poseName') required final String poseName,
          @JsonKey(name: 'totalAttempts') required final int totalAttempts,
          @JsonKey(name: 'averageScore') required final double averageScore,
          @JsonKey(name: 'highestScore') required final double highestScore}) =
      _$PoseStatisticsImpl;

  factory _PoseStatistics.fromJson(Map<String, dynamic> json) =
      _$PoseStatisticsImpl.fromJson;

  @override
  @JsonKey(name: 'poseCode')
  String get poseCode;
  @override
  @JsonKey(name: 'poseName')
  String get poseName;
  @override
  @JsonKey(name: 'totalAttempts')
  int get totalAttempts;
  @override
  @JsonKey(name: 'averageScore')
  double get averageScore;
  @override
  @JsonKey(name: 'highestScore')
  double get highestScore;

  /// Create a copy of PoseStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoseStatisticsImplCopyWith<_$PoseStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
