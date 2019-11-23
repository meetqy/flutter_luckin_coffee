import 'dart:convert';

import 'package:flutter_luckin_coffee/jsonserialize/user/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  UserData _user;

  /// 获取user
  UserData get data => _user;

  SharedPreferences _prefs;

  init(Map userJson) async {
    try {
      _user = UserData.fromJson(userJson);
    } catch(e) {
      return print('user init error, msg: $e');
    }

    await setString(userJson);
  
    return _user;
  }

  /// 保存到本地缓存
  setString(Map userJson) async{
    _prefs = await SharedPreferences.getInstance();

    _prefs.setString('user', json.encode(userJson));
  }
}