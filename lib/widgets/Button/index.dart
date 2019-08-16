import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function onPress;
  final Color bgColor;
  final Color color;
  final Border border;
  final double paddingVertical;
  final double paddingHorizontal;
  final double fontSize;

  /// 公用button
  /// 
  /// ```
  /// @param {Icon} icon - 左侧icon
  /// @param {String} text - 按钮文字
  /// @param {Function} onPress - 点击回调
  /// @param {Color} bgColor - 背景颜色
  /// @param {Color} color - 文字颜色
  /// @param {Border} border - border
  /// @param {double} paddingVertical - 上下间距
  /// @param {double} paddingHorizontal - 左右间距d
  /// @param {double} fontSize - 字体大小
  /// ```
  Button(this.text, {
    this.icon,
    this.onPress,
    this.bgColor,
    this.color,
    this.border,
    this.paddingVertical = 8,
    this.paddingHorizontal = 10,
    this.fontSize = 12
  }) : assert(text != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 5),
        padding: EdgeInsets.symmetric(vertical: paddingVertical,horizontal: paddingHorizontal),
        decoration: BoxDecoration(
          color: bgColor == null ? rgba(255, 129, 2, 1) : bgColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: border
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Container(child: icon),
          Container(
            
            child: Text(text, style: TextStyle(
              color: color == null ? rgba(255, 255, 255, 1) : color,
              fontSize: fontSize
            ),),
          )
        ],),
      )
    );
  }
}