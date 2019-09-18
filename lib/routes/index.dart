import 'package:flutter/material.dart';
// 组件列表
import 'package:flutter_luckin_coffee/components/ExampleWidgetsList.dart';
import 'package:flutter_luckin_coffee/components/arow/example.dart';
import 'package:flutter_luckin_coffee/components/abutton/example.dart';
import 'package:flutter_luckin_coffee/components/adialog/example.dart';
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
    // 从非toolbar页面（子页面）跳转到toolbar页面（主页）实现：
    // pushName到对应的路由，因为Toolbar是单例模式，所以只会创建一个
    // pushName之后在 Toolbar中的 initState中去设置对应routeName的index
    '/': (BuildContext context, { Object args }) => Toolbar(routeName: '/',),
    '/mine': (BuildContext context, { Object args }) => Toolbar(routeName: '/mine',),
    '/order': (BuildContext context, { Object args }) => Toolbar(routeName: '/order',),
    '/shopping_cart': (BuildContext context, { Object args }) => Toolbar(routeName: '/shopping_cart',),
    '/menu': (BuildContext context, { Object args }) => Toolbar(routeName: '/menu',),
    
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
    '/example_abutton': (BuildContext context, { Object args }) => ExampleAButton(),
    '/example_widgets_list': (BuildContext context, { Object args }) => ExampleWidgetsList(args: args),
    '/example_stepper': (BuildContext context, { Object args }) => ExampleStepper(),
    '/example_adialog': (BuildContext context, { Object args }) => ExampleADialog(),
    '/example_arow': (BuildContext context, { Object args }) => ExampleARow(),
  };

  static Router _singleton;

  Router._internal();

  factory Router() {
    if(_singleton == null) {
      _singleton = Router._internal();
    }

    return _singleton;
  }

  // 监听非toolbar页面
  Route getRoutes(RouteSettings settings) {
    final Function builder = Router._routes[settings.name];

    print(settings);

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
