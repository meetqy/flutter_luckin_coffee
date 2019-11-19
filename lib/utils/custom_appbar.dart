import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';

import 'global.dart';

/// 通用appbar
/// 
/// ```
/// @param {BuildContext} - context 如果context存在：左边有返回按钮，反之没有
/// @param {String} title - 标题
/// @param {bool} borderBottom - 是否显示底部border
/// ```
AppBar customAppbar({
  BuildContext context,
  String title = '',
  bool borderBottom = true,
  List actions
}) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: TextStyle(
      color: rgba(56, 56, 56, 1),
      fontSize: 18,
      fontWeight: FontWeight.bold
    ),),
    backgroundColor: hex('#fff'),
    elevation: 0,
    leading: context == null ? null : InkWell(
      child: icontupian8(color: rgba(44, 44, 44, 1), size: 16),
      onTap: () => Navigator.pop(context),
    ),
    bottom: PreferredSize(
      child: Container(
        decoration: BoxDecoration(
          border: G.borderBottom(show: borderBottom)
        ),
      ),
      preferredSize: Size.fromHeight(0),
    ),
    actions: actions,
  );
}