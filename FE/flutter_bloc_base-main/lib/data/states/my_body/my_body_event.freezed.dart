// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_body_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyBodyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(CreateBodyProgressRequest request)
        createRequested,
    required TResult Function() loadLatestRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(CreateBodyProgressRequest request)? createRequested,
    TResult? Function()? loadLatestRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(CreateBodyProgressRequest request)? createRequested,
    TResult Function()? loadLatestRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyBodyLoadRequested value) loadRequested,
    required TResult Function(MyBodyRefreshRequested value) refreshRequested,
    required TResult Function(MyBodyCreateRequested value) createRequested,
    required TResult Function(MyBodyLoadLatestRequested value)
        loadLatestRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyBodyLoadRequested value)? loadRequested,
    TResult? Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult? Function(MyBodyCreateRequested value)? createRequested,
    TResult? Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyBodyLoadRequested value)? loadRequested,
    TResult Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult Function(MyBodyCreateRequested value)? createRequested,
    TResult Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBodyEventCopyWith<$Res> {
  factory $MyBodyEventCopyWith(
          MyBodyEvent value, $Res Function(MyBodyEvent) then) =
      _$MyBodyEventCopyWithImpl<$Res, MyBodyEvent>;
}

/// @nodoc
class _$MyBodyEventCopyWithImpl<$Res, $Val extends MyBodyEvent>
    implements $MyBodyEventCopyWith<$Res> {
  _$MyBodyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyBodyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MyBodyLoadRequestedImplCopyWith<$Res> {
  factory _$$MyBodyLoadRequestedImplCopyWith(_$MyBodyLoadRequestedImpl value,
          $Res Function(_$MyBodyLoadRequestedImpl) then) =
      __$$MyBodyLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyBodyLoadRequestedImplCopyWithImpl<$Res>
    extends _$MyBodyEventCopyWithImpl<$Res, _$MyBodyLoadRequestedImpl>
    implements _$$MyBodyLoadRequestedImplCopyWith<$Res> {
  __$$MyBodyLoadRequestedImplCopyWithImpl(_$MyBodyLoadRequestedImpl _value,
      $Res Function(_$MyBodyLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyBodyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MyBodyLoadRequestedImpl implements MyBodyLoadRequested {
  const _$MyBodyLoadRequestedImpl();

  @override
  String toString() {
    return 'MyBodyEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBodyLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(CreateBodyProgressRequest request)
        createRequested,
    required TResult Function() loadLatestRequested,
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(CreateBodyProgressRequest request)? createRequested,
    TResult? Function()? loadLatestRequested,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(CreateBodyProgressRequest request)? createRequested,
    TResult Function()? loadLatestRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyBodyLoadRequested value) loadRequested,
    required TResult Function(MyBodyRefreshRequested value) refreshRequested,
    required TResult Function(MyBodyCreateRequested value) createRequested,
    required TResult Function(MyBodyLoadLatestRequested value)
        loadLatestRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyBodyLoadRequested value)? loadRequested,
    TResult? Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult? Function(MyBodyCreateRequested value)? createRequested,
    TResult? Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyBodyLoadRequested value)? loadRequested,
    TResult Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult Function(MyBodyCreateRequested value)? createRequested,
    TResult Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class MyBodyLoadRequested implements MyBodyEvent {
  const factory MyBodyLoadRequested() = _$MyBodyLoadRequestedImpl;
}

/// @nodoc
abstract class _$$MyBodyRefreshRequestedImplCopyWith<$Res> {
  factory _$$MyBodyRefreshRequestedImplCopyWith(
          _$MyBodyRefreshRequestedImpl value,
          $Res Function(_$MyBodyRefreshRequestedImpl) then) =
      __$$MyBodyRefreshRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyBodyRefreshRequestedImplCopyWithImpl<$Res>
    extends _$MyBodyEventCopyWithImpl<$Res, _$MyBodyRefreshRequestedImpl>
    implements _$$MyBodyRefreshRequestedImplCopyWith<$Res> {
  __$$MyBodyRefreshRequestedImplCopyWithImpl(
      _$MyBodyRefreshRequestedImpl _value,
      $Res Function(_$MyBodyRefreshRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyBodyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MyBodyRefreshRequestedImpl implements MyBodyRefreshRequested {
  const _$MyBodyRefreshRequestedImpl();

  @override
  String toString() {
    return 'MyBodyEvent.refreshRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBodyRefreshRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(CreateBodyProgressRequest request)
        createRequested,
    required TResult Function() loadLatestRequested,
  }) {
    return refreshRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(CreateBodyProgressRequest request)? createRequested,
    TResult? Function()? loadLatestRequested,
  }) {
    return refreshRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(CreateBodyProgressRequest request)? createRequested,
    TResult Function()? loadLatestRequested,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyBodyLoadRequested value) loadRequested,
    required TResult Function(MyBodyRefreshRequested value) refreshRequested,
    required TResult Function(MyBodyCreateRequested value) createRequested,
    required TResult Function(MyBodyLoadLatestRequested value)
        loadLatestRequested,
  }) {
    return refreshRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyBodyLoadRequested value)? loadRequested,
    TResult? Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult? Function(MyBodyCreateRequested value)? createRequested,
    TResult? Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
  }) {
    return refreshRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyBodyLoadRequested value)? loadRequested,
    TResult Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult Function(MyBodyCreateRequested value)? createRequested,
    TResult Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested(this);
    }
    return orElse();
  }
}

abstract class MyBodyRefreshRequested implements MyBodyEvent {
  const factory MyBodyRefreshRequested() = _$MyBodyRefreshRequestedImpl;
}

