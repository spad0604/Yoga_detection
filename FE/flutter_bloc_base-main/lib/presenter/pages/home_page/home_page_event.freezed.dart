// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() started,
    required TResult Function(String code) fetchYogaPoses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? started,
    TResult? Function(String code)? fetchYogaPoses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? started,
    TResult Function(String code)? fetchYogaPoses,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageErrorOccurred value) errorOccurred,
    required TResult Function(HomePageStarted value) started,
    required TResult Function(HomePageFetchYogaPoses value) fetchYogaPoses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageErrorOccurred value)? errorOccurred,
    TResult? Function(HomePageStarted value)? started,
    TResult? Function(HomePageFetchYogaPoses value)? fetchYogaPoses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageErrorOccurred value)? errorOccurred,
    TResult Function(HomePageStarted value)? started,
    TResult Function(HomePageFetchYogaPoses value)? fetchYogaPoses,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageEventCopyWith<$Res> {
  factory $HomePageEventCopyWith(
          HomePageEvent value, $Res Function(HomePageEvent) then) =
      _$HomePageEventCopyWithImpl<$Res, HomePageEvent>;
}

/// @nodoc
class _$HomePageEventCopyWithImpl<$Res, $Val extends HomePageEvent>
    implements $HomePageEventCopyWith<$Res> {
  _$HomePageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomePageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomePageErrorOccurredImplCopyWith<$Res> {
  factory _$$HomePageErrorOccurredImplCopyWith(
          _$HomePageErrorOccurredImpl value,
          $Res Function(_$HomePageErrorOccurredImpl) then) =
      __$$HomePageErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class __$$HomePageErrorOccurredImplCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res, _$HomePageErrorOccurredImpl>
    implements _$$HomePageErrorOccurredImplCopyWith<$Res> {
  __$$HomePageErrorOccurredImplCopyWithImpl(_$HomePageErrorOccurredImpl _value,
      $Res Function(_$HomePageErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$HomePageErrorOccurredImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$HomePageErrorOccurredImpl implements HomePageErrorOccurred {
  const _$HomePageErrorOccurredImpl([this.error]);

  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'HomePageEvent.errorOccurred(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageErrorOccurredImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HomePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageErrorOccurredImplCopyWith<_$HomePageErrorOccurredImpl>
      get copyWith => __$$HomePageErrorOccurredImplCopyWithImpl<
          _$HomePageErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() started,
    required TResult Function(String code) fetchYogaPoses,
  }) {
    return errorOccurred(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? started,
    TResult? Function(String code)? fetchYogaPoses,
  }) {
    return errorOccurred?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? started,
    TResult Function(String code)? fetchYogaPoses,
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
    required TResult Function(HomePageErrorOccurred value) errorOccurred,
    required TResult Function(HomePageStarted value) started,
    required TResult Function(HomePageFetchYogaPoses value) fetchYogaPoses,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageErrorOccurred value)? errorOccurred,
    TResult? Function(HomePageStarted value)? started,
    TResult? Function(HomePageFetchYogaPoses value)? fetchYogaPoses,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageErrorOccurred value)? errorOccurred,
    TResult Function(HomePageStarted value)? started,
    TResult Function(HomePageFetchYogaPoses value)? fetchYogaPoses,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class HomePageErrorOccurred implements HomePageEvent {
  const factory HomePageErrorOccurred([final BaseException<dynamic>? error]) =
      _$HomePageErrorOccurredImpl;

  BaseException<dynamic>? get error;

  /// Create a copy of HomePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageErrorOccurredImplCopyWith<_$HomePageErrorOccurredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomePageStartedImplCopyWith<$Res> {
  factory _$$HomePageStartedImplCopyWith(_$HomePageStartedImpl value,
          $Res Function(_$HomePageStartedImpl) then) =
      __$$HomePageStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomePageStartedImplCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res, _$HomePageStartedImpl>
    implements _$$HomePageStartedImplCopyWith<$Res> {
  __$$HomePageStartedImplCopyWithImpl(
      _$HomePageStartedImpl _value, $Res Function(_$HomePageStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomePageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomePageStartedImpl implements HomePageStarted {
  const _$HomePageStartedImpl();

  @override
  String toString() {
    return 'HomePageEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomePageStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() started,
    required TResult Function(String code) fetchYogaPoses,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? started,
    TResult? Function(String code)? fetchYogaPoses,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? started,
    TResult Function(String code)? fetchYogaPoses,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageErrorOccurred value) errorOccurred,
    required TResult Function(HomePageStarted value) started,
    required TResult Function(HomePageFetchYogaPoses value) fetchYogaPoses,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageErrorOccurred value)? errorOccurred,
    TResult? Function(HomePageStarted value)? started,
    TResult? Function(HomePageFetchYogaPoses value)? fetchYogaPoses,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageErrorOccurred value)? errorOccurred,
    TResult Function(HomePageStarted value)? started,
    TResult Function(HomePageFetchYogaPoses value)? fetchYogaPoses,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class HomePageStarted implements HomePageEvent {
  const factory HomePageStarted() = _$HomePageStartedImpl;
}

/// @nodoc
abstract class _$$HomePageFetchYogaPosesImplCopyWith<$Res> {
  factory _$$HomePageFetchYogaPosesImplCopyWith(
          _$HomePageFetchYogaPosesImpl value,
          $Res Function(_$HomePageFetchYogaPosesImpl) then) =
      __$$HomePageFetchYogaPosesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$HomePageFetchYogaPosesImplCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res, _$HomePageFetchYogaPosesImpl>
    implements _$$HomePageFetchYogaPosesImplCopyWith<$Res> {
  __$$HomePageFetchYogaPosesImplCopyWithImpl(
      _$HomePageFetchYogaPosesImpl _value,
      $Res Function(_$HomePageFetchYogaPosesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$HomePageFetchYogaPosesImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomePageFetchYogaPosesImpl implements HomePageFetchYogaPoses {
  const _$HomePageFetchYogaPosesImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'HomePageEvent.fetchYogaPoses(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageFetchYogaPosesImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of HomePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageFetchYogaPosesImplCopyWith<_$HomePageFetchYogaPosesImpl>
      get copyWith => __$$HomePageFetchYogaPosesImplCopyWithImpl<
          _$HomePageFetchYogaPosesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() started,
    required TResult Function(String code) fetchYogaPoses,
  }) {
    return fetchYogaPoses(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? started,
    TResult? Function(String code)? fetchYogaPoses,
  }) {
    return fetchYogaPoses?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? started,
    TResult Function(String code)? fetchYogaPoses,
    required TResult orElse(),
  }) {
    if (fetchYogaPoses != null) {
      return fetchYogaPoses(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageErrorOccurred value) errorOccurred,
    required TResult Function(HomePageStarted value) started,
    required TResult Function(HomePageFetchYogaPoses value) fetchYogaPoses,
  }) {
    return fetchYogaPoses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageErrorOccurred value)? errorOccurred,
    TResult? Function(HomePageStarted value)? started,
    TResult? Function(HomePageFetchYogaPoses value)? fetchYogaPoses,
  }) {
    return fetchYogaPoses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageErrorOccurred value)? errorOccurred,
    TResult Function(HomePageStarted value)? started,
    TResult Function(HomePageFetchYogaPoses value)? fetchYogaPoses,
    required TResult orElse(),
  }) {
    if (fetchYogaPoses != null) {
      return fetchYogaPoses(this);
    }
    return orElse();
  }
}

abstract class HomePageFetchYogaPoses implements HomePageEvent {
  const factory HomePageFetchYogaPoses(final String code) =
      _$HomePageFetchYogaPosesImpl;

  String get code;

  /// Create a copy of HomePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageFetchYogaPosesImplCopyWith<_$HomePageFetchYogaPosesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
