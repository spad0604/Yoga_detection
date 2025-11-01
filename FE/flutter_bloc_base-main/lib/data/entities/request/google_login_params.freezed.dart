// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_login_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoogleLoginParams _$GoogleLoginParamsFromJson(Map<String, dynamic> json) {
  return _GoogleLoginParams.fromJson(json);
}

/// @nodoc
mixin _$GoogleLoginParams {
  @JsonKey(name: 'idToken')
  String get idToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcmToken')
  String? get fcmToken => throw _privateConstructorUsedError;

  /// Serializes this GoogleLoginParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoogleLoginParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoogleLoginParamsCopyWith<GoogleLoginParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleLoginParamsCopyWith<$Res> {
  factory $GoogleLoginParamsCopyWith(
          GoogleLoginParams value, $Res Function(GoogleLoginParams) then) =
      _$GoogleLoginParamsCopyWithImpl<$Res, GoogleLoginParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'idToken') String idToken,
      @JsonKey(name: 'fcmToken') String? fcmToken});
}

/// @nodoc
class _$GoogleLoginParamsCopyWithImpl<$Res, $Val extends GoogleLoginParams>
    implements $GoogleLoginParamsCopyWith<$Res> {
  _$GoogleLoginParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoogleLoginParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoogleLoginParamsImplCopyWith<$Res>
    implements $GoogleLoginParamsCopyWith<$Res> {
  factory _$$GoogleLoginParamsImplCopyWith(_$GoogleLoginParamsImpl value,
          $Res Function(_$GoogleLoginParamsImpl) then) =
      __$$GoogleLoginParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'idToken') String idToken,
      @JsonKey(name: 'fcmToken') String? fcmToken});
}

/// @nodoc
class __$$GoogleLoginParamsImplCopyWithImpl<$Res>
    extends _$GoogleLoginParamsCopyWithImpl<$Res, _$GoogleLoginParamsImpl>
    implements _$$GoogleLoginParamsImplCopyWith<$Res> {
  __$$GoogleLoginParamsImplCopyWithImpl(_$GoogleLoginParamsImpl _value,
      $Res Function(_$GoogleLoginParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleLoginParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_$GoogleLoginParamsImpl(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoogleLoginParamsImpl
    with DiagnosticableTreeMixin
    implements _GoogleLoginParams {
  const _$GoogleLoginParamsImpl(
      {@JsonKey(name: 'idToken') required this.idToken,
      @JsonKey(name: 'fcmToken') this.fcmToken});

  factory _$GoogleLoginParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoogleLoginParamsImplFromJson(json);

  @override
  @JsonKey(name: 'idToken')
  final String idToken;
  @override
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoogleLoginParams(idToken: $idToken, fcmToken: $fcmToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoogleLoginParams'))
      ..add(DiagnosticsProperty('idToken', idToken))
      ..add(DiagnosticsProperty('fcmToken', fcmToken));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleLoginParamsImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idToken, fcmToken);

  /// Create a copy of GoogleLoginParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleLoginParamsImplCopyWith<_$GoogleLoginParamsImpl> get copyWith =>
      __$$GoogleLoginParamsImplCopyWithImpl<_$GoogleLoginParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoogleLoginParamsImplToJson(
      this,
    );
  }
}

abstract class _GoogleLoginParams implements GoogleLoginParams {
  const factory _GoogleLoginParams(
          {@JsonKey(name: 'idToken') required final String idToken,
          @JsonKey(name: 'fcmToken') final String? fcmToken}) =
      _$GoogleLoginParamsImpl;

  factory _GoogleLoginParams.fromJson(Map<String, dynamic> json) =
      _$GoogleLoginParamsImpl.fromJson;

  @override
  @JsonKey(name: 'idToken')
  String get idToken;
  @override
  @JsonKey(name: 'fcmToken')
  String? get fcmToken;

  /// Create a copy of GoogleLoginParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleLoginParamsImplCopyWith<_$GoogleLoginParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
