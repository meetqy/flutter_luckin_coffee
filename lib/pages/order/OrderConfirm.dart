import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';
import 'package:flutter_luckin_coffee/widgets/TakeOutBtn/index.dart';

class OrderConfirm extends StatefulWidget {
  OrderConfirm({Key key}) : super(key: key);

  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: '确认订单',
        context: context
      ),
      body: Container(
        child: Column(children: <Widget>[
          head(),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: hex('#fff'),
            child: Column(
              children: <Widget>[
                contentAddress(),
                // 订单信息
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                    border: ui.borderBottom()
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Row(children: <Widget>[
                          Text('订单信息', style: TextStyle(
                            fontSize: 13,
                            color: rgba(56, 56, 56, 1),
                            fontWeight: FontWeight.bold
                          ),)
                        ],),
                      ),
                      // 商品信息
                      Column(children: <Widget>[
                        goodsMsg(),
                        goodsMsg(bottom: false),
                      ],),
                    ],
                  ),
                ),

                // 结算
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text('合计', style: TextStyle(
                          color: rgba(80, 80, 80, 1),
                          fontSize: 13
                        ),),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('¥ 21', style: TextStyle(
                            color: rgba(56, 56, 56, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),),
                        )
                      ],)
                  ],),
                )
              ],
            ),
          )
        ],),
      ),
    );
  }

  Container goodsMsg({bool bottom = true}) {
    return Container(
      margin: EdgeInsets.only(bottom: bottom ? 12 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              child: Text('标准美式', style: TextStyle(
                fontSize: 15,
                color: rgba(56, 56, 56, 1),
                fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              child: Text('大/单份糖/单份奶/热', style: TextStyle(
                fontSize: 10,
                color: rgba(56, 56, 56, 1),
              ),),
            ),
          ],),


          Row(
            children: <Widget>[
              Text('x1', style: TextStyle(
                color: rgba(80, 80, 80, 1),
                fontSize: 13
              ),),
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Text('¥21', style: TextStyle(
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

  Container contentAddress() {
    return Container(
      decoration: BoxDecoration(
        border: ui.borderBottom()
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('自提门店', style: TextStyle(
                color: rgba(56, 56, 56, 1),
                fontSize: 13,
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              children: <Widget>[
                Text('青年汇店(No.1795)', style: TextStyle(
                  color: rgba(56, 56, 56, 1),
                  fontSize: 15,
                ),),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text('朝阳区朝阳北路青年汇102号楼一层123室', style: TextStyle(
                color: rgba(56, 56, 56, 1),
                fontSize: 12,
              ),),
            ],
          ),
        ],
      ),
    );
  }

  Container head() {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      color: hex('#fff'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TakeOutBtn(),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('立即取餐', style: TextStyle(
                  color: rgba(56, 56, 56, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),),
                Row(children: <Widget>[
                  Text('约', style: TextStyle(
                      color: rgba(128, 128, 128, 1),
                      fontSize: 13
                    ),
                  ),
                  Text('14:42', style: TextStyle(
                      color: rgba(136, 175, 213, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('可取', style: TextStyle(
                      color: rgba(128, 128, 128, 1),
                      fontSize: 13
                    ),
                  ),
              ],)
        ],),
          )
      ],),
    );
  }
}