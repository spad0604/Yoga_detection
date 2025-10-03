// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterParamsImpl _$$RegisterParamsImplFromJson(Map<String, dynamic> json) =>
    _$RegisterParamsImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      birthDate: json['birthDate'] as String,
    );

Map<String, dynamic> _$$RegisterParamsImplToJson(
        _$RegisterParamsImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'birthDate': instance.birthDate,
    };
