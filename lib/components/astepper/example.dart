import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

import 'AStepper.dart';

class ExampleAStepper extends StatefulWidget {
  ExampleAStepper({Key key}) : super(key: key);

  _ExampleStepperState createState() => _ExampleStepperState();
}

class _ExampleStepperState extends State<ExampleAStepper> {

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
                  AStepper(value: 1,)
                ],),
              ),
              returnRow(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('限制范围2-5'),
                  AStepper(value: 1,min: 2,max: 5,)
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
        border: G.borderBottom(),
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
      child:child
    );
  }
}