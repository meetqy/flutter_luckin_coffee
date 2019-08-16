import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class RecommendGoods extends StatelessWidget {
  final String goodsImg;
  
  RecommendGoods({
    this.goodsImg
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      color: hex('#fff'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Image.asset(goodsImg,fit: BoxFit.cover,),
        Container(
          padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text('金枪鱼谷物沙拉', style: TextStyle(
              fontSize: 11,
              color: rgba(56, 56, 56, 1),
              fontWeight: FontWeight.bold
            ),),
            Text('Tuna and Mixed Gr...', style: TextStyle(
              color: rgba(166, 166, 166, 1),
              fontSize: 10
            ),),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                      child: Text('¥25.08', style: TextStyle(
                        fontSize: 12,
                        color: rgba(255, 141, 26, 1),
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    /// TODO: 删除线待实现
                    Container(
                      margin: EdgeInsets.only(left: 3),
                      child: Text('¥38', style: TextStyle(
                          color: rgba(166, 166, 166, 1),
                          fontSize: 12
                        )
                      ),
                    ),
                  ],),
                  Container(
                    child: iconjaifill(color: rgba(148, 196, 236, 1), size: 24)
                  )
              ],),
            )
          ],),
        )
        
      ],),
    );
  }
}

