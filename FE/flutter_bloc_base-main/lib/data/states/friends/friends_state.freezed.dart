// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FriendsState {
  List<FriendResponse> get friends => throw _privateConstructorUsedError;
  List<FriendResponse> get pendingRequests =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingPending => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FriendsStateCopyWith<FriendsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsStateCopyWith<$Res> {
  factory $FriendsStateCopyWith(
          FriendsState value, $Res Function(FriendsState) then) =
      _$FriendsStateCopyWithImpl<$Res, FriendsState>;
  @useResult
  $Res call(
      {List<FriendResponse> friends,
      List<FriendResponse> pendingRequests,
      bool isLoading,
      bool isLoadingPending,
      String? error});
}

/// @nodoc
class _$FriendsStateCopyWithImpl<$Res, $Val extends FriendsState>
    implements $FriendsStateCopyWith<$Res> {
  _$FriendsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
    Object? pendingRequests = null,
    Object? isLoading = null,
    Object? isLoadingPending = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendResponse>,
      pendingRequests: null == pendingRequests
          ? _value.pendingRequests
          : pendingRequests // ignore: cast_nullable_to_non_nullable
              as List<FriendResponse>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingPending: null == isLoadingPending
          ? _value.isLoadingPending
          : isLoadingPending // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendsStateImplCopyWith<$Res>
    implements $FriendsStateCopyWith<$Res> {
  factory _$$FriendsStateImplCopyWith(
          _$FriendsStateImpl value, $Res Function(_$FriendsStateImpl) then) =
      __$$FriendsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FriendResponse> friends,
      List<FriendResponse> pendingRequests,
      bool isLoading,
      bool isLoadingPending,
      String? error});
}

/// @nodoc
class __$$FriendsStateImplCopyWithImpl<$Res>
    extends _$FriendsStateCopyWithImpl<$Res, _$FriendsStateImpl>
    implements _$$FriendsStateImplCopyWith<$Res> {
  __$$FriendsStateImplCopyWithImpl(
      _$FriendsStateImpl _value, $Res Function(_$FriendsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
    Object? pendingRequests = null,
    Object? isLoading = null,
    Object? isLoadingPending = null,
    Object? error = freezed,
  }) {
    return _then(_$FriendsStateImpl(
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FriendResponse>,
      pendingRequests: null == pendingRequests
          ? _value._pendingRequests
          : pendingRequests // ignore: cast_nullable_to_non_nullable
              as List<FriendResponse>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingPending: null == isLoadingPending
          ? _value.isLoadingPending
          : isLoadingPending // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FriendsStateImpl implements _FriendsState {
  const _$FriendsStateImpl(
      {final List<FriendResponse> friends = const [],
      final List<FriendResponse> pendingRequests = const [],
      this.isLoading = false,
      this.isLoadingPending = false,
      this.error})
      : _friends = friends,
        _pendingRequests = pendingRequests;

  final List<FriendResponse> _friends;
  @override
  @JsonKey()
  List<FriendResponse> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<FriendResponse> _pendingRequests;
  @override
  @JsonKey()
  List<FriendResponse> get pendingRequests {
    if (_pendingRequests is EqualUnmodifiableListView) return _pendingRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingRequests);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingPending;
  @override
  final String? error;

  @override
  String toString() {
    return 'FriendsState(friends: $friends, pendingRequests: $pendingRequests, isLoading: $isLoading, isLoadingPending: $isLoadingPending, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsStateImpl &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._pendingRequests, _pendingRequests) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingPending, isLoadingPending) ||
                other.isLoadingPending == isLoadingPending) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_pendingRequests),
      isLoading,
      isLoadingPending,
      error);

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendsStateImplCopyWith<_$FriendsStateImpl> get copyWith =>
      __$$FriendsStateImplCopyWithImpl<_$FriendsStateImpl>(this, _$identity);
}

abstract class _FriendsState implements FriendsState {
  const factory _FriendsState(
      {final List<FriendResponse> friends,
      final List<FriendResponse> pendingRequests,
      final bool isLoading,
      final bool isLoadingPending,
      final String? error}) = _$FriendsStateImpl;

  @override
  List<FriendResponse> get friends;
  @override
  List<FriendResponse> get pendingRequests;
  @override
  bool get isLoading;
  @override
  bool get isLoadingPending;
  @override
  String? get error;

  /// Create a copy of FriendsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendsStateImplCopyWith<_$FriendsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
