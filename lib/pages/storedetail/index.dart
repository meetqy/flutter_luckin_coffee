import 'package:flutter/material.dart';

import 'package:flutter_luckin_coffee/utils/global.dart';

class StoreDetail extends StatefulWidget {
  StoreDetail();

  _StoreDetailState createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: '门店详情', context: context),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            '青年汇店(No.1795)',
                            style: TextStyle(
                                color: Color.fromRGBO(56, 56, 56, 1),
                                fontSize: 18),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(255, 141, 26, 1)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            child: Text(
                              'PICKUP',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 141, 26, 1),
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color.fromRGBO(148, 196, 236, 1),
                          size: 16,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 65,
                          child: Text(
                            '营业时间：',
                            style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1),
                                fontSize: 12),
                          ),
                        ),
                        Text(
                          '周一至周五 07:00-20:00',
                          style: TextStyle(
                              color: Color.fromRGBO(128, 128, 128, 1),
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 65,
                        ),
                        Text(
                          '周六 08:00-18:00',
                          style: TextStyle(
                              color: Color.fromRGBO(128, 128, 128, 1),
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 65,
                        ),
                        Text(
                          '周日 08:00-18:00',
                          style: TextStyle(
                              color: Color.fromRGBO(128, 128, 128, 1),
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 65,
                          child: Text(
                            '门店地址：',
                            style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1),
                                fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '奥术大师大撒大所大萨',
                            style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1),
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 地图
            Container(
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '门店地图',
                        style: TextStyle(
                            color: Color.fromRGBO(56, 56, 56, 1), fontSize: 15),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'lib/assets/images/map.png',
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
