// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_login_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoogleLoginParamsImpl _$$GoogleLoginParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$GoogleLoginParamsImpl(
      idToken: json['idToken'] as String,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$$GoogleLoginParamsImplToJson(
        _$GoogleLoginParamsImpl instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'fcmToken': instance.fcmToken,
    };
