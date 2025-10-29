// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_yoga_pose_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoseLandmarkData _$PoseLandmarkDataFromJson(Map<String, dynamic> json) {
  return _PoseLandmarkData.fromJson(json);
}

/// @nodoc
mixin _$PoseLandmarkData {
  String get type => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get z => throw _privateConstructorUsedError;

  /// Serializes this PoseLandmarkData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoseLandmarkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoseLandmarkDataCopyWith<PoseLandmarkData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoseLandmarkDataCopyWith<$Res> {
  factory $PoseLandmarkDataCopyWith(
          PoseLandmarkData value, $Res Function(PoseLandmarkData) then) =
      _$PoseLandmarkDataCopyWithImpl<$Res, PoseLandmarkData>;
  @useResult
  $Res call({String type, double x, double y, double z});
}

/// @nodoc
class _$PoseLandmarkDataCopyWithImpl<$Res, $Val extends PoseLandmarkData>
    implements $PoseLandmarkDataCopyWith<$Res> {
  _$PoseLandmarkDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoseLandmarkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? x = null,
    Object? y = null,
    Object? z = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoseLandmarkDataImplCopyWith<$Res>
    implements $PoseLandmarkDataCopyWith<$Res> {
  factory _$$PoseLandmarkDataImplCopyWith(_$PoseLandmarkDataImpl value,
          $Res Function(_$PoseLandmarkDataImpl) then) =
      __$$PoseLandmarkDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, double x, double y, double z});
}

/// @nodoc
class __$$PoseLandmarkDataImplCopyWithImpl<$Res>
    extends _$PoseLandmarkDataCopyWithImpl<$Res, _$PoseLandmarkDataImpl>
    implements _$$PoseLandmarkDataImplCopyWith<$Res> {
  __$$PoseLandmarkDataImplCopyWithImpl(_$PoseLandmarkDataImpl _value,
      $Res Function(_$PoseLandmarkDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoseLandmarkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? x = null,
    Object? y = null,
    Object? z = null,
  }) {
    return _then(_$PoseLandmarkDataImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoseLandmarkDataImpl implements _PoseLandmarkData {
  const _$PoseLandmarkDataImpl(
      {required this.type, required this.x, required this.y, required this.z});

  factory _$PoseLandmarkDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoseLandmarkDataImplFromJson(json);

  @override
  final String type;
  @override
  final double x;
  @override
  final double y;
  @override
  final double z;

  @override
  String toString() {
    return 'PoseLandmarkData(type: $type, x: $x, y: $y, z: $z)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoseLandmarkDataImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.z, z) || other.z == z));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, x, y, z);

  /// Create a copy of PoseLandmarkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoseLandmarkDataImplCopyWith<_$PoseLandmarkDataImpl> get copyWith =>
      __$$PoseLandmarkDataImplCopyWithImpl<_$PoseLandmarkDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoseLandmarkDataImplToJson(
      this,
    );
  }
}

abstract class _PoseLandmarkData implements PoseLandmarkData {
  const factory _PoseLandmarkData(
      {required final String type,
      required final double x,
      required final double y,
      required final double z}) = _$PoseLandmarkDataImpl;

  factory _PoseLandmarkData.fromJson(Map<String, dynamic> json) =
      _$PoseLandmarkDataImpl.fromJson;

  @override
  String get type;
  @override
  double get x;
  @override
  double get y;
  @override
  double get z;

  /// Create a copy of PoseLandmarkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoseLandmarkDataImplCopyWith<_$PoseLandmarkDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostYogaPoseModel _$PostYogaPoseModelFromJson(Map<String, dynamic> json) {
  return _PostYogaPoseModel.fromJson(json);
}

/// @nodoc
mixin _$PostYogaPoseModel {
  @JsonKey(name: "poseId")
  String get poseId => throw _privateConstructorUsedError;
  @JsonKey(name: "landmarks")
  List<PoseLandmarkData> get landmarks => throw _privateConstructorUsedError;
  @JsonKey(name: "imageBase64")
  String? get imageBase64 => throw _privateConstructorUsedError;
  @JsonKey(name: "timestamp")
  String get timestamp => throw _privateConstructorUsedError;

  /// Serializes this PostYogaPoseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostYogaPoseModelCopyWith<PostYogaPoseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostYogaPoseModelCopyWith<$Res> {
  factory $PostYogaPoseModelCopyWith(
          PostYogaPoseModel value, $Res Function(PostYogaPoseModel) then) =
      _$PostYogaPoseModelCopyWithImpl<$Res, PostYogaPoseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "poseId") String poseId,
      @JsonKey(name: "landmarks") List<PoseLandmarkData> landmarks,
      @JsonKey(name: "imageBase64") String? imageBase64,
      @JsonKey(name: "timestamp") String timestamp});
}

