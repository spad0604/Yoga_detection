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
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError; // Basic measurements
  @JsonKey(name: 'weightKg')
  double? get weightKg => throw _privateConstructorUsedError;
  @JsonKey(name: 'heightCm')
  double? get heightCm => throw _privateConstructorUsedError;
  double? get bmi => throw _privateConstructorUsedError; // Body composition
  @JsonKey(name: 'bodyFatPercentage')
  double? get bodyFatPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'muscleMassKg')
  double? get muscleMassKg => throw _privateConstructorUsedError;
  @JsonKey(name: 'bodyWaterPercentage')
  double? get bodyWaterPercentage =>
      throw _privateConstructorUsedError; // Body measurements (circumferences)
  @JsonKey(name: 'chestCm')
  double? get chestCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'waistCm')
  double? get waistCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'hipCm')
  double? get hipCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'armCm')
  double? get armCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'thighCm')
  double? get thighCm => throw _privateConstructorUsedError; // Additional info
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'photoUrl')
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'recordedAt')
  DateTime get recordedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
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
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'weightKg') double? weightKg,
      @JsonKey(name: 'heightCm') double? heightCm,
      double? bmi,
      @JsonKey(name: 'bodyFatPercentage') double? bodyFatPercentage,
      @JsonKey(name: 'muscleMassKg') double? muscleMassKg,
      @JsonKey(name: 'bodyWaterPercentage') double? bodyWaterPercentage,
      @JsonKey(name: 'chestCm') double? chestCm,
      @JsonKey(name: 'waistCm') double? waistCm,
      @JsonKey(name: 'hipCm') double? hipCm,
      @JsonKey(name: 'armCm') double? armCm,
      @JsonKey(name: 'thighCm') double? thighCm,
      String? notes,
      @JsonKey(name: 'photoUrl') String? photoUrl,
      @JsonKey(name: 'recordedAt') DateTime recordedAt,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
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
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'weightKg') double? weightKg,
      @JsonKey(name: 'heightCm') double? heightCm,
      double? bmi,
      @JsonKey(name: 'bodyFatPercentage') double? bodyFatPercentage,
      @JsonKey(name: 'muscleMassKg') double? muscleMassKg,
      @JsonKey(name: 'bodyWaterPercentage') double? bodyWaterPercentage,
      @JsonKey(name: 'chestCm') double? chestCm,
      @JsonKey(name: 'waistCm') double? waistCm,
      @JsonKey(name: 'hipCm') double? hipCm,
      @JsonKey(name: 'armCm') double? armCm,
      @JsonKey(name: 'thighCm') double? thighCm,
      String? notes,
      @JsonKey(name: 'photoUrl') String? photoUrl,
      @JsonKey(name: 'recordedAt') DateTime recordedAt,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
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
      @JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'weightKg') this.weightKg,
      @JsonKey(name: 'heightCm') this.heightCm,
      this.bmi,
      @JsonKey(name: 'bodyFatPercentage') this.bodyFatPercentage,
      @JsonKey(name: 'muscleMassKg') this.muscleMassKg,
      @JsonKey(name: 'bodyWaterPercentage') this.bodyWaterPercentage,
      @JsonKey(name: 'chestCm') this.chestCm,
      @JsonKey(name: 'waistCm') this.waistCm,
      @JsonKey(name: 'hipCm') this.hipCm,
      @JsonKey(name: 'armCm') this.armCm,
      @JsonKey(name: 'thighCm') this.thighCm,
      this.notes,
      @JsonKey(name: 'photoUrl') this.photoUrl,
      @JsonKey(name: 'recordedAt') required this.recordedAt,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt});

  factory _$BodyProgressResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyProgressResponseImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'userId')
  final String userId;
// Basic measurements
  @override
  @JsonKey(name: 'weightKg')
  final double? weightKg;
  @override
  @JsonKey(name: 'heightCm')
  final double? heightCm;
  @override
  final double? bmi;
// Body composition
  @override
  @JsonKey(name: 'bodyFatPercentage')
  final double? bodyFatPercentage;
  @override
  @JsonKey(name: 'muscleMassKg')
  final double? muscleMassKg;
  @override
  @JsonKey(name: 'bodyWaterPercentage')
  final double? bodyWaterPercentage;
// Body measurements (circumferences)
  @override
  @JsonKey(name: 'chestCm')
  final double? chestCm;
  @override
  @JsonKey(name: 'waistCm')
  final double? waistCm;
  @override
  @JsonKey(name: 'hipCm')
  final double? hipCm;
  @override
  @JsonKey(name: 'armCm')
  final double? armCm;
  @override
  @JsonKey(name: 'thighCm')
  final double? thighCm;
// Additional info
  @override
  final String? notes;
  @override
  @JsonKey(name: 'photoUrl')
  final String? photoUrl;
  @override
  @JsonKey(name: 'recordedAt')
  final DateTime recordedAt;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
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
      @JsonKey(name: 'userId') required final String userId,
      @JsonKey(name: 'weightKg') final double? weightKg,
      @JsonKey(name: 'heightCm') final double? heightCm,
      final double? bmi,
      @JsonKey(name: 'bodyFatPercentage') final double? bodyFatPercentage,
      @JsonKey(name: 'muscleMassKg') final double? muscleMassKg,
      @JsonKey(name: 'bodyWaterPercentage') final double? bodyWaterPercentage,
      @JsonKey(name: 'chestCm') final double? chestCm,
      @JsonKey(name: 'waistCm') final double? waistCm,
      @JsonKey(name: 'hipCm') final double? hipCm,
      @JsonKey(name: 'armCm') final double? armCm,
      @JsonKey(name: 'thighCm') final double? thighCm,
      final String? notes,
      @JsonKey(name: 'photoUrl') final String? photoUrl,
      @JsonKey(name: 'recordedAt') required final DateTime recordedAt,
      @JsonKey(name: 'createdAt') final DateTime? createdAt,
      @JsonKey(name: 'updatedAt')
      final DateTime? updatedAt}) = _$BodyProgressResponseImpl;

  factory _BodyProgressResponse.fromJson(Map<String, dynamic> json) =
      _$BodyProgressResponseImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'userId')
  String get userId; // Basic measurements
  @override
  @JsonKey(name: 'weightKg')
  double? get weightKg;
  @override
  @JsonKey(name: 'heightCm')
  double? get heightCm;
  @override
  double? get bmi; // Body composition
  @override
  @JsonKey(name: 'bodyFatPercentage')
  double? get bodyFatPercentage;
  @override
  @JsonKey(name: 'muscleMassKg')
  double? get muscleMassKg;
  @override
  @JsonKey(name: 'bodyWaterPercentage')
  double? get bodyWaterPercentage; // Body measurements (circumferences)
  @override
  @JsonKey(name: 'chestCm')
  double? get chestCm;
  @override
  @JsonKey(name: 'waistCm')
  double? get waistCm;
  @override
  @JsonKey(name: 'hipCm')
  double? get hipCm;
  @override
  @JsonKey(name: 'armCm')
  double? get armCm;
  @override
  @JsonKey(name: 'thighCm')
  double? get thighCm; // Additional info
  @override
  String? get notes;
  @override
  @JsonKey(name: 'photoUrl')
  String? get photoUrl;
  @override
  @JsonKey(name: 'recordedAt')
  DateTime get recordedAt;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;

  /// Create a copy of BodyProgressResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BodyProgressResponseImplCopyWith<_$BodyProgressResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
