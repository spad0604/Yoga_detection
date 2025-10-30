// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendResponse _$FriendResponseFromJson(Map<String, dynamic> json) {
  return _FriendResponse.fromJson(json);
}

/// @nodoc
mixin _$FriendResponse {
  @JsonKey(name: 'friendshipId')
  String get friendshipId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatarUrl')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'friendsSince')
  DateTime? get friendsSince => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPosesCompleted')
  int? get totalPosesCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalRoutinesCompleted')
  int? get totalRoutinesCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'averageScore')
  double? get averageScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentStreak')
  int? get currentStreak => throw _privateConstructorUsedError;

  /// Serializes this FriendResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FriendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FriendResponseCopyWith<FriendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendResponseCopyWith<$Res> {
  factory $FriendResponseCopyWith(
          FriendResponse value, $Res Function(FriendResponse) then) =
      _$FriendResponseCopyWithImpl<$Res, FriendResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'friendshipId') String friendshipId,
      @JsonKey(name: 'userId') String userId,
      String username,
      String email,
      @JsonKey(name: 'avatarUrl') String? avatarUrl,
      String? status,
      @JsonKey(name: 'friendsSince') DateTime? friendsSince,
      @JsonKey(name: 'totalPosesCompleted') int? totalPosesCompleted,
      @JsonKey(name: 'totalRoutinesCompleted') int? totalRoutinesCompleted,
      @JsonKey(name: 'averageScore') double? averageScore,
      @JsonKey(name: 'currentStreak') int? currentStreak});
}

/// @nodoc
class _$FriendResponseCopyWithImpl<$Res, $Val extends FriendResponse>
    implements $FriendResponseCopyWith<$Res> {
  _$FriendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FriendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendshipId = null,
    Object? userId = null,
    Object? username = null,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? status = freezed,
    Object? friendsSince = freezed,
    Object? totalPosesCompleted = freezed,
    Object? totalRoutinesCompleted = freezed,
    Object? averageScore = freezed,
    Object? currentStreak = freezed,
  }) {
    return _then(_value.copyWith(
      friendshipId: null == friendshipId
          ? _value.friendshipId
          : friendshipId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      friendsSince: freezed == friendsSince
          ? _value.friendsSince
          : friendsSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalPosesCompleted: freezed == totalPosesCompleted
          ? _value.totalPosesCompleted
          : totalPosesCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRoutinesCompleted: freezed == totalRoutinesCompleted
          ? _value.totalRoutinesCompleted
          : totalRoutinesCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      currentStreak: freezed == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendResponseImplCopyWith<$Res>
    implements $FriendResponseCopyWith<$Res> {
  factory _$$FriendResponseImplCopyWith(_$FriendResponseImpl value,
          $Res Function(_$FriendResponseImpl) then) =
      __$$FriendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'friendshipId') String friendshipId,
      @JsonKey(name: 'userId') String userId,
      String username,
      String email,
      @JsonKey(name: 'avatarUrl') String? avatarUrl,
      String? status,
      @JsonKey(name: 'friendsSince') DateTime? friendsSince,
      @JsonKey(name: 'totalPosesCompleted') int? totalPosesCompleted,
      @JsonKey(name: 'totalRoutinesCompleted') int? totalRoutinesCompleted,
      @JsonKey(name: 'averageScore') double? averageScore,
      @JsonKey(name: 'currentStreak') int? currentStreak});
}

