// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginStarted,
    required TResult Function(String idToken) googleStarted,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginStarted,
    TResult? Function(String idToken)? googleStarted,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginStarted,
    TResult Function(String idToken)? googleStarted,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEmailChanged value) emailChanged,
    required TResult Function(LoginPasswordChanged value) passwordChanged,
    required TResult Function(LoginStarted value) loginStarted,
    required TResult Function(LoginWithGoogleStarted value) googleStarted,
    required TResult Function(LoginErrorOccurred value) errorOccurred,
    required TResult Function(LoginLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEmailChanged value)? emailChanged,
    TResult? Function(LoginPasswordChanged value)? passwordChanged,
    TResult? Function(LoginStarted value)? loginStarted,
    TResult? Function(LoginWithGoogleStarted value)? googleStarted,
    TResult? Function(LoginErrorOccurred value)? errorOccurred,
    TResult? Function(LoginLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEmailChanged value)? emailChanged,
    TResult Function(LoginPasswordChanged value)? passwordChanged,
    TResult Function(LoginStarted value)? loginStarted,
    TResult Function(LoginWithGoogleStarted value)? googleStarted,
    TResult Function(LoginErrorOccurred value)? errorOccurred,
    TResult Function(LoginLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginEmailChangedImplCopyWith<$Res> {
  factory _$$LoginEmailChangedImplCopyWith(_$LoginEmailChangedImpl value,
          $Res Function(_$LoginEmailChangedImpl) then) =
      __$$LoginEmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$LoginEmailChangedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginEmailChangedImpl>
    implements _$$LoginEmailChangedImplCopyWith<$Res> {
  __$$LoginEmailChangedImplCopyWithImpl(_$LoginEmailChangedImpl _value,
      $Res Function(_$LoginEmailChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$LoginEmailChangedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginEmailChangedImpl implements LoginEmailChanged {
  const _$LoginEmailChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEmailChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginEmailChangedImplCopyWith<_$LoginEmailChangedImpl> get copyWith =>
      __$$LoginEmailChangedImplCopyWithImpl<_$LoginEmailChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginStarted,
    required TResult Function(String idToken) googleStarted,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() loading,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginStarted,
    TResult? Function(String idToken)? googleStarted,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? loading,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginStarted,
    TResult Function(String idToken)? googleStarted,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEmailChanged value) emailChanged,
    required TResult Function(LoginPasswordChanged value) passwordChanged,
    required TResult Function(LoginStarted value) loginStarted,
    required TResult Function(LoginWithGoogleStarted value) googleStarted,
    required TResult Function(LoginErrorOccurred value) errorOccurred,
    required TResult Function(LoginLoading value) loading,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEmailChanged value)? emailChanged,
    TResult? Function(LoginPasswordChanged value)? passwordChanged,
    TResult? Function(LoginStarted value)? loginStarted,
    TResult? Function(LoginWithGoogleStarted value)? googleStarted,
    TResult? Function(LoginErrorOccurred value)? errorOccurred,
    TResult? Function(LoginLoading value)? loading,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEmailChanged value)? emailChanged,
    TResult Function(LoginPasswordChanged value)? passwordChanged,
    TResult Function(LoginStarted value)? loginStarted,
    TResult Function(LoginWithGoogleStarted value)? googleStarted,
    TResult Function(LoginErrorOccurred value)? errorOccurred,
    TResult Function(LoginLoading value)? loading,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class LoginEmailChanged implements LoginEvent {
  const factory LoginEmailChanged(final String email) = _$LoginEmailChangedImpl;

  String get email;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginEmailChangedImplCopyWith<_$LoginEmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginPasswordChangedImplCopyWith<$Res> {
  factory _$$LoginPasswordChangedImplCopyWith(_$LoginPasswordChangedImpl value,
          $Res Function(_$LoginPasswordChangedImpl) then) =
      __$$LoginPasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$LoginPasswordChangedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginPasswordChangedImpl>
    implements _$$LoginPasswordChangedImplCopyWith<$Res> {
  __$$LoginPasswordChangedImplCopyWithImpl(_$LoginPasswordChangedImpl _value,
      $Res Function(_$LoginPasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$LoginPasswordChangedImpl(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginPasswordChangedImpl implements LoginPasswordChanged {
  const _$LoginPasswordChangedImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPasswordChangedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginPasswordChangedImplCopyWith<_$LoginPasswordChangedImpl>
      get copyWith =>
          __$$LoginPasswordChangedImplCopyWithImpl<_$LoginPasswordChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginStarted,
    required TResult Function(String idToken) googleStarted,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() loading,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginStarted,
    TResult? Function(String idToken)? googleStarted,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? loading,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginStarted,
    TResult Function(String idToken)? googleStarted,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEmailChanged value) emailChanged,
    required TResult Function(LoginPasswordChanged value) passwordChanged,
    required TResult Function(LoginStarted value) loginStarted,
    required TResult Function(LoginWithGoogleStarted value) googleStarted,
    required TResult Function(LoginErrorOccurred value) errorOccurred,
    required TResult Function(LoginLoading value) loading,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEmailChanged value)? emailChanged,
    TResult? Function(LoginPasswordChanged value)? passwordChanged,
    TResult? Function(LoginStarted value)? loginStarted,
    TResult? Function(LoginWithGoogleStarted value)? googleStarted,
    TResult? Function(LoginErrorOccurred value)? errorOccurred,
    TResult? Function(LoginLoading value)? loading,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEmailChanged value)? emailChanged,
    TResult Function(LoginPasswordChanged value)? passwordChanged,
    TResult Function(LoginStarted value)? loginStarted,
    TResult Function(LoginWithGoogleStarted value)? googleStarted,
    TResult Function(LoginErrorOccurred value)? errorOccurred,
    TResult Function(LoginLoading value)? loading,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class LoginPasswordChanged implements LoginEvent {
  const factory LoginPasswordChanged(final String password) =
      _$LoginPasswordChangedImpl;

  String get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginPasswordChangedImplCopyWith<_$LoginPasswordChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginStartedImplCopyWith<$Res> {
  factory _$$LoginStartedImplCopyWith(
          _$LoginStartedImpl value, $Res Function(_$LoginStartedImpl) then) =
      __$$LoginStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginStartedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginStartedImpl>
    implements _$$LoginStartedImplCopyWith<$Res> {
  __$$LoginStartedImplCopyWithImpl(
      _$LoginStartedImpl _value, $Res Function(_$LoginStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginStartedImpl implements LoginStarted {
  const _$LoginStartedImpl();

  @override
  String toString() {
    return 'LoginEvent.loginStarted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginStarted,
    required TResult Function(String idToken) googleStarted,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() loading,
  }) {
    return loginStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginStarted,
    TResult? Function(String idToken)? googleStarted,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? loading,
  }) {
    return loginStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginStarted,
    TResult Function(String idToken)? googleStarted,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loginStarted != null) {
      return loginStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEmailChanged value) emailChanged,
    required TResult Function(LoginPasswordChanged value) passwordChanged,
    required TResult Function(LoginStarted value) loginStarted,
    required TResult Function(LoginWithGoogleStarted value) googleStarted,
    required TResult Function(LoginErrorOccurred value) errorOccurred,
    required TResult Function(LoginLoading value) loading,
  }) {
    return loginStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEmailChanged value)? emailChanged,
    TResult? Function(LoginPasswordChanged value)? passwordChanged,
    TResult? Function(LoginStarted value)? loginStarted,
    TResult? Function(LoginWithGoogleStarted value)? googleStarted,
    TResult? Function(LoginErrorOccurred value)? errorOccurred,
    TResult? Function(LoginLoading value)? loading,
  }) {
    return loginStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEmailChanged value)? emailChanged,
    TResult Function(LoginPasswordChanged value)? passwordChanged,
    TResult Function(LoginStarted value)? loginStarted,
    TResult Function(LoginWithGoogleStarted value)? googleStarted,
    TResult Function(LoginErrorOccurred value)? errorOccurred,
    TResult Function(LoginLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loginStarted != null) {
      return loginStarted(this);
    }
    return orElse();
  }
}

abstract class LoginStarted implements LoginEvent {
  const factory LoginStarted() = _$LoginStartedImpl;
}

/// @nodoc
abstract class _$$LoginWithGoogleStartedImplCopyWith<$Res> {
  factory _$$LoginWithGoogleStartedImplCopyWith(
          _$LoginWithGoogleStartedImpl value,
          $Res Function(_$LoginWithGoogleStartedImpl) then) =
      __$$LoginWithGoogleStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String idToken});
}

/// @nodoc
class __$$LoginWithGoogleStartedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginWithGoogleStartedImpl>
    implements _$$LoginWithGoogleStartedImplCopyWith<$Res> {
  __$$LoginWithGoogleStartedImplCopyWithImpl(
      _$LoginWithGoogleStartedImpl _value,
      $Res Function(_$LoginWithGoogleStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
  }) {
    return _then(_$LoginWithGoogleStartedImpl(
      null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginWithGoogleStartedImpl implements LoginWithGoogleStarted {
  const _$LoginWithGoogleStartedImpl(this.idToken);

  @override
  final String idToken;

  @override
  String toString() {
    return 'LoginEvent.googleStarted(idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithGoogleStartedImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idToken);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithGoogleStartedImplCopyWith<_$LoginWithGoogleStartedImpl>
      get copyWith => __$$LoginWithGoogleStartedImplCopyWithImpl<
          _$LoginWithGoogleStartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginStarted,
    required TResult Function(String idToken) googleStarted,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() loading,
  }) {
    return googleStarted(idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginStarted,
    TResult? Function(String idToken)? googleStarted,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? loading,
  }) {
    return googleStarted?.call(idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginStarted,
    TResult Function(String idToken)? googleStarted,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (googleStarted != null) {
      return googleStarted(idToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEmailChanged value) emailChanged,
    required TResult Function(LoginPasswordChanged value) passwordChanged,
    required TResult Function(LoginStarted value) loginStarted,
    required TResult Function(LoginWithGoogleStarted value) googleStarted,
    required TResult Function(LoginErrorOccurred value) errorOccurred,
    required TResult Function(LoginLoading value) loading,
  }) {
    return googleStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEmailChanged value)? emailChanged,
    TResult? Function(LoginPasswordChanged value)? passwordChanged,
    TResult? Function(LoginStarted value)? loginStarted,
    TResult? Function(LoginWithGoogleStarted value)? googleStarted,
    TResult? Function(LoginErrorOccurred value)? errorOccurred,
    TResult? Function(LoginLoading value)? loading,
  }) {
    return googleStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEmailChanged value)? emailChanged,
    TResult Function(LoginPasswordChanged value)? passwordChanged,
    TResult Function(LoginStarted value)? loginStarted,
    TResult Function(LoginWithGoogleStarted value)? googleStarted,
    TResult Function(LoginErrorOccurred value)? errorOccurred,
    TResult Function(LoginLoading value)? loading,
    required TResult orElse(),
  }) {
    if (googleStarted != null) {
      return googleStarted(this);
    }
    return orElse();
  }
}

abstract class LoginWithGoogleStarted implements LoginEvent {
  const factory LoginWithGoogleStarted(final String idToken) =
      _$LoginWithGoogleStartedImpl;

  String get idToken;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithGoogleStartedImplCopyWith<_$LoginWithGoogleStartedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginErrorOccurredImplCopyWith<$Res> {
  factory _$$LoginErrorOccurredImplCopyWith(_$LoginErrorOccurredImpl value,
          $Res Function(_$LoginErrorOccurredImpl) then) =
      __$$LoginErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class __$$LoginErrorOccurredImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginErrorOccurredImpl>
    implements _$$LoginErrorOccurredImplCopyWith<$Res> {
  __$$LoginErrorOccurredImplCopyWithImpl(_$LoginErrorOccurredImpl _value,
      $Res Function(_$LoginErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$LoginErrorOccurredImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoginErrorOccurredImpl implements LoginErrorOccurred {
  const _$LoginErrorOccurredImpl([this.error]);

  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'LoginEvent.errorOccurred(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginErrorOccurredImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginErrorOccurredImplCopyWith<_$LoginErrorOccurredImpl> get copyWith =>
      __$$LoginErrorOccurredImplCopyWithImpl<_$LoginErrorOccurredImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginStarted,
    required TResult Function(String idToken) googleStarted,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() loading,
  }) {
    return errorOccurred(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginStarted,
    TResult? Function(String idToken)? googleStarted,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? loading,
  }) {
    return errorOccurred?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginStarted,
    TResult Function(String idToken)? googleStarted,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? loading,
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
    required TResult Function(LoginEmailChanged value) emailChanged,
    required TResult Function(LoginPasswordChanged value) passwordChanged,
    required TResult Function(LoginStarted value) loginStarted,
    required TResult Function(LoginWithGoogleStarted value) googleStarted,
    required TResult Function(LoginErrorOccurred value) errorOccurred,
    required TResult Function(LoginLoading value) loading,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEmailChanged value)? emailChanged,
    TResult? Function(LoginPasswordChanged value)? passwordChanged,
    TResult? Function(LoginStarted value)? loginStarted,
    TResult? Function(LoginWithGoogleStarted value)? googleStarted,
    TResult? Function(LoginErrorOccurred value)? errorOccurred,
    TResult? Function(LoginLoading value)? loading,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEmailChanged value)? emailChanged,
    TResult Function(LoginPasswordChanged value)? passwordChanged,
    TResult Function(LoginStarted value)? loginStarted,
    TResult Function(LoginWithGoogleStarted value)? googleStarted,
    TResult Function(LoginErrorOccurred value)? errorOccurred,
    TResult Function(LoginLoading value)? loading,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class LoginErrorOccurred implements LoginEvent {
  const factory LoginErrorOccurred([final BaseException<dynamic>? error]) =
      _$LoginErrorOccurredImpl;

  BaseException<dynamic>? get error;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginErrorOccurredImplCopyWith<_$LoginErrorOccurredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginLoadingImplCopyWith<$Res> {
  factory _$$LoginLoadingImplCopyWith(
          _$LoginLoadingImpl value, $Res Function(_$LoginLoadingImpl) then) =
      __$$LoginLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginLoadingImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginLoadingImpl>
    implements _$$LoginLoadingImplCopyWith<$Res> {
  __$$LoginLoadingImplCopyWithImpl(
      _$LoginLoadingImpl _value, $Res Function(_$LoginLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginLoadingImpl implements LoginLoading {
  const _$LoginLoadingImpl();

  @override
  String toString() {
    return 'LoginEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginStarted,
    required TResult Function(String idToken) googleStarted,
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginStarted,
    TResult? Function(String idToken)? googleStarted,
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginStarted,
    TResult Function(String idToken)? googleStarted,
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEmailChanged value) emailChanged,
    required TResult Function(LoginPasswordChanged value) passwordChanged,
    required TResult Function(LoginStarted value) loginStarted,
    required TResult Function(LoginWithGoogleStarted value) googleStarted,
    required TResult Function(LoginErrorOccurred value) errorOccurred,
    required TResult Function(LoginLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEmailChanged value)? emailChanged,
    TResult? Function(LoginPasswordChanged value)? passwordChanged,
    TResult? Function(LoginStarted value)? loginStarted,
    TResult? Function(LoginWithGoogleStarted value)? googleStarted,
    TResult? Function(LoginErrorOccurred value)? errorOccurred,
    TResult? Function(LoginLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEmailChanged value)? emailChanged,
    TResult Function(LoginPasswordChanged value)? passwordChanged,
    TResult Function(LoginStarted value)? loginStarted,
    TResult Function(LoginWithGoogleStarted value)? googleStarted,
    TResult Function(LoginErrorOccurred value)? errorOccurred,
    TResult Function(LoginLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginLoading implements LoginEvent {
  const factory LoginLoading() = _$LoginLoadingImpl;
}
