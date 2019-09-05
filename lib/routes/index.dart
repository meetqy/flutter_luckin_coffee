import 'package:flutter/material.dart';
// 组件列表
import 'package:flutter_luckin_coffee/components/ExplameWidgetsList.dart';
import 'package:flutter_luckin_coffee/components/button/example.dart';
import 'package:flutter_luckin_coffee/components/stepper/example.dart';

// luckin coffee 页面
import 'package:flutter_luckin_coffee/pages/choosephonecode/index.dart';
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
    '/': (BuildContext context, { Object args }) => Toolbar(routeName: '/home'),
    '/login_method': (BuildContext context, { Object args }) => LoginMethod(),
    '/login_phone': (BuildContext context, { Object args }) => LoginPhone(),
    '/user_agreement': (BuildContext context, { Object args }) => UserAgreement(),
    '/order_evaluation': (BuildContext context, { Object args }) => OrderEvaluation(),
    '/order_confirm': (BuildContext context, { Object args }) => OrderConfirm(),
    '/order_remark': (BuildContext context, { Object args }) => OrderRemark(),
    '/order_detail': (BuildContext context, { Object args }) => OrderDetail(args: args,),
    '/coupon': (BuildContext context, { Object args }) => Coupon(),
    '/self_store': (BuildContext context, { Object args }) => SelfStore(),
    '/store_detail': (BuildContext context, { Object args }) => StoreDetail(),
    '/dining_code': (BuildContext context, { Object args }) => DiningCode(),
    '/choose_phone_code': (BuildContext context, { Object args }) => ChoosePhoneCode(),
    '/explame_button': (BuildContext context, { Object args }) => ExampleButton(),
    '/explame_widgets_list': (BuildContext context, { Object args }) => ExplameWidgetsList(),
    '/example_stepper': (BuildContext context, { Object args }) => ExplameStepper(),
  };

  static Router _singleton;

  Router._internal();

  factory Router() {
    if(_singleton == null) {
      _singleton = Router._internal();
    }

    return _singleton;
  }

  Route getRoutes(RouteSettings settings) {
    final Function builder = Router._routes[settings.name];

    if(builder == null) {
      return null;
    } else {
      return MaterialPageRoute(
        settings: settings, 
        builder: (BuildContext context) => builder(context, args: settings.arguments)
      );
    }
  }
}
