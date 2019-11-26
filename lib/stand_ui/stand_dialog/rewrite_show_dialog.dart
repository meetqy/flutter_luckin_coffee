import 'package:flutter/material.dart';


class RewriteShowDialog {
  
  RewriteShowDialog({
    @required this.context,
    this.child,
    this.barrierColor = Colors.black54,
    this.barrierDismissible = false,
    this.elevation = 0,
    this.padding
  }){
    _showGeneralDialog(
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder: (BuildContext context) {
        /// AnimatedPadding代替dialog 
        /// dialog没有提供修改padding的属性，本身也是调用的AnimatedPadding
        return AnimatedPadding(
          padding: padding == null ? EdgeInsets.symmetric(horizontal: 32, vertical: 24) : padding,
          duration: Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: MediaQuery.removeViewInsets(
            removeLeft: true,
            removeTop: true,
            removeRight: true,
            removeBottom: true,
            context: context,
            child: Center(
              child: Material(
                elevation: elevation,
                borderRadius: BorderRadius.circular(12),
                child: child
              ),
            ),
          ),
        );
      }
    );
  }

  final BuildContext context;

  /// 内容
  final Widget child;

  /// 点击背景是否可以关闭弹窗
  final bool barrierDismissible;
  
  /// 背景颜色
  final Color barrierColor;

  /// 阴影
  final double elevation;

  /// 内边距
  final EdgeInsets padding;

  /// 重写showGeneralDialog
  /// 系统自带的背景背景透明不能修改
  void _showGeneralDialog({
    Widget Function(BuildContext) builder,
    Widget child,
    bool barrierDismissible,
    Color barrierColor
  }) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        final Widget pageChild = child ?? Builder(builder: builder);
        return SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return pageChild;
            }
          ),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: barrierColor,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
  }
}