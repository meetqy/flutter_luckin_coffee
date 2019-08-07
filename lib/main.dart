import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/routes/index.dart';

final router = Router();

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Luckin Coffee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: router.getRoutes(),
      initialRoute: '/',
      onGenerateRoute: handleRoute
    );
  }
}


Route<dynamic> handleRoute(RouteSettings settings) {
  print(settings);
  return null;
}