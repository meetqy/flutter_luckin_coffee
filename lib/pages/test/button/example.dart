import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/test/button/index.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class ExampleButton extends StatefulWidget {
  ExampleButton({Key key}) : super(key: key);

  _ExampleButtonState createState() => _ExampleButtonState();
}

class _ExampleButtonState extends State<ExampleButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Button组件',
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
                    space(Button.normal(child: Text('默认按钮'),onPressed: (){})),
                    space(Button.normal(child: Text('主要按钮'),type: 'primary',onPressed: (){})),
                    space(Button.normal(child: Text('信息按钮'),type: 'info',onPressed: (){}))
                  ],
                ),
              ),
              
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    space(Button.normal(child: Text('危险按钮'),type: 'danger',onPressed: (){})),
                    space(Button.normal(child: Text('警告按钮'),type: 'warning',onPressed: (){}))
                  ],
                ),
              ),            
              
              Row(children: <Widget>[Text('禁用状态')],),    

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    space(Button.normal(child: Text('主要按钮'),type: 'primary')),
                    space(Button.normal(child: Text('警告按钮'),type: 'warning'))
                  ],
                ),
              ),

              Row(children: <Widget>[Text('边框按钮')],),    
             
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(children: <Widget>[
                  space(Button.normal(
                    child: Text('主要按钮'),type: 'primary',plain: true,onPressed: (){})),
                  space(Button.normal(
                    child: Text('警告按钮'),type: 'warning',plain: true,onPressed: (){}))
                ],),
              ),

              Row(children: <Widget>[Text('icon按钮')],),   
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    space(Button.icon(
                      width: 44,icon: icongouwuche(),type: 'primary',onPressed: (){}
                    )),
                    space(Button.icon(
                      width: 44,icon: icongouwuche(),type: 'primary',plain: true,onPressed: (){}
                    )),
                    space(Button.icon(
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
                    space(Button.icon(
                      borderRadius: BorderRadius.circular(40),
                      width: 44,icon: icongouwuche(),type: 'primary',onPressed: (){}
                    )),
                    space(Button.icon(
                      plain: true,
                      borderRadius: BorderRadius.circular(40),
                      width: 44,icon: icongouwuche(),type: 'primary',onPressed: (){}
                    )),
                    space(Button.normal(
                      width: 80,height: 30,bgColor: rgba(204, 192, 180, 1),
                      type: 'primary',onPressed: (){},
                      borderRadius: BorderRadius.circular(44),
                      child: Text('冰')
                    ),),
                    space(Button.normal(
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
                    space(Button.loading(
                      width: 44,type: 'primary',onPressed: (){},
                    ),),
                    space(Button.loading(
                      width: 44,type: 'primary',plain: true,onPressed: (){}
                    ),)
                  ],
                ),
              ),


              Row(children: <Widget>[Text('自定义按钮')],),  

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(children: <Widget>[
                  space(Button.icon(
                    width: 82,height: 32, bgColor: rgba(136, 175, 213, 0.3),
                    textChild: Text('收藏口味', style: TextStyle(
                      color: rgba(136, 175, 213, 1),
                      fontSize: 12
                    ),),
                    icon: icongouwuche(size: 12, color: rgba(136, 175, 213, 1)),type: 'primary',onPressed: (){}
                  )),
                  space(Button.icon(
                    width: 82,height: 32,bgColor: rgba(255, 129, 2, 1),
                    textChild: Text('冲2赠1', style: TextStyle(
                      color: rgba(255, 255, 255, 1),
                      fontSize: 12
                    ),),
                    icon: icongouwuche(size: 12, color: rgba(255, 255, 255, 1)),type: 'primary',onPressed: (){}
                  )),
                  space(Button.icon(
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