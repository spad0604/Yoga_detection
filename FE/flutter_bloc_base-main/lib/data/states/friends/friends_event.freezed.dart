// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FriendsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFriends,
    required TResult Function() loadPendingRequests,
    required TResult Function() refreshFriends,
    required TResult Function() refreshPendingRequests,
    required TResult Function(String email) sendFriendRequest,
    required TResult Function(String friendshipId) acceptRequest,
    required TResult Function(String friendshipId) rejectRequest,
    required TResult Function(String friendshipId) removeFriend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFriends,
    TResult? Function()? loadPendingRequests,
    TResult? Function()? refreshFriends,
    TResult? Function()? refreshPendingRequests,
    TResult? Function(String email)? sendFriendRequest,
    TResult? Function(String friendshipId)? acceptRequest,
    TResult? Function(String friendshipId)? rejectRequest,
    TResult? Function(String friendshipId)? removeFriend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFriends,
    TResult Function()? loadPendingRequests,
    TResult Function()? refreshFriends,
    TResult Function()? refreshPendingRequests,
    TResult Function(String email)? sendFriendRequest,
    TResult Function(String friendshipId)? acceptRequest,
    TResult Function(String friendshipId)? rejectRequest,
    TResult Function(String friendshipId)? removeFriend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FriendsLoadFriends value) loadFriends,
    required TResult Function(FriendsLoadPendingRequests value)
        loadPendingRequests,
    required TResult Function(FriendsRefreshFriends value) refreshFriends,
    required TResult Function(FriendsRefreshPendingRequests value)
        refreshPendingRequests,
    required TResult Function(FriendsSendFriendRequest value) sendFriendRequest,
    required TResult Function(FriendsAcceptRequest value) acceptRequest,
    required TResult Function(FriendsRejectRequest value) rejectRequest,
    required TResult Function(FriendsRemoveFriend value) removeFriend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FriendsLoadFriends value)? loadFriends,
    TResult? Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult? Function(FriendsRefreshFriends value)? refreshFriends,
    TResult? Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult? Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult? Function(FriendsAcceptRequest value)? acceptRequest,
    TResult? Function(FriendsRejectRequest value)? rejectRequest,
    TResult? Function(FriendsRemoveFriend value)? removeFriend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FriendsLoadFriends value)? loadFriends,
    TResult Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult Function(FriendsRefreshFriends value)? refreshFriends,
    TResult Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult Function(FriendsAcceptRequest value)? acceptRequest,
    TResult Function(FriendsRejectRequest value)? rejectRequest,
    TResult Function(FriendsRemoveFriend value)? removeFriend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsEventCopyWith<$Res> {
  factory $FriendsEventCopyWith(
          FriendsEvent value, $Res Function(FriendsEvent) then) =
      _$FriendsEventCopyWithImpl<$Res, FriendsEvent>;
}

