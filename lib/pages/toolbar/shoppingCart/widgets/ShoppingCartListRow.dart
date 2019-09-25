import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/abutton/index.dart';
import 'package:flutter_luckin_coffee/components/astepper/AStepper.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class ShoppingCartListRow extends StatelessWidget {
  final bool border;


  /// 购物车行
  /// 
  /// ```
  /// @param {bool} border - 是否显示border
  /// ```
  ShoppingCartListRow({
    this.border = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // left
          Container(
            width: 54,
            child: Row(children: <Widget>[
              iconqueren(color: rgba(136, 175, 213, 1), size: 24),
            ],),
          ),
          
          // right
          Expanded(child: 
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: G.borderBottom(show: border)
              ),
              child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Row(children: <Widget>[
                        Text('标准美式', style: TextStyle(
                          color: rgba(56, 56, 56, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: AButton.normal(
                            child: Text('充2赠1', style: TextStyle(fontSize: 8),),
                            bgColor: rgba(255, 129, 2, 1),
                            color: hex("#fff"),
                            height: 16,
                            width: 34,
                            borderRadius: BorderRadius.circular(2),
                            onPressed: () => {}
                          ),
                        )
                      ],),

                      Row(children: <Widget>[
                        Text('大/单份奶/单份糖/热', style: TextStyle(
                          color: rgba(80, 80, 80, 1),
                          fontSize: 10
                        ),),
                      ],),

                      Row(
                        children: <Widget>[
                          Text('仅限打包带走', style: TextStyle(
                            fontSize: 10,
                            color: rgba(85, 122, 157, 1)
                          ),)
                      ],)
                    ],),
                  ),
                ),

                Text('¥21', style: TextStyle(
                  color: rgba(56, 56, 56, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: AStepper()
                )
              ],),
            )
          )
          
      ],),
    );
  }
}