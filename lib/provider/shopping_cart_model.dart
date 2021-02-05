import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/jsonserialize/shopping_cart/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartModel with ChangeNotifier {
  Map<String, ShoppingCartData> _shoppingCart = {};

  num _totalPrice = 0;

  get data => _shoppingCart;

  get totalPrice => _totalPrice;

  /// 初始化购物车
  init(Map<String, dynamic> data) {
    for (var key in data.keys) {
      Map val = data[key];

      _shoppingCart['$key'] = ShoppingCartData.fromJson(val);
    }

    _calcTotal();
  }

  /// 加入购物车
  add(ShoppingCartData data) {
    // 找出和传入的id相同的商品，如果没有返回null
    var key = _shoppingCart.keys.firstWhere((key) {
      List<String> keyArr = key.split('-');
      ShoppingCartData val = _shoppingCart[key];
      return int.parse(keyArr[0]) == data.id && val.specName == data.specName;
    }, orElse: () => null);

    if (key == null) {
      key = '${data.id}';
      data.checked = true;
      _shoppingCart.addAll({"$key": data});
    } else {
      ShoppingCartData nowData = _shoppingCart[key];
      nowData.number += data.number;
      _shoppingCart["$key"] = nowData;
    }

    _calcTotal();
    _saveLocal();
    notifyListeners();
  }

  modify(String id, {@required ShoppingCartData data}) {
    _shoppingCart[id] = data;
    _calcTotal();
    _saveLocal();
  }

  /// 从购物车移除
  remove(String id) {
    _shoppingCart.remove(id);
    _calcTotal();
    _saveLocal();
  }

  /// 保存到本地
  _saveLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("shoppingCart", json.encode(_shoppingCart));
  }

  /// 计算总价
  _calcTotal() {
    double price = 0;
    _shoppingCart.values.forEach((ShoppingCartData data) {
      if (data.checked) {
        price += (data.number * data.price);
      }
    });

    _totalPrice = price;
  }
}
