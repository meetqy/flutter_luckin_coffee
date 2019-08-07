/*
 * @Author: meetqy
 * @since: 2019-08-07 15:16:23
 * @lastTime: 2019-08-07 15:18:34
 * @LastEditors: meetqy
 */
import 'package:flutter/widgets.dart';

/// 获取屏幕宽度
screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// 获取屏幕宽度
screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}