import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';
import 'package:flutter_luckin_coffee/widgets/Button/ds.dart';

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
        child: Row(children: <Widget>[
          Button(
            type: 'danger',
            child: Text('哈哈哈'),
          ),
          ThemeText('sss', color: ThemeColors.blackDark,)
        ],),
      ),
    );
  }
}