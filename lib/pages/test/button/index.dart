import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/test/button/Button.dart';

/// 暴露button 相当于工厂函数
class Button {
  static Widget normal({
    double width = 300,
    double height = 44,
    String type = 'default',
    Color color,
    Color bgColor,
    Color borderColor,
    bool plain = false,
    VoidCallback onPressed,
    Widget child
  }) {
    return CustomButton.normal(
      width: width,
      height: height,
      type: type,
      color: color,
      bgColor: bgColor,
      borderColor: borderColor,
      plain: plain,
      onPressed: onPressed,
      child: child
    ).widget;
  }

  static Widget icon({
    double width,
    double height = 44,
    String type = 'default',
    Color color,
    Color bgColor,
    Color borderColor,
    bool plain = false,
    VoidCallback onPressed,
    Widget textChild,
    Widget icon,
  }) {
    return CustomButton.icon(
      width: width,
      height: height,
      type: type,
      color: color,
      bgColor: bgColor,
      borderColor: borderColor,
      plain: plain,
      onPressed: onPressed,
      textChild: textChild,
      icon: icon,
    ).widget;
  }
}