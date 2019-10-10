// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsDetail _$GoodsDetailFromJson(Map<String, dynamic> json) {
  return GoodsDetail(
      code: json['code'] as int,
      data: json['data'] == null
          ? null
          : GoodsDetailData.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String);
}

Map<String, dynamic> _$GoodsDetailToJson(GoodsDetail instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg
    };

GoodsDetailData _$GoodsDetailDataFromJson(Map<String, dynamic> json) {
  return GoodsDetailData(
      extJson: json['extJson'] == null
          ? null
          : GoodsDetailExtJson.fromJson(
              json['extJson'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : GoodsDetailCategory.fromJson(
              json['category'] as Map<String, dynamic>),
      pics: (json['pics'] as List)
          ?.map((e) => e == null
              ? null
              : GoodsDetailPic.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      content: json['content'] as String,
      basicInfo: json['basicInfo'] == null
          ? null
          : GoodsDetailBasicInfo.fromJson(
              json['basicInfo'] as Map<String, dynamic>),
      properties: (json['properties'] as List)
          ?.map((e) => e == null
              ? null
              : GoodsDetailProperty.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$GoodsDetailDataToJson(GoodsDetailData instance) =>
    <String, dynamic>{
      'extJson': instance.extJson,
      'category': instance.category,
      'pics': instance.pics,
      'content': instance.content,
      'basicInfo': instance.basicInfo,
      'properties': instance.properties
    };

GoodsDetailBasicInfo _$GoodsDetailBasicInfoFromJson(Map<String, dynamic> json) {
  return GoodsDetailBasicInfo(
      categoryId: json['categoryId'] as int,
      characteristic: json['characteristic'] as String,
      commission: (json['commission'] as num)?.toDouble(),
      commissionType: json['commissionType'] as int,
      dateAdd: json['dateAdd'] as String,
      dateUpdate: json['dateUpdate'] as String,
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

Map<String, dynamic> _$GoodsDetailBasicInfoToJson(
        GoodsDetailBasicInfo instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'characteristic': instance.characteristic,
      'commission': instance.commission,
      'commissionType': instance.commissionType,
      'dateAdd': instance.dateAdd,
      'dateUpdate': instance.dateUpdate,
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

GoodsDetailCategory _$GoodsDetailCategoryFromJson(Map<String, dynamic> json) {
  return GoodsDetailCategory(
      dateAdd: json['dateAdd'] as String,
      id: json['id'] as int,
      isUse: json['isUse'] as bool,
      name: json['name'] as String,
      paixu: json['paixu'] as int,
      pid: json['pid'] as int,
      userId: json['userId'] as int);
}

Map<String, dynamic> _$GoodsDetailCategoryToJson(
        GoodsDetailCategory instance) =>
    <String, dynamic>{
      'dateAdd': instance.dateAdd,
      'id': instance.id,
      'isUse': instance.isUse,
      'name': instance.name,
      'paixu': instance.paixu,
      'pid': instance.pid,
      'userId': instance.userId
    };

GoodsDetailExtJson _$GoodsDetailExtJsonFromJson(Map<String, dynamic> json) {
  return GoodsDetailExtJson(defaultSpec: json['defaultSpec'] as String);
}

Map<String, dynamic> _$GoodsDetailExtJsonToJson(GoodsDetailExtJson instance) =>
    <String, dynamic>{'defaultSpec': instance.defaultSpec};

GoodsDetailPic _$GoodsDetailPicFromJson(Map<String, dynamic> json) {
  return GoodsDetailPic(
      goodsId: json['goodsId'] as int,
      id: json['id'] as int,
      pic: json['pic'] as String,
      userId: json['userId'] as int);
}

Map<String, dynamic> _$GoodsDetailPicToJson(GoodsDetailPic instance) =>
    <String, dynamic>{
      'goodsId': instance.goodsId,
      'id': instance.id,
      'pic': instance.pic,
      'userId': instance.userId
    };

GoodsDetailProperty _$GoodsDetailPropertyFromJson(Map<String, dynamic> json) {
  return GoodsDetailProperty(
      childsCurGoods: (json['childsCurGoods'] as List)
          ?.map((e) => e == null
              ? null
              : GoodsDetailProperty.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      dateAdd: json['dateAdd'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      paixu: json['paixu'] as int,
      userId: json['userId'] as int,
      propertyId: json['propertyId'] as int);
}

Map<String, dynamic> _$GoodsDetailPropertyToJson(
        GoodsDetailProperty instance) =>
    <String, dynamic>{
      'childsCurGoods': instance.childsCurGoods,
      'dateAdd': instance.dateAdd,
      'id': instance.id,
      'name': instance.name,
      'paixu': instance.paixu,
      'userId': instance.userId,
      'propertyId': instance.propertyId
    };
