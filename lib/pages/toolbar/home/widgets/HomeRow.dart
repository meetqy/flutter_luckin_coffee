import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class HomeRow extends StatelessWidget {
  final String title;
  final String desc;
  final Widget right;
  final bool titleBold;
  final bool bottomBorder;
  final Function onPress;


  /// Home公用行
  HomeRow(this.title, this.desc, {
    this.right,
    this.titleBold = true,
    this.bottomBorder = true,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress != null ? (){} : onPress(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 70,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: rgba(242, 242, 242, 1), width: bottomBorder ? 1 : 0))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 左边内容
            Container(
              width: 150,
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Text(title, 
                      style: TextStyle(
                        color: rgba(56, 56, 56, 1), 
                        fontSize: 15, 
                        fontWeight: titleBold ? FontWeight.bold: FontWeight.normal
                      ),
                    ),
                  ],),
                  Row(children: <Widget>[
                    Text(desc, 
                      style: TextStyle(color: rgba(128, 128, 128, 1), fontSize: 11),
                    ),
                  ],),
              ],),
            ),

            // 右边内容
            Container(child: right,)
        ],),
      ),
    );
  }
}