/// @nodoc
class _$FriendsEventCopyWithImpl<$Res, $Val extends FriendsEvent>
    implements $FriendsEventCopyWith<$Res> {
  _$FriendsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FriendsLoadFriendsImplCopyWith<$Res> {
  factory _$$FriendsLoadFriendsImplCopyWith(_$FriendsLoadFriendsImpl value,
          $Res Function(_$FriendsLoadFriendsImpl) then) =
      __$$FriendsLoadFriendsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FriendsLoadFriendsImplCopyWithImpl<$Res>
    extends _$FriendsEventCopyWithImpl<$Res, _$FriendsLoadFriendsImpl>
    implements _$$FriendsLoadFriendsImplCopyWith<$Res> {
  __$$FriendsLoadFriendsImplCopyWithImpl(_$FriendsLoadFriendsImpl _value,
      $Res Function(_$FriendsLoadFriendsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FriendsLoadFriendsImpl implements FriendsLoadFriends {
  const _$FriendsLoadFriendsImpl();

  @override
  String toString() {
    return 'FriendsEvent.loadFriends()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FriendsLoadFriendsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFriends,
    required TResult Function() loadPendingRequests,
    required TResult Function() refreshFriends,
    required TResult Function() refreshPendingRequests,
    required TResult Function(String email) sendFriendRequest,
    required TResult Function(String friendshipId) acceptRequest,
    required TResult Function(String friendshipId) rejectRequest,
    required TResult Function(String friendshipId) removeFriend,
  }) {
    return loadFriends();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFriends,
    TResult? Function()? loadPendingRequests,
    TResult? Function()? refreshFriends,
    TResult? Function()? refreshPendingRequests,
    TResult? Function(String email)? sendFriendRequest,
    TResult? Function(String friendshipId)? acceptRequest,
    TResult? Function(String friendshipId)? rejectRequest,
    TResult? Function(String friendshipId)? removeFriend,
  }) {
    return loadFriends?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFriends,
    TResult Function()? loadPendingRequests,
    TResult Function()? refreshFriends,
    TResult Function()? refreshPendingRequests,
    TResult Function(String email)? sendFriendRequest,
    TResult Function(String friendshipId)? acceptRequest,
    TResult Function(String friendshipId)? rejectRequest,
    TResult Function(String friendshipId)? removeFriend,
    required TResult orElse(),
  }) {
    if (loadFriends != null) {
      return loadFriends();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FriendsLoadFriends value) loadFriends,
    required TResult Function(FriendsLoadPendingRequests value)
        loadPendingRequests,
    required TResult Function(FriendsRefreshFriends value) refreshFriends,
    required TResult Function(FriendsRefreshPendingRequests value)
        refreshPendingRequests,
    required TResult Function(FriendsSendFriendRequest value) sendFriendRequest,
    required TResult Function(FriendsAcceptRequest value) acceptRequest,
    required TResult Function(FriendsRejectRequest value) rejectRequest,
    required TResult Function(FriendsRemoveFriend value) removeFriend,
  }) {
    return loadFriends(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FriendsLoadFriends value)? loadFriends,
    TResult? Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult? Function(FriendsRefreshFriends value)? refreshFriends,
    TResult? Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult? Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult? Function(FriendsAcceptRequest value)? acceptRequest,
    TResult? Function(FriendsRejectRequest value)? rejectRequest,
    TResult? Function(FriendsRemoveFriend value)? removeFriend,
  }) {
    return loadFriends?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FriendsLoadFriends value)? loadFriends,
    TResult Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult Function(FriendsRefreshFriends value)? refreshFriends,
    TResult Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult Function(FriendsAcceptRequest value)? acceptRequest,
    TResult Function(FriendsRejectRequest value)? rejectRequest,
    TResult Function(FriendsRemoveFriend value)? removeFriend,
    required TResult orElse(),
  }) {
    if (loadFriends != null) {
      return loadFriends(this);
    }
    return orElse();
  }
}

abstract class FriendsLoadFriends implements FriendsEvent {
  const factory FriendsLoadFriends() = _$FriendsLoadFriendsImpl;
}

/// @nodoc
abstract class _$$FriendsLoadPendingRequestsImplCopyWith<$Res> {
  factory _$$FriendsLoadPendingRequestsImplCopyWith(
          _$FriendsLoadPendingRequestsImpl value,
          $Res Function(_$FriendsLoadPendingRequestsImpl) then) =
      __$$FriendsLoadPendingRequestsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FriendsLoadPendingRequestsImplCopyWithImpl<$Res>
    extends _$FriendsEventCopyWithImpl<$Res, _$FriendsLoadPendingRequestsImpl>
    implements _$$FriendsLoadPendingRequestsImplCopyWith<$Res> {
  __$$FriendsLoadPendingRequestsImplCopyWithImpl(
      _$FriendsLoadPendingRequestsImpl _value,
      $Res Function(_$FriendsLoadPendingRequestsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FriendsLoadPendingRequestsImpl implements FriendsLoadPendingRequests {
  const _$FriendsLoadPendingRequestsImpl();

  @override
  String toString() {
    return 'FriendsEvent.loadPendingRequests()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsLoadPendingRequestsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFriends,
    required TResult Function() loadPendingRequests,
    required TResult Function() refreshFriends,
    required TResult Function() refreshPendingRequests,
    required TResult Function(String email) sendFriendRequest,
    required TResult Function(String friendshipId) acceptRequest,
    required TResult Function(String friendshipId) rejectRequest,
    required TResult Function(String friendshipId) removeFriend,
  }) {
    return loadPendingRequests();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFriends,
    TResult? Function()? loadPendingRequests,
    TResult? Function()? refreshFriends,
    TResult? Function()? refreshPendingRequests,
    TResult? Function(String email)? sendFriendRequest,
    TResult? Function(String friendshipId)? acceptRequest,
    TResult? Function(String friendshipId)? rejectRequest,
    TResult? Function(String friendshipId)? removeFriend,
  }) {
    return loadPendingRequests?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFriends,
    TResult Function()? loadPendingRequests,
    TResult Function()? refreshFriends,
    TResult Function()? refreshPendingRequests,
    TResult Function(String email)? sendFriendRequest,
    TResult Function(String friendshipId)? acceptRequest,
    TResult Function(String friendshipId)? rejectRequest,
    TResult Function(String friendshipId)? removeFriend,
    required TResult orElse(),
  }) {
    if (loadPendingRequests != null) {
      return loadPendingRequests();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FriendsLoadFriends value) loadFriends,
    required TResult Function(FriendsLoadPendingRequests value)
        loadPendingRequests,
    required TResult Function(FriendsRefreshFriends value) refreshFriends,
    required TResult Function(FriendsRefreshPendingRequests value)
        refreshPendingRequests,
    required TResult Function(FriendsSendFriendRequest value) sendFriendRequest,
    required TResult Function(FriendsAcceptRequest value) acceptRequest,
    required TResult Function(FriendsRejectRequest value) rejectRequest,
    required TResult Function(FriendsRemoveFriend value) removeFriend,
  }) {
    return loadPendingRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FriendsLoadFriends value)? loadFriends,
    TResult? Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult? Function(FriendsRefreshFriends value)? refreshFriends,
    TResult? Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult? Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult? Function(FriendsAcceptRequest value)? acceptRequest,
    TResult? Function(FriendsRejectRequest value)? rejectRequest,
    TResult? Function(FriendsRemoveFriend value)? removeFriend,
  }) {
    return loadPendingRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FriendsLoadFriends value)? loadFriends,
    TResult Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult Function(FriendsRefreshFriends value)? refreshFriends,
    TResult Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult Function(FriendsAcceptRequest value)? acceptRequest,
    TResult Function(FriendsRejectRequest value)? rejectRequest,
    TResult Function(FriendsRemoveFriend value)? removeFriend,
    required TResult orElse(),
  }) {
    if (loadPendingRequests != null) {
      return loadPendingRequests(this);
    }
    return orElse();
  }
}

