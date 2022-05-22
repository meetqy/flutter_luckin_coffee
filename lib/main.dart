import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/routes/luckin_router.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

final LuckinRouter router = LuckinRouter();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: G.navigatorKey,
      title: 'Flutter Luckin Coffee',
      initialRoute: '/',
      onGenerateRoute: router.getRoutes,
    );
  }
}
