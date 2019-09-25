import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/abutton/index.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/shoppingCart/widgets/RecommendGoods.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/shoppingCart/widgets/ShoppingCartListRow.dart';
import 'package:flutter_luckin_coffee/widgets/DialogPage/index.dart';

class ShoppingCart extends StatefulWidget {
  static _ShoppingCartState _shoppingCartState;

  getAppBar() => _shoppingCartState.createAppBar();

  ShoppingCart() {
    if(_shoppingCartState == null) {
      _shoppingCartState = _ShoppingCartState();
    }
  }

  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  AppBar createAppBar() {
    /// 配置appbar
    return customAppbar(title: '购物车');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 75),
            color: rgba(248, 248, 248, 1),
            child: Column(children: <Widget>[
              Image.asset('lib/assets/images/order/order1.png', fit: BoxFit.cover,),
              
              // 购物车列表展示
              Container(
                color: hex('#fff'),
                child: Column(children: <Widget>[
                  ShoppingCartListRow(),
                  ShoppingCartListRow(),
                  ShoppingCartListRow(),
                  ShoppingCartListRow(),
                  ShoppingCartListRow(),
                  ShoppingCartListRow(border: false,),
                ],),
              ),

              // 猜你喜欢 
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(top: 30),
                child: Column(children: <Widget>[
                  // title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('猜你喜欢', style: TextStyle(
                        color: rgba(56, 56, 56, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                      Row(children: <Widget>[
                        icontupian19(color: rgba(148, 196, 236, 1), size: 14),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text('换一批', style: TextStyle(
                            color: rgba(144, 192, 239, 1),
                            fontSize: 11
                          ),),
                        )
                      ],)
                  ],),

                  // 推荐商品
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new RecommendGoods(
                          goodsImg: 'lib/assets/images/menu/goods1.png',
                          addOnPress: () {
                            dialogPage.show(context);
                          }
                        ),
                        new RecommendGoods(
                          goodsImg: 'lib/assets/images/menu/goods2.png',
                          addOnPress: () {
                            dialogPage.show(context);
                          }
                        ),
                        new RecommendGoods(
                          goodsImg: 'lib/assets/images/menu/goods3.png',
                          addOnPress: () {
                            dialogPage.show(context);
                          }
                        ),
                      ],
                    ),
                  )
                ],),
              ),
            ],)
          ),
        ),
        
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1,color: rgba(242,242,242,1))),
              color: hex('#fff'),
            ),
            width: G.screenWidth(),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              // left
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  Container(
                    child: Text('应付合计', style: TextStyle(
                      color: rgba(56, 56, 56, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('¥21', style: TextStyle(
                      color: rgba(56, 56, 56, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],),
              ),

              // right button
              AButton.normal(
                child: Text('去结算'),
                color: hex('#fff'),
                bgColor: rgba(144, 192, 239, 1),
                width: 120,
                height: 60,
                borderRadius: BorderRadius.zero,
                onPressed: () => G.pushNamed('/order_confirm')
              )
            ],),
          ),
        )
      ],);
  }
}

