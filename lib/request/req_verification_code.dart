import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 验证码相关
class ReqVerificationCode {
  final Dio _dio;

  ReqVerificationCode(this._dio);

  /// 获取邮箱验证码
  Future<Response> getMailCode({
    /// 邮箱
    @required String mail
  }) {
    return _dio.get(
      '/verification/mail/get',
      queryParameters: {
        "mail": mail
      }
    );
  }

  /// 校验邮件验证码是否正确
  Future<Response> checkMailCode({
    /// 验证码
    @required String code,
    /// 邮箱
    @required String mail,
  }) {
    return _dio.post(
      '/verification/mail/check',
      data: {
        "code": code,
        "mail": mail
      }
    );
  }
}