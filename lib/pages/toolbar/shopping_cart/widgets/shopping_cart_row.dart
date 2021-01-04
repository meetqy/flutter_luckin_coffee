import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/components/a_checkbox/a_checkbox.dart';
import 'package:flutter_luckin_coffee/components/a_row/a_row.dart';
import 'package:flutter_luckin_coffee/components/a_stepper/a_stepper.dart';
import 'package:flutter_luckin_coffee/jsonserialize/shopping_cart/data.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class ShoppingCartRow extends StatelessWidget {
  final ShoppingCartData data;
  final bool border;
  final Function onChange;
  final Function(bool) onCheckBoxChange;

  /// 购物车商品列表行
  const ShoppingCartRow(
      {Key key,
      this.data,
      this.border = true,
      @required this.onChange,
      @required this.onCheckBoxChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARow(
      height: null,
      padding: EdgeInsets.symmetric(horizontal: 15),
      border: Border.all(color: Colors.transparent),
      leftChild: Container(
        margin: EdgeInsets.only(right: 15),
        child: ACheckBox(
          activeColor: rgba(136, 175, 213, 1),
          width: 24,
          radius: Radius.circular(24),
          value: data.checked,
          onChanged: (bool value) => onCheckBoxChange(value),
        ),
      ),
      centerChild: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(border: G.borderBottom(show: border)),
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
                          '${data.name}',
                          style: TextStyle(
                              color: rgba(56, 56, 56, 1),
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
                              bgColor: rgba(255, 129, 2, 1),
                              color: hex("#fff"),
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
                          '${G.handleGoodsDesc(data.specName)}',
                          style: TextStyle(
                              color: rgba(80, 80, 80, 1), fontSize: 10),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '仅限打包带走',
                          style: TextStyle(
                              fontSize: 10, color: rgba(85, 122, 157, 1)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text(
              '¥${data.price}',
              style: TextStyle(
                  color: rgba(56, 56, 56, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: AStepper(
                  value: data.number,
                  onChange: (val) => onChange(val),
                ))
          ],
        ),
      ),
    );
  }
}
