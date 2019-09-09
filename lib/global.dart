import 'package:flutter/material.dart';


/// global
class G {
  static GlobalKey<NavigatorState> navigatorKey=GlobalKey();
  // toolbar routeName
  static List toobarRouteNameList = ['/', '/menu', '/order', '/shopping_cart', '/mine'];

  static NavigatorState getCurrentState() {
    return navigatorKey.currentState;
  }

  static BuildContext getCurrentContext() {
    return navigatorKey.currentContext;
  }

  // 跳转页面使用 G.pushNamed
  static pushNamed(routeName, {Object arguments}){
    print(arguments);
    getCurrentState().pushNamed(routeName, arguments: arguments);
  }
}
