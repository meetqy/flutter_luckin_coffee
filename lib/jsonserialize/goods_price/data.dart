import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class GoodsPrice {
  int code;
  GoodsPriceData data;
  String msg;

  GoodsPrice({
    this.code,
    this.data,
    this.msg,
  });

  //反序列化
  factory GoodsPrice.fromJson(Map<String, dynamic> json) =>
      _$GoodsPriceFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsPriceToJson(this);
}

@JsonSerializable()
class GoodsPriceData {
  int goodsId;
  int id;
  double originalPrice;
  double pingtuanPrice;
  double price;
  String propertyChildIds;
  String propertyChildNames;
  int score;
  int stores;
  int userId;

  GoodsPriceData({
    this.goodsId,
    this.id,
    this.originalPrice,
    this.pingtuanPrice,
    this.price,
    this.propertyChildIds,
    this.propertyChildNames,
    this.score,
    this.stores,
    this.userId,
  });

  //反序列化
  factory GoodsPriceData.fromJson(Map<String, dynamic> json) =>
      _$GoodsPriceDataFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsPriceDataToJson(this);
}
