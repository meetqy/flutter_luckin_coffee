/*
 * @Author: meetqy
 * @since: 2019-09-02 15:41:55
 * @lastTime: 2019-09-09 15:12:18
 * @LastEditors: meetqy
 */
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/global.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';


class ExampleWidgetsList extends StatelessWidget {
  final Object args;
  const ExampleWidgetsList({
    Key key,
    this.args
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: hex('#fff'),
      appBar: customAppbar(
        title: '组件列表',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              returnRow(context,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Button'),
                    icontupian6(color: rgba(228, 228, 228, 1), size: 14)
                  ],
                ),
                onPress: () => Navigator.pushNamed(context, '/explame_button'),
              ),

              returnRow(context,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('CustomStepper 步进器'),
                    icontupian6(color: rgba(228, 228, 228, 1), size: 14)
                  ],
                ),
                onPress: () => Navigator.pushNamed(context, '/example_stepper'),
              ),

              returnRow(context,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('CustomDialog 弹出框'),
                    icontupian6(color: rgba(228, 228, 228, 1), size: 14)
                  ],
                ),
                onPress: () => Navigator.pushNamed(context, '/example_dialog'),
              ),

              returnRow(context,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('返回我的页面'),
                    icontupian6(color: rgba(228, 228, 228, 1), size: 14)
                  ],
                ),
                onPress: () => G.pushNamed('/mine', arguments: {"a": 'test args'}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell returnRow(BuildContext context, {Widget child, Function onPress}) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: ui.borderBottom(),
        ),
        child: child,
      ),
      onTap: () => onPress == null ?(){} : onPress(),
    );
  }
}