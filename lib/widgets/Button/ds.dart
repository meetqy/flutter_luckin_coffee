import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class Button extends FlatButton {  
  final bool disabled;
  final String type;
  final color;
  final bgColor;
  final borderColor;
  final double width;
  final double height;

  static Map _buttonTypeConfig= {
    "warning": {"color": hex('#fff'),"bgColor": hex('#ff976a'),"borderColor": hex('#ff976a'),},
    "danger": {"color": hex('#fff'),"bgColor": hex('#f44'),"borderColor": hex('#f44'),},
    "info": {"color": hex('#fff'),"bgColor": hex('#1989fa'),"borderColor": hex('#1989fa'),},
    "primary": {"color": hex('#fff'),"bgColor": hex('#07c160'),"borderColor": hex('#07c160'),},
    "default": {"color": hex('#323233'),"bgColor": hex('#fff'),"borderColor": hex('#ebedf0'),},
  };

  static Color _bgColor;
  static Color _color;
  static Color _borderColor;

  Button({
    this.width = 300,
    this.height = 44,
    this.disabled = false,
    this.type = 'default',
    this.color,
    this.bgColor,
    this.borderColor,
    VoidCallback onPressed,
    Widget child,
  }) : super(
    child: child, 
    onPressed: onPressed
  ){

    var buttonColor = _buttonTypeConfig["$type"];

    // type不符合要求，设置为defalut
    if(buttonColor == null) buttonColor = _buttonTypeConfig['default'];

    setColor(
      color: color ?? buttonColor['color'],
      bgColor: bgColor ?? buttonColor['bgColor'],
      borderColor: borderColor ?? buttonColor['borderColor'],
    );
  }

  /// 设置color
  /// disabled状态  color透明度设置为0.5
  setColor({
    Color color,
    Color bgColor,
    Color borderColor
  }){
    _color = color.withOpacity(disabled ? 0.5: 1.0);
    _bgColor = bgColor.withOpacity(disabled ? 0.5: 1.0);
    _borderColor = borderColor.withOpacity(disabled ? 0.5: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: _borderColor, width: 1)
      ),
      child: FlatButton(
        child: child,
        textColor: _color,
        color: _bgColor,
        disabledColor: _bgColor,
        onPressed: (){},
      ),
    );
  }
}
