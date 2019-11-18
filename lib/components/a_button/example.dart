/*
 * @Author: meetqy
 * @since: 2019-09-02 13:34:28
 * @lastTime: 2019-09-18 10:36:20
 * @LastEditors: meetqy
 */
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';

import 'index.dart';

class ExampleAButton extends StatefulWidget {
  ExampleAButton({Key key}) : super(key: key);

  _ExampleAButtonState createState() => _ExampleAButtonState();
}

class _ExampleAButtonState extends State<ExampleAButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'AButton组件',
        context: context,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[Text('按钮类型')],), 
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    space(AButton.normal(child: Text('默认按钮'),onPressed: (){})),
                    space(AButton.normal(child: Text('主要按钮'),type: 'primary',onPressed: (){})),
                    space(AButton.normal(child: Text('信息按钮'),type: 'info',onPressed: (){}))
                  ],
                ),
              ),
              
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    space(AButton.normal(child: Text('危险按钮'),type: 'danger',onPressed: (){})),
                    space(AButton.normal(child: Text('警告按钮'),type: 'warning',onPressed: (){}))
                  ],
                ),
              ),            
              
              Row(children: <Widget>[Text('禁用状态')],),    

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    space(AButton.normal(child: Text('主要按钮'),type: 'primary')),
                    space(AButton.normal(child: Text('警告按钮'),type: 'warning'))
                  ],
                ),
              ),

              Row(children: <Widget>[Text('边框按钮')],),    
             
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(children: <Widget>[
                  space(AButton.normal(
                    child: Text('主要按钮'),type: 'primary',plain: true,onPressed: (){})),
                  space(AButton.normal(
                    child: Text('警告按钮'),type: 'warning',plain: true,onPressed: (){}))
                ],),
              ),

              Row(children: <Widget>[Text('icon按钮')],),   
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    space(AButton.icon(
                      width: 44,icon: icongouwuche(),type: 'primary',onPressed: (){}
                    )),
                    space(AButton.icon(
                      width: 44,icon: icongouwuche(),type: 'primary',plain: true,onPressed: (){}
                    )),
                    space(AButton.icon(
                      textChild: Text('按钮'),
                      icon: icongouwuche(),type: 'primary',plain: true,onPressed: (){}
                    ))
                  ],
                ),
              ),

              Row(children: <Widget>[Text('圆角按钮')],),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    space(AButton.icon(
                      borderRadius: BorderRadius.circular(40),
                      width: 44,icon: icongouwuche(),type: 'primary',onPressed: (){}
                    )),
                    space(AButton.icon(
                      plain: true,
                      borderRadius: BorderRadius.circular(40),
                      width: 44,icon: icongouwuche(),type: 'primary',onPressed: (){}
                    )),
                    space(AButton.normal(
                      width: 80,height: 30,bgColor: rgba(204, 192, 180, 1),
                      type: 'primary',onPressed: (){},
                      borderRadius: BorderRadius.circular(44),
                      child: Text('冰')
                    ),),
                    space(AButton.normal(
                      width: 80,height: 30,plain: true,
                      borderColor: rgba(204, 192, 180, 1),
                      onPressed: (){},
                      borderRadius: BorderRadius.circular(44),
                      child: Text('热', style: TextStyle(color: rgba(204, 192, 180, 1),),)
                    ))
                  ]
                ),
              ),

              Row(children: <Widget>[Text('加载按钮')],),  
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    space(AButton.loading(
                      width: 44,type: 'primary',onPressed: (){},
                    ),),
                    space(AButton.loading(
                      width: 44,type: 'primary',plain: true,onPressed: (){}
                    ),)
                  ],
                ),
              ),


              Row(children: <Widget>[Text('自定义按钮')],),  

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(children: <Widget>[
                  space(AButton.icon(
                    width: 82,height: 32, bgColor: rgba(136, 175, 213, 0.3),
                    textChild: Text('收藏口味', style: TextStyle(
                      color: rgba(136, 175, 213, 1),
                      fontSize: 12
                    ),),
                    icon: icongouwuche(size: 12, color: rgba(136, 175, 213, 1)),type: 'primary',onPressed: (){}
                  )),
                  space(AButton.icon(
                    width: 82,height: 32,bgColor: rgba(255, 129, 2, 1),
                    textChild: Text('冲2赠1', style: TextStyle(
                      color: rgba(255, 255, 255, 1),
                      fontSize: 12
                    ),),
                    icon: icongouwuche(size: 12, color: rgba(255, 255, 255, 1)),type: 'primary',onPressed: (){}
                  )),
                  space(AButton.icon(
                    width: 82,height: 32,borderColor: Colors.green,bgColor: rgba(255, 129, 2, .1),plain: true,
                    textChild: Text('冲2赠1', style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12
                    ),),
                    icon: icongouwuche(size: 12, color: rgba(255, 129, 2, 1)),onPressed: (){}
                  )),
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget space(Widget child) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: child,
    );
  }
}