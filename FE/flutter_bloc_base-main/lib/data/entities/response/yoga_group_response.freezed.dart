// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_group_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YogaGroupResponse _$YogaGroupResponseFromJson(Map<String, dynamic> json) {
  return _YogaGroupResponse.fromJson(json);
}

/// @nodoc
mixin _$YogaGroupResponse {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'ownerId')
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ownerName')
  String? get ownerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'memberCount')
  int get memberCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPrivate')
  bool get isPrivate => throw _privateConstructorUsedError;
  @JsonKey(name: 'isMember')
  bool get isMember => throw _privateConstructorUsedError;
  @JsonKey(name: 'userRole')
  String? get userRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this YogaGroupResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YogaGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YogaGroupResponseCopyWith<YogaGroupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YogaGroupResponseCopyWith<$Res> {
  factory $YogaGroupResponseCopyWith(
          YogaGroupResponse value, $Res Function(YogaGroupResponse) then) =
      _$YogaGroupResponseCopyWithImpl<$Res, YogaGroupResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'ownerId') String ownerId,
      @JsonKey(name: 'ownerName') String? ownerName,
      @JsonKey(name: 'memberCount') int memberCount,
      @JsonKey(name: 'isPrivate') bool isPrivate,
      @JsonKey(name: 'isMember') bool isMember,
      @JsonKey(name: 'userRole') String? userRole,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class _$YogaGroupResponseCopyWithImpl<$Res, $Val extends YogaGroupResponse>
    implements $YogaGroupResponseCopyWith<$Res> {
  _$YogaGroupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YogaGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? ownerId = null,
    Object? ownerName = freezed,
    Object? memberCount = null,
    Object? isPrivate = null,
    Object? isMember = null,
    Object? userRole = freezed,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      isMember: null == isMember
          ? _value.isMember
          : isMember // ignore: cast_nullable_to_non_nullable
              as bool,
      userRole: freezed == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$YogaGroupResponseImplCopyWith<$Res>
    implements $YogaGroupResponseCopyWith<$Res> {
  factory _$$YogaGroupResponseImplCopyWith(_$YogaGroupResponseImpl value,
          $Res Function(_$YogaGroupResponseImpl) then) =
      __$$YogaGroupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'ownerId') String ownerId,
      @JsonKey(name: 'ownerName') String? ownerName,
      @JsonKey(name: 'memberCount') int memberCount,
      @JsonKey(name: 'isPrivate') bool isPrivate,
      @JsonKey(name: 'isMember') bool isMember,
      @JsonKey(name: 'userRole') String? userRole,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt});
}

/// @nodoc
class __$$YogaGroupResponseImplCopyWithImpl<$Res>
    extends _$YogaGroupResponseCopyWithImpl<$Res, _$YogaGroupResponseImpl>
    implements _$$YogaGroupResponseImplCopyWith<$Res> {
  __$$YogaGroupResponseImplCopyWithImpl(_$YogaGroupResponseImpl _value,
      $Res Function(_$YogaGroupResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of YogaGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? ownerId = null,
    Object? ownerName = freezed,
    Object? memberCount = null,
    Object? isPrivate = null,
    Object? isMember = null,
    Object? userRole = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$YogaGroupResponseImpl(
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      isMember: null == isMember
          ? _value.isMember
          : isMember // ignore: cast_nullable_to_non_nullable
              as bool,
      userRole: freezed == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$YogaGroupResponseImpl implements _YogaGroupResponse {
  const _$YogaGroupResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'ownerId') required this.ownerId,
      @JsonKey(name: 'ownerName') this.ownerName,
      @JsonKey(name: 'memberCount') this.memberCount = 0,
      @JsonKey(name: 'isPrivate') this.isPrivate = false,
      @JsonKey(name: 'isMember') this.isMember = false,
      @JsonKey(name: 'userRole') this.userRole,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt});

  factory _$YogaGroupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$YogaGroupResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'ownerId')
  final String ownerId;
  @override
  @JsonKey(name: 'ownerName')
  final String? ownerName;
  @override
  @JsonKey(name: 'memberCount')
  final int memberCount;
  @override
  @JsonKey(name: 'isPrivate')
  final bool isPrivate;
  @override
  @JsonKey(name: 'isMember')
  final bool isMember;
  @override
  @JsonKey(name: 'userRole')
  final String? userRole;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'YogaGroupResponse(id: $id, name: $name, description: $description, imageUrl: $imageUrl, ownerId: $ownerId, ownerName: $ownerName, memberCount: $memberCount, isPrivate: $isPrivate, isMember: $isMember, userRole: $userRole, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YogaGroupResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.isMember, isMember) ||
                other.isMember == isMember) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole) &&
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
      imageUrl,
      ownerId,
      ownerName,
      memberCount,
      isPrivate,
      isMember,
      userRole,
      createdAt,
      updatedAt);

  /// Create a copy of YogaGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YogaGroupResponseImplCopyWith<_$YogaGroupResponseImpl> get copyWith =>
      __$$YogaGroupResponseImplCopyWithImpl<_$YogaGroupResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YogaGroupResponseImplToJson(
      this,
    );
  }
}

abstract class _YogaGroupResponse implements YogaGroupResponse {
  const factory _YogaGroupResponse(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'imageUrl') final String? imageUrl,
          @JsonKey(name: 'ownerId') required final String ownerId,
          @JsonKey(name: 'ownerName') final String? ownerName,
          @JsonKey(name: 'memberCount') final int memberCount,
          @JsonKey(name: 'isPrivate') final bool isPrivate,
          @JsonKey(name: 'isMember') final bool isMember,
          @JsonKey(name: 'userRole') final String? userRole,
          @JsonKey(name: 'createdAt') final DateTime? createdAt,
          @JsonKey(name: 'updatedAt') final DateTime? updatedAt}) =
      _$YogaGroupResponseImpl;

  factory _YogaGroupResponse.fromJson(Map<String, dynamic> json) =
      _$YogaGroupResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'ownerId')
  String get ownerId;
  @override
  @JsonKey(name: 'ownerName')
  String? get ownerName;
  @override
  @JsonKey(name: 'memberCount')
  int get memberCount;
  @override
  @JsonKey(name: 'isPrivate')
  bool get isPrivate;
  @override
  @JsonKey(name: 'isMember')
  bool get isMember;
  @override
  @JsonKey(name: 'userRole')
  String? get userRole;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;

  /// Create a copy of YogaGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YogaGroupResponseImplCopyWith<_$YogaGroupResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
