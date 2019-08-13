import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class SelectRow extends StatelessWidget {
  final String leftText;
  final List<Widget> rightContainer;

  SelectRow(this.leftText, {
    this.rightContainer
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6,bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 65,
            alignment: Alignment.center,
            height: 30,
            child: Text(leftText, style: TextStyle(color: rgba(56, 56, 56, 1)),),
          ),
          Expanded(
            child: Container(
              child: Wrap(
                children: rightContainer,
              )
            )
          )
      ],),
    );
  }
}