abstract class FriendsLoadPendingRequests implements FriendsEvent {
  const factory FriendsLoadPendingRequests() = _$FriendsLoadPendingRequestsImpl;
}

/// @nodoc
abstract class _$$FriendsRefreshFriendsImplCopyWith<$Res> {
  factory _$$FriendsRefreshFriendsImplCopyWith(
          _$FriendsRefreshFriendsImpl value,
          $Res Function(_$FriendsRefreshFriendsImpl) then) =
      __$$FriendsRefreshFriendsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FriendsRefreshFriendsImplCopyWithImpl<$Res>
    extends _$FriendsEventCopyWithImpl<$Res, _$FriendsRefreshFriendsImpl>
    implements _$$FriendsRefreshFriendsImplCopyWith<$Res> {
  __$$FriendsRefreshFriendsImplCopyWithImpl(_$FriendsRefreshFriendsImpl _value,
      $Res Function(_$FriendsRefreshFriendsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FriendsRefreshFriendsImpl implements FriendsRefreshFriends {
  const _$FriendsRefreshFriendsImpl();

  @override
  String toString() {
    return 'FriendsEvent.refreshFriends()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsRefreshFriendsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFriends,
    required TResult Function() loadPendingRequests,
    required TResult Function() refreshFriends,
    required TResult Function() refreshPendingRequests,
    required TResult Function(String email) sendFriendRequest,
    required TResult Function(String friendshipId) acceptRequest,
    required TResult Function(String friendshipId) rejectRequest,
    required TResult Function(String friendshipId) removeFriend,
  }) {
    return refreshFriends();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFriends,
    TResult? Function()? loadPendingRequests,
    TResult? Function()? refreshFriends,
    TResult? Function()? refreshPendingRequests,
    TResult? Function(String email)? sendFriendRequest,
    TResult? Function(String friendshipId)? acceptRequest,
    TResult? Function(String friendshipId)? rejectRequest,
    TResult? Function(String friendshipId)? removeFriend,
  }) {
    return refreshFriends?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFriends,
    TResult Function()? loadPendingRequests,
    TResult Function()? refreshFriends,
    TResult Function()? refreshPendingRequests,
    TResult Function(String email)? sendFriendRequest,
    TResult Function(String friendshipId)? acceptRequest,
    TResult Function(String friendshipId)? rejectRequest,
    TResult Function(String friendshipId)? removeFriend,
    required TResult orElse(),
  }) {
    if (refreshFriends != null) {
      return refreshFriends();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FriendsLoadFriends value) loadFriends,
    required TResult Function(FriendsLoadPendingRequests value)
        loadPendingRequests,
    required TResult Function(FriendsRefreshFriends value) refreshFriends,
    required TResult Function(FriendsRefreshPendingRequests value)
        refreshPendingRequests,
    required TResult Function(FriendsSendFriendRequest value) sendFriendRequest,
    required TResult Function(FriendsAcceptRequest value) acceptRequest,
    required TResult Function(FriendsRejectRequest value) rejectRequest,
    required TResult Function(FriendsRemoveFriend value) removeFriend,
  }) {
    return refreshFriends(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FriendsLoadFriends value)? loadFriends,
    TResult? Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult? Function(FriendsRefreshFriends value)? refreshFriends,
    TResult? Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult? Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult? Function(FriendsAcceptRequest value)? acceptRequest,
    TResult? Function(FriendsRejectRequest value)? rejectRequest,
    TResult? Function(FriendsRemoveFriend value)? removeFriend,
  }) {
    return refreshFriends?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FriendsLoadFriends value)? loadFriends,
    TResult Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult Function(FriendsRefreshFriends value)? refreshFriends,
    TResult Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult Function(FriendsAcceptRequest value)? acceptRequest,
    TResult Function(FriendsRejectRequest value)? rejectRequest,
    TResult Function(FriendsRemoveFriend value)? removeFriend,
    required TResult orElse(),
  }) {
    if (refreshFriends != null) {
      return refreshFriends(this);
    }
    return orElse();
  }
}

