// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsCategory _$GoodsCategoryFromJson(Map<String, dynamic> json) {
  return GoodsCategory(
      code: json['code'] as int,
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : GoodsCategoryDatum.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      msg: json['msg'] as String);
}

Map<String, dynamic> _$GoodsCategoryToJson(GoodsCategory instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg
    };

GoodsCategoryDatum _$GoodsCategoryDatumFromJson(Map<String, dynamic> json) {
  return GoodsCategoryDatum(
      dateAdd: json['dateAdd'] as String,
      dateUpdate: json['dateUpdate'] as String,
      id: json['id'] as int,
      isUse: json['isUse'] as bool,
      level: json['level'] as int,
      name: json['name'] as String,
      paixu: json['paixu'] as int,
      pid: json['pid'] as int,
      userId: json['userId'] as int);
}

Map<String, dynamic> _$GoodsCategoryDatumToJson(GoodsCategoryDatum instance) =>
    <String, dynamic>{
      'dateAdd': instance.dateAdd,
      'dateUpdate': instance.dateUpdate,
      'id': instance.id,
      'isUse': instance.isUse,
      'level': instance.level,
      'name': instance.name,
      'paixu': instance.paixu,
      'pid': instance.pid,
      'userId': instance.userId
    };
