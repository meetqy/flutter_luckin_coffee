import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class RadiusBtn extends StatelessWidget {
  final bool isActive;
  final String text;
  final Function onPress;

  RadiusBtn(this.text, {
    this.isActive = false,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress == null ? (){} : onPress(),
      child: Container(
        width: 80,
        height: 30,
        margin: EdgeInsets.only(right: 10, bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: rgba(204, 192, 180, 1)), 
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: isActive ? rgba(204, 192, 180, 1) : hex('#fff')
        ),
        child: Text(text, 
          style: TextStyle(color: isActive ? hex('#fff') : rgba(204, 192, 180, 1), fontSize: 14),
        ),
      ),
    );
  }
}