import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/loginMethod/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/index.dart';
import 'package:flutter_luckin_coffee/widgets/FullScreenDialog/index.dart';


class Router {
  static final _routes = {
    '/': (BuildContext context) => Toolbar(routeName: '/home'),
    '/dialog': (BuildContext context) => FullScreenDialog(),
    '/login_method': (BuildContext context) => LoginMethod(),
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