abstract class FriendsRefreshFriends implements FriendsEvent {
  const factory FriendsRefreshFriends() = _$FriendsRefreshFriendsImpl;
}

/// @nodoc
abstract class _$$FriendsRefreshPendingRequestsImplCopyWith<$Res> {
  factory _$$FriendsRefreshPendingRequestsImplCopyWith(
          _$FriendsRefreshPendingRequestsImpl value,
          $Res Function(_$FriendsRefreshPendingRequestsImpl) then) =
      __$$FriendsRefreshPendingRequestsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FriendsRefreshPendingRequestsImplCopyWithImpl<$Res>
    extends _$FriendsEventCopyWithImpl<$Res,
        _$FriendsRefreshPendingRequestsImpl>
    implements _$$FriendsRefreshPendingRequestsImplCopyWith<$Res> {
  __$$FriendsRefreshPendingRequestsImplCopyWithImpl(
      _$FriendsRefreshPendingRequestsImpl _value,
      $Res Function(_$FriendsRefreshPendingRequestsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FriendsRefreshPendingRequestsImpl
    implements FriendsRefreshPendingRequests {
  const _$FriendsRefreshPendingRequestsImpl();

  @override
  String toString() {
    return 'FriendsEvent.refreshPendingRequests()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsRefreshPendingRequestsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFriends,
    required TResult Function() loadPendingRequests,
    required TResult Function() refreshFriends,
    required TResult Function() refreshPendingRequests,
    required TResult Function(String email) sendFriendRequest,
    required TResult Function(String friendshipId) acceptRequest,
    required TResult Function(String friendshipId) rejectRequest,
    required TResult Function(String friendshipId) removeFriend,
  }) {
    return refreshPendingRequests();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFriends,
    TResult? Function()? loadPendingRequests,
    TResult? Function()? refreshFriends,
    TResult? Function()? refreshPendingRequests,
    TResult? Function(String email)? sendFriendRequest,
    TResult? Function(String friendshipId)? acceptRequest,
    TResult? Function(String friendshipId)? rejectRequest,
    TResult? Function(String friendshipId)? removeFriend,
  }) {
    return refreshPendingRequests?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFriends,
    TResult Function()? loadPendingRequests,
    TResult Function()? refreshFriends,
    TResult Function()? refreshPendingRequests,
    TResult Function(String email)? sendFriendRequest,
    TResult Function(String friendshipId)? acceptRequest,
    TResult Function(String friendshipId)? rejectRequest,
    TResult Function(String friendshipId)? removeFriend,
    required TResult orElse(),
  }) {
    if (refreshPendingRequests != null) {
      return refreshPendingRequests();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FriendsLoadFriends value) loadFriends,
    required TResult Function(FriendsLoadPendingRequests value)
        loadPendingRequests,
    required TResult Function(FriendsRefreshFriends value) refreshFriends,
    required TResult Function(FriendsRefreshPendingRequests value)
        refreshPendingRequests,
    required TResult Function(FriendsSendFriendRequest value) sendFriendRequest,
    required TResult Function(FriendsAcceptRequest value) acceptRequest,
    required TResult Function(FriendsRejectRequest value) rejectRequest,
    required TResult Function(FriendsRemoveFriend value) removeFriend,
  }) {
    return refreshPendingRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FriendsLoadFriends value)? loadFriends,
    TResult? Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult? Function(FriendsRefreshFriends value)? refreshFriends,
    TResult? Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult? Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult? Function(FriendsAcceptRequest value)? acceptRequest,
    TResult? Function(FriendsRejectRequest value)? rejectRequest,
    TResult? Function(FriendsRemoveFriend value)? removeFriend,
  }) {
    return refreshPendingRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FriendsLoadFriends value)? loadFriends,
    TResult Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult Function(FriendsRefreshFriends value)? refreshFriends,
    TResult Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult Function(FriendsAcceptRequest value)? acceptRequest,
    TResult Function(FriendsRejectRequest value)? rejectRequest,
    TResult Function(FriendsRemoveFriend value)? removeFriend,
    required TResult orElse(),
  }) {
    if (refreshPendingRequests != null) {
      return refreshPendingRequests(this);
    }
    return orElse();
  }
}

