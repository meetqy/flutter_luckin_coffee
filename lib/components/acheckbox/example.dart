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
  static bool checkbox3 = false;
  static bool checkbox4 = false;
  static bool checkbox6 = false;
  static bool checkbox7 = false;
  static Map<String, bool> checkbox5 = {
    'a': false,
    'b': true,
    'c': false
  };

  static Map<String, bool> checkbox8 = {
    'a': false,
    'b': false,
    'c': false
  };

  static List<String> checkbox8Value = [];

  onChange(bool value) {
    setState(() {
      checkbox2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'ACheckBox',
        context: context
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
              leftChild: ACheckBox(
                width: 20,
                value: checkbox6,
                onChanged: (bool value) {
                  setState(() {
                    checkbox6 = value;
                  });
                },
              ),
              centerChild: Container(
                margin: EdgeInsets.only(left: 50),
                child: ACheckBox(
                  width: 20,
                  radius: Radius.circular(20),
                  value: checkbox7,
                  onChanged: (bool value) {
                    setState(() {
                      checkbox7 = value;
                    });
                  },
                ),
              ),
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
            ),


            ARow(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
              leftChild: Text('带文本的复选框', style: TextStyle(
                color: rgba(69, 90, 100, 0.6)
              ),),
            ),

            ARow(
              leftChild: ACheckBox(
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
              centerChild: Container(
                margin: EdgeInsets.only(left: 50),
                child: ACheckBox(
                  width: 20,
                  radius: Radius.circular(20),
                  value: checkbox2,
                  title: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('圆形复选框'),
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      checkbox2 = value;
                    });
                  },
                ),
              ),
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
            ),

            ARow(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
              leftChild: Text('自定义颜色', style: TextStyle(
                color: rgba(69, 90, 100, 0.6)
              ),),
            ),

            ARow(
              leftChild: ACheckBox(
                width: 20,
                value: checkbox3,
                activeColor: rgba(7, 193, 96, 1),
                title: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text('复选框'),
                ),
                onChanged: (bool value) {
                  setState(() {
                    checkbox3 = value;
                  });
                },
              ),
              centerChild: Container(
                margin: EdgeInsets.only(left: 50),
                child: ACheckBox(
                  width: 20,
                  radius: Radius.circular(20),
                  value: checkbox4,
                  activeColor: rgba(7, 193, 96, 1),
                  title: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('复选框'),
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      checkbox4 = value;
                    });
                  },
                ),
              ),
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
            ),

            ARow(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
              leftChild: Text('复选框组', style: TextStyle(
                color: rgba(69, 90, 100, 0.6)
              ),),
            ),

            Column(
              children: checkbox5.keys.map((String key) {
                return ARow(
                  centerChild: ACheckBox(
                    width: 20,
                    value: checkbox5[key],
                    title: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('复选框$key'),
                    ),
                    onChanged: (bool value) {
                      setState(() {
                        checkbox5[key] = value;
                      });
                    },
                  ),
                );
              }).toList(),
            ),

            ARow(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
              leftChild: Text('最多选择2项', style: TextStyle(
                color: rgba(69, 90, 100, 0.6)
              ),),
            ),

            Column(
              children: checkbox8.keys.map((String key) {
                return ARow(
                  centerChild: ACheckBox(
                    width: 20,
                    value: checkbox8[key],
                    title: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('复选框$key'),
                    ),
                    onChanged: (bool value) {
                      
                      setState(() {
                        if(value) {
                          if(checkbox8Value.length < 2) {
                            checkbox8Value.add(key);
                            checkbox8[key] = value;
                          }
                        } else {
                          checkbox8Value.remove(key);
                          checkbox8[key] = value;
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}