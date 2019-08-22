import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class CustomStepper extends StatelessWidget {
  /// 步进器  
  /// 大概样子：- 1 +
  const CustomStepper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        iconjian(size: 28, color: rgba(136, 175, 213, 1)),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 3),
          child: Text('1', 
            style: TextStyle(
              color: rgba(136, 175, 213, 1),
              fontSize: 14
            ),
          ),
        ),
        iconjaifill(size: 28, color: rgba(136, 175, 213, 1))
      ],
    );
  }
}