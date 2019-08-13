import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class Ui {
  /// 底部border
  /// ```
  /// @param {Color} color
  /// @param {bool} show  是否显示底部border
  /// ```
  Border borderBottom({Color color, bool show = true}){
    return Border(
      bottom: BorderSide(
        color: color == null || !show  ? rgba(242, 242, 242, show ? 1 : 0) : color,
        width: 1
      )
    );
  }

  /// 圆形背景 里面包icon
  Widget circelIcon({Icon icon, Function onPress, Color bgColor}) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor == null ? rgba(0, 0, 0, 0.3) : bgColor,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: icon
      ),
      onTap: () {
        if(onPress!=null) {
          onPress();
        }
      },
    );
  }
}

final ui = Ui();