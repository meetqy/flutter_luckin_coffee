import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/AButton/index.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';

class OrderEvaluation extends StatefulWidget {
  OrderEvaluation({Key key}) : super(key: key);

  _OrderEvaluationState createState() => _OrderEvaluationState();
}

class _OrderEvaluationState extends State<OrderEvaluation> {
  double bottom = G.screenPadding().bottom; // 获取屏幕的底部距离

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hex('#fff'),
      appBar: customAppbar(context: context, title: "评价",),
      body: Container(
          color: rgba(248, 248, 248, 1),
          child: Stack(children: <Widget>[
            Container(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 25),
                  color: rgba(255, 255, 255, 1),
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('“满意”', style: TextStyle(
                          color: rgba(56, 56, 56, 1),
                          fontSize: 18
                        ),)
                    ],),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: icontupian21(color: rgba(244, 236, 44, 1), size: 40)
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: icontupian20(color: rgba(188, 188, 188, 1), size: 40)
                            )
                          ],
                        ),
                      ],),
                    ),
                    
                    // 输入框
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: <Widget>[
                        Expanded(child: 
                          TextField(
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              filled: true,
                              focusColor: rgba(248, 248, 248, 1),
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              hintText: '请输入评价内容（可不填）',
                              hintStyle: TextStyle(fontSize: 14,color: rgba(166, 166, 166, 1)),
                              fillColor: rgba(248, 248, 248, 1)
                            ),
                          )
                        ,)
                      ],),
                    )
                  ],),
                ),
              ],),
            ),

            Positioned(
              left: 0,
              bottom: 0,
              child: Container(                
                width: G.screenWidth(),
                padding: EdgeInsets.only(bottom: bottom, top: bottom/2),
                color: hex('#fff'),
                alignment: Alignment.center,
                child: AButton.normal(
                  width: 300,
                  child: Text('提交'),
                  bgColor: rgba(144, 192, 239, 1),
                  color: hex('#fff'),
                  onPressed: () => {}
                ),
              ),
            )
          ],),
        ),
    );
  }
}