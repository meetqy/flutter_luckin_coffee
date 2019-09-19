import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/acheckbox/ACheckBox.dart';
import 'package:flutter_luckin_coffee/components/arow/ARow.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';

class ExampleACheckBox extends StatefulWidget {
  ExampleACheckBox({Key key}) : super(key: key);

  _ExampleACheckBoxState createState() => _ExampleACheckBoxState();
}

class _ExampleACheckBoxState extends State<ExampleACheckBox> {
  static bool checkbox1 = false;
  static bool checkbox2 = false;

  onChange(bool value) {
    setState(() {
      checkbox2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'ACheckBox'
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ARow(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
              leftChild: Text('基础用法', style: TextStyle(
                color: rgba(69, 90, 100, 0.6)
              ),),
            ),

            ARow(
              centerChild: ACheckBox(
                width: 20,
                value: checkbox1,
                title: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text('复选框'),
                ),
                onChanged: (bool value) {
                  setState(() {
                    checkbox1 = value;
                  });
                },
              ),
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
            ),

            ARow(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
              leftChild: Text('圆形复选框', style: TextStyle(
                color: rgba(69, 90, 100, 0.6)
              ),),
            ),

            ARow(
              centerChild: ACheckBox(
                width: 20,
                radius: Radius.circular(20),
                value: checkbox2,
                title: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text('复选框'),
                ),
                onChanged: (bool value) {
                  setState(() {
                    checkbox2 = value;
                  });
                },
              ),
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
            ),

            
          ],
        ),
      ),
    );
  }
}