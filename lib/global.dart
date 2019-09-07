import 'package:flutter/material.dart';

/// global
class G {
  static GlobalKey<NavigatorState> navigatorKey=GlobalKey();

  static NavigatorState getCurrentState() {
    return navigatorKey.currentState;
  }

  static pushNamed(routeName){
    getCurrentState().pushNamed(routeName);
  }
}
