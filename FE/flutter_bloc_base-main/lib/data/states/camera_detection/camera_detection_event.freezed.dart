// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_detection_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraDetectionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() start,
    required TResult Function() stop,
    required TResult Function(List<Pose> poses) posesUpdated,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraDetectionInitialize value) initialize,
    required TResult Function(CameraDetectionStart value) start,
    required TResult Function(CameraDetectionStop value) stop,
    required TResult Function(CameraDetectionPosesUpdated value) posesUpdated,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraDetectionEventCopyWith<$Res> {
  factory $CameraDetectionEventCopyWith(CameraDetectionEvent value,
          $Res Function(CameraDetectionEvent) then) =
      _$CameraDetectionEventCopyWithImpl<$Res, CameraDetectionEvent>;
}

/// @nodoc
class _$CameraDetectionEventCopyWithImpl<$Res,
        $Val extends CameraDetectionEvent>
    implements $CameraDetectionEventCopyWith<$Res> {
  _$CameraDetectionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CameraDetectionInitializeImplCopyWith<$Res> {
  factory _$$CameraDetectionInitializeImplCopyWith(
          _$CameraDetectionInitializeImpl value,
          $Res Function(_$CameraDetectionInitializeImpl) then) =
      __$$CameraDetectionInitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraDetectionInitializeImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res,
        _$CameraDetectionInitializeImpl>
    implements _$$CameraDetectionInitializeImplCopyWith<$Res> {
  __$$CameraDetectionInitializeImplCopyWithImpl(
      _$CameraDetectionInitializeImpl _value,
      $Res Function(_$CameraDetectionInitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CameraDetectionInitializeImpl implements CameraDetectionInitialize {
  const _$CameraDetectionInitializeImpl();

  @override
  String toString() {
    return 'CameraDetectionEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionInitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() start,
    required TResult Function() stop,
    required TResult Function(List<Pose> poses) posesUpdated,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraDetectionInitialize value) initialize,
    required TResult Function(CameraDetectionStart value) start,
    required TResult Function(CameraDetectionStop value) stop,
    required TResult Function(CameraDetectionPosesUpdated value) posesUpdated,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionInitialize implements CameraDetectionEvent {
  const factory CameraDetectionInitialize() = _$CameraDetectionInitializeImpl;
}

/// @nodoc
abstract class _$$CameraDetectionStartImplCopyWith<$Res> {
  factory _$$CameraDetectionStartImplCopyWith(_$CameraDetectionStartImpl value,
          $Res Function(_$CameraDetectionStartImpl) then) =
      __$$CameraDetectionStartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraDetectionStartImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res, _$CameraDetectionStartImpl>
    implements _$$CameraDetectionStartImplCopyWith<$Res> {
  __$$CameraDetectionStartImplCopyWithImpl(_$CameraDetectionStartImpl _value,
      $Res Function(_$CameraDetectionStartImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CameraDetectionStartImpl implements CameraDetectionStart {
  const _$CameraDetectionStartImpl();

  @override
  String toString() {
    return 'CameraDetectionEvent.start()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionStartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() start,
    required TResult Function() stop,
    required TResult Function(List<Pose> poses) posesUpdated,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraDetectionInitialize value) initialize,
    required TResult Function(CameraDetectionStart value) start,
    required TResult Function(CameraDetectionStop value) stop,
    required TResult Function(CameraDetectionPosesUpdated value) posesUpdated,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionStart implements CameraDetectionEvent {
  const factory CameraDetectionStart() = _$CameraDetectionStartImpl;
}

/// @nodoc
abstract class _$$CameraDetectionStopImplCopyWith<$Res> {
  factory _$$CameraDetectionStopImplCopyWith(_$CameraDetectionStopImpl value,
          $Res Function(_$CameraDetectionStopImpl) then) =
      __$$CameraDetectionStopImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraDetectionStopImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res, _$CameraDetectionStopImpl>
    implements _$$CameraDetectionStopImplCopyWith<$Res> {
  __$$CameraDetectionStopImplCopyWithImpl(_$CameraDetectionStopImpl _value,
      $Res Function(_$CameraDetectionStopImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CameraDetectionStopImpl implements CameraDetectionStop {
  const _$CameraDetectionStopImpl();

  @override
  String toString() {
    return 'CameraDetectionEvent.stop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionStopImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() start,
    required TResult Function() stop,
    required TResult Function(List<Pose> poses) posesUpdated,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
  }) {
    return stop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraDetectionInitialize value) initialize,
    required TResult Function(CameraDetectionStart value) start,
    required TResult Function(CameraDetectionStop value) stop,
    required TResult Function(CameraDetectionPosesUpdated value) posesUpdated,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionStop implements CameraDetectionEvent {
  const factory CameraDetectionStop() = _$CameraDetectionStopImpl;
}

/// @nodoc
abstract class _$$CameraDetectionPosesUpdatedImplCopyWith<$Res> {
  factory _$$CameraDetectionPosesUpdatedImplCopyWith(
          _$CameraDetectionPosesUpdatedImpl value,
          $Res Function(_$CameraDetectionPosesUpdatedImpl) then) =
      __$$CameraDetectionPosesUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Pose> poses});
}

/// @nodoc
class __$$CameraDetectionPosesUpdatedImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res,
        _$CameraDetectionPosesUpdatedImpl>
    implements _$$CameraDetectionPosesUpdatedImplCopyWith<$Res> {
  __$$CameraDetectionPosesUpdatedImplCopyWithImpl(
      _$CameraDetectionPosesUpdatedImpl _value,
      $Res Function(_$CameraDetectionPosesUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poses = null,
  }) {
    return _then(_$CameraDetectionPosesUpdatedImpl(
      null == poses
          ? _value._poses
          : poses // ignore: cast_nullable_to_non_nullable
              as List<Pose>,
    ));
  }
}

/// @nodoc

class _$CameraDetectionPosesUpdatedImpl implements CameraDetectionPosesUpdated {
  const _$CameraDetectionPosesUpdatedImpl(final List<Pose> poses)
      : _poses = poses;

  final List<Pose> _poses;
  @override
  List<Pose> get poses {
    if (_poses is EqualUnmodifiableListView) return _poses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poses);
  }

  @override
  String toString() {
    return 'CameraDetectionEvent.posesUpdated(poses: $poses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionPosesUpdatedImpl &&
            const DeepCollectionEquality().equals(other._poses, _poses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_poses));

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraDetectionPosesUpdatedImplCopyWith<_$CameraDetectionPosesUpdatedImpl>
      get copyWith => __$$CameraDetectionPosesUpdatedImplCopyWithImpl<
          _$CameraDetectionPosesUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() start,
    required TResult Function() stop,
    required TResult Function(List<Pose> poses) posesUpdated,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
  }) {
    return posesUpdated(poses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
  }) {
    return posesUpdated?.call(poses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    required TResult orElse(),
  }) {
    if (posesUpdated != null) {
      return posesUpdated(poses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraDetectionInitialize value) initialize,
    required TResult Function(CameraDetectionStart value) start,
    required TResult Function(CameraDetectionStop value) stop,
    required TResult Function(CameraDetectionPosesUpdated value) posesUpdated,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
  }) {
    return posesUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
  }) {
    return posesUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (posesUpdated != null) {
      return posesUpdated(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionPosesUpdated implements CameraDetectionEvent {
  const factory CameraDetectionPosesUpdated(final List<Pose> poses) =
      _$CameraDetectionPosesUpdatedImpl;

  List<Pose> get poses;

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraDetectionPosesUpdatedImplCopyWith<_$CameraDetectionPosesUpdatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CameraDetectionErrorOccurredImplCopyWith<$Res> {
  factory _$$CameraDetectionErrorOccurredImplCopyWith(
          _$CameraDetectionErrorOccurredImpl value,
          $Res Function(_$CameraDetectionErrorOccurredImpl) then) =
      __$$CameraDetectionErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class __$$CameraDetectionErrorOccurredImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res,
        _$CameraDetectionErrorOccurredImpl>
    implements _$$CameraDetectionErrorOccurredImplCopyWith<$Res> {
  __$$CameraDetectionErrorOccurredImplCopyWithImpl(
      _$CameraDetectionErrorOccurredImpl _value,
      $Res Function(_$CameraDetectionErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$CameraDetectionErrorOccurredImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$CameraDetectionErrorOccurredImpl
    implements CameraDetectionErrorOccurred {
  const _$CameraDetectionErrorOccurredImpl([this.error]);

  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'CameraDetectionEvent.errorOccurred(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionErrorOccurredImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraDetectionErrorOccurredImplCopyWith<
          _$CameraDetectionErrorOccurredImpl>
      get copyWith => __$$CameraDetectionErrorOccurredImplCopyWithImpl<
          _$CameraDetectionErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() start,
    required TResult Function() stop,
    required TResult Function(List<Pose> poses) posesUpdated,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
  }) {
    return errorOccurred(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
  }) {
    return errorOccurred?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
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
    required TResult Function(CameraDetectionInitialize value) initialize,
    required TResult Function(CameraDetectionStart value) start,
    required TResult Function(CameraDetectionStop value) stop,
    required TResult Function(CameraDetectionPosesUpdated value) posesUpdated,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionErrorOccurred implements CameraDetectionEvent {
  const factory CameraDetectionErrorOccurred(
          [final BaseException<dynamic>? error]) =
      _$CameraDetectionErrorOccurredImpl;

  BaseException<dynamic>? get error;

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraDetectionErrorOccurredImplCopyWith<
          _$CameraDetectionErrorOccurredImpl>
      get copyWith => throw _privateConstructorUsedError;
}
