import 'package:flutter/material.dart';

import 'global.dart';

/// 通用appbar
///
/// ```
/// @param {BuildContext} - context 如果context存在：左边有返回按钮，反之没有
/// @param {String} title - 标题
/// @param {bool} borderBottom - 是否显示底部border
/// ```
AppBar customAppbar(
    {BuildContext context,
    String title = '',
    bool borderBottom = true,
    List actions}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          color: Color.fromRGBO(56, 56, 56, 1),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    leading: context == null
        ? null
        : InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(44, 44, 44, 1),
              size: 16,
            ),
            onTap: () => Navigator.pop(context),
          ),
    bottom: PreferredSize(
      child: Container(
        decoration: BoxDecoration(border: cuBorderBottom(show: borderBottom)),
      ),
      preferredSize: Size.fromHeight(0),
    ),
    actions: actions,
  );
}
