import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/test/button/index.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class TestButton extends StatefulWidget {
  TestButton({Key key}) : super(key: key);

  _TestButtonState createState() => _TestButtonState();
}

class _TestButtonState extends State<TestButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button.normal(
                  width: 84,
                  height: 32,
                  bgColor: rgba(140, 172, 212, .3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      iconsc(size: 14, color: rgba(140, 172, 212, 1)),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text('加入收藏', style: TextStyle(
                          color: rgba(136, 175, 213, 1),
                          fontSize: 12
                        ),),
                      )
                    ],
                  ),
                  onPressed: (){}
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Button.icon(
                    width: null,
                    type: 'warning',
                    textChild: Text('加载中...', style: TextStyle(fontSize: 12),),
                    icon: iconsc(size: 14, color: rgba(140, 172, 212, 1)),
                    onPressed: () {
                      
                    },
                  ),
                ],
              ),
            )
          
          
          ],
        ),
      ),
    );
  }
}