/// @nodoc
class _$PostYogaPoseModelCopyWithImpl<$Res, $Val extends PostYogaPoseModel>
    implements $PostYogaPoseModelCopyWith<$Res> {
  _$PostYogaPoseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseId = null,
    Object? landmarks = null,
    Object? imageBase64 = freezed,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      poseId: null == poseId
          ? _value.poseId
          : poseId // ignore: cast_nullable_to_non_nullable
              as String,
      landmarks: null == landmarks
          ? _value.landmarks
          : landmarks // ignore: cast_nullable_to_non_nullable
              as List<PoseLandmarkData>,
      imageBase64: freezed == imageBase64
          ? _value.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostYogaPoseModelImplCopyWith<$Res>
    implements $PostYogaPoseModelCopyWith<$Res> {
  factory _$$PostYogaPoseModelImplCopyWith(_$PostYogaPoseModelImpl value,
          $Res Function(_$PostYogaPoseModelImpl) then) =
      __$$PostYogaPoseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "poseId") String poseId,
      @JsonKey(name: "landmarks") List<PoseLandmarkData> landmarks,
      @JsonKey(name: "imageBase64") String? imageBase64,
      @JsonKey(name: "timestamp") String timestamp});
}

/// @nodoc
class __$$PostYogaPoseModelImplCopyWithImpl<$Res>
    extends _$PostYogaPoseModelCopyWithImpl<$Res, _$PostYogaPoseModelImpl>
    implements _$$PostYogaPoseModelImplCopyWith<$Res> {
  __$$PostYogaPoseModelImplCopyWithImpl(_$PostYogaPoseModelImpl _value,
      $Res Function(_$PostYogaPoseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseId = null,
    Object? landmarks = null,
    Object? imageBase64 = freezed,
    Object? timestamp = null,
  }) {
    return _then(_$PostYogaPoseModelImpl(
      poseId: null == poseId
          ? _value.poseId
          : poseId // ignore: cast_nullable_to_non_nullable
              as String,
      landmarks: null == landmarks
          ? _value._landmarks
          : landmarks // ignore: cast_nullable_to_non_nullable
              as List<PoseLandmarkData>,
      imageBase64: freezed == imageBase64
          ? _value.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostYogaPoseModelImpl implements _PostYogaPoseModel {
  const _$PostYogaPoseModelImpl(
      {@JsonKey(name: "poseId") required this.poseId,
      @JsonKey(name: "landmarks")
      required final List<PoseLandmarkData> landmarks,
      @JsonKey(name: "imageBase64") this.imageBase64,
      @JsonKey(name: "timestamp") required this.timestamp})
      : _landmarks = landmarks;

  factory _$PostYogaPoseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostYogaPoseModelImplFromJson(json);

  @override
  @JsonKey(name: "poseId")
  final String poseId;
  final List<PoseLandmarkData> _landmarks;
  @override
  @JsonKey(name: "landmarks")
  List<PoseLandmarkData> get landmarks {
    if (_landmarks is EqualUnmodifiableListView) return _landmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_landmarks);
  }

  @override
  @JsonKey(name: "imageBase64")
  final String? imageBase64;
  @override
  @JsonKey(name: "timestamp")
  final String timestamp;

  @override
  String toString() {
    return 'PostYogaPoseModel(poseId: $poseId, landmarks: $landmarks, imageBase64: $imageBase64, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostYogaPoseModelImpl &&
            (identical(other.poseId, poseId) || other.poseId == poseId) &&
            const DeepCollectionEquality()
                .equals(other._landmarks, _landmarks) &&
            (identical(other.imageBase64, imageBase64) ||
                other.imageBase64 == imageBase64) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poseId,
      const DeepCollectionEquality().hash(_landmarks), imageBase64, timestamp);

  /// Create a copy of PostYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostYogaPoseModelImplCopyWith<_$PostYogaPoseModelImpl> get copyWith =>
      __$$PostYogaPoseModelImplCopyWithImpl<_$PostYogaPoseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostYogaPoseModelImplToJson(
      this,
    );
  }
}

abstract class _PostYogaPoseModel implements PostYogaPoseModel {
  const factory _PostYogaPoseModel(
          {@JsonKey(name: "poseId") required final String poseId,
          @JsonKey(name: "landmarks")
          required final List<PoseLandmarkData> landmarks,
          @JsonKey(name: "imageBase64") final String? imageBase64,
          @JsonKey(name: "timestamp") required final String timestamp}) =
      _$PostYogaPoseModelImpl;

  factory _PostYogaPoseModel.fromJson(Map<String, dynamic> json) =
      _$PostYogaPoseModelImpl.fromJson;

  @override
  @JsonKey(name: "poseId")
  String get poseId;
  @override
  @JsonKey(name: "landmarks")
  List<PoseLandmarkData> get landmarks;
  @override
  @JsonKey(name: "imageBase64")
  String? get imageBase64;
  @override
  @JsonKey(name: "timestamp")
  String get timestamp;

  /// Create a copy of PostYogaPoseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostYogaPoseModelImplCopyWith<_$PostYogaPoseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
