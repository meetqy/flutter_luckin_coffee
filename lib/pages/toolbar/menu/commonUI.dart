import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class Ui {
  Border borderBottom({Color color}){
    return Border(bottom: BorderSide(color: color == null ? rgba(242, 242, 242, 1) : color,width: 1));
  } 
}

final ui = Ui();