abstract class FriendsRefreshPendingRequests implements FriendsEvent {
  const factory FriendsRefreshPendingRequests() =
      _$FriendsRefreshPendingRequestsImpl;
}

/// @nodoc
abstract class _$$FriendsSendFriendRequestImplCopyWith<$Res> {
  factory _$$FriendsSendFriendRequestImplCopyWith(
          _$FriendsSendFriendRequestImpl value,
          $Res Function(_$FriendsSendFriendRequestImpl) then) =
      __$$FriendsSendFriendRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$FriendsSendFriendRequestImplCopyWithImpl<$Res>
    extends _$FriendsEventCopyWithImpl<$Res, _$FriendsSendFriendRequestImpl>
    implements _$$FriendsSendFriendRequestImplCopyWith<$Res> {
  __$$FriendsSendFriendRequestImplCopyWithImpl(
      _$FriendsSendFriendRequestImpl _value,
      $Res Function(_$FriendsSendFriendRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$FriendsSendFriendRequestImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FriendsSendFriendRequestImpl implements FriendsSendFriendRequest {
  const _$FriendsSendFriendRequestImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'FriendsEvent.sendFriendRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsSendFriendRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendsSendFriendRequestImplCopyWith<_$FriendsSendFriendRequestImpl>
      get copyWith => __$$FriendsSendFriendRequestImplCopyWithImpl<
          _$FriendsSendFriendRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFriends,
    required TResult Function() loadPendingRequests,
    required TResult Function() refreshFriends,
    required TResult Function() refreshPendingRequests,
    required TResult Function(String email) sendFriendRequest,
    required TResult Function(String friendshipId) acceptRequest,
    required TResult Function(String friendshipId) rejectRequest,
    required TResult Function(String friendshipId) removeFriend,
  }) {
    return sendFriendRequest(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFriends,
    TResult? Function()? loadPendingRequests,
    TResult? Function()? refreshFriends,
    TResult? Function()? refreshPendingRequests,
    TResult? Function(String email)? sendFriendRequest,
    TResult? Function(String friendshipId)? acceptRequest,
    TResult? Function(String friendshipId)? rejectRequest,
    TResult? Function(String friendshipId)? removeFriend,
  }) {
    return sendFriendRequest?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFriends,
    TResult Function()? loadPendingRequests,
    TResult Function()? refreshFriends,
    TResult Function()? refreshPendingRequests,
    TResult Function(String email)? sendFriendRequest,
    TResult Function(String friendshipId)? acceptRequest,
    TResult Function(String friendshipId)? rejectRequest,
    TResult Function(String friendshipId)? removeFriend,
    required TResult orElse(),
  }) {
    if (sendFriendRequest != null) {
      return sendFriendRequest(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FriendsLoadFriends value) loadFriends,
    required TResult Function(FriendsLoadPendingRequests value)
        loadPendingRequests,
    required TResult Function(FriendsRefreshFriends value) refreshFriends,
    required TResult Function(FriendsRefreshPendingRequests value)
        refreshPendingRequests,
    required TResult Function(FriendsSendFriendRequest value) sendFriendRequest,
    required TResult Function(FriendsAcceptRequest value) acceptRequest,
    required TResult Function(FriendsRejectRequest value) rejectRequest,
    required TResult Function(FriendsRemoveFriend value) removeFriend,
  }) {
    return sendFriendRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FriendsLoadFriends value)? loadFriends,
    TResult? Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult? Function(FriendsRefreshFriends value)? refreshFriends,
    TResult? Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult? Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult? Function(FriendsAcceptRequest value)? acceptRequest,
    TResult? Function(FriendsRejectRequest value)? rejectRequest,
    TResult? Function(FriendsRemoveFriend value)? removeFriend,
  }) {
    return sendFriendRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FriendsLoadFriends value)? loadFriends,
    TResult Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult Function(FriendsRefreshFriends value)? refreshFriends,
    TResult Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult Function(FriendsAcceptRequest value)? acceptRequest,
    TResult Function(FriendsRejectRequest value)? rejectRequest,
    TResult Function(FriendsRemoveFriend value)? removeFriend,
    required TResult orElse(),
  }) {
    if (sendFriendRequest != null) {
      return sendFriendRequest(this);
    }
    return orElse();
  }
}

abstract class FriendsSendFriendRequest implements FriendsEvent {
  const factory FriendsSendFriendRequest(final String email) =
      _$FriendsSendFriendRequestImpl;

  String get email;

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendsSendFriendRequestImplCopyWith<_$FriendsSendFriendRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FriendsAcceptRequestImplCopyWith<$Res> {
  factory _$$FriendsAcceptRequestImplCopyWith(_$FriendsAcceptRequestImpl value,
          $Res Function(_$FriendsAcceptRequestImpl) then) =
      __$$FriendsAcceptRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String friendshipId});
}

