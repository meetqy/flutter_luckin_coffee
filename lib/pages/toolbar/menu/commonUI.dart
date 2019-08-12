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
}

final ui = Ui();