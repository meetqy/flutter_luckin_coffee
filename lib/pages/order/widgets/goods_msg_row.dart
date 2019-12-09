import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/jsonserialize/shopping_cart/data.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class GoodsMsgRow extends StatelessWidget {

  GoodsMsgRow({
    Key key,
    this.data,
    this.marginBottom = true
  });

  /// 底部距离
  final bool marginBottom;

  final ShoppingCartData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              child: Text('${data.name}', style: TextStyle(
                fontSize: 15,
                color: rgba(56, 56, 56, 1),
                fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              child: Text('${G.handleGoodsDesc(data.specName).replaceAll(',', '/')}', style: TextStyle(
                fontSize: 10,
                color: rgba(56, 56, 56, 1),
              ),),
            ),
          ],),


          Row(
            children: <Widget>[
              Text('x${data.number}', style: TextStyle(
                color: rgba(80, 80, 80, 1),
                fontSize: 13
              ),),
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Text('¥ ${data.price * data.number}', style: TextStyle(
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