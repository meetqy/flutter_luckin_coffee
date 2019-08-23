import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/coupon/index.dart';
import 'package:flutter_luckin_coffee/pages/login/LoginMethod.dart';
import 'package:flutter_luckin_coffee/pages/login/LoginPhone.dart';
import 'package:flutter_luckin_coffee/pages/login/UserAgreement.dart';
import 'package:flutter_luckin_coffee/pages/order/OrderConfirm.dart';
import 'package:flutter_luckin_coffee/pages/order/OrderEvaluation.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/index.dart';


class Router {
  static final _routes = {    
    '/': (BuildContext context) => Toolbar(routeName: '/home'),
    '/login_method': (BuildContext context) => LoginMethod(),
    '/login_phone': (BuildContext context) => LoginPhone(),
    '/user_agreement': (BuildContext context) => UserAgreement(),
    '/order_evaluation': (BuildContext context) => OrderEvaluation(),
    '/order_confirm': (BuildContext context) => OrderConfirm(),
    '/coupon': (BuildContext context) => Coupon(),
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