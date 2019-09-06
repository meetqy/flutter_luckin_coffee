/*
 * @Author: meetqy
 * @since: 2019-09-06 10:40:40
 * @lastTime: 2019-09-06 17:09:20
 * @LastEditors: meetqy
 */
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/button/index.dart';
import 'package:flutter_luckin_coffee/components/dialog/CustomDialog.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';

class ExampleDialog extends StatefulWidget {
  ExampleDialog({Key key}) : super(key: key);

  _ExampleDialogState createState() => _ExampleDialogState();
}

class _ExampleDialogState extends State<ExampleDialog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Dialog 弹出框',
        context: context
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Button.normal(
                          child: Text('提示弹窗'),
                          type: 'primary',
                          onPressed: (){
                            CustomDialog.alert(context,
                              title: '提示弹窗',
                              content: '代码是写出来给人看的，附带能在机器上运行'
                            );
                          }
                        ),
                      ),

                      Button.normal(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('提示弹窗(无标题)'),
                        type: 'primary',
                        onPressed: (){
                          CustomDialog.alert(context,
                            content: '代码是写出来给人看的，附带能在机器上运行'
                          );
                        }
                      ),
                  ],),
                ),
                
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: <Widget>[
                      Button.normal(
                        child: Text('确认弹窗'),
                        type: 'primary',
                        onPressed: (){
                          CustomDialog.confirm(context,
                            title: '确认弹窗',
                            content: 'flutter_luckin_coffee是一个完整的flutter实战demo',
                            confirmButtonPress: () {
                              Navigator.pop(context);
                            }
                          );
                        }
                      ),
                    ],
                  ),
                ),
            ],),
          )
        ],
      ),
    );
  }
}