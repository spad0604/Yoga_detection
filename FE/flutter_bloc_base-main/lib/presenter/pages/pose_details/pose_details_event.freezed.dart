// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pose_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PoseDetailsEvent {
  BaseException<dynamic>? get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PoseDetailsErrorOccurred value) errorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PoseDetailsErrorOccurred value)? errorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PoseDetailsErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PoseDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoseDetailsEventCopyWith<PoseDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoseDetailsEventCopyWith<$Res> {
  factory $PoseDetailsEventCopyWith(
          PoseDetailsEvent value, $Res Function(PoseDetailsEvent) then) =
      _$PoseDetailsEventCopyWithImpl<$Res, PoseDetailsEvent>;
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class _$PoseDetailsEventCopyWithImpl<$Res, $Val extends PoseDetailsEvent>
    implements $PoseDetailsEventCopyWith<$Res> {
  _$PoseDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoseDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoseDetailsErrorOccurredImplCopyWith<$Res>
    implements $PoseDetailsEventCopyWith<$Res> {
  factory _$$PoseDetailsErrorOccurredImplCopyWith(
          _$PoseDetailsErrorOccurredImpl value,
          $Res Function(_$PoseDetailsErrorOccurredImpl) then) =
      __$$PoseDetailsErrorOccurredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class __$$PoseDetailsErrorOccurredImplCopyWithImpl<$Res>
    extends _$PoseDetailsEventCopyWithImpl<$Res, _$PoseDetailsErrorOccurredImpl>
    implements _$$PoseDetailsErrorOccurredImplCopyWith<$Res> {
  __$$PoseDetailsErrorOccurredImplCopyWithImpl(
      _$PoseDetailsErrorOccurredImpl _value,
      $Res Function(_$PoseDetailsErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoseDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$PoseDetailsErrorOccurredImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$PoseDetailsErrorOccurredImpl implements PoseDetailsErrorOccurred {
  const _$PoseDetailsErrorOccurredImpl([this.error]);

  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'PoseDetailsEvent.errorOccurred(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoseDetailsErrorOccurredImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PoseDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoseDetailsErrorOccurredImplCopyWith<_$PoseDetailsErrorOccurredImpl>
      get copyWith => __$$PoseDetailsErrorOccurredImplCopyWithImpl<
          _$PoseDetailsErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
  }) {
    return errorOccurred(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
  }) {
    return errorOccurred?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PoseDetailsErrorOccurred value) errorOccurred,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PoseDetailsErrorOccurred value)? errorOccurred,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PoseDetailsErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class PoseDetailsErrorOccurred implements PoseDetailsEvent {
  const factory PoseDetailsErrorOccurred(
      [final BaseException<dynamic>? error]) = _$PoseDetailsErrorOccurredImpl;

  @override
  BaseException<dynamic>? get error;

  /// Create a copy of PoseDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoseDetailsErrorOccurredImplCopyWith<_$PoseDetailsErrorOccurredImpl>
      get copyWith => throw _privateConstructorUsedError;
}
