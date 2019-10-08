import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class GoodsList {
  int code;
  List<GoodsListDatum> data;
  String msg;

  GoodsList({
    this.code,
    this.data,
    this.msg,
  });

  //反序列化
  factory GoodsList.fromJson(Map<String, dynamic> json) => _$GoodsListFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsListToJson(this);
}

@JsonSerializable()
class GoodsListDatum {
  int categoryId;
  String characteristic;
  double commission;
  int commissionType;
  String dateAdd;
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

  GoodsListDatum({
    this.categoryId,
    this.characteristic,
    this.commission,
    this.commissionType,
    this.dateAdd,
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
  factory GoodsListDatum.fromJson(Map<String, dynamic> json) => _$GoodsListDatumFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsListDatumToJson(this);
}
