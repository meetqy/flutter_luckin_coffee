import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/jsonserialize/shopping_cart/data.dart';

class ShoppingCartModel with ChangeNotifier {
  /// 购物车索引 用作商品的id 累加
  int _index = 10000;

  get value => _index;

  Map<String, ShoppingCartData> shoppingCart = {};

  /// 加入购物车
  add() {
    _index++;
    notifyListeners();
  }

  /// 从购物车移除
  remove(int id) {

  }

  /// 对某个商品增加数量
  addNumber(int id) {

  }

  /// 对某个商品减少数量
  subNumber(int id) {

  }

  /// 计算总价
  _calcTotal() {

  }
}
