import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class FullScreenDialog extends StatelessWidget {
  final Widget child;


  /// 全屏弹窗
  /// 
  /// ```
  /// @param {Widget} dialog - 弹窗内容
  /// ```
  FullScreenDialog({this.child});

  /// 显示FullScreenDialog
  void show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => this
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: rgba(0, 0, 0, 0.3),
      child: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 44),
        child: child,
      ),
    );
  }
}