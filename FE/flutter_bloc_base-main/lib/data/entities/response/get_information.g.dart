// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetInformationImpl _$$GetInformationImplFromJson(Map<String, dynamic> json) =>
    _$GetInformationImpl(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      dob: json['dob'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
      registerDate: json['register_date'] as String,
    );

Map<String, dynamic> _$$GetInformationImplToJson(
        _$GetInformationImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'dob': instance.dob,
      'id': instance.id,
      'email': instance.email,
      'register_date': instance.registerDate,
    };
