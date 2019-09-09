import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/global.dart';
import 'package:flutter_luckin_coffee/routes/index.dart';

final router = Router();

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: G.navigatorKey,
      title: 'Flutter Luckin Coffee',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: rgba(0, 0, 0, 0),
          ),
          elevation: 0,
        ),
        
        // button去除点击后的背景，注意：对appbar中的的button无效
        // buttonTheme: ButtonThemeData(
        //   splashColor: rgba(0, 0, 0, 0),
        //   highlightColor: rgba(0, 0, 0, 0),
        // ),
      ),
      initialRoute: '/example_widgets_list',
      onGenerateRoute: router.getRoutes,
    );
  }
  
}