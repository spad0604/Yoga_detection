// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pose_history_attempts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoseHistoryAttempts _$PoseHistoryAttemptsFromJson(Map<String, dynamic> json) {
  return _PoseHistoryAttempts.fromJson(json);
}

/// @nodoc
mixin _$PoseHistoryAttempts {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PoseHistoryAttempts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoseHistoryAttempts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoseHistoryAttemptsCopyWith<PoseHistoryAttempts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoseHistoryAttemptsCopyWith<$Res> {
  factory $PoseHistoryAttemptsCopyWith(
          PoseHistoryAttempts value, $Res Function(PoseHistoryAttempts) then) =
      _$PoseHistoryAttemptsCopyWithImpl<$Res, PoseHistoryAttempts>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'poseCode') String poseCode,
      @JsonKey(name: 'poseName') String poseName,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'score') double score,
      @JsonKey(name: 'feedback') String? feedback,
      @JsonKey(name: 'createdAt') DateTime createdAt});
}

/// @nodoc
class _$PoseHistoryAttemptsCopyWithImpl<$Res, $Val extends PoseHistoryAttempts>
    implements $PoseHistoryAttemptsCopyWith<$Res> {
  _$PoseHistoryAttemptsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoseHistoryAttempts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poseCode = null,
    Object? poseName = null,
    Object? imageUrl = freezed,
    Object? score = null,
    Object? feedback = freezed,
    Object? createdAt = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoseHistoryAttemptsImplCopyWith<$Res>
    implements $PoseHistoryAttemptsCopyWith<$Res> {
  factory _$$PoseHistoryAttemptsImplCopyWith(_$PoseHistoryAttemptsImpl value,
          $Res Function(_$PoseHistoryAttemptsImpl) then) =
      __$$PoseHistoryAttemptsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'poseCode') String poseCode,
      @JsonKey(name: 'poseName') String poseName,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'score') double score,
      @JsonKey(name: 'feedback') String? feedback,
      @JsonKey(name: 'createdAt') DateTime createdAt});
}

/// @nodoc
class __$$PoseHistoryAttemptsImplCopyWithImpl<$Res>
    extends _$PoseHistoryAttemptsCopyWithImpl<$Res, _$PoseHistoryAttemptsImpl>
    implements _$$PoseHistoryAttemptsImplCopyWith<$Res> {
  __$$PoseHistoryAttemptsImplCopyWithImpl(_$PoseHistoryAttemptsImpl _value,
      $Res Function(_$PoseHistoryAttemptsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoseHistoryAttempts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poseCode = null,
    Object? poseName = null,
    Object? imageUrl = freezed,
    Object? score = null,
    Object? feedback = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$PoseHistoryAttemptsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoseHistoryAttemptsImpl implements _PoseHistoryAttempts {
  const _$PoseHistoryAttemptsImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'poseCode') required this.poseCode,
      @JsonKey(name: 'poseName') required this.poseName,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'score') required this.score,
      @JsonKey(name: 'feedback') this.feedback,
      @JsonKey(name: 'createdAt') required this.createdAt});

  factory _$PoseHistoryAttemptsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoseHistoryAttemptsImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
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
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  @override
  String toString() {
    return 'PoseHistoryAttempts(id: $id, poseCode: $poseCode, poseName: $poseName, imageUrl: $imageUrl, score: $score, feedback: $feedback, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoseHistoryAttemptsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poseCode, poseCode) ||
                other.poseCode == poseCode) &&
            (identical(other.poseName, poseName) ||
                other.poseName == poseName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, poseCode, poseName, imageUrl,
      score, feedback, createdAt);

  /// Create a copy of PoseHistoryAttempts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoseHistoryAttemptsImplCopyWith<_$PoseHistoryAttemptsImpl> get copyWith =>
      __$$PoseHistoryAttemptsImplCopyWithImpl<_$PoseHistoryAttemptsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoseHistoryAttemptsImplToJson(
      this,
    );
  }
}

abstract class _PoseHistoryAttempts implements PoseHistoryAttempts {
  const factory _PoseHistoryAttempts(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'poseCode') required final String poseCode,
          @JsonKey(name: 'poseName') required final String poseName,
          @JsonKey(name: 'imageUrl') final String? imageUrl,
          @JsonKey(name: 'score') required final double score,
          @JsonKey(name: 'feedback') final String? feedback,
          @JsonKey(name: 'createdAt') required final DateTime createdAt}) =
      _$PoseHistoryAttemptsImpl;

  factory _PoseHistoryAttempts.fromJson(Map<String, dynamic> json) =
      _$PoseHistoryAttemptsImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
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
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;

  /// Create a copy of PoseHistoryAttempts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoseHistoryAttemptsImplCopyWith<_$PoseHistoryAttemptsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
