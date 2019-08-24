import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class GoodsMsgRow extends StatelessWidget {
  final bool marginBottom;

  GoodsMsgRow({
    this.marginBottom = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom ? 12 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              child: Text('标准美式', style: TextStyle(
                fontSize: 15,
                color: rgba(56, 56, 56, 1),
                fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              child: Text('大/单份糖/单份奶/热', style: TextStyle(
                fontSize: 10,
                color: rgba(56, 56, 56, 1),
              ),),
            ),
          ],),


          Row(
            children: <Widget>[
              Text('x1', style: TextStyle(
                color: rgba(80, 80, 80, 1),
                fontSize: 13
              ),),
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Text('¥21', style: TextStyle(
                  fontSize: 14,
                  color: rgba(56, 56, 56, 1),
                  fontWeight: FontWeight.bold
                ),),
              )
            ],
          ),
        ],
      ),
          
    );
  }
}