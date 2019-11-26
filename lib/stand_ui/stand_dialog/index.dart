import 'package:flutter/material.dart';

import 'alert.dart';

class StandDialog {
  StandDialog({
    @required this.context,
    this.message = '代码是写出来给人看的，附带能在机器上运行',
    this.title = '标题', 
    VoidCallback onOk,
  }) {
    StandDialog.alert(
      context: context,
      message: message,
      title: title,
      onOk: onOk
    );
  }

  final String message;

  final String title;

  final BuildContext context;

  StandDialog.alert({
    @required this.context,
    this.message = '代码是写出来给人看的，附带能在机器上运行',
    this.title = '标题', 
    VoidCallback onOk,
  }) {
    Alert(
      context: context,
      message: message,
      title: title,
      onOk: onOk
    );
  }
}