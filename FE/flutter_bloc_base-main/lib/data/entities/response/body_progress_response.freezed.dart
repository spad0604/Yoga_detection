// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'body_progress_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BodyProgressResponse _$BodyProgressResponseFromJson(Map<String, dynamic> json) {
  return _BodyProgressResponse.fromJson(json);
}

/// @nodoc
mixin _$BodyProgressResponse {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError; // Basic measurements
  double? get weightKg => throw _privateConstructorUsedError;
  double? get heightCm => throw _privateConstructorUsedError;
  double? get bmi => throw _privateConstructorUsedError; // Body composition
  double? get bodyFatPercentage => throw _privateConstructorUsedError;
  double? get muscleMassKg => throw _privateConstructorUsedError;
  double? get bodyWaterPercentage =>
      throw _privateConstructorUsedError; // Body measurements (circumferences)
  double? get chestCm => throw _privateConstructorUsedError;
  double? get waistCm => throw _privateConstructorUsedError;
  double? get hipCm => throw _privateConstructorUsedError;
  double? get armCm => throw _privateConstructorUsedError;
  double? get thighCm => throw _privateConstructorUsedError; // Additional info
  String? get notes => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  DateTime get recordedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BodyProgressResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BodyProgressResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BodyProgressResponseCopyWith<BodyProgressResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyProgressResponseCopyWith<$Res> {
  factory $BodyProgressResponseCopyWith(BodyProgressResponse value,
          $Res Function(BodyProgressResponse) then) =
      _$BodyProgressResponseCopyWithImpl<$Res, BodyProgressResponse>;
  @useResult
  $Res call(
      {String id,
      String userId,
      double? weightKg,
      double? heightCm,
      double? bmi,
      double? bodyFatPercentage,
      double? muscleMassKg,
      double? bodyWaterPercentage,
      double? chestCm,
      double? waistCm,
      double? hipCm,
      double? armCm,
      double? thighCm,
      String? notes,
      String? photoUrl,
      DateTime recordedAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$BodyProgressResponseCopyWithImpl<$Res,
        $Val extends BodyProgressResponse>
    implements $BodyProgressResponseCopyWith<$Res> {
  _$BodyProgressResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BodyProgressResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? weightKg = freezed,
    Object? heightCm = freezed,
    Object? bmi = freezed,
    Object? bodyFatPercentage = freezed,
    Object? muscleMassKg = freezed,
    Object? bodyWaterPercentage = freezed,
    Object? chestCm = freezed,
    Object? waistCm = freezed,
    Object? hipCm = freezed,
    Object? armCm = freezed,
    Object? thighCm = freezed,
    Object? notes = freezed,
    Object? photoUrl = freezed,
    Object? recordedAt = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      weightKg: freezed == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      heightCm: freezed == heightCm
          ? _value.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double?,
      bmi: freezed == bmi
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as double?,
      bodyFatPercentage: freezed == bodyFatPercentage
          ? _value.bodyFatPercentage
          : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      muscleMassKg: freezed == muscleMassKg
          ? _value.muscleMassKg
          : muscleMassKg // ignore: cast_nullable_to_non_nullable
              as double?,
      bodyWaterPercentage: freezed == bodyWaterPercentage
          ? _value.bodyWaterPercentage
          : bodyWaterPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      chestCm: freezed == chestCm
          ? _value.chestCm
          : chestCm // ignore: cast_nullable_to_non_nullable
              as double?,
      waistCm: freezed == waistCm
          ? _value.waistCm
          : waistCm // ignore: cast_nullable_to_non_nullable
              as double?,
      hipCm: freezed == hipCm
          ? _value.hipCm
          : hipCm // ignore: cast_nullable_to_non_nullable
              as double?,
      armCm: freezed == armCm
          ? _value.armCm
          : armCm // ignore: cast_nullable_to_non_nullable
              as double?,
      thighCm: freezed == thighCm
          ? _value.thighCm
          : thighCm // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
}

/// @nodoc
abstract class _$$BodyProgressResponseImplCopyWith<$Res>
    implements $BodyProgressResponseCopyWith<$Res> {
  factory _$$BodyProgressResponseImplCopyWith(_$BodyProgressResponseImpl value,
          $Res Function(_$BodyProgressResponseImpl) then) =
      __$$BodyProgressResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      double? weightKg,
      double? heightCm,
      double? bmi,
      double? bodyFatPercentage,
      double? muscleMassKg,
      double? bodyWaterPercentage,
      double? chestCm,
      double? waistCm,
      double? hipCm,
      double? armCm,
      double? thighCm,
      String? notes,
      String? photoUrl,
      DateTime recordedAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$BodyProgressResponseImplCopyWithImpl<$Res>
    extends _$BodyProgressResponseCopyWithImpl<$Res, _$BodyProgressResponseImpl>
    implements _$$BodyProgressResponseImplCopyWith<$Res> {
  __$$BodyProgressResponseImplCopyWithImpl(_$BodyProgressResponseImpl _value,
      $Res Function(_$BodyProgressResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BodyProgressResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? weightKg = freezed,
    Object? heightCm = freezed,
    Object? bmi = freezed,
    Object? bodyFatPercentage = freezed,
    Object? muscleMassKg = freezed,
    Object? bodyWaterPercentage = freezed,
    Object? chestCm = freezed,
    Object? waistCm = freezed,
    Object? hipCm = freezed,
    Object? armCm = freezed,
    Object? thighCm = freezed,
    Object? notes = freezed,
    Object? photoUrl = freezed,
    Object? recordedAt = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BodyProgressResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      weightKg: freezed == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      heightCm: freezed == heightCm
          ? _value.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
              as double?,
      bmi: freezed == bmi
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as double?,
      bodyFatPercentage: freezed == bodyFatPercentage
          ? _value.bodyFatPercentage
          : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      muscleMassKg: freezed == muscleMassKg
          ? _value.muscleMassKg
          : muscleMassKg // ignore: cast_nullable_to_non_nullable
              as double?,
      bodyWaterPercentage: freezed == bodyWaterPercentage
          ? _value.bodyWaterPercentage
          : bodyWaterPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      chestCm: freezed == chestCm
          ? _value.chestCm
          : chestCm // ignore: cast_nullable_to_non_nullable
              as double?,
      waistCm: freezed == waistCm
          ? _value.waistCm
          : waistCm // ignore: cast_nullable_to_non_nullable
              as double?,
      hipCm: freezed == hipCm
          ? _value.hipCm
          : hipCm // ignore: cast_nullable_to_non_nullable
              as double?,
      armCm: freezed == armCm
          ? _value.armCm
          : armCm // ignore: cast_nullable_to_non_nullable
              as double?,
      thighCm: freezed == thighCm
          ? _value.thighCm
          : thighCm // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
class _$BodyProgressResponseImpl implements _BodyProgressResponse {
  const _$BodyProgressResponseImpl(
      {required this.id,
      required this.userId,
      this.weightKg,
      this.heightCm,
      this.bmi,
      this.bodyFatPercentage,
      this.muscleMassKg,
      this.bodyWaterPercentage,
      this.chestCm,
      this.waistCm,
      this.hipCm,
      this.armCm,
      this.thighCm,
      this.notes,
      this.photoUrl,
      required this.recordedAt,
      this.createdAt,
      this.updatedAt});

  factory _$BodyProgressResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyProgressResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
// Basic measurements
  @override
  final double? weightKg;
  @override
  final double? heightCm;
  @override
  final double? bmi;
// Body composition
  @override
  final double? bodyFatPercentage;
  @override
  final double? muscleMassKg;
  @override
  final double? bodyWaterPercentage;
// Body measurements (circumferences)
  @override
  final double? chestCm;
  @override
  final double? waistCm;
  @override
  final double? hipCm;
  @override
  final double? armCm;
  @override
  final double? thighCm;
// Additional info
  @override
  final String? notes;
  @override
  final String? photoUrl;
  @override
  final DateTime recordedAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BodyProgressResponse(id: $id, userId: $userId, weightKg: $weightKg, heightCm: $heightCm, bmi: $bmi, bodyFatPercentage: $bodyFatPercentage, muscleMassKg: $muscleMassKg, bodyWaterPercentage: $bodyWaterPercentage, chestCm: $chestCm, waistCm: $waistCm, hipCm: $hipCm, armCm: $armCm, thighCm: $thighCm, notes: $notes, photoUrl: $photoUrl, recordedAt: $recordedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyProgressResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.bmi, bmi) || other.bmi == bmi) &&
            (identical(other.bodyFatPercentage, bodyFatPercentage) ||
                other.bodyFatPercentage == bodyFatPercentage) &&
            (identical(other.muscleMassKg, muscleMassKg) ||
                other.muscleMassKg == muscleMassKg) &&
            (identical(other.bodyWaterPercentage, bodyWaterPercentage) ||
                other.bodyWaterPercentage == bodyWaterPercentage) &&
            (identical(other.chestCm, chestCm) || other.chestCm == chestCm) &&
            (identical(other.waistCm, waistCm) || other.waistCm == waistCm) &&
            (identical(other.hipCm, hipCm) || other.hipCm == hipCm) &&
            (identical(other.armCm, armCm) || other.armCm == armCm) &&
            (identical(other.thighCm, thighCm) || other.thighCm == thighCm) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
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
      userId,
      weightKg,
      heightCm,
      bmi,
      bodyFatPercentage,
      muscleMassKg,
      bodyWaterPercentage,
      chestCm,
      waistCm,
      hipCm,
      armCm,
      thighCm,
      notes,
      photoUrl,
      recordedAt,
      createdAt,
      updatedAt);

  /// Create a copy of BodyProgressResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyProgressResponseImplCopyWith<_$BodyProgressResponseImpl>
      get copyWith =>
          __$$BodyProgressResponseImplCopyWithImpl<_$BodyProgressResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyProgressResponseImplToJson(
      this,
    );
  }
}

abstract class _BodyProgressResponse implements BodyProgressResponse {
  const factory _BodyProgressResponse(
      {required final String id,
      required final String userId,
      final double? weightKg,
      final double? heightCm,
      final double? bmi,
      final double? bodyFatPercentage,
      final double? muscleMassKg,
      final double? bodyWaterPercentage,
      final double? chestCm,
      final double? waistCm,
      final double? hipCm,
      final double? armCm,
      final double? thighCm,
      final String? notes,
      final String? photoUrl,
      required final DateTime recordedAt,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$BodyProgressResponseImpl;

  factory _BodyProgressResponse.fromJson(Map<String, dynamic> json) =
      _$BodyProgressResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get userId; // Basic measurements
  @override
  double? get weightKg;
  @override
  double? get heightCm;
  @override
  double? get bmi; // Body composition
  @override
  double? get bodyFatPercentage;
  @override
  double? get muscleMassKg;
  @override
  double? get bodyWaterPercentage; // Body measurements (circumferences)
  @override
  double? get chestCm;
  @override
  double? get waistCm;
  @override
  double? get hipCm;
  @override
  double? get armCm;
  @override
  double? get thighCm; // Additional info
  @override
  String? get notes;
  @override
  String? get photoUrl;
  @override
  DateTime get recordedAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of BodyProgressResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BodyProgressResponseImplCopyWith<_$BodyProgressResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
