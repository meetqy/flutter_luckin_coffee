import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  /// Appbar配置
  final AppBar appbar = AppBar();

  ShoppingCart({Key key}) : super(key: key);

  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('ShoppingCart'),
    );
  }
}