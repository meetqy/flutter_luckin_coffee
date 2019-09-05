import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

import 'CustomStepper.dart';

class ExplameStepper extends StatefulWidget {
  ExplameStepper({Key key}) : super(key: key);

  _ExplameStepperState createState() => _ExplameStepperState();
}

class _ExplameStepperState extends State<ExplameStepper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: '步进器',
        context: context
      ),
      body: Container(
        color: hex('#fff'),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              returnRow(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('基础用法'),
                  CustomStepper(value: 1,)
                ],),
              ),
              returnRow(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('限制范围2-5'),
                  CustomStepper(value: 1,min: 2,max: 5,)
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container returnRow({Widget child}) {
    return Container(
              decoration: BoxDecoration(
                border: ui.borderBottom(),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
              child:child
            );
  }
}