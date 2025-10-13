// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_pose_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YogaPoseDetails _$YogaPoseDetailsFromJson(Map<String, dynamic> json) {
  return _YogaPoseDetails.fromJson(json);
}

/// @nodoc
mixin _$YogaPoseDetails {
  @JsonKey(readValue: _readId)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'minutes')
  int? get totalMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'calos')
  int? get totalCalories => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  String? get level => throw _privateConstructorUsedError;

  /// Serializes this YogaPoseDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YogaPoseDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YogaPoseDetailsCopyWith<YogaPoseDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YogaPoseDetailsCopyWith<$Res> {
  factory $YogaPoseDetailsCopyWith(
          YogaPoseDetails value, $Res Function(YogaPoseDetails) then) =
      _$YogaPoseDetailsCopyWithImpl<$Res, YogaPoseDetails>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _readId) String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'minutes') int? totalMinutes,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'calos') int? totalCalories,
      @JsonKey(name: 'level') String? level});
}

/// @nodoc
class _$YogaPoseDetailsCopyWithImpl<$Res, $Val extends YogaPoseDetails>
    implements $YogaPoseDetailsCopyWith<$Res> {
  _$YogaPoseDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YogaPoseDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? totalMinutes = freezed,
    Object? imageUrl = freezed,
    Object? totalCalories = freezed,
    Object? level = freezed,
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
      totalMinutes: freezed == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCalories: freezed == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YogaPoseDetailsImplCopyWith<$Res>
    implements $YogaPoseDetailsCopyWith<$Res> {
  factory _$$YogaPoseDetailsImplCopyWith(_$YogaPoseDetailsImpl value,
          $Res Function(_$YogaPoseDetailsImpl) then) =
      __$$YogaPoseDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _readId) String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'minutes') int? totalMinutes,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'calos') int? totalCalories,
      @JsonKey(name: 'level') String? level});
}

/// @nodoc
class __$$YogaPoseDetailsImplCopyWithImpl<$Res>
    extends _$YogaPoseDetailsCopyWithImpl<$Res, _$YogaPoseDetailsImpl>
    implements _$$YogaPoseDetailsImplCopyWith<$Res> {
  __$$YogaPoseDetailsImplCopyWithImpl(
      _$YogaPoseDetailsImpl _value, $Res Function(_$YogaPoseDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of YogaPoseDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? totalMinutes = freezed,
    Object? imageUrl = freezed,
    Object? totalCalories = freezed,
    Object? level = freezed,
  }) {
    return _then(_$YogaPoseDetailsImpl(
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
      totalMinutes: freezed == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCalories: freezed == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YogaPoseDetailsImpl implements _YogaPoseDetails {
  const _$YogaPoseDetailsImpl(
      {@JsonKey(readValue: _readId) required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'minutes') this.totalMinutes,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'calos') this.totalCalories,
      @JsonKey(name: 'level') this.level});

  factory _$YogaPoseDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$YogaPoseDetailsImplFromJson(json);

  @override
  @JsonKey(readValue: _readId)
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'minutes')
  final int? totalMinutes;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'calos')
  final int? totalCalories;
  @override
  @JsonKey(name: 'level')
  final String? level;

  @override
  String toString() {
    return 'YogaPoseDetails(id: $id, name: $name, description: $description, totalMinutes: $totalMinutes, imageUrl: $imageUrl, totalCalories: $totalCalories, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YogaPoseDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalMinutes, totalMinutes) ||
                other.totalMinutes == totalMinutes) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      totalMinutes, imageUrl, totalCalories, level);

  /// Create a copy of YogaPoseDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YogaPoseDetailsImplCopyWith<_$YogaPoseDetailsImpl> get copyWith =>
      __$$YogaPoseDetailsImplCopyWithImpl<_$YogaPoseDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YogaPoseDetailsImplToJson(
      this,
    );
  }
}

abstract class _YogaPoseDetails implements YogaPoseDetails {
  const factory _YogaPoseDetails(
      {@JsonKey(readValue: _readId) required final String id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'minutes') final int? totalMinutes,
      @JsonKey(name: 'imageUrl') final String? imageUrl,
      @JsonKey(name: 'calos') final int? totalCalories,
      @JsonKey(name: 'level') final String? level}) = _$YogaPoseDetailsImpl;

  factory _YogaPoseDetails.fromJson(Map<String, dynamic> json) =
      _$YogaPoseDetailsImpl.fromJson;

  @override
  @JsonKey(readValue: _readId)
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'minutes')
  int? get totalMinutes;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'calos')
  int? get totalCalories;
  @override
  @JsonKey(name: 'level')
  String? get level;

  /// Create a copy of YogaPoseDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YogaPoseDetailsImplCopyWith<_$YogaPoseDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
