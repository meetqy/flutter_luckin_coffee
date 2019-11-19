import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

import 'a_stepper.dart';


class ExampleAStepper extends StatefulWidget {
  ExampleAStepper({Key key}) : super(key: key);

  _ExampleStepperState createState() => _ExampleStepperState();
}

class _ExampleStepperState extends State<ExampleAStepper> {

  int num1 = 1;
  int num2 = 2;
  

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
                  AStepper(
                    value: num1,
                    onChange: (val) {
                      setState(() {
                        num1 = val;
                      });
                    },
                  )
                ],),
              ),
              returnRow(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('限制范围2-5'),
                  AStepper(
                    value: num2,
                    min: 2,
                    max: 5,
                    onChange: (val) {
                      setState(() {
                        num2 = val;
                      });
                    },
                  )
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