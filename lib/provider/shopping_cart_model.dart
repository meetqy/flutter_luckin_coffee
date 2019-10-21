import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/jsonserialize/shopping_cart/data.dart';

class ShoppingCartModel with ChangeNotifier {
  /// 购物车索引 用作商品的id 累加
  int _index = 10001;

  Map<String, ShoppingCartData> _shoppingCart = {};

  num _totalPrice = 0;

  get data => _shoppingCart;
  get totalPrice => _totalPrice;

  /// 加入购物车
  add(ShoppingCartData data) {
    // 找出和传入的id相同的商品，如果没有返回null
    var key = _shoppingCart.keys.firstWhere((key) {
      List<String> keyArr = key.split('-');
      ShoppingCartData val = _shoppingCart[key];
      return int.parse(keyArr[0]) == data.id && val.specName == data.specName;
    }, orElse: () => null);

    
    if(key == null) {
      key = '${data.id}-$_index';
      data.checked = true;
      _index++;
      _shoppingCart.addAll({
        "$key": data
      });
    } else {
      ShoppingCartData nowData = _shoppingCart[key];
      nowData.number += data.number;
      _shoppingCart["$key"] = nowData;
    }

    _calcTotal();
    notifyListeners();
  }

  modify(String id, { 
    @required ShoppingCartData data 
  }) {
    _shoppingCart[id] = data;
    _calcTotal();
  }

  /// 从购物车移除
  remove(String id) {
    _shoppingCart.remove(id);
    _calcTotal();
  }

  /// 计算总价
  _calcTotal() {
    double price = 0;
    _shoppingCart.values.forEach((ShoppingCartData data) {
      if(data.checked) {
        price +=  (data.number * data.price);
      }
    });

    _totalPrice = price;
  }
}
