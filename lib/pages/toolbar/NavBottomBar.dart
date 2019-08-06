/*
 * @Author: meetqy
 * @since: 2019-08-06 11:39:22
 * @lastTime: 2019-08-06 16:58:58
 * @LastEditors: meetqy
 */

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_flutter/utils/Icon.dart';


class NavBottomBar extends StatefulWidget {
  final ValueChanged onChange;
  final int initRoute;

  static NavBottomBar _singleton;

  /// 导航菜单 单例模式
  /// ```
  /// @param {int} initRoute - 默认选中
  /// @param {ValueChanged} onChange - 导航菜单改变时的回调 返回当前导航的索引
  /// ```
  /// return BottomNavigationBar 
  factory NavBottomBar(int initRoute, ValueChanged onChange) {
    if(_singleton == null) {
      _singleton = NavBottomBar._internal(initRoute, onChange);
    }

    return _singleton;
  }

  NavBottomBar._internal(this.initRoute, this.onChange);


  _NavBottomBarState createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  static int _currentIndex = 0;  // 当前导航的索引
  static bool flag = true;  // 判断是否需要初始化导航

  // 初始化导航
  // flag = true 代表第一次加载导航需要初始化导航
  _initIndex() {
    if(!flag) return ;
    flag = false;
    setState(() {
      _currentIndex = widget.initRoute;
    });
  }

  @override
  Widget build(BuildContext context) {
    _initIndex();
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