import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class CustomButton {  
  static Map _buttonTypeConfig= {
    "warning": {"color": hex('#fff'),"bgColor": hex('#ff976a'),"borderColor": hex('#ff976a'),},
    "danger": {"color": hex('#fff'),"bgColor": hex('#f44'),"borderColor": hex('#f44'),},
    "info": {"color": hex('#fff'),"bgColor": hex('#1989fa'),"borderColor": hex('#1989fa'),},
    "primary": {"color": hex('#fff'),"bgColor": hex('#07c160'),"borderColor": hex('#07c160'),},
    "default": {"color": hex('#323233'),"bgColor": hex('#fff'),"borderColor": hex('#ebedf0'),},
  };

  Widget widget;

  static Color _bgColor;
  static Color _color;
  static Color _borderColor;

  final String type; 
  final Color color;
  final Color bgColor;
  final Color borderColor;
  final double width;
  final double height;
  final bool plain;
  final VoidCallback onPressed;

  CustomButton.normal({
    this.width,
    this.height,
    this.type,
    this.color,
    this.bgColor,
    this.borderColor,
    this.plain,
    this.onPressed,
    Widget child
  }) {
    var buttonColor = _getType();

    _setColor(
      color: color ?? buttonColor['color'],
      bgColor: bgColor ?? buttonColor['bgColor'],
      borderColor: borderColor ?? buttonColor['borderColor'],
    );

    widget = _initNormal(child);
  }

  Widget _initNormal(Widget child) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: plain ? Border.all(width: 1, color: _borderColor) : null
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: child,
        textColor: _color,
        splashColor: onPressed == null ? Colors.transparent : null,
        highlightColor: onPressed == null ? Colors.transparent : null,
        color: _bgColor,
        disabledColor: _bgColor,
        onPressed: onPressed == null ? (){} : onPressed,
      ),
    );
  }

  CustomButton.loading({
    this.width,
    this.height,
    this.type,
    this.color,
    this.bgColor,
    this.borderColor,
    this.plain,
    this.onPressed,
    Widget textChild,
    Widget loadingChild 
  }) {
    var buttonColor = _getType();

    _setColor(
      color: color ?? buttonColor['color'],
      bgColor: bgColor ?? buttonColor['bgColor'],
      borderColor: borderColor ?? buttonColor['borderColor'],
    );

    widget = _initLoading(textChild, loadingChild);
  }

  /// 初始化带loading的按钮
  _initLoading(Widget textChild, Widget loadingChild) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: plain ? Border.all(width: 1, color: _borderColor) : null
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            loadingChild == null ? Transform.scale(
              scale: 0.7,
              child: CircularProgressIndicator(
                backgroundColor: _color,
              ),
            ) : loadingChild,
            Container(child: textChild,)
          ],
        ),
        textColor: _color,
        splashColor: onPressed == null ? Colors.transparent : null,
        highlightColor: onPressed == null ? Colors.transparent : null,
        color: _bgColor,
        disabledColor: _bgColor,
        onPressed: onPressed == null ? (){} : onPressed,
      ),
    );
  }


  _getType() {
    var buttonColor = _buttonTypeConfig["$type"];

    // type不符合要求，设置为defalut
    if(buttonColor == null) buttonColor = _buttonTypeConfig['default'];

    return buttonColor;
  }


  /// 设置color
  /// disabled状态  color透明度设置为0.5
  _setColor({
    Color color,
    Color bgColor,
    Color borderColor,
  }){
    // 通过plain属性将按钮设置为朴素按钮，朴素按钮的文字为按钮颜色，背景为白色
    if(plain) { 
      _borderColor = bgColor.withOpacity(onPressed == null ? 0.5: 1.0);;
      _color = _borderColor;
      _bgColor = hex('#fff');
    } else {
      _color = color.withOpacity(onPressed == null ? 0.5: 1.0);
      _bgColor = bgColor.withOpacity(onPressed == null ? 0.5: 1.0);
      _borderColor = borderColor.withOpacity(onPressed == null ? 0.5: 1.0);
    }
  }
}


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

  static Widget loading({
    double width = 300,
    double height = 44,
    String type = 'default',
    Color color,
    Color bgColor,
    Color borderColor,
    bool plain = false,
    VoidCallback onPressed,
    Widget textChild,
    Widget loadingChild
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
      textChild: textChild,
      loadingChild: loadingChild
    ).widget;
  }

}