// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetInformation _$GetInformationFromJson(Map<String, dynamic> json) {
  return _GetInformation.fromJson(json);
}

/// @nodoc
mixin _$GetInformation {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get registerDate => throw _privateConstructorUsedError;

  /// Serializes this GetInformation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetInformationCopyWith<GetInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetInformationCopyWith<$Res> {
  factory $GetInformationCopyWith(
          GetInformation value, $Res Function(GetInformation) then) =
      _$GetInformationCopyWithImpl<$Res, GetInformation>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String dob,
      String id,
      String email,
      String registerDate});
}

/// @nodoc
class _$GetInformationCopyWithImpl<$Res, $Val extends GetInformation>
    implements $GetInformationCopyWith<$Res> {
  _$GetInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? dob = null,
    Object? id = null,
    Object? email = null,
    Object? registerDate = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      registerDate: null == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetInformationImplCopyWith<$Res>
    implements $GetInformationCopyWith<$Res> {
  factory _$$GetInformationImplCopyWith(_$GetInformationImpl value,
          $Res Function(_$GetInformationImpl) then) =
      __$$GetInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String dob,
      String id,
      String email,
      String registerDate});
}

/// @nodoc
class __$$GetInformationImplCopyWithImpl<$Res>
    extends _$GetInformationCopyWithImpl<$Res, _$GetInformationImpl>
    implements _$$GetInformationImplCopyWith<$Res> {
  __$$GetInformationImplCopyWithImpl(
      _$GetInformationImpl _value, $Res Function(_$GetInformationImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? dob = null,
    Object? id = null,
    Object? email = null,
    Object? registerDate = null,
  }) {
    return _then(_$GetInformationImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      registerDate: null == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetInformationImpl implements _GetInformation {
  const _$GetInformationImpl(
      {required this.firstName,
      required this.lastName,
      required this.dob,
      required this.id,
      required this.email,
      required this.registerDate});

  factory _$GetInformationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetInformationImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String dob;
  @override
  final String id;
  @override
  final String email;
  @override
  final String registerDate;

  @override
  String toString() {
    return 'GetInformation(firstName: $firstName, lastName: $lastName, dob: $dob, id: $id, email: $email, registerDate: $registerDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetInformationImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.registerDate, registerDate) ||
                other.registerDate == registerDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, dob, id, email, registerDate);

  /// Create a copy of GetInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetInformationImplCopyWith<_$GetInformationImpl> get copyWith =>
      __$$GetInformationImplCopyWithImpl<_$GetInformationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetInformationImplToJson(
      this,
    );
  }
}

abstract class _GetInformation implements GetInformation {
  const factory _GetInformation(
      {required final String firstName,
      required final String lastName,
      required final String dob,
      required final String id,
      required final String email,
      required final String registerDate}) = _$GetInformationImpl;

  factory _GetInformation.fromJson(Map<String, dynamic> json) =
      _$GetInformationImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get dob;
  @override
  String get id;
  @override
  String get email;
  @override
  String get registerDate;

  /// Create a copy of GetInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetInformationImplCopyWith<_$GetInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
