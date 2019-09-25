import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/AButton/index.dart';
import 'package:flutter_luckin_coffee/pages/order/widgets/GoodsMsgRow.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class OrderDetail extends StatefulWidget {
  final Map args;

  OrderDetail({
    this.args
  });

  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  static Map args;

  @override
  void initState() { 
    super.initState();

    setState(() {
      args = widget.args;
    });
  }

  /// 下单成功 
  /// status 1
  buySuccess() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      color: hex('#fff'),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('下单成功', style: TextStyle(
                color: rgba(56, 56, 56, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 55,
                height: 16,
                decoration: BoxDecoration(
                  border: Border.all(color: rgba(217, 217, 217, 1)),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    icontubiao7(color: rgba(48, 100, 157, 1), size: 10),
                    Text('慢必赔', style: TextStyle(
                      color: rgba(80, 80, 80, 1),
                      fontSize: 10
                    ),)
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('预计', style: TextStyle(
                  color: rgba(56, 56, 56, 1),
                  fontSize: 12
                ),),
                Text('15:15', style: TextStyle(
                  color: rgba(144, 192, 239, 1),
                  fontSize: 12
                ),),
                Text('送达，请耐心等待luckin来临！', style: TextStyle(
                  fontSize: 12,
                  color: rgba(56, 56, 56, 1),
                ),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AButton.normal(
                  child: Text('取消订单', style: TextStyle(fontSize: 14),),
                  width: 105,
                  height: 32,
                  plain: true,
                  color: rgba(56, 56, 56, 1),
                  borderColor: rgba(217, 217, 217, 1),
                  onPressed: () => {}
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: AButton.normal(
                    child: Text('取餐码'),
                    width: 105,
                    height: 32,
                    plain: true,
                    color: rgba(136, 175, 213, 1),
                    borderColor: rgba(136, 175, 213, 1),
                    onPressed: () => {}
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  /// 待付款
  /// status 2
  waitPayment() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      color: hex('#fff'),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('待付款', style: TextStyle(
                color: rgba(56, 56, 56, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('请在', style: TextStyle(
                  color: rgba(56, 56, 56, 1),
                  fontSize: 12
                ),),
                Text('15:15', style: TextStyle(
                  color: rgba(144, 192, 239, 1),
                  fontSize: 12
                ),),
                Text('内完成支付，过时订单将会取消。', style: TextStyle(
                  fontSize: 12,
                  color: rgba(56, 56, 56, 1),
                ),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // AButton.bigButton('取消订单',
                //     width: 105,
                //     height: 32,
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     bgColor: Colors.transparent,
                //     color: rgba(56, 56, 56, 1),
                //     border: Border.all(color: rgba(217, 217, 217, 1)),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 10),
                //   child: AButton.bigButton('去支付',
                //       width: 105,
                //       height: 32,
                //       fontSize: 14,
                //       bgColor: Colors.transparent,
                //       color: rgba(255, 129, 2, 1),
                //       border: Border.all(color: rgba(255, 129, 2, 1)),
                //   ),
                // ),
              ],
            ),
          )
        ],
      )
    );
  }

  /// 返回对应的page
  returnPage() {
    if(args['status'] == 1) {
      return buySuccess();
    } else if(args['status'] == 2) {
      return waitPayment();
    }
    
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: customAppbar(
        title: '订单详情',
        context: context,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              IconData(0xe625, fontFamily: 'iconfont'),
              size: 18,
              color: rgba(148, 196, 236, 1),
            ),
          )
        ]
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // module1
              returnPage(),

              // module2
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: EdgeInsets.only(top: 10),
                color: hex('#fff'),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        border: G.borderBottom()
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('外卖订单:33412823848583', style: TextStyle(
                            color: rgba(128, 128, 128, 1),
                            fontSize: 13
                          ),),
                          Text('2019-01-07 14:22', style: TextStyle(
                            color: rgba(128, 128, 128, 1),
                            fontSize: 13
                          ),),
                      ],),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(children: <Widget>[
                        GoodsMsgRow(),
                        GoodsMsgRow(),
                        GoodsMsgRow(),
                        GoodsMsgRow(),
                        GoodsMsgRow(marginBottom: false,)
                      ],),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('配送费', style: TextStyle(
                            fontSize: 14,
                            color: rgba(56, 56, 56, 1),
                          ),),
                          Text('¥6', style: TextStyle(
                            color: rgba(56, 56, 56, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: G.borderBottom()
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('使用咖啡钱包', style: TextStyle(
                            fontSize: 14,
                            color: rgba(144, 192, 239, 1),
                          ),),
                          Text('-￥21', style: TextStyle(
                            color: rgba(144, 192, 239, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('共1件商品', style: TextStyle(
                            fontSize: 14,
                            color: rgba(56, 56, 56, 1),
                          ),),
                          Row(
                            children: <Widget>[
                              Text('实付', style: TextStyle(
                                color: rgba(56, 56, 56, 1),
                                fontSize: 14
                              ),),
                              Text('￥21', style: TextStyle(
                                color: rgba(56, 56, 56, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          )
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            
              // module3
              Container(
                margin: EdgeInsets.only(top: 10),
                color: hex('#fff'),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('收货地址', style: TextStyle(
                          color: rgba(56, 56, 56, 1),
                          fontSize: 14
                        ),),
                        Text('北京市朝阳区青年汇佳园10号楼102号楼...', style: TextStyle(
                          color: rgba(128, 128, 128, 1),
                          fontSize: 13
                        ),)
                    ],),

                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('piu先生  13244234213', style: TextStyle(
                            color: rgba(128, 128, 128, 1),
                            fontSize: 13
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // module4
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset('lib/assets/images/order/order2.png', height: 60),
              )
            ],
          ),
        ),
      ),
    );
  }
}

