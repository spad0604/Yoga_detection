// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_yoga_pose_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserYogaPoseModel _$UserYogaPoseModelFromJson(Map<String, dynamic> json) {
  return _UserYogaPoseModel.fromJson(json);
}

/// @nodoc
mixin _$UserYogaPoseModel {
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "poseCode")
  String get poseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "imageUrl")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "score")
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: "feedback")
  String? get feedback => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createAt => throw _privateConstructorUsedError;

  /// Serializes this UserYogaPoseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserYogaPoseModelCopyWith<UserYogaPoseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserYogaPoseModelCopyWith<$Res> {
  factory $UserYogaPoseModelCopyWith(
          UserYogaPoseModel value, $Res Function(UserYogaPoseModel) then) =
      _$UserYogaPoseModelCopyWithImpl<$Res, UserYogaPoseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "poseCode") String poseCode,
      @JsonKey(name: "imageUrl") String? imageUrl,
      @JsonKey(name: "score") double? score,
      @JsonKey(name: "feedback") String? feedback,
      @JsonKey(name: "createdAt") DateTime createAt});
}

/// @nodoc
class _$UserYogaPoseModelCopyWithImpl<$Res, $Val extends UserYogaPoseModel>
    implements $UserYogaPoseModelCopyWith<$Res> {
  _$UserYogaPoseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poseCode = null,
    Object? imageUrl = freezed,
    Object? score = freezed,
    Object? feedback = freezed,
    Object? createAt = null,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserYogaPoseModelImplCopyWith<$Res>
    implements $UserYogaPoseModelCopyWith<$Res> {
  factory _$$UserYogaPoseModelImplCopyWith(_$UserYogaPoseModelImpl value,
          $Res Function(_$UserYogaPoseModelImpl) then) =
      __$$UserYogaPoseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "poseCode") String poseCode,
      @JsonKey(name: "imageUrl") String? imageUrl,
      @JsonKey(name: "score") double? score,
      @JsonKey(name: "feedback") String? feedback,
      @JsonKey(name: "createdAt") DateTime createAt});
}

/// @nodoc
class __$$UserYogaPoseModelImplCopyWithImpl<$Res>
    extends _$UserYogaPoseModelCopyWithImpl<$Res, _$UserYogaPoseModelImpl>
    implements _$$UserYogaPoseModelImplCopyWith<$Res> {
  __$$UserYogaPoseModelImplCopyWithImpl(_$UserYogaPoseModelImpl _value,
      $Res Function(_$UserYogaPoseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poseCode = null,
    Object? imageUrl = freezed,
    Object? score = freezed,
    Object? feedback = freezed,
    Object? createAt = null,
  }) {
    return _then(_$UserYogaPoseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poseCode: null == poseCode
          ? _value.poseCode
          : poseCode // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserYogaPoseModelImpl implements _UserYogaPoseModel {
  const _$UserYogaPoseModelImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "poseCode") required this.poseCode,
      @JsonKey(name: "imageUrl") this.imageUrl,
      @JsonKey(name: "score") this.score,
      @JsonKey(name: "feedback") this.feedback,
      @JsonKey(name: "createdAt") required this.createAt});

  factory _$UserYogaPoseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserYogaPoseModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String id;
  @override
  @JsonKey(name: "poseCode")
  final String poseCode;
  @override
  @JsonKey(name: "imageUrl")
  final String? imageUrl;
  @override
  @JsonKey(name: "score")
  final double? score;
  @override
  @JsonKey(name: "feedback")
  final String? feedback;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createAt;

  @override
  String toString() {
    return 'UserYogaPoseModel(id: $id, poseCode: $poseCode, imageUrl: $imageUrl, score: $score, feedback: $feedback, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserYogaPoseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poseCode, poseCode) ||
                other.poseCode == poseCode) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, poseCode, imageUrl, score, feedback, createAt);

  /// Create a copy of UserYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserYogaPoseModelImplCopyWith<_$UserYogaPoseModelImpl> get copyWith =>
      __$$UserYogaPoseModelImplCopyWithImpl<_$UserYogaPoseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserYogaPoseModelImplToJson(
      this,
    );
  }
}

abstract class _UserYogaPoseModel implements UserYogaPoseModel {
  const factory _UserYogaPoseModel(
          {@JsonKey(name: "id") required final String id,
          @JsonKey(name: "poseCode") required final String poseCode,
          @JsonKey(name: "imageUrl") final String? imageUrl,
          @JsonKey(name: "score") final double? score,
          @JsonKey(name: "feedback") final String? feedback,
          @JsonKey(name: "createdAt") required final DateTime createAt}) =
      _$UserYogaPoseModelImpl;

  factory _UserYogaPoseModel.fromJson(Map<String, dynamic> json) =
      _$UserYogaPoseModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String get id;
  @override
  @JsonKey(name: "poseCode")
  String get poseCode;
  @override
  @JsonKey(name: "imageUrl")
  String? get imageUrl;
  @override
  @JsonKey(name: "score")
  double? get score;
  @override
  @JsonKey(name: "feedback")
  String? get feedback;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createAt;

  /// Create a copy of UserYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserYogaPoseModelImplCopyWith<_$UserYogaPoseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
