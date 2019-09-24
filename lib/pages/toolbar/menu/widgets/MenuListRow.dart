import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class MenuListRow extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function onPress;
  final Key key;
  final int id;

  /// 左侧菜单列表  行
  /// 
  /// ```
  /// @param {String} title - 标题
  /// @param {bool} isActive - 是否是选中状态
  /// @param {Function} onPress - 点击回调
  /// @param {Function} onPress - 点击回调
  /// @param {Key} key - key
  /// @param {int} id - 唯一标识，用于确定当前点击的widget
  /// ```
  MenuListRow(this.title, {
    this.isActive = false,
    this.onPress,
    this.key,
    this.id
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: () => onPress(id),
      child: Container(
        alignment: Alignment.center,
        height: 44,
        decoration: BoxDecoration(
          border: isActive ? G.borderBottom(color: hex('#fff')) : G.borderBottom(),
          color: isActive ? hex('#fff') : null
        ),
        child: Text(title),
      ),
    );
  }
}