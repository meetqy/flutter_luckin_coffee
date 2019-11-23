import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import 'enum.dart';

export 'enum.dart';

class StandButton extends StatelessWidget {
  StandButton({
    Key key,
    this.type = ButtonType.normal,
    this.color,
    this.gradientColor,
    this.plain = false,
    this.disabled = false,
    this.width,
    this.height,
    this.icon,
    this.text,
    this.onPressed,
    this.borderRadius = 2
  }) : super(key: key){
    _initColor();
    _initOnPressed();
  }

  /// 类型，可选值为 primary info warning danger
  final ButtonType type;

  /// 自定义按钮的渐变颜色
  final LinearGradient gradientColor;

  /// 自定义按钮的颜色
  final Color color;

  /// 将按钮设置为朴素按钮，朴素按钮的文字为按钮颜色，背景为白色。
  final bool plain;

  /// 禁用按钮，禁用状态下按钮不可点击
  final bool disabled;

  /// 按钮宽度
  final double width;

  /// 按钮高度
  final double height;

  /// 按钮文字
  final Widget text;

  /// 按钮文字左侧图标
  final Icon icon;

  /// 点击按钮触发
  final VoidCallback onPressed;

  /// 圆角
  final double borderRadius;

  /// 按钮背景颜色
  /// 传入的color > type
  static Color _color;

  /// 按钮文字颜色，边框颜色
  static Color _textColor;

  /// 边框颜色 
  static Color _borderColor;

  /// 点击回调 disabled == true，无效
  static VoidCallback _onPressed;

  /// 初始化 _onPressed
  void _initOnPressed() {
    if(disabled) {
      _onPressed = null;
    } else {
      _onPressed = onPressed == null ? (){} : onPressed;
    }
  }

  /// 初始化 _color, _textColor
  void _initColor() {
    switch(type) {
      case ButtonType.primary:
        _handleColor(hex('#07c160'), hex('#fff'));
        break;

      case ButtonType.info:
        _handleColor(hex('#1989fa'), hex('#fff'));
        break;

      case ButtonType.danger:
        _handleColor(hex('#ee0a24'), hex('#fff'));
        break;

      case ButtonType.warning:
        _handleColor(hex('#ff976a'), hex('#fff'));
        break;

      default: 
        _color = hex('#fff');
        _textColor = hex('#323233');
        _borderColor = hex('#ebedf0');
        break;
    }

    /// 禁用状态
    /// borderColor透明度 .3 
    /// 其他颜色透明度 .5
    if(disabled) {
      _color = _color.withOpacity(.5);
      _textColor = _textColor.withOpacity(.5);
      _borderColor = _borderColor.withOpacity(.3);
    }
  }

  /// 处理Color
  void _handleColor(
    Color color,
    Color textColor,
  ) {
    if(plain) {
      _color = textColor;
      _textColor = color;
      _borderColor = _textColor;
    } else {
      _color = color;
      _textColor = textColor;
      _borderColor = _color;
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      key: key,
      textStyle: TextStyle(
        color: _textColor,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
      color: _color,
      child: InkWell(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            gradient: gradientColor,
            border: Border.all(color: _borderColor, width: 1),
            borderRadius: BorderRadius.circular(borderRadius)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: icon,
              ),
              Container(
                child: text,
              )
            ],
          ),
        ),
        onTap: _onPressed,
      ),
    );
  }
}