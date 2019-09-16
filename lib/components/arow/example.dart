import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/arow/ARow.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class ExampleARow extends StatefulWidget {
  ExampleARow({Key key}) : super(key: key);

  _ExampleARowState createState() => _ExampleARowState();
}

class _ExampleARowState extends State<ExampleARow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'ARow',
        context: context
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: ARow()
          )
        ],
      )
    );
  }
}