// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return OrderData(
      goodsId: json['goodsId'] as int,
      number: json['number'] as int,
      propertyChildIds: (json['propertyChildIds'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      logisticsType: json['logisticsType'] as int,
      days: (json['days'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'goodsId': instance.goodsId,
      'number': instance.number,
      'propertyChildIds': instance.propertyChildIds,
      'logisticsType': instance.logisticsType,
      'days': instance.days
    };
