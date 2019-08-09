import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/commonUI.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class GoodsListRow extends StatelessWidget {
  final String imgSrc;
  final String title;
  final String desc;
  final String recomment;
  final double price;

  GoodsListRow({
    this.title = "",
    this.imgSrc = "",
    this.recomment,
    this.desc,
    this.price = 20
  });

  /// 商品信息中的文本
  /// 
  /// ```
  /// @param {String} title - 标题
  /// @param {double} fontSize 
  /// @param {FontWeight} fontWeight 
  /// @param {Color} color 
  /// ```
  Widget row(String title, {
    double fontSize = 11, 
    FontWeight fontWeight,
    Color color}) {
      return Row(children: <Widget>[
        Expanded(child: 
          Text(title, style: TextStyle(
              color: color == null ? rgba(166, 166, 166, 1) : color,  
              fontSize: fontSize, 
              fontWeight: fontWeight == null ? FontWeight.normal : fontWeight
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(child: 
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: ui.borderBottom(),
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.circular(4.0),
                child: Image.asset(
                  imgSrc, 
                  width: 70, 
                  height: 70, 
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container( 
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    row(title, 
                      color: rgba(56, 56, 56, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                    row(desc == null ? " " : desc),
                    row(recomment == null ? " " : recomment),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("¥$price", style: TextStyle(
                            color: rgba(56, 56, 56, 1), 
                            fontSize: 15, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        icontubiao()
                      ],
                    )
                  ],
                ),
              ), 
            ),
          ],),
        ),
      )
    ],);
  }
}



 