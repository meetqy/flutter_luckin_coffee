import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class ARow extends StatelessWidget {
  final double height;
  final Widget leftChild;
  final Widget centerChild;
  final Widget rightChild;
  final EdgeInsets padding;
  final Border border;
  final Color color;

  /// ARow 行
  /// 
  /// ```
  /// @param {double} height 高度
  /// @param {Widget} leftChild 左侧内容
  /// @param {Widget} centerChild 中间内容
  /// @param {Widget} rightChild 右侧内容
  /// @param {EdgeInsets} padding 内边距
  /// @param {Border} border 
  /// @param {Color} color 
  /// ```
  ARow({
    Key key,
    this.height = 44,
    this.padding,
    this.leftChild,
    this.centerChild,
    this.rightChild,
    this.border,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color == null ? hex('#fff') : color,
        border: border == null ? Border(bottom: BorderSide(width: 1, color: rgba(242, 242, 242, 1))) : border
      ),
      padding: padding == null ? EdgeInsets.symmetric(horizontal: 15) : padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // left
          leftChild == null ? Container() : leftChild,

          // center
          Expanded(
            child: centerChild == null ? Container() : centerChild
          ),
          
          // right
          rightChild == null ? Container() : rightChild
        ],
      ),
    );
  }
}