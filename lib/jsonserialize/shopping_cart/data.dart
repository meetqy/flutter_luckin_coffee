import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class ShoppingCartData {
  int id;
  String name;
  double price;
  int number;
  Map<String, int> spec;
  String specName;
  bool checked;

  /// 默认商品购物车选中
  ShoppingCartData({
    this.id,
    this.name,
    this.price, // 当前规格的单价
    this.number,
    this.spec,
    this.specName,
    this.checked
  });

  //反序列化
  factory ShoppingCartData.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartDataFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$ShoppingCartDataToJson(this);
}
