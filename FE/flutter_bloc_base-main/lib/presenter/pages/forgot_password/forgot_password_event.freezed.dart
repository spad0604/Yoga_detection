// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(String password, String confirmPassword)
        changePassword,
    required TResult Function(String email) setEmail,
    required TResult Function(String email) sendOtp,
    required TResult Function(String email, String otp) verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(String password, String confirmPassword)? changePassword,
    TResult? Function(String email)? setEmail,
    TResult? Function(String email)? sendOtp,
    TResult? Function(String email, String otp)? verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(String password, String confirmPassword)? changePassword,
    TResult Function(String email)? setEmail,
    TResult Function(String email)? sendOtp,
    TResult Function(String email, String otp)? verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ForgotPasswordErrorOccurred value) errorOccurred,
    required TResult Function(ChangePasswordRequested value) changePassword,
    required TResult Function(SetEmailEvent value) setEmail,
    required TResult Function(SendOtpRequested value) sendOtp,
    required TResult Function(VerifyOtpRequested value) verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult? Function(ChangePasswordRequested value)? changePassword,
    TResult? Function(SetEmailEvent value)? setEmail,
    TResult? Function(SendOtpRequested value)? sendOtp,
    TResult? Function(VerifyOtpRequested value)? verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult Function(ChangePasswordRequested value)? changePassword,
    TResult Function(SetEmailEvent value)? setEmail,
    TResult Function(SendOtpRequested value)? sendOtp,
    TResult Function(VerifyOtpRequested value)? verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
          ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) then) =
      _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ForgotPasswordErrorOccurredImplCopyWith<$Res> {
  factory _$$ForgotPasswordErrorOccurredImplCopyWith(
          _$ForgotPasswordErrorOccurredImpl value,
          $Res Function(_$ForgotPasswordErrorOccurredImpl) then) =
      __$$ForgotPasswordErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class __$$ForgotPasswordErrorOccurredImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res,
        _$ForgotPasswordErrorOccurredImpl>
    implements _$$ForgotPasswordErrorOccurredImplCopyWith<$Res> {
  __$$ForgotPasswordErrorOccurredImplCopyWithImpl(
      _$ForgotPasswordErrorOccurredImpl _value,
      $Res Function(_$ForgotPasswordErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ForgotPasswordErrorOccurredImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordErrorOccurredImpl
    with DiagnosticableTreeMixin
    implements ForgotPasswordErrorOccurred {
  const _$ForgotPasswordErrorOccurredImpl([this.error]);

  @override
  final BaseException<dynamic>? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.errorOccurred(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordEvent.errorOccurred'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordErrorOccurredImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordErrorOccurredImplCopyWith<_$ForgotPasswordErrorOccurredImpl>
      get copyWith => __$$ForgotPasswordErrorOccurredImplCopyWithImpl<
          _$ForgotPasswordErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(String password, String confirmPassword)
        changePassword,
    required TResult Function(String email) setEmail,
    required TResult Function(String email) sendOtp,
    required TResult Function(String email, String otp) verifyOtp,
  }) {
    return errorOccurred(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(String password, String confirmPassword)? changePassword,
    TResult? Function(String email)? setEmail,
    TResult? Function(String email)? sendOtp,
    TResult? Function(String email, String otp)? verifyOtp,
  }) {
    return errorOccurred?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(String password, String confirmPassword)? changePassword,
    TResult Function(String email)? setEmail,
    TResult Function(String email)? sendOtp,
    TResult Function(String email, String otp)? verifyOtp,
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
    required TResult Function(ForgotPasswordErrorOccurred value) errorOccurred,
    required TResult Function(ChangePasswordRequested value) changePassword,
    required TResult Function(SetEmailEvent value) setEmail,
    required TResult Function(SendOtpRequested value) sendOtp,
    required TResult Function(VerifyOtpRequested value) verifyOtp,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult? Function(ChangePasswordRequested value)? changePassword,
    TResult? Function(SetEmailEvent value)? setEmail,
    TResult? Function(SendOtpRequested value)? sendOtp,
    TResult? Function(VerifyOtpRequested value)? verifyOtp,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult Function(ChangePasswordRequested value)? changePassword,
    TResult Function(SetEmailEvent value)? setEmail,
    TResult Function(SendOtpRequested value)? sendOtp,
    TResult Function(VerifyOtpRequested value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordErrorOccurred implements ForgotPasswordEvent {
  const factory ForgotPasswordErrorOccurred(
          [final BaseException<dynamic>? error]) =
      _$ForgotPasswordErrorOccurredImpl;

  BaseException<dynamic>? get error;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordErrorOccurredImplCopyWith<_$ForgotPasswordErrorOccurredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePasswordRequestedImplCopyWith<$Res> {
  factory _$$ChangePasswordRequestedImplCopyWith(
          _$ChangePasswordRequestedImpl value,
          $Res Function(_$ChangePasswordRequestedImpl) then) =
      __$$ChangePasswordRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password, String confirmPassword});
}

/// @nodoc
class __$$ChangePasswordRequestedImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res,
        _$ChangePasswordRequestedImpl>
    implements _$$ChangePasswordRequestedImplCopyWith<$Res> {
  __$$ChangePasswordRequestedImplCopyWithImpl(
      _$ChangePasswordRequestedImpl _value,
      $Res Function(_$ChangePasswordRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$ChangePasswordRequestedImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePasswordRequestedImpl
    with DiagnosticableTreeMixin
    implements ChangePasswordRequested {
  const _$ChangePasswordRequestedImpl(
      {required this.password, required this.confirmPassword});

  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.changePassword(password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordEvent.changePassword'))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('confirmPassword', confirmPassword));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordRequestedImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, confirmPassword);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordRequestedImplCopyWith<_$ChangePasswordRequestedImpl>
      get copyWith => __$$ChangePasswordRequestedImplCopyWithImpl<
          _$ChangePasswordRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(String password, String confirmPassword)
        changePassword,
    required TResult Function(String email) setEmail,
    required TResult Function(String email) sendOtp,
    required TResult Function(String email, String otp) verifyOtp,
  }) {
    return changePassword(password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(String password, String confirmPassword)? changePassword,
    TResult? Function(String email)? setEmail,
    TResult? Function(String email)? sendOtp,
    TResult? Function(String email, String otp)? verifyOtp,
  }) {
    return changePassword?.call(password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(String password, String confirmPassword)? changePassword,
    TResult Function(String email)? setEmail,
    TResult Function(String email)? sendOtp,
    TResult Function(String email, String otp)? verifyOtp,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(password, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ForgotPasswordErrorOccurred value) errorOccurred,
    required TResult Function(ChangePasswordRequested value) changePassword,
    required TResult Function(SetEmailEvent value) setEmail,
    required TResult Function(SendOtpRequested value) sendOtp,
    required TResult Function(VerifyOtpRequested value) verifyOtp,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult? Function(ChangePasswordRequested value)? changePassword,
    TResult? Function(SetEmailEvent value)? setEmail,
    TResult? Function(SendOtpRequested value)? sendOtp,
    TResult? Function(VerifyOtpRequested value)? verifyOtp,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult Function(ChangePasswordRequested value)? changePassword,
    TResult Function(SetEmailEvent value)? setEmail,
    TResult Function(SendOtpRequested value)? sendOtp,
    TResult Function(VerifyOtpRequested value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class ChangePasswordRequested implements ForgotPasswordEvent {
  const factory ChangePasswordRequested(
      {required final String password,
      required final String confirmPassword}) = _$ChangePasswordRequestedImpl;

  String get password;
  String get confirmPassword;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordRequestedImplCopyWith<_$ChangePasswordRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetEmailEventImplCopyWith<$Res> {
  factory _$$SetEmailEventImplCopyWith(
          _$SetEmailEventImpl value, $Res Function(_$SetEmailEventImpl) then) =
      __$$SetEmailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SetEmailEventImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$SetEmailEventImpl>
    implements _$$SetEmailEventImplCopyWith<$Res> {
  __$$SetEmailEventImplCopyWithImpl(
      _$SetEmailEventImpl _value, $Res Function(_$SetEmailEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SetEmailEventImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetEmailEventImpl
    with DiagnosticableTreeMixin
    implements SetEmailEvent {
  const _$SetEmailEventImpl(this.email);

  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.setEmail(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordEvent.setEmail'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetEmailEventImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetEmailEventImplCopyWith<_$SetEmailEventImpl> get copyWith =>
      __$$SetEmailEventImplCopyWithImpl<_$SetEmailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(String password, String confirmPassword)
        changePassword,
    required TResult Function(String email) setEmail,
    required TResult Function(String email) sendOtp,
    required TResult Function(String email, String otp) verifyOtp,
  }) {
    return setEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(String password, String confirmPassword)? changePassword,
    TResult? Function(String email)? setEmail,
    TResult? Function(String email)? sendOtp,
    TResult? Function(String email, String otp)? verifyOtp,
  }) {
    return setEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(String password, String confirmPassword)? changePassword,
    TResult Function(String email)? setEmail,
    TResult Function(String email)? sendOtp,
    TResult Function(String email, String otp)? verifyOtp,
    required TResult orElse(),
  }) {
    if (setEmail != null) {
      return setEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ForgotPasswordErrorOccurred value) errorOccurred,
    required TResult Function(ChangePasswordRequested value) changePassword,
    required TResult Function(SetEmailEvent value) setEmail,
    required TResult Function(SendOtpRequested value) sendOtp,
    required TResult Function(VerifyOtpRequested value) verifyOtp,
  }) {
    return setEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult? Function(ChangePasswordRequested value)? changePassword,
    TResult? Function(SetEmailEvent value)? setEmail,
    TResult? Function(SendOtpRequested value)? sendOtp,
    TResult? Function(VerifyOtpRequested value)? verifyOtp,
  }) {
    return setEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult Function(ChangePasswordRequested value)? changePassword,
    TResult Function(SetEmailEvent value)? setEmail,
    TResult Function(SendOtpRequested value)? sendOtp,
    TResult Function(VerifyOtpRequested value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (setEmail != null) {
      return setEmail(this);
    }
    return orElse();
  }
}

abstract class SetEmailEvent implements ForgotPasswordEvent {
  const factory SetEmailEvent(final String email) = _$SetEmailEventImpl;

  String get email;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetEmailEventImplCopyWith<_$SetEmailEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendOtpRequestedImplCopyWith<$Res> {
  factory _$$SendOtpRequestedImplCopyWith(_$SendOtpRequestedImpl value,
          $Res Function(_$SendOtpRequestedImpl) then) =
      __$$SendOtpRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SendOtpRequestedImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$SendOtpRequestedImpl>
    implements _$$SendOtpRequestedImplCopyWith<$Res> {
  __$$SendOtpRequestedImplCopyWithImpl(_$SendOtpRequestedImpl _value,
      $Res Function(_$SendOtpRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SendOtpRequestedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendOtpRequestedImpl
    with DiagnosticableTreeMixin
    implements SendOtpRequested {
  const _$SendOtpRequestedImpl(this.email);

  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.sendOtp(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordEvent.sendOtp'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpRequestedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpRequestedImplCopyWith<_$SendOtpRequestedImpl> get copyWith =>
      __$$SendOtpRequestedImplCopyWithImpl<_$SendOtpRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(String password, String confirmPassword)
        changePassword,
    required TResult Function(String email) setEmail,
    required TResult Function(String email) sendOtp,
    required TResult Function(String email, String otp) verifyOtp,
  }) {
    return sendOtp(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(String password, String confirmPassword)? changePassword,
    TResult? Function(String email)? setEmail,
    TResult? Function(String email)? sendOtp,
    TResult? Function(String email, String otp)? verifyOtp,
  }) {
    return sendOtp?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(String password, String confirmPassword)? changePassword,
    TResult Function(String email)? setEmail,
    TResult Function(String email)? sendOtp,
    TResult Function(String email, String otp)? verifyOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ForgotPasswordErrorOccurred value) errorOccurred,
    required TResult Function(ChangePasswordRequested value) changePassword,
    required TResult Function(SetEmailEvent value) setEmail,
    required TResult Function(SendOtpRequested value) sendOtp,
    required TResult Function(VerifyOtpRequested value) verifyOtp,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult? Function(ChangePasswordRequested value)? changePassword,
    TResult? Function(SetEmailEvent value)? setEmail,
    TResult? Function(SendOtpRequested value)? sendOtp,
    TResult? Function(VerifyOtpRequested value)? verifyOtp,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult Function(ChangePasswordRequested value)? changePassword,
    TResult Function(SetEmailEvent value)? setEmail,
    TResult Function(SendOtpRequested value)? sendOtp,
    TResult Function(VerifyOtpRequested value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class SendOtpRequested implements ForgotPasswordEvent {
  const factory SendOtpRequested(final String email) = _$SendOtpRequestedImpl;

  String get email;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpRequestedImplCopyWith<_$SendOtpRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpRequestedImplCopyWith<$Res> {
  factory _$$VerifyOtpRequestedImplCopyWith(_$VerifyOtpRequestedImpl value,
          $Res Function(_$VerifyOtpRequestedImpl) then) =
      __$$VerifyOtpRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class __$$VerifyOtpRequestedImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$VerifyOtpRequestedImpl>
    implements _$$VerifyOtpRequestedImplCopyWith<$Res> {
  __$$VerifyOtpRequestedImplCopyWithImpl(_$VerifyOtpRequestedImpl _value,
      $Res Function(_$VerifyOtpRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
  }) {
    return _then(_$VerifyOtpRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyOtpRequestedImpl
    with DiagnosticableTreeMixin
    implements VerifyOtpRequested {
  const _$VerifyOtpRequestedImpl({required this.email, required this.otp});

  @override
  final String email;
  @override
  final String otp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForgotPasswordEvent.verifyOtp(email: $email, otp: $otp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForgotPasswordEvent.verifyOtp'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('otp', otp));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpRequestedImplCopyWith<_$VerifyOtpRequestedImpl> get copyWith =>
      __$$VerifyOtpRequestedImplCopyWithImpl<_$VerifyOtpRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(String password, String confirmPassword)
        changePassword,
    required TResult Function(String email) setEmail,
    required TResult Function(String email) sendOtp,
    required TResult Function(String email, String otp) verifyOtp,
  }) {
    return verifyOtp(email, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(String password, String confirmPassword)? changePassword,
    TResult? Function(String email)? setEmail,
    TResult? Function(String email)? sendOtp,
    TResult? Function(String email, String otp)? verifyOtp,
  }) {
    return verifyOtp?.call(email, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(String password, String confirmPassword)? changePassword,
    TResult Function(String email)? setEmail,
    TResult Function(String email)? sendOtp,
    TResult Function(String email, String otp)? verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(email, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ForgotPasswordErrorOccurred value) errorOccurred,
    required TResult Function(ChangePasswordRequested value) changePassword,
    required TResult Function(SetEmailEvent value) setEmail,
    required TResult Function(SendOtpRequested value) sendOtp,
    required TResult Function(VerifyOtpRequested value) verifyOtp,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult? Function(ChangePasswordRequested value)? changePassword,
    TResult? Function(SetEmailEvent value)? setEmail,
    TResult? Function(SendOtpRequested value)? sendOtp,
    TResult? Function(VerifyOtpRequested value)? verifyOtp,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordErrorOccurred value)? errorOccurred,
    TResult Function(ChangePasswordRequested value)? changePassword,
    TResult Function(SetEmailEvent value)? setEmail,
    TResult Function(SendOtpRequested value)? sendOtp,
    TResult Function(VerifyOtpRequested value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class VerifyOtpRequested implements ForgotPasswordEvent {
  const factory VerifyOtpRequested(
      {required final String email,
      required final String otp}) = _$VerifyOtpRequestedImpl;

  String get email;
  String get otp;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpRequestedImplCopyWith<_$VerifyOtpRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
