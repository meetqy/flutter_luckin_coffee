import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 用户管理相关
class ReqUser {
  final Dio _dio;

  ReqUser(this._dio);

  /// 注册 可用作登录
  Future<Response> register({
    /// 验证码
    @required String code,
    /// 邮箱
    @required String email,
    /// 密码
    @required String pwd,
    /// true / false 是否在注册后自动完成登录【对于之前已注册的用户，自动完成登录】
    bool autoLogin = true,
    /// 城市
    String city,
    /// 昵称
    String nick,
    /// 省份
    String province, 
  }) {
    if(nick == null) {
      nick = email.substring(0, email.indexOf('@'));
    }
    return _dio.post(
      '/user/email/register',
      queryParameters: {
        "code": code,
        "email": email,
        "pwd": pwd,
        "autoLogin": autoLogin,
        "nick": nick,
        "province": province,
      }
    );
  }

  /// 获取用户详情
  Future<Response> detail() {
    return _dio.post('/user/detail');
  }

  /// 查看用户资产
  Future<Response> amount({
    @required String token
  }) {
    return _dio.post('/user/amount');
  }
}