/// @nodoc
abstract class _$$MyBodyCreateRequestedImplCopyWith<$Res> {
  factory _$$MyBodyCreateRequestedImplCopyWith(
          _$MyBodyCreateRequestedImpl value,
          $Res Function(_$MyBodyCreateRequestedImpl) then) =
      __$$MyBodyCreateRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateBodyProgressRequest request});

  $CreateBodyProgressRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$MyBodyCreateRequestedImplCopyWithImpl<$Res>
    extends _$MyBodyEventCopyWithImpl<$Res, _$MyBodyCreateRequestedImpl>
    implements _$$MyBodyCreateRequestedImplCopyWith<$Res> {
  __$$MyBodyCreateRequestedImplCopyWithImpl(_$MyBodyCreateRequestedImpl _value,
      $Res Function(_$MyBodyCreateRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyBodyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$MyBodyCreateRequestedImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as CreateBodyProgressRequest,
    ));
  }

  /// Create a copy of MyBodyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateBodyProgressRequestCopyWith<$Res> get request {
    return $CreateBodyProgressRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$MyBodyCreateRequestedImpl implements MyBodyCreateRequested {
  const _$MyBodyCreateRequestedImpl(this.request);

  @override
  final CreateBodyProgressRequest request;

  @override
  String toString() {
    return 'MyBodyEvent.createRequested(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBodyCreateRequestedImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of MyBodyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyBodyCreateRequestedImplCopyWith<_$MyBodyCreateRequestedImpl>
      get copyWith => __$$MyBodyCreateRequestedImplCopyWithImpl<
          _$MyBodyCreateRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(CreateBodyProgressRequest request)
        createRequested,
    required TResult Function() loadLatestRequested,
  }) {
    return createRequested(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(CreateBodyProgressRequest request)? createRequested,
    TResult? Function()? loadLatestRequested,
  }) {
    return createRequested?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(CreateBodyProgressRequest request)? createRequested,
    TResult Function()? loadLatestRequested,
    required TResult orElse(),
  }) {
    if (createRequested != null) {
      return createRequested(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyBodyLoadRequested value) loadRequested,
    required TResult Function(MyBodyRefreshRequested value) refreshRequested,
    required TResult Function(MyBodyCreateRequested value) createRequested,
    required TResult Function(MyBodyLoadLatestRequested value)
        loadLatestRequested,
  }) {
    return createRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyBodyLoadRequested value)? loadRequested,
    TResult? Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult? Function(MyBodyCreateRequested value)? createRequested,
    TResult? Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
  }) {
    return createRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyBodyLoadRequested value)? loadRequested,
    TResult Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult Function(MyBodyCreateRequested value)? createRequested,
    TResult Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
    required TResult orElse(),
  }) {
    if (createRequested != null) {
      return createRequested(this);
    }
    return orElse();
  }
}

abstract class MyBodyCreateRequested implements MyBodyEvent {
  const factory MyBodyCreateRequested(final CreateBodyProgressRequest request) =
      _$MyBodyCreateRequestedImpl;

  CreateBodyProgressRequest get request;

  /// Create a copy of MyBodyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyBodyCreateRequestedImplCopyWith<_$MyBodyCreateRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyBodyLoadLatestRequestedImplCopyWith<$Res> {
  factory _$$MyBodyLoadLatestRequestedImplCopyWith(
          _$MyBodyLoadLatestRequestedImpl value,
          $Res Function(_$MyBodyLoadLatestRequestedImpl) then) =
      __$$MyBodyLoadLatestRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyBodyLoadLatestRequestedImplCopyWithImpl<$Res>
    extends _$MyBodyEventCopyWithImpl<$Res, _$MyBodyLoadLatestRequestedImpl>
    implements _$$MyBodyLoadLatestRequestedImplCopyWith<$Res> {
  __$$MyBodyLoadLatestRequestedImplCopyWithImpl(
      _$MyBodyLoadLatestRequestedImpl _value,
      $Res Function(_$MyBodyLoadLatestRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyBodyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MyBodyLoadLatestRequestedImpl implements MyBodyLoadLatestRequested {
  const _$MyBodyLoadLatestRequestedImpl();

  @override
  String toString() {
    return 'MyBodyEvent.loadLatestRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBodyLoadLatestRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(CreateBodyProgressRequest request)
        createRequested,
    required TResult Function() loadLatestRequested,
  }) {
    return loadLatestRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(CreateBodyProgressRequest request)? createRequested,
    TResult? Function()? loadLatestRequested,
  }) {
    return loadLatestRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(CreateBodyProgressRequest request)? createRequested,
    TResult Function()? loadLatestRequested,
    required TResult orElse(),
  }) {
    if (loadLatestRequested != null) {
      return loadLatestRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyBodyLoadRequested value) loadRequested,
    required TResult Function(MyBodyRefreshRequested value) refreshRequested,
    required TResult Function(MyBodyCreateRequested value) createRequested,
    required TResult Function(MyBodyLoadLatestRequested value)
        loadLatestRequested,
  }) {
    return loadLatestRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyBodyLoadRequested value)? loadRequested,
    TResult? Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult? Function(MyBodyCreateRequested value)? createRequested,
    TResult? Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
  }) {
    return loadLatestRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyBodyLoadRequested value)? loadRequested,
    TResult Function(MyBodyRefreshRequested value)? refreshRequested,
    TResult Function(MyBodyCreateRequested value)? createRequested,
    TResult Function(MyBodyLoadLatestRequested value)? loadLatestRequested,
    required TResult orElse(),
  }) {
    if (loadLatestRequested != null) {
      return loadLatestRequested(this);
    }
    return orElse();
  }
}

abstract class MyBodyLoadLatestRequested implements MyBodyEvent {
  const factory MyBodyLoadLatestRequested() = _$MyBodyLoadLatestRequestedImpl;
}
