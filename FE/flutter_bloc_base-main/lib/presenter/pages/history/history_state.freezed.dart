// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryState {
  HistoryStatus get status => throw _privateConstructorUsedError;
  List<UserYogaPoseModel> get poses => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  UserYogaPoseModel? get selectedPose => throw _privateConstructorUsedError;
  BaseException<dynamic>? get error => throw _privateConstructorUsedError;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
  @useResult
  $Res call(
      {HistoryStatus status,
      List<UserYogaPoseModel> poses,
      int currentPage,
      bool hasMore,
      UserYogaPoseModel? selectedPose,
      BaseException<dynamic>? error});

  $UserYogaPoseModelCopyWith<$Res>? get selectedPose;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? poses = null,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? selectedPose = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HistoryStatus,
      poses: null == poses
          ? _value.poses
          : poses // ignore: cast_nullable_to_non_nullable
              as List<UserYogaPoseModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPose: freezed == selectedPose
          ? _value.selectedPose
          : selectedPose // ignore: cast_nullable_to_non_nullable
              as UserYogaPoseModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ) as $Val);
  }

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserYogaPoseModelCopyWith<$Res>? get selectedPose {
    if (_value.selectedPose == null) {
      return null;
    }

    return $UserYogaPoseModelCopyWith<$Res>(_value.selectedPose!, (value) {
      return _then(_value.copyWith(selectedPose: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryStateImplCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory _$$HistoryStateImplCopyWith(
          _$HistoryStateImpl value, $Res Function(_$HistoryStateImpl) then) =
      __$$HistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HistoryStatus status,
      List<UserYogaPoseModel> poses,
      int currentPage,
      bool hasMore,
      UserYogaPoseModel? selectedPose,
      BaseException<dynamic>? error});

  @override
  $UserYogaPoseModelCopyWith<$Res>? get selectedPose;
}

/// @nodoc
class __$$HistoryStateImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateImpl>
    implements _$$HistoryStateImplCopyWith<$Res> {
  __$$HistoryStateImplCopyWithImpl(
      _$HistoryStateImpl _value, $Res Function(_$HistoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? poses = null,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? selectedPose = freezed,
    Object? error = freezed,
  }) {
    return _then(_$HistoryStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HistoryStatus,
      poses: null == poses
          ? _value._poses
          : poses // ignore: cast_nullable_to_non_nullable
              as List<UserYogaPoseModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPose: freezed == selectedPose
          ? _value.selectedPose
          : selectedPose // ignore: cast_nullable_to_non_nullable
              as UserYogaPoseModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$HistoryStateImpl implements _HistoryState {
  const _$HistoryStateImpl(
      {this.status = HistoryStatus.initial,
      final List<UserYogaPoseModel> poses = const [],
      this.currentPage = 0,
      this.hasMore = false,
      this.selectedPose,
      this.error})
      : _poses = poses;

  @override
  @JsonKey()
  final HistoryStatus status;
  final List<UserYogaPoseModel> _poses;
  @override
  @JsonKey()
  List<UserYogaPoseModel> get poses {
    if (_poses is EqualUnmodifiableListView) return _poses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poses);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final UserYogaPoseModel? selectedPose;
  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'HistoryState(status: $status, poses: $poses, currentPage: $currentPage, hasMore: $hasMore, selectedPose: $selectedPose, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._poses, _poses) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.selectedPose, selectedPose) ||
                other.selectedPose == selectedPose) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_poses),
      currentPage,
      hasMore,
      selectedPose,
      error);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      __$$HistoryStateImplCopyWithImpl<_$HistoryStateImpl>(this, _$identity);
}

abstract class _HistoryState implements HistoryState {
  const factory _HistoryState(
      {final HistoryStatus status,
      final List<UserYogaPoseModel> poses,
      final int currentPage,
      final bool hasMore,
      final UserYogaPoseModel? selectedPose,
      final BaseException<dynamic>? error}) = _$HistoryStateImpl;

  @override
  HistoryStatus get status;
  @override
  List<UserYogaPoseModel> get poses;
  @override
  int get currentPage;
  @override
  bool get hasMore;
  @override
  UserYogaPoseModel? get selectedPose;
  @override
  BaseException<dynamic>? get error;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
