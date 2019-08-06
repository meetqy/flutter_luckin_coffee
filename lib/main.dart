import 'package:flutter/material.dart';
import 'package:luckin_coffee_flutter/routes/index.dart';

final router = Router();

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luckin Coffee Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: router.getRoutes(),
      initialRoute: '/',
    );
  }
}
