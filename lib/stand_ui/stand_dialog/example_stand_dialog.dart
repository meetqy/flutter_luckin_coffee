import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/stand_ui/stand_button/index.dart';
import 'package:flutter_luckin_coffee/stand_ui/stand_dialog/index.dart';

class ExampleStandDialog extends StatefulWidget {
  ExampleStandDialog({Key key}) : super(key: key);

  @override
  _ExampleStandDialogState createState() => _ExampleStandDialogState();
}

class _ExampleStandDialogState extends State<ExampleStandDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stand_dialog'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// 提示弹窗
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle('提示弹窗'),
                    Wrap(
                      children: <Widget>[
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.primary,
                            text: Text('提示弹窗'),
                            onPressed: () {
                              StandDialog.alert(
                                context: context
                              );
                            },
                          ),
                        ),

                        buildContainer(
                          child: StandButton(
                            type: ButtonType.primary,
                            text: Text('提示弹窗（无标题）'),
                            onPressed: () {
                              StandDialog.alert(
                                context: context,
                                title: null
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer({Widget child}) {
    return Container(
      margin: EdgeInsets.only(right: 8, bottom: 8),
      child: child
    );
  }

  Row buildTitle(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Text('$text')
        ),
      ],
    );
  }
}