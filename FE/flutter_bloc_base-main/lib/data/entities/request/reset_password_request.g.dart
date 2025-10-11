// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordRequestImpl _$$ResetPasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordRequestImpl(
      newPassword: json['newPassword'] as String,
      confirmNewPassword: json['confirmNewPassword'] as String,
    );

Map<String, dynamic> _$$ResetPasswordRequestImplToJson(
        _$ResetPasswordRequestImpl instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'confirmNewPassword': instance.confirmNewPassword,
    };
