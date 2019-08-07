/*
 * @Author: meetqy
 * @since: 2019-08-07 14:53:53
 * @lastTime: 2019-08-07 14:58:57
 * @LastEditors: meetqy
 */

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  final bool border;
  final Icon icon;
  final Color bgColor;

  HomeIcon(this.icon, {
    this.bgColor,
    this.border = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        border: border ? Border.all(color: rgba(99, 71, 58, 1)) : null,
        color: bgColor
      ),
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 3),
        child: icon,
      )
    );
  }
}