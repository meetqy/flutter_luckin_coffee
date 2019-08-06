import 'package:flutter/material.dart';
import 'package:luckin_coffee_flutter/pages/navigation/index.dart';
import 'package:luckin_coffee_flutter/pages/navigation/menu/index.dart';
import 'package:luckin_coffee_flutter/pages/navigation/mine/index.dart';
import 'package:luckin_coffee_flutter/pages/navigation/order/index.dart';
import 'package:luckin_coffee_flutter/pages/navigation/shoppingCart/index.dart';



class Router {
  static final _routes = {
    '/': (BuildContext context) => Navigation(),
    '/menu': (BuildContext context) => Menu(),
    '/order': (BuildContext context) => Order(),
    '/mine': (BuildContext context) => Mine(),
    '/shoppingcart': (BuildContext context) => ShoppingCart(),
  };
  static final Router _singleton = Router._internal();

  Router._internal();

  factory Router() {
    return _singleton;
  }

  getRoutes() {
    return _routes;
  }
}