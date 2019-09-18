/*
 * @Author: meetqy
 * @since: 2019-09-02 10:52:36
 * @lastTime: 2019-09-04 14:32:17
 * @LastEditors: meetqy
 */
import 'package:flutter/material.dart';

import 'Button.dart';

/// 暴露button 相当于工厂函数
class AButton {
  /// 按钮
  /// 
  /// ```
  /// @param {double} width 宽度
  /// @param {double} height  高度
  /// @param {String} type  按钮类型：default，primary，info，danger，warning
  /// @param {Color} color  文字颜色
  /// @param {Color} bgColor  背景颜色
  /// @param {Color} borderColor  边框颜色
  /// @param {bool} plain 是否使用边框样式
  /// @param {VoidCallback} onPressed 点击回调 如果没有该参数表示不可点击状态
  /// @param {Widget} child 按钮内容
  /// @param {EdgeInsetsGeometry} padding 内边距
  /// @param {BorderRadius} borderRadius  圆角
  /// ```
  static Widget normal({
    double width,
    double height = 44,
    String type = 'default',
    Color color,
    Color bgColor,
    Color borderColor,
    bool plain = false,
    VoidCallback onPressed,
    Widget child,
    EdgeInsetsGeometry padding,
    BorderRadius borderRadius
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
      child: child,
      padding: padding,
      borderRadius: borderRadius
    ).widget;
  }

  /// 按钮
  /// 
  /// ```
  /// @param {double} width 宽度
  /// @param {double} height  高度
  /// @param {String} type  按钮类型：default，primary，info，danger，warning
  /// @param {Color} color  文字颜色
  /// @param {Color} bgColor  背景颜色
  /// @param {Color} borderColor  边框颜色
  /// @param {bool} plain 是否使用边框样式
  /// @param {VoidCallback} onPressed 点击回调 如果没有该参数表示不可点击状态
  /// @param {Widget} textChild 按钮内容
  /// @param {Widget} icon icon
  /// @param {EdgeInsetsGeometry} padding 内边距
  /// @param {BorderRadius} borderRadius  圆角
  /// ```
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
    EdgeInsetsGeometry padding,
    BorderRadius borderRadius
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
      padding: padding,
      borderRadius: borderRadius
    ).widget;
  }

  /// loading 按钮
  /// 
  /// ```
  /// @param {double} width 宽度
  /// @param {double} height  高度
  /// @param {String} type  按钮类型：default，primary，info，danger，warning
  /// @param {Color} color  加载动画颜色颜色
  /// @param {Color} bgColor  背景颜色
  /// @param {Color} borderColor  边框颜色
  /// @param {bool} plain 是否使用边框样式
  /// @param {VoidCallback} onPressed 点击回调 如果没有该参数表示不可点击状态
  /// @param {Widget} loadingChild 按钮内容
  /// @param {EdgeInsetsGeometry} padding 内边距
  /// @param {BorderRadius} borderRadius  圆角
  /// ```
  static Widget loading({
    double width,
    double height = 44,
    String type = 'default',
    Color color,
    Color bgColor,
    Color borderColor,
    bool plain = false,
    VoidCallback onPressed,
    EdgeInsetsGeometry padding,
    BorderRadius borderRadius,
    Widget loadingChild,
  }) {
    return CustomButton.loading(
      width: width,
      height: height,
      type: type,
      color: color,
      bgColor: bgColor,
      borderColor: borderColor,
      plain: plain,
      onPressed: onPressed,
      padding: padding,
      borderRadius: borderRadius,
      loadingChild: loadingChild,
    ).widget;
  }
}