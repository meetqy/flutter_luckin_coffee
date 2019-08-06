import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_flutter/utils/Icon.dart';

class NavBottomBar extends StatefulWidget {
  final ValueChanged onChange;

  NavBottomBar(this.onChange);

  _NavBottomBarState createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  static int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: iconlogoNotText(),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: iconcaidan1(),
            title: Text('菜单'),
          ),
          BottomNavigationBarItem(
            icon: iconorder(),
            title: Text('订单'),
          ),
          BottomNavigationBarItem(
            icon: icongouwuche(),
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            icon: iconmine(),
            title: Text('我的'),
          ),  
        ],
        unselectedFontSize: 10, // 未选中字体大小
        selectedFontSize: 10, // 选中字体大小
        selectedItemColor: rgba(43, 76, 126, 1), // 选中字体颜色
        onTap: (index) {
          widget.onChange(index);

          setState(() {
            _currentIndex = index;
          });
        },
      );
  }
}