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
    _setColor();

    widget = _initNormal(child);
  }

  Widget _initNormal(Widget child) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: plain ? Border.all(width: 1, color: _borderColor) : null,
        color: bgColor
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: child,
        textColor: _color,
        splashColor: onPressed == null ? Colors.transparent : null,
        highlightColor: onPressed == null ? Colors.transparent : null,
        disabledColor: _bgColor,
        onPressed: onPressed == null ? (){} : onPressed,
      ),
    );
  }

  CustomButton.icon({
    this.width,
    this.height,
    this.type,
    this.color,
    this.bgColor,
    this.borderColor,
    this.plain,
    this.onPressed,
    Widget textChild,
    Widget icon,
  }) {

    _setColor();

    widget = _initIcon(textChild, icon);
  }

  /// 初始化icon的按钮
  _initIcon(Widget textChild, Widget icon) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: plain ? Border.all(width: 1, color: _borderColor) : null,
        color: _bgColor
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: icon,),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: textChild,
            )
          ],
        ),
        textColor: _color,
        splashColor: onPressed == null ? Colors.transparent : null,
        highlightColor: onPressed == null ? Colors.transparent : null,
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
    Widget loadingChild,
    Color loadingColor
  }) {   
    _setColor();

    var defaultLoading = Transform.scale(
      scale: 0.7,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation(loadingColor),
      ),
    );

    widget = _initIcon(textChild, defaultLoading);
  }


  _getType() {
    var buttonColor = _buttonTypeConfig["$type"];

    // type不符合要求，设置为defalut
    if(buttonColor == null) buttonColor = _buttonTypeConfig['default'];

    return buttonColor;
  }


  /// 设置color
  /// disabled状态  color透明度设置为0.5
  _setColor(){
    var buttonColor = _getType();

    // color  传入的
    // buttonColor['xxx'] 默认的
    // $color 最终结果
    var $color = color ?? buttonColor['color'];
    var $bgColor = bgColor ?? buttonColor['bgColor'];
    var $borderColor =  borderColor ?? buttonColor['borderColor'];


    // 通过plain属性将按钮设置为朴素按钮，朴素按钮的文字为按钮颜色，背景为白色
    if(plain) { 
      _borderColor = _color = $bgColor.withOpacity(onPressed == null ? 0.5: 1.0);
      _bgColor = hex('#fff');
    } else {
      _color = $color.withOpacity(onPressed == null ? 0.5: 1.0);
      _bgColor = $bgColor.withOpacity(onPressed == null ? 0.5: 1.0);
      _borderColor = $borderColor.withOpacity(onPressed == null ? 0.5: 1.0);
    }
  }
}