/// @nodoc
class __$$FriendsAcceptRequestImplCopyWithImpl<$Res>
    extends _$FriendsEventCopyWithImpl<$Res, _$FriendsAcceptRequestImpl>
    implements _$$FriendsAcceptRequestImplCopyWith<$Res> {
  __$$FriendsAcceptRequestImplCopyWithImpl(_$FriendsAcceptRequestImpl _value,
      $Res Function(_$FriendsAcceptRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendshipId = null,
  }) {
    return _then(_$FriendsAcceptRequestImpl(
      null == friendshipId
          ? _value.friendshipId
          : friendshipId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FriendsAcceptRequestImpl implements FriendsAcceptRequest {
  const _$FriendsAcceptRequestImpl(this.friendshipId);

  @override
  final String friendshipId;

  @override
  String toString() {
    return 'FriendsEvent.acceptRequest(friendshipId: $friendshipId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsAcceptRequestImpl &&
            (identical(other.friendshipId, friendshipId) ||
                other.friendshipId == friendshipId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, friendshipId);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendsAcceptRequestImplCopyWith<_$FriendsAcceptRequestImpl>
      get copyWith =>
          __$$FriendsAcceptRequestImplCopyWithImpl<_$FriendsAcceptRequestImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFriends,
    required TResult Function() loadPendingRequests,
    required TResult Function() refreshFriends,
    required TResult Function() refreshPendingRequests,
    required TResult Function(String email) sendFriendRequest,
    required TResult Function(String friendshipId) acceptRequest,
    required TResult Function(String friendshipId) rejectRequest,
    required TResult Function(String friendshipId) removeFriend,
  }) {
    return acceptRequest(friendshipId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFriends,
    TResult? Function()? loadPendingRequests,
    TResult? Function()? refreshFriends,
    TResult? Function()? refreshPendingRequests,
    TResult? Function(String email)? sendFriendRequest,
    TResult? Function(String friendshipId)? acceptRequest,
    TResult? Function(String friendshipId)? rejectRequest,
    TResult? Function(String friendshipId)? removeFriend,
  }) {
    return acceptRequest?.call(friendshipId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFriends,
    TResult Function()? loadPendingRequests,
    TResult Function()? refreshFriends,
    TResult Function()? refreshPendingRequests,
    TResult Function(String email)? sendFriendRequest,
    TResult Function(String friendshipId)? acceptRequest,
    TResult Function(String friendshipId)? rejectRequest,
    TResult Function(String friendshipId)? removeFriend,
    required TResult orElse(),
  }) {
    if (acceptRequest != null) {
      return acceptRequest(friendshipId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FriendsLoadFriends value) loadFriends,
    required TResult Function(FriendsLoadPendingRequests value)
        loadPendingRequests,
    required TResult Function(FriendsRefreshFriends value) refreshFriends,
    required TResult Function(FriendsRefreshPendingRequests value)
        refreshPendingRequests,
    required TResult Function(FriendsSendFriendRequest value) sendFriendRequest,
    required TResult Function(FriendsAcceptRequest value) acceptRequest,
    required TResult Function(FriendsRejectRequest value) rejectRequest,
    required TResult Function(FriendsRemoveFriend value) removeFriend,
  }) {
    return acceptRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FriendsLoadFriends value)? loadFriends,
    TResult? Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult? Function(FriendsRefreshFriends value)? refreshFriends,
    TResult? Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult? Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult? Function(FriendsAcceptRequest value)? acceptRequest,
    TResult? Function(FriendsRejectRequest value)? rejectRequest,
    TResult? Function(FriendsRemoveFriend value)? removeFriend,
  }) {
    return acceptRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FriendsLoadFriends value)? loadFriends,
    TResult Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult Function(FriendsRefreshFriends value)? refreshFriends,
    TResult Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult Function(FriendsAcceptRequest value)? acceptRequest,
    TResult Function(FriendsRejectRequest value)? rejectRequest,
    TResult Function(FriendsRemoveFriend value)? removeFriend,
    required TResult orElse(),
  }) {
    if (acceptRequest != null) {
      return acceptRequest(this);
    }
    return orElse();
  }
}

abstract class FriendsAcceptRequest implements FriendsEvent {
  const factory FriendsAcceptRequest(final String friendshipId) =
      _$FriendsAcceptRequestImpl;

  String get friendshipId;

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendsAcceptRequestImplCopyWith<_$FriendsAcceptRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FriendsRejectRequestImplCopyWith<$Res> {
  factory _$$FriendsRejectRequestImplCopyWith(_$FriendsRejectRequestImpl value,
          $Res Function(_$FriendsRejectRequestImpl) then) =
      __$$FriendsRejectRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String friendshipId});
}

