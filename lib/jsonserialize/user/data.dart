import 'package:json_annotation/json_annotation.dart';

///part关键字, 使用part关键字可以将一个库,分解成多个dart文件,(并不推荐使用)
///有点像C#中部分类的概念
///!!!其中序列化相关的代码,应该可以用插件来生成.
part 'data.g.dart';

//用户数据的序列化的类
@JsonSerializable()
class UserData {
  String city;
  String dateAdd;
  String dateLogin;
  String email;
  int id;
  String ipAdd;
  String ipLogin;
  bool isIdcardCheck;
  bool isSeller;
  bool levelRenew;
  String nick;
  String province;
  int source;
  String sourceStr;
  int status;
  String statusStr;
  String token;

  UserData({
    this.city,
    this.dateAdd,
    this.dateLogin,
    this.email,
    this.id,
    this.ipAdd,
    this.ipLogin,
    this.isIdcardCheck,
    this.isSeller,
    this.levelRenew,
    this.nick,
    this.province,
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
