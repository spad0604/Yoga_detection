// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activities_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActivitiesState {
  List<UserActivityResponse> get friendActivities =>
      throw _privateConstructorUsedError;
  List<UserActivityResponse> get myActivities =>
      throw _privateConstructorUsedError;
  bool get isLoadingFriends => throw _privateConstructorUsedError;
  bool get isLoadingMe => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ActivitiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivitiesStateCopyWith<ActivitiesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivitiesStateCopyWith<$Res> {
  factory $ActivitiesStateCopyWith(
          ActivitiesState value, $Res Function(ActivitiesState) then) =
      _$ActivitiesStateCopyWithImpl<$Res, ActivitiesState>;
  @useResult
  $Res call(
      {List<UserActivityResponse> friendActivities,
      List<UserActivityResponse> myActivities,
      bool isLoadingFriends,
      bool isLoadingMe,
      String? error});
}

/// @nodoc
class _$ActivitiesStateCopyWithImpl<$Res, $Val extends ActivitiesState>
    implements $ActivitiesStateCopyWith<$Res> {
  _$ActivitiesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivitiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendActivities = null,
    Object? myActivities = null,
    Object? isLoadingFriends = null,
    Object? isLoadingMe = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      friendActivities: null == friendActivities
          ? _value.friendActivities
          : friendActivities // ignore: cast_nullable_to_non_nullable
              as List<UserActivityResponse>,
      myActivities: null == myActivities
          ? _value.myActivities
          : myActivities // ignore: cast_nullable_to_non_nullable
              as List<UserActivityResponse>,
      isLoadingFriends: null == isLoadingFriends
          ? _value.isLoadingFriends
          : isLoadingFriends // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMe: null == isLoadingMe
          ? _value.isLoadingMe
          : isLoadingMe // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivitiesStateImplCopyWith<$Res>
    implements $ActivitiesStateCopyWith<$Res> {
  factory _$$ActivitiesStateImplCopyWith(_$ActivitiesStateImpl value,
          $Res Function(_$ActivitiesStateImpl) then) =
      __$$ActivitiesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserActivityResponse> friendActivities,
      List<UserActivityResponse> myActivities,
      bool isLoadingFriends,
      bool isLoadingMe,
      String? error});
}

/// @nodoc
class __$$ActivitiesStateImplCopyWithImpl<$Res>
    extends _$ActivitiesStateCopyWithImpl<$Res, _$ActivitiesStateImpl>
    implements _$$ActivitiesStateImplCopyWith<$Res> {
  __$$ActivitiesStateImplCopyWithImpl(
      _$ActivitiesStateImpl _value, $Res Function(_$ActivitiesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivitiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendActivities = null,
    Object? myActivities = null,
    Object? isLoadingFriends = null,
    Object? isLoadingMe = null,
    Object? error = freezed,
  }) {
    return _then(_$ActivitiesStateImpl(
      friendActivities: null == friendActivities
          ? _value._friendActivities
          : friendActivities // ignore: cast_nullable_to_non_nullable
              as List<UserActivityResponse>,
      myActivities: null == myActivities
          ? _value._myActivities
          : myActivities // ignore: cast_nullable_to_non_nullable
              as List<UserActivityResponse>,
      isLoadingFriends: null == isLoadingFriends
          ? _value.isLoadingFriends
          : isLoadingFriends // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMe: null == isLoadingMe
          ? _value.isLoadingMe
          : isLoadingMe // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ActivitiesStateImpl implements _ActivitiesState {
  const _$ActivitiesStateImpl(
      {final List<UserActivityResponse> friendActivities = const [],
      final List<UserActivityResponse> myActivities = const [],
      this.isLoadingFriends = false,
      this.isLoadingMe = false,
      this.error})
      : _friendActivities = friendActivities,
        _myActivities = myActivities;

  final List<UserActivityResponse> _friendActivities;
  @override
  @JsonKey()
  List<UserActivityResponse> get friendActivities {
    if (_friendActivities is EqualUnmodifiableListView)
      return _friendActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendActivities);
  }

  final List<UserActivityResponse> _myActivities;
  @override
  @JsonKey()
  List<UserActivityResponse> get myActivities {
    if (_myActivities is EqualUnmodifiableListView) return _myActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myActivities);
  }

  @override
  @JsonKey()
  final bool isLoadingFriends;
  @override
  @JsonKey()
  final bool isLoadingMe;
  @override
  final String? error;

  @override
  String toString() {
    return 'ActivitiesState(friendActivities: $friendActivities, myActivities: $myActivities, isLoadingFriends: $isLoadingFriends, isLoadingMe: $isLoadingMe, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivitiesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._friendActivities, _friendActivities) &&
            const DeepCollectionEquality()
                .equals(other._myActivities, _myActivities) &&
            (identical(other.isLoadingFriends, isLoadingFriends) ||
                other.isLoadingFriends == isLoadingFriends) &&
            (identical(other.isLoadingMe, isLoadingMe) ||
                other.isLoadingMe == isLoadingMe) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_friendActivities),
      const DeepCollectionEquality().hash(_myActivities),
      isLoadingFriends,
      isLoadingMe,
      error);

  /// Create a copy of ActivitiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivitiesStateImplCopyWith<_$ActivitiesStateImpl> get copyWith =>
      __$$ActivitiesStateImplCopyWithImpl<_$ActivitiesStateImpl>(
          this, _$identity);
}

abstract class _ActivitiesState implements ActivitiesState {
  const factory _ActivitiesState(
      {final List<UserActivityResponse> friendActivities,
      final List<UserActivityResponse> myActivities,
      final bool isLoadingFriends,
      final bool isLoadingMe,
      final String? error}) = _$ActivitiesStateImpl;

  @override
  List<UserActivityResponse> get friendActivities;
  @override
  List<UserActivityResponse> get myActivities;
  @override
  bool get isLoadingFriends;
  @override
  bool get isLoadingMe;
  @override
  String? get error;

  /// Create a copy of ActivitiesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivitiesStateImplCopyWith<_$ActivitiesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
