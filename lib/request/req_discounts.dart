import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ReqDiscounts {
  final Dio _dio;

  ReqDiscounts(this._dio);

  /// 我的优惠券
  my({
    /// 优惠券状态:0 正常 1 失效 2 过期已结束 3 已使用
    @required int status,
  }) {
    return _dio.get('/discounts/my');
  }
}