// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_page_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() getInformation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? getInformation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? getInformation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountPageErrorOccurred value) errorOccurred,
    required TResult Function(AccountPageGetInformation value) getInformation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountPageErrorOccurred value)? errorOccurred,
    TResult? Function(AccountPageGetInformation value)? getInformation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountPageErrorOccurred value)? errorOccurred,
    TResult Function(AccountPageGetInformation value)? getInformation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountPageEventCopyWith<$Res> {
  factory $AccountPageEventCopyWith(
          AccountPageEvent value, $Res Function(AccountPageEvent) then) =
      _$AccountPageEventCopyWithImpl<$Res, AccountPageEvent>;
}

/// @nodoc
class _$AccountPageEventCopyWithImpl<$Res, $Val extends AccountPageEvent>
    implements $AccountPageEventCopyWith<$Res> {
  _$AccountPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AccountPageErrorOccurredImplCopyWith<$Res> {
  factory _$$AccountPageErrorOccurredImplCopyWith(
          _$AccountPageErrorOccurredImpl value,
          $Res Function(_$AccountPageErrorOccurredImpl) then) =
      __$$AccountPageErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class __$$AccountPageErrorOccurredImplCopyWithImpl<$Res>
    extends _$AccountPageEventCopyWithImpl<$Res, _$AccountPageErrorOccurredImpl>
    implements _$$AccountPageErrorOccurredImplCopyWith<$Res> {
  __$$AccountPageErrorOccurredImplCopyWithImpl(
      _$AccountPageErrorOccurredImpl _value,
      $Res Function(_$AccountPageErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AccountPageErrorOccurredImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$AccountPageErrorOccurredImpl implements AccountPageErrorOccurred {
  const _$AccountPageErrorOccurredImpl([this.error]);

  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'AccountPageEvent.errorOccurred(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountPageErrorOccurredImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AccountPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountPageErrorOccurredImplCopyWith<_$AccountPageErrorOccurredImpl>
      get copyWith => __$$AccountPageErrorOccurredImplCopyWithImpl<
          _$AccountPageErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() getInformation,
  }) {
    return errorOccurred(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? getInformation,
  }) {
    return errorOccurred?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? getInformation,
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
    required TResult Function(AccountPageErrorOccurred value) errorOccurred,
    required TResult Function(AccountPageGetInformation value) getInformation,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountPageErrorOccurred value)? errorOccurred,
    TResult? Function(AccountPageGetInformation value)? getInformation,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountPageErrorOccurred value)? errorOccurred,
    TResult Function(AccountPageGetInformation value)? getInformation,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class AccountPageErrorOccurred implements AccountPageEvent {
  const factory AccountPageErrorOccurred(
      [final BaseException<dynamic>? error]) = _$AccountPageErrorOccurredImpl;

  BaseException<dynamic>? get error;

  /// Create a copy of AccountPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountPageErrorOccurredImplCopyWith<_$AccountPageErrorOccurredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountPageGetInformationImplCopyWith<$Res> {
  factory _$$AccountPageGetInformationImplCopyWith(
          _$AccountPageGetInformationImpl value,
          $Res Function(_$AccountPageGetInformationImpl) then) =
      __$$AccountPageGetInformationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountPageGetInformationImplCopyWithImpl<$Res>
    extends _$AccountPageEventCopyWithImpl<$Res,
        _$AccountPageGetInformationImpl>
    implements _$$AccountPageGetInformationImplCopyWith<$Res> {
  __$$AccountPageGetInformationImplCopyWithImpl(
      _$AccountPageGetInformationImpl _value,
      $Res Function(_$AccountPageGetInformationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountPageGetInformationImpl implements AccountPageGetInformation {
  const _$AccountPageGetInformationImpl();

  @override
  String toString() {
    return 'AccountPageEvent.getInformation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountPageGetInformationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function() getInformation,
  }) {
    return getInformation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function()? getInformation,
  }) {
    return getInformation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function()? getInformation,
    required TResult orElse(),
  }) {
    if (getInformation != null) {
      return getInformation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountPageErrorOccurred value) errorOccurred,
    required TResult Function(AccountPageGetInformation value) getInformation,
  }) {
    return getInformation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountPageErrorOccurred value)? errorOccurred,
    TResult? Function(AccountPageGetInformation value)? getInformation,
  }) {
    return getInformation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountPageErrorOccurred value)? errorOccurred,
    TResult Function(AccountPageGetInformation value)? getInformation,
    required TResult orElse(),
  }) {
    if (getInformation != null) {
      return getInformation(this);
    }
    return orElse();
  }
}

abstract class AccountPageGetInformation implements AccountPageEvent {
  const factory AccountPageGetInformation() = _$AccountPageGetInformationImpl;
}
