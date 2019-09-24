import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class FullScreenDialog extends StatelessWidget {
  final Widget child;
  final CloseDialog closeChild; 


  /// 全屏弹窗
  /// 关闭弹窗实现思路：
  /// 提供一个CloseDialog的widget，让调用者可以控制改容器的位置（该容器是绝对定位）。
  /// 当点击容器的时候，在内部调用关闭的方法
  /// 为什么要这样做：
  /// 采用其他方式最大的问题是，类之间不能共享context，
  /// 如果能够共享context，其他方法解决，会比这种方式更加优雅
  /// 
  /// ```
  /// @param {Widget} dialog - 弹窗内容
  /// @param {CloseDialog} closeChild - 关闭弹窗的widget 
  /// ```
  FullScreenDialog({this.child, this.closeChild});

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
        width: G.screenWidth(),
        height: G.screenHeight(),
        padding: EdgeInsets.symmetric(vertical: 44),
        child: Center(
          child: Stack(children: <Widget>[
            child,
            closeChild
          ],)
        )
      ),
    );
  }
}

class CloseDialog extends StatelessWidget {
  final double left;
  final double right;
  final double top;
  final double bottom;
  final Widget child;

  CloseDialog({
    this.bottom ,
    this.left,
    this.top ,
    this.right,
    this.child
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: InkWell(
        child: child,
        onTap: () {
          Navigator.pop(context);
        },
      )
    );
  }
}