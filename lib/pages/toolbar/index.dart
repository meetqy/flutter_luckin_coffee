import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/home/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/mine/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/order/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/shopping_cart/index.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';

class Toolbar extends StatefulWidget {
  Toolbar({Key key}) : super(key: key);

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  int cuttentIndex = 0;

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Home(),
          Menu(),
          Order(),
          ShoppingCart(),
          Mine(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(43, 76, 126, 1),
        unselectedItemColor: Color.fromRGBO(43, 76, 126, .5),
        currentIndex: cuttentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
            cuttentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: iconlogoNotText(),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: iconcaidan(),
            label: '菜单',
          ),
          BottomNavigationBarItem(
            icon: iconorder(),
            label: '订单',
          ),
          BottomNavigationBarItem(
            icon: icongouwuche(),
            label: '购物车',
          ),
          BottomNavigationBarItem(
            icon: iconmine(),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
