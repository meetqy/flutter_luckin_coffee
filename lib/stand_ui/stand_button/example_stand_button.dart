import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/stand_ui/stand_button/index.dart';
import 'package:flutter_luckin_coffee/stand_ui/stand_button/loading.dart';

class ExampleStandButton extends StatefulWidget {
  ExampleStandButton({Key key}) : super(key: key);

  @override
  _ExampleStandButtonState createState() => _ExampleStandButtonState();
}

class _ExampleStandButtonState extends State<ExampleStandButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stand_button'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              StandButton(
                type: ButtonType.danger,
                text: Text('danger'),
              ),

              StandButton(
                type: ButtonType.primary,
                text: Text('danger'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}