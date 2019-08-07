import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  /// Appbar配置
  final AppBar appbar = AppBar();

  Menu({Key key}) : super(key: key);

  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Menu'),
    );
  }
}