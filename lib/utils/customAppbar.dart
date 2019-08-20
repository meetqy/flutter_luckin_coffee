import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';

/// 通用appbar
/// 
/// ```
/// @param {String} title - 标题
/// ```
AppBar customAppbar(BuildContext context, {
  String title = '',
  double elevation = 0,
}) {
  return AppBar(
    title: Text(title, style: TextStyle(
      color: rgba(56, 56, 56, 1),
      fontSize: 18,
      fontWeight: FontWeight.bold
    ),),
    backgroundColor: hex('#fff'),
    elevation: elevation,
    leading: InkWell(
      child: icontupian8(color: rgba(44, 44, 44, 1), size: 16),
      onTap: (){
        Navigator.pop(context);
      },
    )
  );
}