import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/commonUI.dart';
import 'package:flutter_luckin_coffee/widgets/Button/index.dart';

class OrderListRow extends StatelessWidget {
  final int orderStatus;  
  final String address;
  final String goodsName;
  final String orderNum;
  final String time;
  final double price;


  /// 创建订单列表信息
  /// ```
  /// @param {int} orderStatus - 订单状态 1: 待付款 2: 已完成 3: 已取消
  /// @param {String} address - 地址
  /// @param {String} goodsName - 商品名字
  /// @param {String} orderNum - 订单号
  /// @param {String} time - 订单时间
  /// @param {double} price - 价格
  /// ```
  OrderListRow(this.orderStatus, {
    this.address,
    this.goodsName,
    this.orderNum,
    this.time,
    this.price
  });


  /// 文字状态
  Widget textStatus() {
    var text = '';
    if(orderStatus == 1) text = "待付款";
    else if(orderStatus == 2) text = "已完成";
    else if(orderStatus == 3) text = "已取消";

    return Text(text, style: TextStyle(
      fontSize: 13,
      color: rgba(136, 175, 213, 1)
    ));
  }

  /// 按钮状态
  List<Widget> buttonStatus() {
    List<Widget>button = [];

    var btn1 = Container(
      margin: EdgeInsets.only(left: 10),
      child: Button('再来一单',
        bgColor: rgba(255, 255, 255, 1),
        color: rgba(56, 56, 56, 1),
        border: Border.all(width: 1, color: rgba(242, 242, 242, 1)),
        paddingVertical: 4,
        paddingHorizontal: 5,
      ),
    );

    var btn2 = Container(
      margin: EdgeInsets.only(left: 10),
      child: Button('去支付',
        bgColor: rgba(255, 255, 255, 1),
        color: rgba(255, 129, 2, 1),
        border: Border.all(width: 1, color: rgba(255, 129, 2, 1)),
        paddingVertical: 4,
        paddingHorizontal: 5,
      ),
    );

    var btn3 = Container(
      margin: EdgeInsets.only(left: 10),
      child: Button('去评价',
        bgColor: rgba(255, 255, 255, 1),
        color: rgba(144, 192, 239, 1),
        border: Border.all(width: 1, color: rgba(144, 192, 239, 1)),
        paddingVertical: 4,
        paddingHorizontal: 5,
      ),
    );

    if(orderStatus == 1) {
      button.add(btn2);
    } else if(orderStatus == 2) {
      button.add(btn1);
      button.add(btn3);
    } else if(orderStatus == 3) {
      button.add(btn1);
    }


    return button;
    
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      height: 160,
      color: hex('#fff'),
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: ui.borderBottom()
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('外卖订单：$orderNum', style: TextStyle(
                color: rgba(166, 166, 166, 1),
                fontSize: 13
              ),),
              textStatus()
          ],),
        ),

        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('$address...', style: TextStyle(
                color: rgba(56, 56, 56, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),),
              Text('$time', style: TextStyle(
                fontSize: 12,
                color: rgba(166, 166, 166, 1)
              ),)
          ],),
        ),

        Row(children: <Widget>[
          Text('$goodsName等   共1件商品', style: TextStyle(
            color: rgba(80, 80, 80, 1),
            fontSize: 13,
          ),),
        ],),


        Container(
          margin: EdgeInsets.only(top: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('¥$price', style: TextStyle(
                color: rgba(56, 56, 56, 1),
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),),
              Row(children: buttonStatus())
          ],),
        ),


      ],),
    );
  }
}
