// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(
            String firstName,
            String lastName,
            String email,
            String password,
            String confirmPassword,
            String phone,
            String birthDate)
        started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(
            String firstName,
            String lastName,
            String email,
            String password,
            String confirmPassword,
            String phone,
            String birthDate)?
        started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(
            String firstName,
            String lastName,
            String email,
            String password,
            String confirmPassword,
            String phone,
            String birthDate)?
        started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterErrorOccurred value) errorOccurred,
    required TResult Function(RegisterStarted value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterErrorOccurred value)? errorOccurred,
    TResult? Function(RegisterStarted value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterErrorOccurred value)? errorOccurred,
    TResult Function(RegisterStarted value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RegisterErrorOccurredImplCopyWith<$Res> {
  factory _$$RegisterErrorOccurredImplCopyWith(
          _$RegisterErrorOccurredImpl value,
          $Res Function(_$RegisterErrorOccurredImpl) then) =
      __$$RegisterErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class __$$RegisterErrorOccurredImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$RegisterErrorOccurredImpl>
    implements _$$RegisterErrorOccurredImplCopyWith<$Res> {
  __$$RegisterErrorOccurredImplCopyWithImpl(_$RegisterErrorOccurredImpl _value,
      $Res Function(_$RegisterErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$RegisterErrorOccurredImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$RegisterErrorOccurredImpl implements RegisterErrorOccurred {
  const _$RegisterErrorOccurredImpl([this.error]);

  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'RegisterEvent.errorOccurred(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterErrorOccurredImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorOccurredImplCopyWith<_$RegisterErrorOccurredImpl>
      get copyWith => __$$RegisterErrorOccurredImplCopyWithImpl<
          _$RegisterErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(
            String firstName,
            String lastName,
            String email,
            String password,
            String confirmPassword,
            String phone,
            String birthDate)
        started,
  }) {
    return errorOccurred(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(
            String firstName,
            String lastName,
            String email,
            String password,
            String confirmPassword,
            String phone,
            String birthDate)?
        started,
  }) {
    return errorOccurred?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(
            String firstName,
            String lastName,
            String email,
            String password,
            String confirmPassword,
            String phone,
            String birthDate)?
        started,
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
    required TResult Function(RegisterErrorOccurred value) errorOccurred,
    required TResult Function(RegisterStarted value) started,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterErrorOccurred value)? errorOccurred,
    TResult? Function(RegisterStarted value)? started,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterErrorOccurred value)? errorOccurred,
    TResult Function(RegisterStarted value)? started,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class RegisterErrorOccurred implements RegisterEvent {
  const factory RegisterErrorOccurred([final BaseException<dynamic>? error]) =
      _$RegisterErrorOccurredImpl;

  BaseException<dynamic>? get error;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterErrorOccurredImplCopyWith<_$RegisterErrorOccurredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterStartedImplCopyWith<$Res> {
  factory _$$RegisterStartedImplCopyWith(_$RegisterStartedImpl value,
          $Res Function(_$RegisterStartedImpl) then) =
      __$$RegisterStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String phone,
      String birthDate});
}

/// @nodoc
class __$$RegisterStartedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$RegisterStartedImpl>
    implements _$$RegisterStartedImplCopyWith<$Res> {
  __$$RegisterStartedImplCopyWithImpl(
      _$RegisterStartedImpl _value, $Res Function(_$RegisterStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? phone = null,
    Object? birthDate = null,
  }) {
    return _then(_$RegisterStartedImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterStartedImpl implements RegisterStarted {
  const _$RegisterStartedImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.phone,
      required this.birthDate});

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String phone;
  @override
  final String birthDate;

  @override
  String toString() {
    return 'RegisterEvent.started(firstName: $firstName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword, phone: $phone, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStartedImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      password, confirmPassword, phone, birthDate);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStartedImplCopyWith<_$RegisterStartedImpl> get copyWith =>
      __$$RegisterStartedImplCopyWithImpl<_$RegisterStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(
            String firstName,
            String lastName,
            String email,
            String password,
            String confirmPassword,
            String phone,
            String birthDate)
        started,
  }) {
    return started(firstName, lastName, email, password, confirmPassword, phone,
        birthDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(
            String firstName,
            String lastName,
            String email,
            String password,
            String confirmPassword,
            String phone,
            String birthDate)?
        started,
  }) {
    return started?.call(firstName, lastName, email, password, confirmPassword,
        phone, birthDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(
            String firstName,
            String lastName,
            String email,
            String password,
            String confirmPassword,
            String phone,
            String birthDate)?
        started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(firstName, lastName, email, password, confirmPassword,
          phone, birthDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterErrorOccurred value) errorOccurred,
    required TResult Function(RegisterStarted value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterErrorOccurred value)? errorOccurred,
    TResult? Function(RegisterStarted value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterErrorOccurred value)? errorOccurred,
    TResult Function(RegisterStarted value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class RegisterStarted implements RegisterEvent {
  const factory RegisterStarted(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String password,
      required final String confirmPassword,
      required final String phone,
      required final String birthDate}) = _$RegisterStartedImpl;

  String get firstName;
  String get lastName;
  String get email;
  String get password;
  String get confirmPassword;
  String get phone;
  String get birthDate;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterStartedImplCopyWith<_$RegisterStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
