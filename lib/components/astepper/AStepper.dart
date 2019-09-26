import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_luckin_coffee/components/AButton/index.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class AStepper extends StatefulWidget {
  final num min;
  final num max;
  final Function onChange;
  final num value;

  /// 步进器   格式： - 1 +
  /// 
  /// ```
  /// @param {num} min - 最小值
  /// @param {num} max - 最大值
  /// @param {num} value - value
  /// @param {Function} onChange - 值改变的回调 返回一个num
  /// ```
  AStepper({
    Key key,
    this.min = 0,
    this.max = 99,
    this.value = 1,
    this.onChange,
  }) : super(key: key);

  _CustomStepperState createState() => _CustomStepperState(min, value);
}

class _CustomStepperState extends State<AStepper> {
  final num min;
  final num value;
  num number;

  _CustomStepperState(this.min, this.value){
    if(value is int) {
      number = value < min ? min : value;
    } else {
      number = min;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          AButton.icon(
            width: 28,
            height: 28,
            bgColor: Colors.transparent,
            icon: iconjianfill(size: 28, color: rgba(144, 192, 239, number == widget.min ? 0.3 : 1)),
            onPressed: (){
              if(number > widget.min) {
                setState(() {
                  number -= 1;
                  widget.onChange != null ?? widget.onChange(number);
                });
              }
            },
          ),
          Container(
            width: 32,
            height: 28,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.only(top: 2),
                child: Text('$number',)
              )
            ),
          ),
          AButton.icon(
            width: 28,
            height: 28,
            bgColor: Colors.transparent,
            icon: iconjaifill(size: 28,color: rgba(144, 192, 239, number == widget.max ? 0.3 : 1)),
            onPressed: (){
              if(number < widget.max) {
                setState(() {
                  number += 1;
                  widget.onChange != null ?? widget.onChange(number);
                });
              }
            },
          ),
        ],
      ),
    );
  }
}