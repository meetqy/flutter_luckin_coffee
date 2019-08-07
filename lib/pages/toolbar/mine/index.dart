import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  /// Appbar配置
  final AppBar appbar = AppBar();

  Mine({Key key}) : super(key: key);
  

  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Mine'),
    );
  }
}