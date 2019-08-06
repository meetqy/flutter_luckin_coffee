import 'package:flutter/material.dart';
import 'package:luckin_coffee_flutter/pages/toolbar/index.dart';

class Router {
  static final _routes = {
    '/': (BuildContext context) => Toolbar(routeName: '/order'),
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