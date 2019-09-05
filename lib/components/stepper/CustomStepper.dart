import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_luckin_coffee/components/button/index.dart';
import 'package:flutter_luckin_coffee/ok/ProjectColor.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';

class CustomStepper extends StatefulWidget {
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
  CustomStepper({
    Key key,
    this.min = 0,
    this.max = 99,
    this.value = 1,
    this.onChange,
  }) : super(key: key);

  _CustomStepperState createState() => _CustomStepperState(min, value);
}

class _CustomStepperState extends State<CustomStepper> {
  final num min;
  final num value;
  num number;

  _CustomStepperState(this.min, this.value){
    if(value is int) {
      number = value ?? min;
    } else {
      number = min;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Button.icon(
            width: 28,
            height: 28,
            bgColor: Colors.transparent,
            icon: iconjianfill(size: 28, color: ProjectColor.blueLight.withOpacity(number == widget.min ? 0.3 : 1)),
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
          Button.icon(
            width: 28,
            height: 28,
            bgColor: Colors.transparent,
            icon: iconjaifill(size: 28,color: ProjectColor.blueLight.withOpacity(number == widget.max ? 0.3 : 1)),
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