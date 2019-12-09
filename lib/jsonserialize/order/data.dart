import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class OrderData {
  int goodsId;
  int number;
  Map<String, int> propertyChildIds;
  int logisticsType;
  List<String> days;

  OrderData({
    this.goodsId,
    this.number,
    this.propertyChildIds,
    this.logisticsType,
    this.days,
  });

  //反序列化
  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}