/// @nodoc
class __$$FriendsRejectRequestImplCopyWithImpl<$Res>
    extends _$FriendsEventCopyWithImpl<$Res, _$FriendsRejectRequestImpl>
    implements _$$FriendsRejectRequestImplCopyWith<$Res> {
  __$$FriendsRejectRequestImplCopyWithImpl(_$FriendsRejectRequestImpl _value,
      $Res Function(_$FriendsRejectRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendshipId = null,
  }) {
    return _then(_$FriendsRejectRequestImpl(
      null == friendshipId
          ? _value.friendshipId
          : friendshipId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FriendsRejectRequestImpl implements FriendsRejectRequest {
  const _$FriendsRejectRequestImpl(this.friendshipId);

  @override
  final String friendshipId;

  @override
  String toString() {
    return 'FriendsEvent.rejectRequest(friendshipId: $friendshipId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsRejectRequestImpl &&
            (identical(other.friendshipId, friendshipId) ||
                other.friendshipId == friendshipId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, friendshipId);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendsRejectRequestImplCopyWith<_$FriendsRejectRequestImpl>
      get copyWith =>
          __$$FriendsRejectRequestImplCopyWithImpl<_$FriendsRejectRequestImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFriends,
    required TResult Function() loadPendingRequests,
    required TResult Function() refreshFriends,
    required TResult Function() refreshPendingRequests,
    required TResult Function(String email) sendFriendRequest,
    required TResult Function(String friendshipId) acceptRequest,
    required TResult Function(String friendshipId) rejectRequest,
    required TResult Function(String friendshipId) removeFriend,
  }) {
    return rejectRequest(friendshipId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFriends,
    TResult? Function()? loadPendingRequests,
    TResult? Function()? refreshFriends,
    TResult? Function()? refreshPendingRequests,
    TResult? Function(String email)? sendFriendRequest,
    TResult? Function(String friendshipId)? acceptRequest,
    TResult? Function(String friendshipId)? rejectRequest,
    TResult? Function(String friendshipId)? removeFriend,
  }) {
    return rejectRequest?.call(friendshipId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFriends,
    TResult Function()? loadPendingRequests,
    TResult Function()? refreshFriends,
    TResult Function()? refreshPendingRequests,
    TResult Function(String email)? sendFriendRequest,
    TResult Function(String friendshipId)? acceptRequest,
    TResult Function(String friendshipId)? rejectRequest,
    TResult Function(String friendshipId)? removeFriend,
    required TResult orElse(),
  }) {
    if (rejectRequest != null) {
      return rejectRequest(friendshipId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FriendsLoadFriends value) loadFriends,
    required TResult Function(FriendsLoadPendingRequests value)
        loadPendingRequests,
    required TResult Function(FriendsRefreshFriends value) refreshFriends,
    required TResult Function(FriendsRefreshPendingRequests value)
        refreshPendingRequests,
    required TResult Function(FriendsSendFriendRequest value) sendFriendRequest,
    required TResult Function(FriendsAcceptRequest value) acceptRequest,
    required TResult Function(FriendsRejectRequest value) rejectRequest,
    required TResult Function(FriendsRemoveFriend value) removeFriend,
  }) {
    return rejectRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FriendsLoadFriends value)? loadFriends,
    TResult? Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult? Function(FriendsRefreshFriends value)? refreshFriends,
    TResult? Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult? Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult? Function(FriendsAcceptRequest value)? acceptRequest,
    TResult? Function(FriendsRejectRequest value)? rejectRequest,
    TResult? Function(FriendsRemoveFriend value)? removeFriend,
  }) {
    return rejectRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FriendsLoadFriends value)? loadFriends,
    TResult Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult Function(FriendsRefreshFriends value)? refreshFriends,
    TResult Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult Function(FriendsAcceptRequest value)? acceptRequest,
    TResult Function(FriendsRejectRequest value)? rejectRequest,
    TResult Function(FriendsRemoveFriend value)? removeFriend,
    required TResult orElse(),
  }) {
    if (rejectRequest != null) {
      return rejectRequest(this);
    }
    return orElse();
  }
}

abstract class FriendsRejectRequest implements FriendsEvent {
  const factory FriendsRejectRequest(final String friendshipId) =
      _$FriendsRejectRequestImpl;

  String get friendshipId;

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendsRejectRequestImplCopyWith<_$FriendsRejectRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FriendsRemoveFriendImplCopyWith<$Res> {
  factory _$$FriendsRemoveFriendImplCopyWith(_$FriendsRemoveFriendImpl value,
          $Res Function(_$FriendsRemoveFriendImpl) then) =
      __$$FriendsRemoveFriendImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String friendshipId});
}

