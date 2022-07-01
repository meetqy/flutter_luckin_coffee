import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/components/a_row/a_row.dart';
import 'package:flutter_luckin_coffee/components/a_stepper/a_stepper.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class ShoppingCartRow extends StatelessWidget {
  /// 购物车商品列表行
  const ShoppingCartRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARow(
      height: null,
      padding: EdgeInsets.symmetric(horizontal: 15),
      border: Border.all(color: Colors.transparent),
      leftChild: Container(
        margin: EdgeInsets.only(right: 15),
        child: Checkbox(
          value: true,
          onChanged: (value) => {},
        ),
      ),
      centerChild: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(border: cuBorderBottom(show: false)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "拿铁",
                          style: TextStyle(
                              color: Color.fromRGBO(56, 56, 56, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: AButton.normal(
                              child: Text(
                                '充2赠1',
                                style: TextStyle(fontSize: 8),
                              ),
                              bgColor: Color.fromRGBO(255, 129, 2, 1),
                              color: Colors.white,
                              height: 16,
                              width: 34,
                              borderRadius: BorderRadius.circular(2),
                              onPressed: () => {}),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          G.handleGoodsDesc("规格:中,温度:热,糖度:无糖"),
                          style: TextStyle(
                              color: Color.fromRGBO(80, 80, 80, 1),
                              fontSize: 10),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '仅限打包带走',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(85, 122, 157, 1)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text(
              '¥ 24',
              style: TextStyle(
                  color: Color.fromRGBO(56, 56, 56, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: AStepper(
                  value: 24,
                  onChange: (val) => {},
                ))
          ],
        ),
      ),
    );
  }
}
