import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  static _ShoppingCartState _shoppingCartState;

  getAppBar() => _shoppingCartState.createAppBar();

  ShoppingCart() {
    if(_shoppingCartState == null) {
      _shoppingCartState = _ShoppingCartState();
    }
  }

  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  AppBar createAppBar() {
    return AppBar();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('ShoppingCart'),
    );
  }
}