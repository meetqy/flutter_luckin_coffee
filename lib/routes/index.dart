import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/coupon/index.dart';
import 'package:flutter_luckin_coffee/pages/diningcode/DiningCode.dart';
import 'package:flutter_luckin_coffee/pages/login/LoginMethod.dart';
import 'package:flutter_luckin_coffee/pages/login/LoginPhone.dart';
import 'package:flutter_luckin_coffee/pages/login/UserAgreement.dart';
import 'package:flutter_luckin_coffee/pages/order/OrderConfirm.dart';
import 'package:flutter_luckin_coffee/pages/order/OrderDetail.dart';
import 'package:flutter_luckin_coffee/pages/order/OrderEvaluation.dart';
import 'package:flutter_luckin_coffee/pages/order/OrderRemark.dart';
import 'package:flutter_luckin_coffee/pages/selfstore/index.dart';
import 'package:flutter_luckin_coffee/pages/storedetail/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/index.dart';


class Router {
  static final _routes = {    
    '/': (BuildContext context) => Toolbar(routeName: '/home'),
    '/login_method': (BuildContext context) => LoginMethod(),
    '/login_phone': (BuildContext context) => LoginPhone(),
    '/user_agreement': (BuildContext context) => UserAgreement(),
    '/order_evaluation': (BuildContext context) => OrderEvaluation(),
    '/order_confirm': (BuildContext context) => OrderConfirm(),
    '/order_remark': (BuildContext context) => OrderRemark(),
    '/order_detail': (BuildContext context) => OrderDetail(),
    '/coupon': (BuildContext context) => Coupon(),
    '/self_store': (BuildContext context) => SelfStore(),
    '/store_detail': (BuildContext context) => StoreDetail(),
    '/dining_code': (BuildContext context) => DiningCode(),
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