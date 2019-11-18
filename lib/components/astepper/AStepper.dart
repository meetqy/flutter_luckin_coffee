import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class AStepper extends StatelessWidget {
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
  const AStepper({
    Key key,
    this.min = 0,
    this.max = 99,
    this.value = 1,
    @required this.onChange,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          AButton.icon(
            width: 30,
            height: 30,
            bgColor: Colors.transparent,
            icon: iconjian(size: 30, color: rgba(144, 192, 239, value == min ? 0.3 : 1)),
            onPressed: (){
              if(value <= min) return;
              onChange(value - 1);
            },
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 20,
              maxHeight: 28,
            ),
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('$value',)
                )
              ),
            ),
          ),
          
          AButton.icon(
            width: 30,
            height: 30,
            bgColor: Colors.transparent,
            icon: iconjaifill(size: 30,color: rgba(144, 192, 239, value == max ? 0.3 : 1)),
            onPressed: (){
              if(value >= max) return;
              onChange(value + 1);
            },
          ),
        ],
      ),
    );
  }
}
