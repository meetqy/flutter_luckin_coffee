import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/abutton/index.dart';

class SelectRow extends StatelessWidget {
  final String leftText;
  final List<Widget> rightContainer;

  SelectRow(this.leftText, {
    this.rightContainer
  });

  Container _createRadio({
    bool isActive = false,
    String text = ''
  }) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: AButton.normal(
        width: 80,
        height: 30,
        borderRadius: BorderRadius.circular(15),
        child: Text('$text', style: TextStyle(fontSize: 12),),
        plain: !isActive,
        color: isActive ? hex('#fff') : rgba(204, 192, 180, 1),
        bgColor: isActive ? rgba(204, 192, 180, 1) : hex('#fff'),
        borderColor: isActive ? Colors.transparent : rgba(204, 192, 180, 1),
        onPressed: () => {}
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6,bottom: 6),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
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
                      children: <Widget>[
                        _createRadio(
                          isActive: true,
                          text: '全塘 (推荐)'
                        ),
                        _createRadio(text: '半塘'),
                        _createRadio(text: '不加糖'),
                      ],
                    )
                  )
                )
            ],),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
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
                      children: <Widget>[
                        _createRadio(
                          isActive: true,
                          text: '全塘 (推荐)'
                        ),
                        _createRadio(text: '半塘'),
                        _createRadio(text: '不加糖'),
                      ],
                    )
                  )
                )
            ],),
          ),
        ],
      ),
    );
  }
}