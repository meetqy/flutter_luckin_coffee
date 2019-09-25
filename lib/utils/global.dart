/*
 * @Author: meetqy
 * @since: 2019-09-24 14:23:27
 * @lastTime: 2019-09-25 16:04:09
 * @LastEditors: meetqy
 */
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/CustomColors.dart';
import 'package:flutter_luckin_coffee/utils/CustomFontSize.dart';
import 'package:flutter_luckin_coffee/utils/PullToRefreshStyle.dart';

export './Icon.dart';
export './customAppbar.dart';


/// global
class G {
  static GlobalKey<NavigatorState> navigatorKey=GlobalKey();
  /// toolbar routeName
  static List toobarRouteNameList = ['/', '/menu', '/order', '/shopping_cart', '/mine'];

  /// 项目常用颜色
  static CustomColors colors = CustomColors();

  /// 项目常用字体大小
  static CustomFontSize fontSize = CustomFontSize();

  /// 下拉刷新样式
  static PullToRefreshStyle pullToRefreshStyle = PullToRefreshStyle();

  /// 获取当前的state
  static NavigatorState getCurrentState() => navigatorKey.currentState;

  /// 获取当前的context
  static BuildContext getCurrentContext() => navigatorKey.currentContext;

  /// 获取屏幕上下边距
  /// 用于兼容全面屏，刘海屏
  static EdgeInsets screenPadding() => MediaQuery.of(getCurrentContext()).padding;

  /// 获取屏幕宽度
  static double screenWidth() => MediaQuery.of(getCurrentContext()).size.width;

  /// 获取屏幕高度
  static double screenHeight() => MediaQuery.of(getCurrentContext()).size.height;

  /// 跳转页面使用 G.pushNamed
  static pushNamed(String routeName, {Object arguments}){
    // 如果跳转到toolbar页面 删除之前的所有page
    if(toobarRouteNameList.indexOf(routeName) > -1) {
      return getCurrentState().pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
    }

    getCurrentState().pushNamed(routeName, arguments: arguments);
  }

  /// 底部border
  /// ```
  /// @param {Color} color
  /// @param {bool} show  是否显示底部border
  /// ```
  static Border borderBottom({Color color, bool show = true}){
    return Border(
      bottom: BorderSide(
        color: (color == null || !show)  ? (show ? colors.whiteLighter : Colors.transparent) : color,
        width: 1
      )
    );
  }
}