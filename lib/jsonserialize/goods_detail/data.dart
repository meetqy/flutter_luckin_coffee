import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class GoodsDetail {
  int code;
  GoodsDetailData data;
  String msg;

  GoodsDetail({
    this.code,
    this.data,
    this.msg,
  });

  //反序列化
  factory GoodsDetail.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsDetailToJson(this);
}

@JsonSerializable()
class GoodsDetailData {
  GoodsDetailExtJson extJson;
  GoodsDetailCategory category;
  List<GoodsDetailPic> pics;
  String content;
  GoodsDetailBasicInfo basicInfo;
  List<GoodsDetailProperty> properties;

  GoodsDetailData(
      {this.extJson,
      this.category,
      this.pics,
      this.content,
      this.basicInfo,
      this.properties});

  //反序列化
  factory GoodsDetailData.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailDataFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsDetailDataToJson(this);
}

@JsonSerializable()
class GoodsDetailBasicInfo {
  int categoryId;
  String characteristic;
  double commission;
  int commissionType;
  String dateAdd;
  String dateUpdate;
  int gotScore;
  int gotScoreType;
  int id;
  bool kanjia;
  double kanjiaPrice;
  bool limitation;
  int logisticsId;
  bool miaosha;
  double minPrice;
  int minScore;
  String name;
  int numberFav;
  int numberGoodReputation;
  int numberOrders;
  int numberSells;
  double originalPrice;
  int paixu;
  String pic;
  bool pingtuan;
  double pingtuanPrice;
  int recommendStatus;
  String recommendStatusStr;
  int shopId;
  int status;
  String statusStr;
  int stores;
  int userId;
  int vetStatus;
  int views;
  double weight;

  GoodsDetailBasicInfo({
    this.categoryId,
    this.characteristic,
    this.commission,
    this.commissionType,
    this.dateAdd,
    this.dateUpdate,
    this.gotScore,
    this.gotScoreType,
    this.id,
    this.kanjia,
    this.kanjiaPrice,
    this.limitation,
    this.logisticsId,
    this.miaosha,
    this.minPrice,
    this.minScore,
    this.name,
    this.numberFav,
    this.numberGoodReputation,
    this.numberOrders,
    this.numberSells,
    this.originalPrice,
    this.paixu,
    this.pic,
    this.pingtuan,
    this.pingtuanPrice,
    this.recommendStatus,
    this.recommendStatusStr,
    this.shopId,
    this.status,
    this.statusStr,
    this.stores,
    this.userId,
    this.vetStatus,
    this.views,
    this.weight,
  });

  //反序列化
  factory GoodsDetailBasicInfo.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailBasicInfoFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsDetailBasicInfoToJson(this);
}

@JsonSerializable()
class GoodsDetailCategory {
  String dateAdd;
  int id;
  bool isUse;
  String name;
  int paixu;
  int pid;
  int userId;

  GoodsDetailCategory({
    this.dateAdd,
    this.id,
    this.isUse,
    this.name,
    this.paixu,
    this.pid,
    this.userId,
  });

  //反序列化
  factory GoodsDetailCategory.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailCategoryFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsDetailCategoryToJson(this);
}

@JsonSerializable()
class GoodsDetailExtJson {
  String defaultSpec;

  GoodsDetailExtJson({
    this.defaultSpec,
  });

  //反序列化
  factory GoodsDetailExtJson.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailExtJsonFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsDetailExtJsonToJson(this);
}

@JsonSerializable()
class GoodsDetailPic {
  int goodsId;
  int id;
  String pic;
  int userId;

  GoodsDetailPic({
    this.goodsId,
    this.id,
    this.pic,
    this.userId,
  });

  //反序列化
  factory GoodsDetailPic.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailPicFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsDetailPicToJson(this);
}

@JsonSerializable()
class GoodsDetailProperty {
  List<GoodsDetailProperty> childsCurGoods;
  String dateAdd;
  int id;
  String name;
  int paixu;
  int userId;
  int propertyId;

  GoodsDetailProperty({
    this.childsCurGoods,
    this.dateAdd,
    this.id,
    this.name,
    this.paixu,
    this.userId,
    this.propertyId,
  });

  //反序列化
  factory GoodsDetailProperty.fromJson(Map<String, dynamic> json) =>
      _$GoodsDetailPropertyFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsDetailPropertyToJson(this);
}
