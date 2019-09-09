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
  static pushNamed(String routeName, {Object arguments}){
    // 如果跳转到toolbar页面 删除之前的所有page
    if(toobarRouteNameList.indexOf(routeName) > -1) {
      return getCurrentState().pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
    }

    getCurrentState().pushNamed(routeName, arguments: arguments);
  }
}
