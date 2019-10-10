// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsPrice _$GoodsPriceFromJson(Map<String, dynamic> json) {
  return GoodsPrice(
      code: json['code'] as int,
      data: json['data'] == null
          ? null
          : GoodsPriceData.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String);
}

Map<String, dynamic> _$GoodsPriceToJson(GoodsPrice instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg
    };

GoodsPriceData _$GoodsPriceDataFromJson(Map<String, dynamic> json) {
  return GoodsPriceData(
      goodsId: json['goodsId'] as int,
      id: json['id'] as int,
      originalPrice: (json['originalPrice'] as num)?.toDouble(),
      pingtuanPrice: (json['pingtuanPrice'] as num)?.toDouble(),
      price: (json['price'] as num)?.toDouble(),
      propertyChildIds: json['propertyChildIds'] as String,
      propertyChildNames: json['propertyChildNames'] as String,
      score: json['score'] as int,
      stores: json['stores'] as int,
      userId: json['userId'] as int);
}

Map<String, dynamic> _$GoodsPriceDataToJson(GoodsPriceData instance) =>
    <String, dynamic>{
      'goodsId': instance.goodsId,
      'id': instance.id,
      'originalPrice': instance.originalPrice,
      'pingtuanPrice': instance.pingtuanPrice,
      'price': instance.price,
      'propertyChildIds': instance.propertyChildIds,
      'propertyChildNames': instance.propertyChildNames,
      'score': instance.score,
      'stores': instance.stores,
      'userId': instance.userId
    };