/// @nodoc
class __$$FriendsRemoveFriendImplCopyWithImpl<$Res>
    extends _$FriendsEventCopyWithImpl<$Res, _$FriendsRemoveFriendImpl>
    implements _$$FriendsRemoveFriendImplCopyWith<$Res> {
  __$$FriendsRemoveFriendImplCopyWithImpl(_$FriendsRemoveFriendImpl _value,
      $Res Function(_$FriendsRemoveFriendImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendshipId = null,
  }) {
    return _then(_$FriendsRemoveFriendImpl(
      null == friendshipId
          ? _value.friendshipId
          : friendshipId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FriendsRemoveFriendImpl implements FriendsRemoveFriend {
  const _$FriendsRemoveFriendImpl(this.friendshipId);

  @override
  final String friendshipId;

  @override
  String toString() {
    return 'FriendsEvent.removeFriend(friendshipId: $friendshipId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsRemoveFriendImpl &&
            (identical(other.friendshipId, friendshipId) ||
                other.friendshipId == friendshipId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, friendshipId);

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendsRemoveFriendImplCopyWith<_$FriendsRemoveFriendImpl> get copyWith =>
      __$$FriendsRemoveFriendImplCopyWithImpl<_$FriendsRemoveFriendImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFriends,
    required TResult Function() loadPendingRequests,
    required TResult Function() refreshFriends,
    required TResult Function() refreshPendingRequests,
    required TResult Function(String email) sendFriendRequest,
    required TResult Function(String friendshipId) acceptRequest,
    required TResult Function(String friendshipId) rejectRequest,
    required TResult Function(String friendshipId) removeFriend,
  }) {
    return removeFriend(friendshipId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFriends,
    TResult? Function()? loadPendingRequests,
    TResult? Function()? refreshFriends,
    TResult? Function()? refreshPendingRequests,
    TResult? Function(String email)? sendFriendRequest,
    TResult? Function(String friendshipId)? acceptRequest,
    TResult? Function(String friendshipId)? rejectRequest,
    TResult? Function(String friendshipId)? removeFriend,
  }) {
    return removeFriend?.call(friendshipId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFriends,
    TResult Function()? loadPendingRequests,
    TResult Function()? refreshFriends,
    TResult Function()? refreshPendingRequests,
    TResult Function(String email)? sendFriendRequest,
    TResult Function(String friendshipId)? acceptRequest,
    TResult Function(String friendshipId)? rejectRequest,
    TResult Function(String friendshipId)? removeFriend,
    required TResult orElse(),
  }) {
    if (removeFriend != null) {
      return removeFriend(friendshipId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FriendsLoadFriends value) loadFriends,
    required TResult Function(FriendsLoadPendingRequests value)
        loadPendingRequests,
    required TResult Function(FriendsRefreshFriends value) refreshFriends,
    required TResult Function(FriendsRefreshPendingRequests value)
        refreshPendingRequests,
    required TResult Function(FriendsSendFriendRequest value) sendFriendRequest,
    required TResult Function(FriendsAcceptRequest value) acceptRequest,
    required TResult Function(FriendsRejectRequest value) rejectRequest,
    required TResult Function(FriendsRemoveFriend value) removeFriend,
  }) {
    return removeFriend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FriendsLoadFriends value)? loadFriends,
    TResult? Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult? Function(FriendsRefreshFriends value)? refreshFriends,
    TResult? Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult? Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult? Function(FriendsAcceptRequest value)? acceptRequest,
    TResult? Function(FriendsRejectRequest value)? rejectRequest,
    TResult? Function(FriendsRemoveFriend value)? removeFriend,
  }) {
    return removeFriend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FriendsLoadFriends value)? loadFriends,
    TResult Function(FriendsLoadPendingRequests value)? loadPendingRequests,
    TResult Function(FriendsRefreshFriends value)? refreshFriends,
    TResult Function(FriendsRefreshPendingRequests value)?
        refreshPendingRequests,
    TResult Function(FriendsSendFriendRequest value)? sendFriendRequest,
    TResult Function(FriendsAcceptRequest value)? acceptRequest,
    TResult Function(FriendsRejectRequest value)? rejectRequest,
    TResult Function(FriendsRemoveFriend value)? removeFriend,
    required TResult orElse(),
  }) {
    if (removeFriend != null) {
      return removeFriend(this);
    }
    return orElse();
  }
}

abstract class FriendsRemoveFriend implements FriendsEvent {
  const factory FriendsRemoveFriend(final String friendshipId) =
      _$FriendsRemoveFriendImpl;

  String get friendshipId;

  /// Create a copy of FriendsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendsRemoveFriendImplCopyWith<_$FriendsRemoveFriendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
