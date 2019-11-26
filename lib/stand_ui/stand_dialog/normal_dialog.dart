import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/stand_ui/stand_dialog/rewrite_show_dialog.dart';

class NormalDialog extends RewriteShowDialog {
  NormalDialog({
    @required BuildContext context,
    this.message = '代码是写出来给人看的，附带能在机器上运行',
    this.title = '标题', 
    this.bottom
  }): super(
    context: context,
  );

  @override
  Widget get child => _child();

  /// 标题
  final String title;

  /// 内容
  final String message;

  /// 底部
  final Widget bottom;

  Widget _child() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              /// title
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: title == null ? 0 : 10),
                child: buildTitle(),
              ),

              /// message
              Container(
                constraints: BoxConstraints(
                  maxHeight: 500,
                  minHeight: 80
                ),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: SingleChildScrollView(
                  child: buildMessage(),
                ),
              ),
            ],
          ),

          /// bottom
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: hex('#ebedf0')))
                  ),
                  height: 50,
                  child: bottom,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  Container buildMessage() {
    return Container(
      alignment: Alignment.center,
      child: Text(message == null ? '' : message,
        style: TextStyle(
          fontSize: 16
        ),
      ),
    );
  }

  Container buildTitle() {
    return Container(
      child: Text(title == null ? '' : title, style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16
      ),),
    );
  }
}