// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsList _$GoodsListFromJson(Map<String, dynamic> json) {
  return GoodsList(
      code: json['code'] as int,
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : GoodsListDatum.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      msg: json['msg'] as String);
}

Map<String, dynamic> _$GoodsListToJson(GoodsList instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg
    };

GoodsListDatum _$GoodsListDatumFromJson(Map<String, dynamic> json) {
  return GoodsListDatum(
      categoryId: json['categoryId'] as int,
      characteristic: json['characteristic'] as String,
      commission: (json['commission'] as num)?.toDouble(),
      commissionType: json['commissionType'] as int,
      dateAdd: json['dateAdd'] as String,
      gotScore: json['gotScore'] as int,
      gotScoreType: json['gotScoreType'] as int,
      id: json['id'] as int,
      kanjia: json['kanjia'] as bool,
      kanjiaPrice: (json['kanjiaPrice'] as num)?.toDouble(),
      limitation: json['limitation'] as bool,
      logisticsId: json['logisticsId'] as int,
      miaosha: json['miaosha'] as bool,
      minPrice: (json['minPrice'] as num)?.toDouble(),
      minScore: json['minScore'] as int,
      name: json['name'] as String,
      numberFav: json['numberFav'] as int,
      numberGoodReputation: json['numberGoodReputation'] as int,
      numberOrders: json['numberOrders'] as int,
      numberSells: json['numberSells'] as int,
      originalPrice: (json['originalPrice'] as num)?.toDouble(),
      paixu: json['paixu'] as int,
      pic: json['pic'] as String,
      pingtuan: json['pingtuan'] as bool,
      pingtuanPrice: (json['pingtuanPrice'] as num)?.toDouble(),
      recommendStatus: json['recommendStatus'] as int,
      recommendStatusStr: json['recommendStatusStr'] as String,
      shopId: json['shopId'] as int,
      status: json['status'] as int,
      statusStr: json['statusStr'] as String,
      stores: json['stores'] as int,
      userId: json['userId'] as int,
      vetStatus: json['vetStatus'] as int,
      views: json['views'] as int,
      weight: (json['weight'] as num)?.toDouble());
}

Map<String, dynamic> _$GoodsListDatumToJson(GoodsListDatum instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'characteristic': instance.characteristic,
      'commission': instance.commission,
      'commissionType': instance.commissionType,
      'dateAdd': instance.dateAdd,
      'gotScore': instance.gotScore,
      'gotScoreType': instance.gotScoreType,
      'id': instance.id,
      'kanjia': instance.kanjia,
      'kanjiaPrice': instance.kanjiaPrice,
      'limitation': instance.limitation,
      'logisticsId': instance.logisticsId,
      'miaosha': instance.miaosha,
      'minPrice': instance.minPrice,
      'minScore': instance.minScore,
      'name': instance.name,
      'numberFav': instance.numberFav,
      'numberGoodReputation': instance.numberGoodReputation,
      'numberOrders': instance.numberOrders,
      'numberSells': instance.numberSells,
      'originalPrice': instance.originalPrice,
      'paixu': instance.paixu,
      'pic': instance.pic,
      'pingtuan': instance.pingtuan,
      'pingtuanPrice': instance.pingtuanPrice,
      'recommendStatus': instance.recommendStatus,
      'recommendStatusStr': instance.recommendStatusStr,
      'shopId': instance.shopId,
      'status': instance.status,
      'statusStr': instance.statusStr,
      'stores': instance.stores,
      'userId': instance.userId,
      'vetStatus': instance.vetStatus,
      'views': instance.views,
      'weight': instance.weight
    };
