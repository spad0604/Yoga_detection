// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetInformationImpl _$$GetInformationImplFromJson(Map<String, dynamic> json) =>
    _$GetInformationImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      id: json['id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      registerDate: json['registerDate'] == null
          ? null
          : DateTime.parse(json['registerDate'] as String),
      avatarUrl: json['avatarUrl'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$GetInformationImplToJson(
        _$GetInformationImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dob': instance.dob?.toIso8601String(),
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'registerDate': instance.registerDate?.toIso8601String(),
      'avatarUrl': instance.avatarUrl,
      'role': instance.role,
    };
