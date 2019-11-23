// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
      city: json['city'] as String,
      dateAdd: json['dateAdd'] as String,
      dateLogin: json['dateLogin'] as String,
      email: json['email'] as String,
      id: json['id'] as int,
      ipAdd: json['ipAdd'] as String,
      ipLogin: json['ipLogin'] as String,
      isIdcardCheck: json['isIdcardCheck'] as bool,
      isSeller: json['isSeller'] as bool,
      levelRenew: json['levelRenew'] as bool,
      nick: json['nick'] as String,
      province: json['province'] as String,
      source: json['source'] as int,
      sourceStr: json['sourceStr'] as String,
      status: json['status'] as int,
      statusStr: json['statusStr'] as String,
      token: json['token'] as String);
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'city': instance.city,
      'dateAdd': instance.dateAdd,
      'dateLogin': instance.dateLogin,
      'email': instance.email,
      'id': instance.id,
      'ipAdd': instance.ipAdd,
      'ipLogin': instance.ipLogin,
      'isIdcardCheck': instance.isIdcardCheck,
      'isSeller': instance.isSeller,
      'levelRenew': instance.levelRenew,
      'nick': instance.nick,
      'province': instance.province,
      'source': instance.source,
      'sourceStr': instance.sourceStr,
      'status': instance.status,
      'statusStr': instance.statusStr,
      'token': instance.token
    };
