/*
 * @Author: meetqy
 * @since: 2019-08-06 11:35:23
 * @lastTime: 2019-08-09 11:30:36
 * @LastEditors: meetqy
 */

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/NavBottomBar.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/home/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/mine/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/order/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/shoppingCart/index.dart';

class Toolbar extends StatefulWidget {
  final String routeName;

  // 初始化所有的toolbar页面
  static Home _home = Home();
  static Menu _menu = Menu();
  static Order _order = Order();
  static ShoppingCart _shoppingCart = ShoppingCart();
  static Mine _mine = Mine();


  // 所有导航页面
  final Map<int, Map> pages = { 
    0: _createPage(_home, appbar: _home.appbar),
    1: _createPage(_menu, appbar: _menu.appbar),
    2: _createPage(_order, appbar: _order.appbar),
    3: _createPage(_shoppingCart, appbar: _shoppingCart.appbar),
    4: _createPage(_mine, appbar: _mine.appbar)
  };
  

  /// 创建页面map
  /// ```
  /// @param {Widget} page - 页面
  /// @param {Appbar} appbar - 当前页面是否显示appbar 默认为true
  /// ```
  static Map _createPage(Widget page, { AppBar appbar}) {
    return {
      "widget": page,
      "appbar": appbar
    };
  }

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
    var page = widget.pages[_index];

    return Scaffold(
      appBar: page['appbar'],
      body: Container( // 套一层Container便于集中控制
        color: hex('#fff'),
        child: page['widget'],
      ),
      bottomNavigationBar: NavBottomBar(_index, (index) {
        setState(() {
          _index = index;
        });
      }),
    );
  }
}