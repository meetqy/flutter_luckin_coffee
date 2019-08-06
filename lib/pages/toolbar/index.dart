/*
 * @Author: meetqy
 * @since: 2019-08-06 11:35:23
 * @lastTime: 2019-08-06 17:16:08
 * @LastEditors: meetqy
 */

import 'package:flutter/material.dart';
import 'package:luckin_coffee_flutter/pages/toolbar/NavBottomBar.dart';
import 'package:luckin_coffee_flutter/pages/toolbar/home/index.dart';
import 'package:luckin_coffee_flutter/pages/toolbar/menu/index.dart';
import 'package:luckin_coffee_flutter/pages/toolbar/mine/index.dart';
import 'package:luckin_coffee_flutter/pages/toolbar/order/index.dart';
import 'package:luckin_coffee_flutter/pages/toolbar/shoppingCart/index.dart';

class Toolbar extends StatefulWidget {
  final String routeName;
  final List<Widget> pages = [ // 所有导航页面
    Home(),
    Menu(),
    Order(),
    ShoppingCart(),
    Mine()
  ];

  static Toolbar _singleton; 

  /// 底部导航  使用单例模式
  /// 在routes/index.dart文件中去设置初始导航页面
  /// ```
  /// @param {String} routeName - default: '/', 设置初始导航页面
  /// ```
  factory Toolbar({ String routeName = '/' }) {
    if(_singleton == null) {
      _singleton = Toolbar._internal(routeName);
    }
    
    return _singleton;
  }

  Toolbar._internal(this.routeName);

  // 通过 routeName 获取对应页面的索引
  getPageIndex(routeName) {
    switch(routeName) {
      case '/menu': return 1;
      case '/order': return 2;
      case '/shoppingcart': return 3;
      case '/mine': return 4;
      default: return 0;
    }
  }


  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Toolbar> {
  static int _index = 0;  // 当前页面 索引
  static bool flag = true; // 判断是否是初始化页面

  // 初始化导航页面
  // flag = true 代表第一次加载导航需要设置默认页面
  _initRoute(){
    if(!flag) return ;
    flag = false;
    var initIndex = widget.getPageIndex(widget.routeName);
    if(_index != initIndex) {
      setState(() {
        _index = initIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _initRoute();
    return Scaffold(
      appBar: AppBar(),
      body: widget.pages[_index],
      bottomNavigationBar: NavBottomBar(_index, (index) {
        setState(() {
          _index = index;
        });
      }),
    );
  }
}