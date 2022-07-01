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
}

/// 底部border
/// ```
/// @param {Color} color
/// @param {bool} show  是否显示底部border
/// ```
Border cuBorderBottom({Color color, bool show = true}) {
  return Border(
    bottom: BorderSide(
      color: (color == null || !show)
          ? (show ? Color.fromRGBO(242, 242, 242, 1) : Colors.transparent)
          : color,
      width: 1,
    ),
  );
}
