import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/jsonserialize/order/data.dart';

class OrderModel with ChangeNotifier {
  Map<String, OrderData> _orderData = {};

  get data => _orderData;

  /// 初始化
  init(List<OrderData> data) {
    _orderData = {};
    data.forEach((val) {
      _orderData['${val.goodsId}'] = val;
    });
  }
}