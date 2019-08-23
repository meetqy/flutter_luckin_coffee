import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';
import 'package:flutter_luckin_coffee/widgets/Button/index.dart';

import 'widgets/CouponRow.dart';

class Coupon extends StatefulWidget {
  Coupon({Key key}) : super(key: key);

  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  @override
  Widget build(BuildContext context) {
    /// TODO: 待解决：曲面屏兼容问题，固定在最底部，使用SafeArea底部会空出来
    return Scaffold(
      appBar: customAppbar(
        title: '可使用优惠券',
        context: context,
      ),
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: ListView(
              padding: EdgeInsets.only(bottom: 80),
              children: <Widget>[
                CouponRow(),
                    CouponRow(),
                    CouponRow(),
                    CouponRow(),
                    CouponRow(),
                    CouponRow(),
                    CouponRow(),
                    CouponRow(),
                    CouponRow(),
              ],
            ),
          ),
          
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: hex('#fff'),
              alignment: Alignment.center,
              height: 60,
              width: screenWidth(context),
              child: Button.bigButton('保存'),
            ),
          )
          
        ],),
      )
    );
  }
}


