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
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraDetectionInitialize value) initialize,
    required TResult Function(CameraDetectionStart value) start,
    required TResult Function(CameraDetectionStop value) stop,
    required TResult Function(CameraDetectionPosesUpdated value) posesUpdated,
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
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
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
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
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
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
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
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
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
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
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
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
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
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
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
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
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
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
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
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
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
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
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
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
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
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
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
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
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
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
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
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
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
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
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
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
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
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
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
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
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
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
abstract class _$$CameraDetectionStartCountdownImplCopyWith<$Res> {
  factory _$$CameraDetectionStartCountdownImplCopyWith(
          _$CameraDetectionStartCountdownImpl value,
          $Res Function(_$CameraDetectionStartCountdownImpl) then) =
      __$$CameraDetectionStartCountdownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraDetectionStartCountdownImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res,
        _$CameraDetectionStartCountdownImpl>
    implements _$$CameraDetectionStartCountdownImplCopyWith<$Res> {
  __$$CameraDetectionStartCountdownImplCopyWithImpl(
      _$CameraDetectionStartCountdownImpl _value,
      $Res Function(_$CameraDetectionStartCountdownImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CameraDetectionStartCountdownImpl
    implements CameraDetectionStartCountdown {
  const _$CameraDetectionStartCountdownImpl();

  @override
  String toString() {
    return 'CameraDetectionEvent.startCountdown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionStartCountdownImpl);
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
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
  }) {
    return startCountdown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
  }) {
    return startCountdown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
    required TResult orElse(),
  }) {
    if (startCountdown != null) {
      return startCountdown();
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
  }) {
    return startCountdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
  }) {
    return startCountdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
    required TResult orElse(),
  }) {
    if (startCountdown != null) {
      return startCountdown(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionStartCountdown implements CameraDetectionEvent {
  const factory CameraDetectionStartCountdown() =
      _$CameraDetectionStartCountdownImpl;
}

/// @nodoc
abstract class _$$CameraDetectionCountdownTickImplCopyWith<$Res> {
  factory _$$CameraDetectionCountdownTickImplCopyWith(
          _$CameraDetectionCountdownTickImpl value,
          $Res Function(_$CameraDetectionCountdownTickImpl) then) =
      __$$CameraDetectionCountdownTickImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int remaining});
}

/// @nodoc
class __$$CameraDetectionCountdownTickImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res,
        _$CameraDetectionCountdownTickImpl>
    implements _$$CameraDetectionCountdownTickImplCopyWith<$Res> {
  __$$CameraDetectionCountdownTickImplCopyWithImpl(
      _$CameraDetectionCountdownTickImpl _value,
      $Res Function(_$CameraDetectionCountdownTickImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remaining = null,
  }) {
    return _then(_$CameraDetectionCountdownTickImpl(
      null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CameraDetectionCountdownTickImpl
    implements CameraDetectionCountdownTick {
  const _$CameraDetectionCountdownTickImpl(this.remaining);

  @override
  final int remaining;

  @override
  String toString() {
    return 'CameraDetectionEvent.countdownTick(remaining: $remaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionCountdownTickImpl &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remaining);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraDetectionCountdownTickImplCopyWith<
          _$CameraDetectionCountdownTickImpl>
      get copyWith => __$$CameraDetectionCountdownTickImplCopyWithImpl<
          _$CameraDetectionCountdownTickImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() start,
    required TResult Function() stop,
    required TResult Function(List<Pose> poses) posesUpdated,
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
  }) {
    return countdownTick(remaining);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
  }) {
    return countdownTick?.call(remaining);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
    required TResult orElse(),
  }) {
    if (countdownTick != null) {
      return countdownTick(remaining);
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
  }) {
    return countdownTick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
  }) {
    return countdownTick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
    required TResult orElse(),
  }) {
    if (countdownTick != null) {
      return countdownTick(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionCountdownTick implements CameraDetectionEvent {
  const factory CameraDetectionCountdownTick(final int remaining) =
      _$CameraDetectionCountdownTickImpl;

  int get remaining;

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraDetectionCountdownTickImplCopyWith<
          _$CameraDetectionCountdownTickImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CameraDetectionCaptureImageImplCopyWith<$Res> {
  factory _$$CameraDetectionCaptureImageImplCopyWith(
          _$CameraDetectionCaptureImageImpl value,
          $Res Function(_$CameraDetectionCaptureImageImpl) then) =
      __$$CameraDetectionCaptureImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath, Uint8List imageBytes, List<Pose> poses});
}

/// @nodoc
class __$$CameraDetectionCaptureImageImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res,
        _$CameraDetectionCaptureImageImpl>
    implements _$$CameraDetectionCaptureImageImplCopyWith<$Res> {
  __$$CameraDetectionCaptureImageImplCopyWithImpl(
      _$CameraDetectionCaptureImageImpl _value,
      $Res Function(_$CameraDetectionCaptureImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? imageBytes = null,
    Object? poses = null,
  }) {
    return _then(_$CameraDetectionCaptureImageImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: null == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      poses: null == poses
          ? _value._poses
          : poses // ignore: cast_nullable_to_non_nullable
              as List<Pose>,
    ));
  }
}

/// @nodoc

class _$CameraDetectionCaptureImageImpl implements CameraDetectionCaptureImage {
  const _$CameraDetectionCaptureImageImpl(
      {required this.imagePath,
      required this.imageBytes,
      required final List<Pose> poses})
      : _poses = poses;

  @override
  final String imagePath;
  @override
  final Uint8List imageBytes;
  final List<Pose> _poses;
  @override
  List<Pose> get poses {
    if (_poses is EqualUnmodifiableListView) return _poses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poses);
  }

  @override
  String toString() {
    return 'CameraDetectionEvent.captureImage(imagePath: $imagePath, imageBytes: $imageBytes, poses: $poses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionCaptureImageImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes) &&
            const DeepCollectionEquality().equals(other._poses, _poses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      imagePath,
      const DeepCollectionEquality().hash(imageBytes),
      const DeepCollectionEquality().hash(_poses));

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraDetectionCaptureImageImplCopyWith<_$CameraDetectionCaptureImageImpl>
      get copyWith => __$$CameraDetectionCaptureImageImplCopyWithImpl<
          _$CameraDetectionCaptureImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() start,
    required TResult Function() stop,
    required TResult Function(List<Pose> poses) posesUpdated,
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
  }) {
    return captureImage(imagePath, imageBytes, poses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
  }) {
    return captureImage?.call(imagePath, imageBytes, poses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
    required TResult orElse(),
  }) {
    if (captureImage != null) {
      return captureImage(imagePath, imageBytes, poses);
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
  }) {
    return captureImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
  }) {
    return captureImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
    required TResult orElse(),
  }) {
    if (captureImage != null) {
      return captureImage(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionCaptureImage implements CameraDetectionEvent {
  const factory CameraDetectionCaptureImage(
      {required final String imagePath,
      required final Uint8List imageBytes,
      required final List<Pose> poses}) = _$CameraDetectionCaptureImageImpl;

  String get imagePath;
  Uint8List get imageBytes;
  List<Pose> get poses;

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraDetectionCaptureImageImplCopyWith<_$CameraDetectionCaptureImageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CameraDetectionUploadPoseImplCopyWith<$Res> {
  factory _$$CameraDetectionUploadPoseImplCopyWith(
          _$CameraDetectionUploadPoseImpl value,
          $Res Function(_$CameraDetectionUploadPoseImpl) then) =
      __$$CameraDetectionUploadPoseImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String poseId,
      String imagePath,
      Uint8List imageBytes,
      List<Pose> poses});
}

/// @nodoc
class __$$CameraDetectionUploadPoseImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res,
        _$CameraDetectionUploadPoseImpl>
    implements _$$CameraDetectionUploadPoseImplCopyWith<$Res> {
  __$$CameraDetectionUploadPoseImplCopyWithImpl(
      _$CameraDetectionUploadPoseImpl _value,
      $Res Function(_$CameraDetectionUploadPoseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseId = null,
    Object? imagePath = null,
    Object? imageBytes = null,
    Object? poses = null,
  }) {
    return _then(_$CameraDetectionUploadPoseImpl(
      poseId: null == poseId
          ? _value.poseId
          : poseId // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: null == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      poses: null == poses
          ? _value._poses
          : poses // ignore: cast_nullable_to_non_nullable
              as List<Pose>,
    ));
  }
}

/// @nodoc

class _$CameraDetectionUploadPoseImpl implements CameraDetectionUploadPose {
  const _$CameraDetectionUploadPoseImpl(
      {required this.poseId,
      required this.imagePath,
      required this.imageBytes,
      required final List<Pose> poses})
      : _poses = poses;

  @override
  final String poseId;
  @override
  final String imagePath;
  @override
  final Uint8List imageBytes;
  final List<Pose> _poses;
  @override
  List<Pose> get poses {
    if (_poses is EqualUnmodifiableListView) return _poses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poses);
  }

  @override
  String toString() {
    return 'CameraDetectionEvent.uploadPose(poseId: $poseId, imagePath: $imagePath, imageBytes: $imageBytes, poses: $poses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionUploadPoseImpl &&
            (identical(other.poseId, poseId) || other.poseId == poseId) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes) &&
            const DeepCollectionEquality().equals(other._poses, _poses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      poseId,
      imagePath,
      const DeepCollectionEquality().hash(imageBytes),
      const DeepCollectionEquality().hash(_poses));

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraDetectionUploadPoseImplCopyWith<_$CameraDetectionUploadPoseImpl>
      get copyWith => __$$CameraDetectionUploadPoseImplCopyWithImpl<
          _$CameraDetectionUploadPoseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() start,
    required TResult Function() stop,
    required TResult Function(List<Pose> poses) posesUpdated,
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
  }) {
    return uploadPose(poseId, imagePath, imageBytes, poses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
  }) {
    return uploadPose?.call(poseId, imagePath, imageBytes, poses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
    required TResult orElse(),
  }) {
    if (uploadPose != null) {
      return uploadPose(poseId, imagePath, imageBytes, poses);
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
  }) {
    return uploadPose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
  }) {
    return uploadPose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
    required TResult orElse(),
  }) {
    if (uploadPose != null) {
      return uploadPose(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionUploadPose implements CameraDetectionEvent {
  const factory CameraDetectionUploadPose(
      {required final String poseId,
      required final String imagePath,
      required final Uint8List imageBytes,
      required final List<Pose> poses}) = _$CameraDetectionUploadPoseImpl;

  String get poseId;
  String get imagePath;
  Uint8List get imageBytes;
  List<Pose> get poses;

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraDetectionUploadPoseImplCopyWith<_$CameraDetectionUploadPoseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CameraDetectionUploadSuccessImplCopyWith<$Res> {
  factory _$$CameraDetectionUploadSuccessImplCopyWith(
          _$CameraDetectionUploadSuccessImpl value,
          $Res Function(_$CameraDetectionUploadSuccessImpl) then) =
      __$$CameraDetectionUploadSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraDetectionUploadSuccessImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res,
        _$CameraDetectionUploadSuccessImpl>
    implements _$$CameraDetectionUploadSuccessImplCopyWith<$Res> {
  __$$CameraDetectionUploadSuccessImplCopyWithImpl(
      _$CameraDetectionUploadSuccessImpl _value,
      $Res Function(_$CameraDetectionUploadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CameraDetectionUploadSuccessImpl
    implements CameraDetectionUploadSuccess {
  const _$CameraDetectionUploadSuccessImpl();

  @override
  String toString() {
    return 'CameraDetectionEvent.uploadSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionUploadSuccessImpl);
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
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
  }) {
    return uploadSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
  }) {
    return uploadSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
    required TResult orElse(),
  }) {
    if (uploadSuccess != null) {
      return uploadSuccess();
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
  }) {
    return uploadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
  }) {
    return uploadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
    required TResult orElse(),
  }) {
    if (uploadSuccess != null) {
      return uploadSuccess(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionUploadSuccess implements CameraDetectionEvent {
  const factory CameraDetectionUploadSuccess() =
      _$CameraDetectionUploadSuccessImpl;
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
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
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
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
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
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
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
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
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
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
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

/// @nodoc
abstract class _$$CameraDetectionResetToLiveImplCopyWith<$Res> {
  factory _$$CameraDetectionResetToLiveImplCopyWith(
          _$CameraDetectionResetToLiveImpl value,
          $Res Function(_$CameraDetectionResetToLiveImpl) then) =
      __$$CameraDetectionResetToLiveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraDetectionResetToLiveImplCopyWithImpl<$Res>
    extends _$CameraDetectionEventCopyWithImpl<$Res,
        _$CameraDetectionResetToLiveImpl>
    implements _$$CameraDetectionResetToLiveImplCopyWith<$Res> {
  __$$CameraDetectionResetToLiveImplCopyWithImpl(
      _$CameraDetectionResetToLiveImpl _value,
      $Res Function(_$CameraDetectionResetToLiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CameraDetectionResetToLiveImpl implements CameraDetectionResetToLive {
  const _$CameraDetectionResetToLiveImpl();

  @override
  String toString() {
    return 'CameraDetectionEvent.resetToLive()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionResetToLiveImpl);
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
    required TResult Function() startCountdown,
    required TResult Function(int remaining) countdownTick,
    required TResult Function(
            String imagePath, Uint8List imageBytes, List<Pose> poses)
        captureImage,
    required TResult Function(String poseId, String imagePath,
            Uint8List imageBytes, List<Pose> poses)
        uploadPose,
    required TResult Function() uploadSuccess,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() resetToLive,
  }) {
    return resetToLive();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? start,
    TResult? Function()? stop,
    TResult? Function(List<Pose> poses)? posesUpdated,
    TResult? Function()? startCountdown,
    TResult? Function(int remaining)? countdownTick,
    TResult? Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult? Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult? Function()? uploadSuccess,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? resetToLive,
  }) {
    return resetToLive?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? start,
    TResult Function()? stop,
    TResult Function(List<Pose> poses)? posesUpdated,
    TResult Function()? startCountdown,
    TResult Function(int remaining)? countdownTick,
    TResult Function(String imagePath, Uint8List imageBytes, List<Pose> poses)?
        captureImage,
    TResult Function(String poseId, String imagePath, Uint8List imageBytes,
            List<Pose> poses)?
        uploadPose,
    TResult Function()? uploadSuccess,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? resetToLive,
    required TResult orElse(),
  }) {
    if (resetToLive != null) {
      return resetToLive();
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
    required TResult Function(CameraDetectionStartCountdown value)
        startCountdown,
    required TResult Function(CameraDetectionCountdownTick value) countdownTick,
    required TResult Function(CameraDetectionCaptureImage value) captureImage,
    required TResult Function(CameraDetectionUploadPose value) uploadPose,
    required TResult Function(CameraDetectionUploadSuccess value) uploadSuccess,
    required TResult Function(CameraDetectionErrorOccurred value) errorOccurred,
    required TResult Function(CameraDetectionResetToLive value) resetToLive,
  }) {
    return resetToLive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraDetectionInitialize value)? initialize,
    TResult? Function(CameraDetectionStart value)? start,
    TResult? Function(CameraDetectionStop value)? stop,
    TResult? Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult? Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult? Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult? Function(CameraDetectionCaptureImage value)? captureImage,
    TResult? Function(CameraDetectionUploadPose value)? uploadPose,
    TResult? Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult? Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult? Function(CameraDetectionResetToLive value)? resetToLive,
  }) {
    return resetToLive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraDetectionInitialize value)? initialize,
    TResult Function(CameraDetectionStart value)? start,
    TResult Function(CameraDetectionStop value)? stop,
    TResult Function(CameraDetectionPosesUpdated value)? posesUpdated,
    TResult Function(CameraDetectionStartCountdown value)? startCountdown,
    TResult Function(CameraDetectionCountdownTick value)? countdownTick,
    TResult Function(CameraDetectionCaptureImage value)? captureImage,
    TResult Function(CameraDetectionUploadPose value)? uploadPose,
    TResult Function(CameraDetectionUploadSuccess value)? uploadSuccess,
    TResult Function(CameraDetectionErrorOccurred value)? errorOccurred,
    TResult Function(CameraDetectionResetToLive value)? resetToLive,
    required TResult orElse(),
  }) {
    if (resetToLive != null) {
      return resetToLive(this);
    }
    return orElse();
  }
}

abstract class CameraDetectionResetToLive implements CameraDetectionEvent {
  const factory CameraDetectionResetToLive() = _$CameraDetectionResetToLiveImpl;
}
