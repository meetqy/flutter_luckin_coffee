import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import 'loading_button.dart';

enum ButtonType {
  /// 默认按钮
  normal,

  /// 主要按钮
  primary,

  /// 信息按钮
  info,

  /// 警告按钮 
  warning,

  /// 危险按钮
  danger,
}

enum ButtonSize {
  /// 普通按钮
  normal,
  
  /// 大号按钮
  large,

  /// 小型按钮
  small,

  /// 迷你按钮
  mini
}

class StandButton extends StatelessWidget {
  const StandButton({
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
    this.borderRadius = 2,
    this.padding,
    this.size = ButtonSize.normal,
  }) : super(key: key);

  /// 类型，可选值为 primary info warning danger
  final ButtonType type;

  /// 自定义按钮的渐变颜色
  final LinearGradient gradientColor;

  /// 背景颜色
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
  final Widget icon;

  /// 点击按钮触发
  final VoidCallback onPressed;

  /// 圆角
  final double borderRadius;

  /// 内边距
  final EdgeInsets padding;

  /// 按钮尺寸
  final ButtonSize size;


  /// 加载按钮
  static loading({
    Key key,
    ButtonType type = ButtonType.info,
    double iconSize = 25,
    Widget loadingText,
    LoadingType loadingType = LoadingType.circular,
    VoidCallback onPressed,
    bool disabled = false
  }) => LoadingButton(
    key: key,
    iconSize: iconSize,
    loadingText: loadingText,
    type: type,
    loadingType: loadingType,
    onPressed: onPressed,
    disabled: disabled
  );

  /// 初始化颜色 [_color, _textColor, _borderColor]
  List<Color> initColor() {
    switch(type) {
      case ButtonType.primary:
        return handleColor(hex('#07c160'));

      case ButtonType.info:
        return handleColor(hex('#1989fa'));

      case ButtonType.danger:
        return handleColor(hex('#ee0a24'));

      case ButtonType.warning:
        return handleColor(hex('#ff976a'));

      default: 
        return handleColor(Colors.transparent);
    }
  }

  /// 处理Color
  /// 
  /// 朴素按钮: 背景为白色，文本颜色 == 边框颜色
  /// 正常按钮: 文字为白色，背景颜色 == 边框颜色
  /// 默认按钮: 背景白色，文字黑色，边框灰色
  /// 禁用按钮: 背景颜色，文字颜色透明度.5，边框颜色0（朴素按钮边框颜色.3）
  List<Color> handleColor(Color color) {
    /// 默认按钮样式
    List<Color> _colors = [
      /// 背景颜色
      hex('#fff'), 
      /// 文字颜色
      hex('#323233'),
      /// 边框颜色 
      hex('#ebedf0')
    ];

    /// 普通按钮
    if(type == ButtonType.normal) {
      return _colors;
    }

    /// 朴素按钮
    if(plain) {
      _colors[0] = hex('#fff');
      _colors[1] = _colors[2] = color;
    } else {
      _colors[1] = hex('#fff');
      _colors[0] = _colors[2] = color;
    }

    /// 禁用按钮
     if(disabled) {
      _colors = [
        _colors[0].withOpacity(.5),
        _colors[1].withOpacity(.5),
        _colors[2].withOpacity(plain ? .3 : 0)
      ];
    }

    return _colors;
  }

  /// 初始化尺寸
  /// [padding, mainAxisSize]
  List initSize() {
    switch(size) {
      case ButtonSize.large: 
        return [
          EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
          MainAxisSize.max
        ];

      case ButtonSize.small: 
        return [
          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          MainAxisSize.min
        ]; 

      case ButtonSize.mini: 
        return [
          EdgeInsets.all(0),
          MainAxisSize.min
        ];  

      default:
        return [
          EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
          MainAxisSize.min
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    List _colors = initColor();

    /// 按钮尺寸 
    /// [padding, mainAxisSize]
    List _size = initSize();    

    return Material(
      key: key,
      textStyle: TextStyle(
        color: _colors[1],
      ),
      borderRadius: BorderRadius.circular(borderRadius),
      color: _colors[0],
      child: InkWell(
        child: Container(
          width: width,
          height: height,
          padding: padding == null ? _size[0] : padding,
          decoration: BoxDecoration(
            gradient: gradientColor,
            border: Border.all(color: _colors[2], width: 1),
            borderRadius: BorderRadius.circular(borderRadius)
          ),
          child: Row(
            mainAxisSize: _size[1],
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: icon,
              ),
              Container(
                margin: EdgeInsets.only(left: icon != null && text != null ? 6 : 0),
                child: text,
              )
            ],
          ),
        ),
        onTap: () {
          if(!disabled) {
            return onPressed == null ? (){} : onPressed();
          }
        },
      ),
    );
  }
}