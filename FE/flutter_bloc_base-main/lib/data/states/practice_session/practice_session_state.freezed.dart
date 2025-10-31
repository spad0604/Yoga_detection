// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practice_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PracticeSessionState {
  PracticeSession? get session => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  PoseSubmissionResult? get lastSubmission =>
      throw _privateConstructorUsedError;

  /// Create a copy of PracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PracticeSessionStateCopyWith<PracticeSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PracticeSessionStateCopyWith<$Res> {
  factory $PracticeSessionStateCopyWith(PracticeSessionState value,
          $Res Function(PracticeSessionState) then) =
      _$PracticeSessionStateCopyWithImpl<$Res, PracticeSessionState>;
  @useResult
  $Res call(
      {PracticeSession? session,
      bool isLoading,
      bool isSubmitting,
      String? error,
      PoseSubmissionResult? lastSubmission});

  $PracticeSessionCopyWith<$Res>? get session;
  $PoseSubmissionResultCopyWith<$Res>? get lastSubmission;
}

/// @nodoc
class _$PracticeSessionStateCopyWithImpl<$Res,
        $Val extends PracticeSessionState>
    implements $PracticeSessionStateCopyWith<$Res> {
  _$PracticeSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? error = freezed,
    Object? lastSubmission = freezed,
  }) {
    return _then(_value.copyWith(
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as PracticeSession?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSubmission: freezed == lastSubmission
          ? _value.lastSubmission
          : lastSubmission // ignore: cast_nullable_to_non_nullable
              as PoseSubmissionResult?,
    ) as $Val);
  }

  /// Create a copy of PracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PracticeSessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $PracticeSessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }

  /// Create a copy of PracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PoseSubmissionResultCopyWith<$Res>? get lastSubmission {
    if (_value.lastSubmission == null) {
      return null;
    }

    return $PoseSubmissionResultCopyWith<$Res>(_value.lastSubmission!, (value) {
      return _then(_value.copyWith(lastSubmission: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PracticeSessionStateImplCopyWith<$Res>
    implements $PracticeSessionStateCopyWith<$Res> {
  factory _$$PracticeSessionStateImplCopyWith(_$PracticeSessionStateImpl value,
          $Res Function(_$PracticeSessionStateImpl) then) =
      __$$PracticeSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PracticeSession? session,
      bool isLoading,
      bool isSubmitting,
      String? error,
      PoseSubmissionResult? lastSubmission});

  @override
  $PracticeSessionCopyWith<$Res>? get session;
  @override
  $PoseSubmissionResultCopyWith<$Res>? get lastSubmission;
}

/// @nodoc
class __$$PracticeSessionStateImplCopyWithImpl<$Res>
    extends _$PracticeSessionStateCopyWithImpl<$Res, _$PracticeSessionStateImpl>
    implements _$$PracticeSessionStateImplCopyWith<$Res> {
  __$$PracticeSessionStateImplCopyWithImpl(_$PracticeSessionStateImpl _value,
      $Res Function(_$PracticeSessionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? isLoading = null,
    Object? isSubmitting = null,
    Object? error = freezed,
    Object? lastSubmission = freezed,
  }) {
    return _then(_$PracticeSessionStateImpl(
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as PracticeSession?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSubmission: freezed == lastSubmission
          ? _value.lastSubmission
          : lastSubmission // ignore: cast_nullable_to_non_nullable
              as PoseSubmissionResult?,
    ));
  }
}

/// @nodoc

class _$PracticeSessionStateImpl implements _PracticeSessionState {
  const _$PracticeSessionStateImpl(
      {this.session,
      this.isLoading = false,
      this.isSubmitting = false,
      this.error,
      this.lastSubmission});

  @override
  final PracticeSession? session;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? error;
  @override
  final PoseSubmissionResult? lastSubmission;

  @override
  String toString() {
    return 'PracticeSessionState(session: $session, isLoading: $isLoading, isSubmitting: $isSubmitting, error: $error, lastSubmission: $lastSubmission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PracticeSessionStateImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.lastSubmission, lastSubmission) ||
                other.lastSubmission == lastSubmission));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, session, isLoading, isSubmitting, error, lastSubmission);

  /// Create a copy of PracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PracticeSessionStateImplCopyWith<_$PracticeSessionStateImpl>
      get copyWith =>
          __$$PracticeSessionStateImplCopyWithImpl<_$PracticeSessionStateImpl>(
              this, _$identity);
}

abstract class _PracticeSessionState implements PracticeSessionState {
  const factory _PracticeSessionState(
      {final PracticeSession? session,
      final bool isLoading,
      final bool isSubmitting,
      final String? error,
      final PoseSubmissionResult? lastSubmission}) = _$PracticeSessionStateImpl;

  @override
  PracticeSession? get session;
  @override
  bool get isLoading;
  @override
  bool get isSubmitting;
  @override
  String? get error;
  @override
  PoseSubmissionResult? get lastSubmission;

  /// Create a copy of PracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PracticeSessionStateImplCopyWith<_$PracticeSessionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
