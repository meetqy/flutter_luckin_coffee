import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 用户管理相关
class ReqUser {
  final Dio dio;

  ReqUser(this.dio);

  /// 注册
  Future<Response> register({
    /// 验证码
    @required String code,
    /// 邮箱
    @required String email,
    /// 密码
    @required String pwd,
    /// true / false 是否在注册后自动完成登录【对于之前已注册的用户，自动完成登录】
    bool autoLogin = false
  }) {
    return dio.post(
      '/user/email/register',
      queryParameters: {
        "code": code,
        "email": email,
        "pwd": pwd,
        "autoLogin": autoLogin
      }
    );
  }

  /// 登录
  Future<Response> login({
    /// 登录设备ID,自定义即可
    @required String deviceId,
    /// 登录设备名称,自定义即可
    @required String deviceName,
    /// 邮箱
    @required String email,
    /// 密码
    @required String pwd,
  }) {
    return dio.post(
      '/user/email/login',
      data: {
        "deviceId": deviceId,
        "deviceName": deviceName,
        "email": email,
        "pwd": pwd
      }
    );
  }

  /// 找回密码
  Future<Response> resetPwd({
    /// 验证码
    @required String code,
    /// 邮箱
    @required String email,
    /// 新密码
    @required String pwd,
  }) {
    return dio.post(
      '/user/email/login',
      data: {
        "code": code,
        "email": email,
        "pwd": pwd
      }
    );
  }
}