import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class GoodsCategory {
  int code;
  List<GoodsCategoryDatum> data;
  String msg;

  GoodsCategory({
    this.code,
    this.data,
    this.msg,
  });

  //反序列化
  factory GoodsCategory.fromJson(Map<String, dynamic> json) => _$GoodsCategoryFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsCategoryToJson(this);
}

@JsonSerializable()
class GoodsCategoryDatum {
  String dateAdd;
  String dateUpdate;
  int id;
  bool isUse;
  int level;
  String name;
  int paixu;
  int pid;
  int userId;

  GoodsCategoryDatum({
    this.dateAdd,
    this.dateUpdate,
    this.id,
    this.isUse,
    this.level,
    this.name,
    this.paixu,
    this.pid,
    this.userId,
  });

  //反序列化
  factory GoodsCategoryDatum.fromJson(Map<String, dynamic> json) => _$GoodsCategoryDatumFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$GoodsCategoryDatumToJson(this);
}
