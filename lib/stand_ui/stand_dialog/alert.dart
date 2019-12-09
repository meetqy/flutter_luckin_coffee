import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/stand_ui/stand_dialog/normal_dialog.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class Alert extends NormalDialog {
  Alert({
    BuildContext context,
    String title,
    String message,
    this.onOk
  }): super(
    context: context,
    title: title,
    message: message
  );

  @override
  Widget get bottom => _bottom();

  /// 点击确认回调
  final VoidCallback onOk;

  Widget _bottom() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 50,
            child: Text('确认', style: TextStyle(
              color: hex('#1989fa'),
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
          ),
        ],
      ),
      onTap: () {
        if(onOk != null) onOk();
        G.pop();
      },
    );
  }
}