/// @nodoc
class __$$FriendResponseImplCopyWithImpl<$Res>
    extends _$FriendResponseCopyWithImpl<$Res, _$FriendResponseImpl>
    implements _$$FriendResponseImplCopyWith<$Res> {
  __$$FriendResponseImplCopyWithImpl(
      _$FriendResponseImpl _value, $Res Function(_$FriendResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendshipId = null,
    Object? userId = null,
    Object? username = null,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? status = freezed,
    Object? friendsSince = freezed,
    Object? totalPosesCompleted = freezed,
    Object? totalRoutinesCompleted = freezed,
    Object? averageScore = freezed,
    Object? currentStreak = freezed,
  }) {
    return _then(_$FriendResponseImpl(
      friendshipId: null == friendshipId
          ? _value.friendshipId
          : friendshipId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      friendsSince: freezed == friendsSince
          ? _value.friendsSince
          : friendsSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalPosesCompleted: freezed == totalPosesCompleted
          ? _value.totalPosesCompleted
          : totalPosesCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRoutinesCompleted: freezed == totalRoutinesCompleted
          ? _value.totalRoutinesCompleted
          : totalRoutinesCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      currentStreak: freezed == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendResponseImpl implements _FriendResponse {
  const _$FriendResponseImpl(
      {@JsonKey(name: 'friendshipId') required this.friendshipId,
      @JsonKey(name: 'userId') required this.userId,
      required this.username,
      required this.email,
      @JsonKey(name: 'avatarUrl') this.avatarUrl,
      this.status,
      @JsonKey(name: 'friendsSince') this.friendsSince,
      @JsonKey(name: 'totalPosesCompleted') this.totalPosesCompleted,
      @JsonKey(name: 'totalRoutinesCompleted') this.totalRoutinesCompleted,
      @JsonKey(name: 'averageScore') this.averageScore,
      @JsonKey(name: 'currentStreak') this.currentStreak});

  factory _$FriendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendResponseImplFromJson(json);

  @override
  @JsonKey(name: 'friendshipId')
  final String friendshipId;
  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  final String username;
  @override
  final String email;
  @override
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  @override
  final String? status;
  @override
  @JsonKey(name: 'friendsSince')
  final DateTime? friendsSince;
  @override
  @JsonKey(name: 'totalPosesCompleted')
  final int? totalPosesCompleted;
  @override
  @JsonKey(name: 'totalRoutinesCompleted')
  final int? totalRoutinesCompleted;
  @override
  @JsonKey(name: 'averageScore')
  final double? averageScore;
  @override
  @JsonKey(name: 'currentStreak')
  final int? currentStreak;

  @override
  String toString() {
    return 'FriendResponse(friendshipId: $friendshipId, userId: $userId, username: $username, email: $email, avatarUrl: $avatarUrl, status: $status, friendsSince: $friendsSince, totalPosesCompleted: $totalPosesCompleted, totalRoutinesCompleted: $totalRoutinesCompleted, averageScore: $averageScore, currentStreak: $currentStreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendResponseImpl &&
            (identical(other.friendshipId, friendshipId) ||
                other.friendshipId == friendshipId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.friendsSince, friendsSince) ||
                other.friendsSince == friendsSince) &&
            (identical(other.totalPosesCompleted, totalPosesCompleted) ||
                other.totalPosesCompleted == totalPosesCompleted) &&
            (identical(other.totalRoutinesCompleted, totalRoutinesCompleted) ||
                other.totalRoutinesCompleted == totalRoutinesCompleted) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      friendshipId,
      userId,
      username,
      email,
      avatarUrl,
      status,
      friendsSince,
      totalPosesCompleted,
      totalRoutinesCompleted,
      averageScore,
      currentStreak);

  /// Create a copy of FriendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendResponseImplCopyWith<_$FriendResponseImpl> get copyWith =>
      __$$FriendResponseImplCopyWithImpl<_$FriendResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendResponseImplToJson(
      this,
    );
  }
}

abstract class _FriendResponse implements FriendResponse {
  const factory _FriendResponse(
          {@JsonKey(name: 'friendshipId') required final String friendshipId,
          @JsonKey(name: 'userId') required final String userId,
          required final String username,
          required final String email,
          @JsonKey(name: 'avatarUrl') final String? avatarUrl,
          final String? status,
          @JsonKey(name: 'friendsSince') final DateTime? friendsSince,
          @JsonKey(name: 'totalPosesCompleted') final int? totalPosesCompleted,
          @JsonKey(name: 'totalRoutinesCompleted')
          final int? totalRoutinesCompleted,
          @JsonKey(name: 'averageScore') final double? averageScore,
          @JsonKey(name: 'currentStreak') final int? currentStreak}) =
      _$FriendResponseImpl;

  factory _FriendResponse.fromJson(Map<String, dynamic> json) =
      _$FriendResponseImpl.fromJson;

  @override
  @JsonKey(name: 'friendshipId')
  String get friendshipId;
  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  String get username;
  @override
  String get email;
  @override
  @JsonKey(name: 'avatarUrl')
  String? get avatarUrl;
  @override
  String? get status;
  @override
  @JsonKey(name: 'friendsSince')
  DateTime? get friendsSince;
  @override
  @JsonKey(name: 'totalPosesCompleted')
  int? get totalPosesCompleted;
  @override
  @JsonKey(name: 'totalRoutinesCompleted')
  int? get totalRoutinesCompleted;
  @override
  @JsonKey(name: 'averageScore')
  double? get averageScore;
  @override
  @JsonKey(name: 'currentStreak')
  int? get currentStreak;

  /// Create a copy of FriendResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendResponseImplCopyWith<_$FriendResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
