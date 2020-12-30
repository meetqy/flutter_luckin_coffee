import 'dart:convert';

import 'package:flutter_luckin_coffee/jsonserialize/user/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

///这是一个User的封装,
class User {
  //用户的数据
  UserData _user;

  /// 获取user
  UserData get data => _user;

  SharedPreferences _prefs;

  init(Map userJson) async {

    ///使用_user这种方式可以方便自己内部先处理
    try {
      _user = UserData.fromJson(userJson);
    } catch (e) {
      return print('user init error, msg: $e');
    }

    await setString(userJson);
    print(_user);
    return _user;
  }

  /// 保存到本地缓存
  setString(Map userJson) async {
    _prefs = await SharedPreferences.getInstance();

    _prefs.setString('user', json.encode(userJson));
  }
}
