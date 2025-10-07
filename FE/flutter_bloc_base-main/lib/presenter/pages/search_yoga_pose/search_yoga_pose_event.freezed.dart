// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_yoga_pose_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchYogaPoseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(GetListYogaPosesParams params) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(GetListYogaPosesParams params)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(GetListYogaPosesParams params)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchYogaPoseErrorOccurred value) errorOccurred,
    required TResult Function(SearchYogaPoseStarted value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchYogaPoseErrorOccurred value)? errorOccurred,
    TResult? Function(SearchYogaPoseStarted value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchYogaPoseErrorOccurred value)? errorOccurred,
    TResult Function(SearchYogaPoseStarted value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchYogaPoseEventCopyWith<$Res> {
  factory $SearchYogaPoseEventCopyWith(
          SearchYogaPoseEvent value, $Res Function(SearchYogaPoseEvent) then) =
      _$SearchYogaPoseEventCopyWithImpl<$Res, SearchYogaPoseEvent>;
}

/// @nodoc
class _$SearchYogaPoseEventCopyWithImpl<$Res, $Val extends SearchYogaPoseEvent>
    implements $SearchYogaPoseEventCopyWith<$Res> {
  _$SearchYogaPoseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchYogaPoseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SearchYogaPoseErrorOccurredImplCopyWith<$Res> {
  factory _$$SearchYogaPoseErrorOccurredImplCopyWith(
          _$SearchYogaPoseErrorOccurredImpl value,
          $Res Function(_$SearchYogaPoseErrorOccurredImpl) then) =
      __$$SearchYogaPoseErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class __$$SearchYogaPoseErrorOccurredImplCopyWithImpl<$Res>
    extends _$SearchYogaPoseEventCopyWithImpl<$Res,
        _$SearchYogaPoseErrorOccurredImpl>
    implements _$$SearchYogaPoseErrorOccurredImplCopyWith<$Res> {
  __$$SearchYogaPoseErrorOccurredImplCopyWithImpl(
      _$SearchYogaPoseErrorOccurredImpl _value,
      $Res Function(_$SearchYogaPoseErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchYogaPoseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$SearchYogaPoseErrorOccurredImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$SearchYogaPoseErrorOccurredImpl implements SearchYogaPoseErrorOccurred {
  const _$SearchYogaPoseErrorOccurredImpl([this.error]);

  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'SearchYogaPoseEvent.errorOccurred(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchYogaPoseErrorOccurredImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SearchYogaPoseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchYogaPoseErrorOccurredImplCopyWith<_$SearchYogaPoseErrorOccurredImpl>
      get copyWith => __$$SearchYogaPoseErrorOccurredImplCopyWithImpl<
          _$SearchYogaPoseErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(GetListYogaPosesParams params) started,
  }) {
    return errorOccurred(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(GetListYogaPosesParams params)? started,
  }) {
    return errorOccurred?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(GetListYogaPosesParams params)? started,
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
    required TResult Function(SearchYogaPoseErrorOccurred value) errorOccurred,
    required TResult Function(SearchYogaPoseStarted value) started,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchYogaPoseErrorOccurred value)? errorOccurred,
    TResult? Function(SearchYogaPoseStarted value)? started,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchYogaPoseErrorOccurred value)? errorOccurred,
    TResult Function(SearchYogaPoseStarted value)? started,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class SearchYogaPoseErrorOccurred implements SearchYogaPoseEvent {
  const factory SearchYogaPoseErrorOccurred(
          [final BaseException<dynamic>? error]) =
      _$SearchYogaPoseErrorOccurredImpl;

  BaseException<dynamic>? get error;

  /// Create a copy of SearchYogaPoseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchYogaPoseErrorOccurredImplCopyWith<_$SearchYogaPoseErrorOccurredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchYogaPoseStartedImplCopyWith<$Res> {
  factory _$$SearchYogaPoseStartedImplCopyWith(
          _$SearchYogaPoseStartedImpl value,
          $Res Function(_$SearchYogaPoseStartedImpl) then) =
      __$$SearchYogaPoseStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetListYogaPosesParams params});
}

/// @nodoc
class __$$SearchYogaPoseStartedImplCopyWithImpl<$Res>
    extends _$SearchYogaPoseEventCopyWithImpl<$Res, _$SearchYogaPoseStartedImpl>
    implements _$$SearchYogaPoseStartedImplCopyWith<$Res> {
  __$$SearchYogaPoseStartedImplCopyWithImpl(_$SearchYogaPoseStartedImpl _value,
      $Res Function(_$SearchYogaPoseStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchYogaPoseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$SearchYogaPoseStartedImpl(
      null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as GetListYogaPosesParams,
    ));
  }
}

/// @nodoc

class _$SearchYogaPoseStartedImpl implements SearchYogaPoseStarted {
  const _$SearchYogaPoseStartedImpl(this.params);

  @override
  final GetListYogaPosesParams params;

  @override
  String toString() {
    return 'SearchYogaPoseEvent.started(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchYogaPoseStartedImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  /// Create a copy of SearchYogaPoseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchYogaPoseStartedImplCopyWith<_$SearchYogaPoseStartedImpl>
      get copyWith => __$$SearchYogaPoseStartedImplCopyWithImpl<
          _$SearchYogaPoseStartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(GetListYogaPosesParams params) started,
  }) {
    return started(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(GetListYogaPosesParams params)? started,
  }) {
    return started?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(GetListYogaPosesParams params)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchYogaPoseErrorOccurred value) errorOccurred,
    required TResult Function(SearchYogaPoseStarted value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchYogaPoseErrorOccurred value)? errorOccurred,
    TResult? Function(SearchYogaPoseStarted value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchYogaPoseErrorOccurred value)? errorOccurred,
    TResult Function(SearchYogaPoseStarted value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class SearchYogaPoseStarted implements SearchYogaPoseEvent {
  const factory SearchYogaPoseStarted(final GetListYogaPosesParams params) =
      _$SearchYogaPoseStartedImpl;

  GetListYogaPosesParams get params;

  /// Create a copy of SearchYogaPoseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchYogaPoseStartedImplCopyWith<_$SearchYogaPoseStartedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
