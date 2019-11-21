import 'package:dio/dio.dart';
import 'package:flutter_luckin_coffee/request/init_dio.dart';
import 'package:flutter_luckin_coffee/request/req_user.dart';
import 'package:flutter_luckin_coffee/request/req_verification_code.dart';

class Request {
  Dio _dio;

  Request() {
    _dio = initDio();
  }

  ReqUser get user => ReqUser(_dio);

  ReqVerificationCode get verificationCode => ReqVerificationCode(_dio);
}