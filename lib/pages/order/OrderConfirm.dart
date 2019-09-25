import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/AButton/index.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:flutter_luckin_coffee/pages/order/widgets/GoodsMsgRow.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/widgets/TakeOutBtn/index.dart';

class OrderConfirm extends StatefulWidget {
  OrderConfirm({Key key}) : super(key: key);

  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  double bottom = G.screenPadding().bottom; // 获取屏幕的底部距离

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: '确认订单',
        context: context
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 80 + bottom),
              child: Column(children: <Widget>[
                head(),
                // 订单信息
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
                          border: G.borderBottom()
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
                              GoodsMsgRow(),
                              GoodsMsgRow(),
                              GoodsMsgRow(),
                              GoodsMsgRow(),
                              GoodsMsgRow(marginBottom: false),
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
                      ),
                    ],
                  ),
                ),

                // 支付信息
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: hex('#fff'),
                  child: Column(
                    children: <Widget>[
                      // 咖啡钱包
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          border: G.borderBottom()
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text('使用咖啡钱包', style: TextStyle(
                                color: rgba(136, 175, 213, 1),
                                fontSize: 14
                              ),),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: AButton.normal(
                                  child: Text('充值优惠', style: TextStyle(fontSize: 8),),
                                  height: 16,
                                  width: 40,
                                  bgColor: rgba(255, 141, 26, 1),
                                  color: hex('#fff'),
                                  borderRadius: BorderRadius.circular(2),
                                  onPressed: () => {}
                                ),
                              )  
                            ],),
                            Row(children: <Widget>[
                              Text('1个可用', style: TextStyle(
                                fontSize: 14,
                                color: rgba(255, 141, 26, 1)
                              ),),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: icontupian6(color: rgba(228, 228, 228, 1), size: 16)
                              )
                            ],)
                        ],),
                      ),

                      // 使用优惠
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            border: G.borderBottom()
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Text('使用优惠券', style: TextStyle(
                                  color: rgba(136, 175, 213, 1),
                                  fontSize: 14
                                ),),
                              ],),
                              Row(children: <Widget>[
                                Text('1个可用', style: TextStyle(
                                  fontSize: 14,
                                  color: rgba(255, 141, 26, 1)
                                ),),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: icontupian6(color: rgba(228, 228, 228, 1), size: 16)
                                )
                              ],)
                          ],),
                        ), 
                        onTap: () {
                          Navigator.pushNamed(context, '/coupon');
                        },
                      ),

                      // 支付方式
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text('支付方式', style: TextStyle(
                                color: rgba(56, 56, 56, 1)  ,
                                fontSize: 14
                              ),),
                            ],),
                            Row(children: <Widget>[
                              Text('支付宝支付', style: TextStyle(
                                fontSize: 14,
                                color: rgba(128, 128, 128, 1)
                              ),),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: icontupian6(color: rgba(228, 228, 228, 1), size: 16)
                              )
                            ],)
                        ],),
                      ), 
                    ],
                  ),
                ),
              
                // 备注
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: hex('#fff'),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Text('备注特殊要求', style: TextStyle(
                        fontSize: 14,
                        color: rgba(56, 56, 56, 1)
                      ),),
                      icontupian6(color: rgba(228, 228, 228, 1), size: 16)
                    ],),
                    onTap: () => Navigator.pushNamed(context, '/order_remark'),
                  ),
                ),

                // 协议
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 20,
                            height: 20,
                            child: Transform.scale(
                              scale: .8,
                              child: Checkbox(
                                activeColor: rgba(136, 175, 213, 1),
                                value: true, 
                                onChanged: (flag) {},
                              ),
                            ),
                          ),

                          Container(
                            child: Row(
                              children: <Widget>[
                                Text('我已阅读并同意', style: TextStyle(
                                  color: rgba(128, 128, 128, 1),
                                  fontSize: 10
                                ),),
                                Text('《支付协议》', style: TextStyle(
                                  fontSize: 10,
                                  color: rgba(85, 122, 157, 1)
                                ),)
                              ],
                            ),
                          )
                      ],),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(children: <Widget>[
                          Text('温馨提示：仅支持开具电子发票，订单完成后可前往发票管理中开具', style: TextStyle(
                            color: rgba(166, 166, 166, 1),
                            fontSize: 10
                          ),)
                        ],),
                      )
                    
                    ],
                  ),
                )
              ],),
            ),
          ),          

          // 底部            
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(left: 15, bottom: bottom),
              width: G.screenWidth(),
              color: hex('#fff'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: <Widget>[
                    Text('还需支付', style: TextStyle(
                      color: rgba(56, 56, 56, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('¥0', style: TextStyle(
                        color: rgba(56, 56, 56, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),),
                    )
                  ],),
                  AButton.normal(
                    child: Text('去支付'),
                    bgColor: rgba(144, 192, 239, 1),
                    width: 120,
                    height: 60,
                    color: rgba(255, 255, 255, 1),
                    borderRadius: BorderRadius.zero,
                    onPressed: () => G.pushNamed('/order_detail', arguments: {
                      "status": 1
                    })
                  )
                ],
              ),
            ),
          ),
      ],),
    );
  }

  Container contentAddress() {
    return Container(
      decoration: BoxDecoration(
        border: G.borderBottom()
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
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/self_store'),
            child: Column(children: <Widget>[
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
            ],),
          )
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
