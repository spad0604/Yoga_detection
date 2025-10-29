// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_body_progress_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateBodyProgressRequest _$UpdateBodyProgressRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateBodyProgressRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateBodyProgressRequest {
// Basic measurements
  double? get weightKg => throw _privateConstructorUsedError;
  double? get heightCm =>
      throw _privateConstructorUsedError; // Body composition
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
  DateTime? get recordedAt => throw _privateConstructorUsedError;

  /// Serializes this UpdateBodyProgressRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateBodyProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateBodyProgressRequestCopyWith<UpdateBodyProgressRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateBodyProgressRequestCopyWith<$Res> {
  factory $UpdateBodyProgressRequestCopyWith(UpdateBodyProgressRequest value,
          $Res Function(UpdateBodyProgressRequest) then) =
      _$UpdateBodyProgressRequestCopyWithImpl<$Res, UpdateBodyProgressRequest>;
  @useResult
  $Res call(
      {double? weightKg,
      double? heightCm,
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
      DateTime? recordedAt});
}

/// @nodoc
class _$UpdateBodyProgressRequestCopyWithImpl<$Res,
        $Val extends UpdateBodyProgressRequest>
    implements $UpdateBodyProgressRequestCopyWith<$Res> {
  _$UpdateBodyProgressRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateBodyProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weightKg = freezed,
    Object? heightCm = freezed,
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
    Object? recordedAt = freezed,
  }) {
    return _then(_value.copyWith(
      weightKg: freezed == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      heightCm: freezed == heightCm
          ? _value.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
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
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateBodyProgressRequestImplCopyWith<$Res>
    implements $UpdateBodyProgressRequestCopyWith<$Res> {
  factory _$$UpdateBodyProgressRequestImplCopyWith(
          _$UpdateBodyProgressRequestImpl value,
          $Res Function(_$UpdateBodyProgressRequestImpl) then) =
      __$$UpdateBodyProgressRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? weightKg,
      double? heightCm,
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
      DateTime? recordedAt});
}

/// @nodoc
class __$$UpdateBodyProgressRequestImplCopyWithImpl<$Res>
    extends _$UpdateBodyProgressRequestCopyWithImpl<$Res,
        _$UpdateBodyProgressRequestImpl>
    implements _$$UpdateBodyProgressRequestImplCopyWith<$Res> {
  __$$UpdateBodyProgressRequestImplCopyWithImpl(
      _$UpdateBodyProgressRequestImpl _value,
      $Res Function(_$UpdateBodyProgressRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateBodyProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weightKg = freezed,
    Object? heightCm = freezed,
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
    Object? recordedAt = freezed,
  }) {
    return _then(_$UpdateBodyProgressRequestImpl(
      weightKg: freezed == weightKg
          ? _value.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      heightCm: freezed == heightCm
          ? _value.heightCm
          : heightCm // ignore: cast_nullable_to_non_nullable
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
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateBodyProgressRequestImpl implements _UpdateBodyProgressRequest {
  const _$UpdateBodyProgressRequestImpl(
      {this.weightKg,
      this.heightCm,
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
      this.recordedAt});

  factory _$UpdateBodyProgressRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateBodyProgressRequestImplFromJson(json);

// Basic measurements
  @override
  final double? weightKg;
  @override
  final double? heightCm;
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
  final DateTime? recordedAt;

  @override
  String toString() {
    return 'UpdateBodyProgressRequest(weightKg: $weightKg, heightCm: $heightCm, bodyFatPercentage: $bodyFatPercentage, muscleMassKg: $muscleMassKg, bodyWaterPercentage: $bodyWaterPercentage, chestCm: $chestCm, waistCm: $waistCm, hipCm: $hipCm, armCm: $armCm, thighCm: $thighCm, notes: $notes, photoUrl: $photoUrl, recordedAt: $recordedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBodyProgressRequestImpl &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
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
                other.recordedAt == recordedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      weightKg,
      heightCm,
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
      recordedAt);

  /// Create a copy of UpdateBodyProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBodyProgressRequestImplCopyWith<_$UpdateBodyProgressRequestImpl>
      get copyWith => __$$UpdateBodyProgressRequestImplCopyWithImpl<
          _$UpdateBodyProgressRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateBodyProgressRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateBodyProgressRequest implements UpdateBodyProgressRequest {
  const factory _UpdateBodyProgressRequest(
      {final double? weightKg,
      final double? heightCm,
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
      final DateTime? recordedAt}) = _$UpdateBodyProgressRequestImpl;

  factory _UpdateBodyProgressRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateBodyProgressRequestImpl.fromJson;

// Basic measurements
  @override
  double? get weightKg;
  @override
  double? get heightCm; // Body composition
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
  DateTime? get recordedAt;

  /// Create a copy of UpdateBodyProgressRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateBodyProgressRequestImplCopyWith<_$UpdateBodyProgressRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
