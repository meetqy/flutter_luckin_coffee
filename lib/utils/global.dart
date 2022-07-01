/*
 * @Author: meetqy
 * @since: 2019-09-24 14:23:27
 * @lastTime: 2019-11-23 11:50:01
 * @LastEditors: meetqy
 */

import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/loading.dart';

import 'pull_to_refresh_style.dart';

export './custom_appbar.dart';

/// 这个类是用来处理全局的Global的tools类
class G {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// toolbar routeName
  static final List toobarRouteNameList = [
    '/',
    '/menu',
    '/order',
    '/shopping_cart',
    '/mine'
  ];

  /// 处理商品描述
  static String handleGoodsDesc(String str) {
    return str
        .replaceAll(RegExp(',\$'), '')
        .replaceAll(RegExp('规格:|温度:|糖度:|奶油:|无'), '');
  }

  /// 初始化loading
  static final Loading loading = Loading();

  /// 手动延时
  static sleep({int milliseconds = 1000}) async =>
      await Future.delayed(Duration(milliseconds: milliseconds));

  /// 下拉刷新样式
  static final PullToRefreshStyle pullToRefreshStyle = PullToRefreshStyle();

  /// 获取当前的state
  static NavigatorState getCurrentState() => navigatorKey.currentState;

  /// 获取当前的context
  static BuildContext getCurrentContext() => navigatorKey.currentContext;

  /// 获取屏幕上下边距
  /// 用于兼容全面屏，刘海屏
  static EdgeInsets screenPadding() =>
      MediaQuery.of(getCurrentContext()).padding;

  /// 获取屏幕宽度
  static double screenWidth() => MediaQuery.of(getCurrentContext()).size.width;

  /// 获取屏幕高度
  static double screenHeight() =>
      MediaQuery.of(getCurrentContext()).size.height;

  /// 跳转页面使用 G.pushNamed
  static void pushNamed(String routeName, {Object arguments}) {
    // 如果跳转到toolbar页面  不能返回
    if (toobarRouteNameList.indexOf(routeName) > -1) {
      getCurrentState().pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    } else {
      getCurrentState().pushNamed(routeName, arguments: arguments);
    }
  }

  /// 返回页面
  static void pop() => getCurrentState().pop();

  /// 底部border
  /// ```
  /// @param {Color} color
  /// @param {bool} show  是否显示底部border
  /// ```
  static Border borderBottom({Color color, bool show = true}) {
    return Border(
        bottom: BorderSide(
            color: (color == null || !show)
                ? (show ? Color.fromRGBO(242, 242, 242, 1) : Colors.transparent)
                : color,
            width: 1));
  }

  /// 获取时间戳
  /// 不传值 代表获取当前时间戳
  static int getTime([DateTime time]) {
    if (time == null) {
      return (DateTime.now().millisecondsSinceEpoch / 1000).round();
    } else {
      return (time.millisecondsSinceEpoch / 1000).round();
    }
  }
}
