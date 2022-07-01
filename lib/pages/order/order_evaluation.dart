import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';

import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:get/get.dart';

class OrderEvaluation extends StatefulWidget {
  OrderEvaluation({Key key}) : super(key: key);

  _OrderEvaluationState createState() => _OrderEvaluationState();
}

class _OrderEvaluationState extends State<OrderEvaluation> {
  double bottom = Get.bottomBarHeight; // 获取屏幕的底部距离

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(
        context: context,
        title: "评价",
      ),
      body: Container(
        color: Color.fromRGBO(248, 248, 248, 1),
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    color: Color.fromRGBO(255, 255, 255, 1),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '“满意”',
                              style: TextStyle(
                                  color: Color.fromRGBO(56, 56, 56, 1),
                                  fontSize: 18),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: Icon(
                                      Icons.sentiment_satisfied_alt_outlined,
                                      color: Color.fromRGBO(244, 236, 44, 1),
                                      size: 56,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.sentiment_dissatisfied_outlined,
                                      color: Color.fromRGBO(188, 188, 188, 1),
                                      size: 56,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        // 输入框
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 20),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                      filled: true,
                                      focusColor:
                                          Color.fromRGBO(248, 248, 248, 1),
                                      counterText: '',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: '请输入评价内容（可不填）',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(166, 166, 166, 1)),
                                      fillColor:
                                          Color.fromRGBO(248, 248, 248, 1)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: Get.width,
                padding: EdgeInsets.only(bottom: bottom, top: bottom / 2),
                color: Colors.white,
                alignment: Alignment.center,
                child: AButton.normal(
                    width: 300,
                    child: Text('提交'),
                    bgColor: Color.fromRGBO(144, 192, 239, 1),
                    color: Colors.white,
                    onPressed: () => {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
