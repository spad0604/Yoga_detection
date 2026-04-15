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
  @JsonKey(name: "firstName")
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "lastName")
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "dob")
  DateTime? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "registerDate")
  DateTime? get registerDate => throw _privateConstructorUsedError;
  @JsonKey(name: "avatarUrl")
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String? get role => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "firstName") String firstName,
      @JsonKey(name: "lastName") String lastName,
      @JsonKey(name: "dob") DateTime? dob,
      @JsonKey(name: "id") String id,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "registerDate") DateTime? registerDate,
      @JsonKey(name: "avatarUrl") String? avatarUrl,
      @JsonKey(name: "role") String? role});
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
    Object? dob = freezed,
    Object? id = null,
    Object? email = null,
    Object? phone = freezed,
    Object? registerDate = freezed,
    Object? avatarUrl = freezed,
    Object? role = freezed,
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
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: "firstName") String firstName,
      @JsonKey(name: "lastName") String lastName,
      @JsonKey(name: "dob") DateTime? dob,
      @JsonKey(name: "id") String id,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "registerDate") DateTime? registerDate,
      @JsonKey(name: "avatarUrl") String? avatarUrl,
      @JsonKey(name: "role") String? role});
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
    Object? dob = freezed,
    Object? id = null,
    Object? email = null,
    Object? phone = freezed,
    Object? registerDate = freezed,
    Object? avatarUrl = freezed,
    Object? role = freezed,
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
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetInformationImpl implements _GetInformation {
  const _$GetInformationImpl(
      {@JsonKey(name: "firstName") required this.firstName,
      @JsonKey(name: "lastName") required this.lastName,
      @JsonKey(name: "dob") this.dob,
      @JsonKey(name: "id") required this.id,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "registerDate") this.registerDate,
      @JsonKey(name: "avatarUrl") this.avatarUrl,
      @JsonKey(name: "role") this.role});

  factory _$GetInformationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetInformationImplFromJson(json);

  @override
  @JsonKey(name: "firstName")
  final String firstName;
  @override
  @JsonKey(name: "lastName")
  final String lastName;
  @override
  @JsonKey(name: "dob")
  final DateTime? dob;
  @override
  @JsonKey(name: "id")
  final String id;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "registerDate")
  final DateTime? registerDate;
  @override
  @JsonKey(name: "avatarUrl")
  final String? avatarUrl;
  @override
  @JsonKey(name: "role")
  final String? role;

  @override
  String toString() {
    return 'GetInformation(firstName: $firstName, lastName: $lastName, dob: $dob, id: $id, email: $email, phone: $phone, registerDate: $registerDate, avatarUrl: $avatarUrl, role: $role)';
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
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.registerDate, registerDate) ||
                other.registerDate == registerDate) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, dob, id,
      email, phone, registerDate, avatarUrl, role);

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
      {@JsonKey(name: "firstName") required final String firstName,
      @JsonKey(name: "lastName") required final String lastName,
      @JsonKey(name: "dob") final DateTime? dob,
      @JsonKey(name: "id") required final String id,
      @JsonKey(name: "email") required final String email,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "registerDate") final DateTime? registerDate,
      @JsonKey(name: "avatarUrl") final String? avatarUrl,
      @JsonKey(name: "role") final String? role}) = _$GetInformationImpl;

  factory _GetInformation.fromJson(Map<String, dynamic> json) =
      _$GetInformationImpl.fromJson;

  @override
  @JsonKey(name: "firstName")
  String get firstName;
  @override
  @JsonKey(name: "lastName")
  String get lastName;
  @override
  @JsonKey(name: "dob")
  DateTime? get dob;
  @override
  @JsonKey(name: "id")
  String get id;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "registerDate")
  DateTime? get registerDate;
  @override
  @JsonKey(name: "avatarUrl")
  String? get avatarUrl;
  @override
  @JsonKey(name: "role")
  String? get role;

  /// Create a copy of GetInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetInformationImplCopyWith<_$GetInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
