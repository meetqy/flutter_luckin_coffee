import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function onPress;
  final Color bgColor;
  final Color color;

  Button(this.text, {
    this.icon,
    this.onPress,
    this.bgColor,
    this.color
  }) : assert(text != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        decoration: BoxDecoration(
          color: bgColor == null ? rgba(255, 129, 2, 1) : bgColor,
          borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Container(child: icon),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(text, style: TextStyle(
              color: color == null ? rgba(255, 255, 255, 1) : color,
              fontSize: 12
            ),),
          )
        ],),
      )
    );
  }
}