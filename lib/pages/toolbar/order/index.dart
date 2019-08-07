import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  /// Appbar配置
  final AppBar appbar = AppBar();

  Order({Key key}) : super(key: key);

  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Order'),
    );
  }
}