/*
 * @Author: meetqy
 * @since: 2019-08-07 15:16:23
 * @lastTime: 2019-08-08 17:43:05
 * @LastEditors: meetqy
 */
import 'package:flutter/widgets.dart';

/// 获取屏幕宽度
screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// 获取屏幕高度
screenHeight(BuildContext context) {  
  return MediaQuery.of(context).size.height;
}