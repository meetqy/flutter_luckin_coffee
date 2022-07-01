import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/components/goods_detail/index.dart';
import 'package:flutter_luckin_coffee/mock/goods_list.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/shopping_cart/widgets/recommend_goods.dart';
import 'package:get/get.dart';

import 'widgets/shopping_cart_row.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<MockGoods> goodsList = MockGoods.data();

  /// 购物车为空
  Container shoppingCartNotData() {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: Column(
        children: <Widget>[
          Image.asset(
            './lib/assets/images/shopping_cart_null.png',
            width: 125,
            fit: BoxFit.contain,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 32),
            child: Text(
              '您的购物车有点寂寞',
              style: TextStyle(
                  color: Color.fromRGBO(166, 166, 166, 1), fontSize: 12),
            ),
          ),
          AButton.normal(
              width: 100,
              height: 30,
              type: 'info',
              color: Color.fromRGBO(144, 192, 239, 1),
              borderColor: Color.fromRGBO(144, 192, 239, 1),
              plain: true,
              child: Text('去喝一杯'),
              onPressed: () => Get.toNamed('/menu'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "购物车",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Color(0xfff7f7f7),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'lib/assets/images/order/order1.png',
                            fit: BoxFit.cover,
                          ),
                        ),

                        // 购物车列表展示
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [ShoppingCartRow()],
                          ),
                        ),

                        // 购物车没有商品
                        // Center(child: shoppingCartNotData()),

                        guessLike(),
                      ],
                    )),
              ),
            ),
            buttomBtnRow(
              false,
              23,
            )
          ],
        ),
      ),
    );
  }

  /// 猜你喜欢
  Container guessLike() {
    return goodsList == null
        ? Container()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                // title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '猜你喜欢',
                      style: TextStyle(
                          color: Color.fromRGBO(56, 56, 56, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.refresh,
                            color: Color.fromRGBO(148, 196, 236, 1),
                            size: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              '换一批',
                              style: TextStyle(
                                  color: Color.fromRGBO(144, 192, 239, 1),
                                  fontSize: 11),
                            ),
                          )
                        ],
                      ),
                      onTap: () {},
                    )
                  ],
                ),

                // 推荐商品
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: goodsList.sublist(0, 3).map((item) {
                      return RecommendGoods(
                        data: item,
                        onPress: () {
                          /// 弹出商品详情  /widgets/goods_detail
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return GoodsDetailDialog(
                                id: goodsList.indexOf(item),
                              );
                            },
                          );
                        },
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          );
  }

  /// 底部合计
  Container buttomBtnRow(bool shoppingCartIsEmpty, num totalPrice) {
    return Container(
      child: shoppingCartIsEmpty
          ? null
          : Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: Color.fromRGBO(242, 242, 242, 1))),
                color: Colors.white,
              ),
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
                          child: Text(
                            '应付合计',
                            style: TextStyle(
                                color: Color.fromRGBO(56, 56, 56, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '¥ 22',
                            style: TextStyle(
                                color: Color.fromRGBO(56, 56, 56, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),

                  // right button
                  AButton.normal(
                    child: Text('去结算'),
                    color: Colors.white,
                    bgColor: Color.fromRGBO(144, 192, 239, 1),
                    width: 120,
                    height: 60,
                    borderRadius: BorderRadius.zero,
                    onPressed: () {
                      Get.toNamed('/order_confirm');
                    },
                  )
                ],
              ),
            ),
    );
  }
}
