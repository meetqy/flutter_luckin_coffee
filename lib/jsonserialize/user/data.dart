import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class UserData {
  String dateAdd;
  String dateLogin;
  String email;
  int id;
  String ipAdd;
  String ipLogin;
  bool isIdcardCheck;
  bool isSeller;
  bool levelRenew;
  int source;
  String sourceStr;
  int status;
  String statusStr;
  String token;

  UserData({
    this.dateAdd,
    this.dateLogin,
    this.email,
    this.id,
    this.ipAdd,
    this.ipLogin,
    this.isIdcardCheck,
    this.isSeller,
    this.levelRenew,
    this.source,
    this.sourceStr,
    this.status,
    this.statusStr,
    this.token,
  });

    //反序列化
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
