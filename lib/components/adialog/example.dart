/*
 * @Author: meetqy
 * @since: 2019-09-06 10:40:40
 * @lastTime: 2019-09-18 10:47:05
 * @LastEditors: meetqy
 */
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/AButton/index.dart';
import 'package:flutter_luckin_coffee/components/adialog/ADialog.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';

class ExampleADialog extends StatefulWidget {
  ExampleADialog({Key key}) : super(key: key);

  _ExampleDialogState createState() => _ExampleDialogState();
}

class _ExampleDialogState extends State<ExampleADialog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'ADialog 弹出框',
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
                        child: AButton.normal(
                          child: Text('提示弹窗'),
                          type: 'primary',
                          onPressed: (){
                            ADialog.alert(context,
                              title: '提示弹窗',
                              content: '代码是写出来给人看的，附带能在机器上运行'
                            );
                          }
                        ),
                      ),

                      AButton.normal(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('提示弹窗(无标题)'),
                        type: 'primary',
                        onPressed: (){
                          ADialog.alert(context,
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
                      AButton.normal(
                        child: Text('确认弹窗'),
                        type: 'primary',
                        onPressed: (){
                          ADialog.confirm(context,
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