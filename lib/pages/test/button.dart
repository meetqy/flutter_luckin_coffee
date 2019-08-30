import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/test/button/Button.dart';
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
                  child: Text('1232'),
                  onPressed: (){}
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Button.loading(
                    width: 120,
                    type: 'warning',
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