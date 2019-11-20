import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 验证码相关
class ReqVerificationCode {
  final Dio dio;

  ReqVerificationCode(this.dio);

  /// 获取邮箱验证码
  getMailCode({
    /// 邮箱
    @required String mail
  }) async{
    return await dio.get(
      '/verification/mail/get',
      queryParameters: {
        "mail": mail
      }
    );
  }

  /// 校验邮件验证码是否正确
  checkMailCode({
    /// 验证码
    @required String code,
    /// 邮箱
    @required String mail,
  }) async {
    return await dio.post(
      '/verification/mail/check',
      data: {
        "code": code,
        "mail": mail
      }
    );
  }
}