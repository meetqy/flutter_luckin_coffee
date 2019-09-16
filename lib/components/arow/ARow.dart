import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class ARow extends StatelessWidget {
  final double height;
  final Widget leftChild;
  final Widget centerChild;
  final Widget rightChild;
  final EdgeInsets padding;

  ARow({
    Key key,
    this.height = 44,
    this.padding,
    this.leftChild,
    this.centerChild,
    this.rightChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: hex('#fff'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // left
          // Container(
          //   height: height,
          //   color: Colors.red,
          //   child: ,
          // ),
          icontupian5(size: 18),

          // center
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              height: height,
              color: Colors.blue,
              child: Text('咖啡钱包'),
            ),
          ),
          
          // right
          Container(
            height: height,
            color: Colors.yellow,
            child: Row(
              children: <Widget>[
                Text('7杯'),
                icontupian6(size: 18)
              ],
            ),
          )
        ],
      ),
    );
  }
}