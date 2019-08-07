/*
 * @Author: meetqy
 * @since: 2019-08-07 14:53:53
 * @lastTime: 2019-08-07 16:12:14
 * @LastEditors: meetqy
 */

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  final bool border;
  final Icon icon;
  final Color bgColor;
  final EdgeInsets margin;

  /// home公用icon 
  /// ```
  /// @param {bool} border - 是否显示border
  /// @param {Icon} icon - icon
  /// @param {Color} bgColor
  /// @param {EdgeInsets} margin - icon定位不在中心需要微调
  /// ```
  HomeIcon(this.icon, {
    this.bgColor,
    this.border = true,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        border: border ? Border.all(color: rgba(99, 71, 58, 1)) : null,
        color: bgColor
      ),
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        margin: margin,
        child: icon,
      )
    );
  }
}