/*
 * @Author: meetqy
 * @since: 2019-08-30 14:34:02
 * @lastTime: 2019-09-23 16:19:54
 * @LastEditors: meetqy
 */
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
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  CustomButton.normal({
    this.width,
    this.height,
    this.type,
    this.color,
    this.bgColor,
    this.borderColor,
    this.plain,
    this.onPressed,
    this.padding,
    this.borderRadius,
    Widget child
  }) {
    _setColor();

    widget = _init(child);
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
    this.padding,
    this.borderRadius,
    Widget textChild,
    Widget icon,
  }) {

    _setColor();

    widget = _initIcon(textChild, icon);
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
    this.padding,
    this.borderRadius,
    Widget textChild,
    Widget loadingChild,
  }) {   
    _setColor();

    Widget defaultLoading = Transform.scale(
      scale: 0.7,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation(_color),
      ),
    );

    widget = _initIcon(textChild, defaultLoading);
  }

  _init(Widget child) {
    return Container(
      width: width,
      height: height,
      child: FlatButton(
        padding: padding == null ? EdgeInsets.all(0) : padding,
        shape:  RoundedRectangleBorder(
          borderRadius: borderRadius == null ? BorderRadius.circular(4) : borderRadius,
          side: BorderSide(width: 1, color: !plain ? Colors.transparent : _borderColor)
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: child,
        textColor: _color,
        color: _bgColor,
        splashColor: onPressed == null ? Colors.transparent : null,
        highlightColor: onPressed == null ? Colors.transparent : null,
        disabledColor: _bgColor,
        onPressed: onPressed == null ? (){} : onPressed,
      ),
    );
  }

  _initIcon(Widget textChild, Widget icon) {
    Widget iconChild = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(child: icon,),
        Container(
          margin: EdgeInsets.only(left: textChild == null ? 0 : 5),
          child: textChild,
        )
      ],
    );

    return _init(iconChild);
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
    Map buttonColor = _getType();

    // color  传入的
    // buttonColor['xxx'] 默认的
    // $color 最终结果
    Color $color = color ?? buttonColor['color'];
    Color $bgColor = bgColor ?? buttonColor['bgColor'];
    Color $borderColor =  borderColor ?? buttonColor['borderColor'];


    // 通过plain属性将按钮设置为朴素按钮，朴素按钮的文字为按钮颜色
    // 默认背景颜色为白色
    if(plain) { 
      // 如果调用者传入的color为空，文字颜色 = 背景颜色
      // 默认背景颜色为白色
      if(color == null) {
        _color = onPressed == null ? $bgColor.withOpacity(.5): $bgColor;
      } else {
        _color = onPressed == null ? $color.withOpacity(.5): $color;
      }
      
      // 如果调用者传入的borderColor为空，边框颜色 = 背景颜色
      // 默认背景颜色为白色
      if(borderColor == null) {
        _borderColor = onPressed == null ? $bgColor.withOpacity(.5): $bgColor;
      } else {
        _borderColor = onPressed == null ? $borderColor.withOpacity(.5): $borderColor;
      }

      _bgColor = bgColor ?? hex('#fff');
    } else {
      _color = onPressed == null ? $color.withOpacity(.5): $color;
      _bgColor = onPressed == null ? $bgColor.withOpacity(.5): $bgColor;
      _borderColor = onPressed == null ? $borderColor.withOpacity(.5): $borderColor;
    }
  }
}