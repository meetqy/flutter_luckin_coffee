import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/abutton/index.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class OrderListRow extends StatelessWidget {
  final int orderStatus;  
  final String address;
  final String goodsName;
  final String orderNum;
  final String time;
  final double price;
  final Function onPress;


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
    this.price,
    this.onPress
  });


  /// 文字状态
  Widget textStatus() {
    var text = '';
    var color = rgba(166, 166, 166, 1);
    if(orderStatus == 1) {
      color = rgba(136, 175, 213, 1);
      text = "待付款";
    }
    else if(orderStatus == 2) text = "已完成";
    else if(orderStatus == 3) text = "已取消";

    return Text(text, style: TextStyle(
      fontSize: 12,
      color: color
    ));
  }

  /// 按钮状态
  List<Widget> buttonStatus(BuildContext context) {
    List<Widget>button = [];

    var btn1 = Container(
      margin: EdgeInsets.only(left: 10),
      child: AButton.normal(
        child: Text('再来一单', style: TextStyle(fontSize: 12),),
        color: rgba(56, 56, 56, 1),
        plain: true,
        height: 28,
        width: 74,
        borderColor: rgba(242, 242, 242, 1),
        onPressed: () => {}
      ),
    );

    var btn2 = Container(
      margin: EdgeInsets.only(left: 10),
      child: AButton.normal(
        child: Text('去支付', style: TextStyle(fontSize: 12),),
        color: rgba(255, 129, 2, 1),
        borderColor: rgba(255, 129, 2, 1),
        plain: true,
        height: 28,
        width: 74,
        onPressed: () => G.pushNamed('/order_confirm')
      ),
    );

    var btn3 = Container(
      margin: EdgeInsets.only(left: 10),
      child: AButton.normal(
        child: Text('去评价', style: TextStyle(fontSize: 12),),
        color: rgba(144, 192, 239, 1),
        plain: true,
        height: 28,
        width: 74,
        borderColor: rgba(144, 192, 239, 1),
        onPressed: () => G.pushNamed('/order_evaluation')
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
    return InkWell(
      onTap: () => onPress == null ? (){} : onPress(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        height: 160,
        color: hex('#fff'),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: G.borderBottom()
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('外卖订单：$orderNum', style: TextStyle(
                  color: rgba(166, 166, 166, 1),
                  fontSize: 12
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
              fontSize: 12,
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
                Row(children: buttonStatus(context))
            ],),
          ),


        ],),
      ),
    );
  }
}
