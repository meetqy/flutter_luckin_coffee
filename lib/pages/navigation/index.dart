import 'package:flutter/material.dart';
import 'package:luckin_coffee_flutter/pages/navigation/NavBottomBar.dart';
import 'package:luckin_coffee_flutter/pages/navigation/home/index.dart';
import 'package:luckin_coffee_flutter/pages/navigation/menu/index.dart';
import 'package:luckin_coffee_flutter/pages/navigation/mine/index.dart';
import 'package:luckin_coffee_flutter/pages/navigation/order/index.dart';
import 'package:luckin_coffee_flutter/pages/navigation/shoppingCart/index.dart';

class Navigation extends StatefulWidget {
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  static int _index = 0;
  static List<Widget> pages = [
    Home(),
    Menu(),
    Order(),
    ShoppingCart(),
    Mine()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pages[_index],
      bottomNavigationBar: NavBottomBar((index) {
        print(index);
        setState(() {
          _index = index;
        });
      }),
    );
  }
}