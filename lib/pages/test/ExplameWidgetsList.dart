import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class ExplameWidgetsList extends StatelessWidget {
  const ExplameWidgetsList({Key key}) : super(key: key);

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
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: ui.borderBottom(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Button'),
                      icontupian6(color: rgba(228, 228, 228, 1), size: 14)
                    ],
                  ),
                ),
                onTap: (){Navigator.pushNamed(context, '/explame_button');},
              )
            ],
          ),
        ),
      ),
    );
  }
}