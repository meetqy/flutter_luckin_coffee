import 'package:flutter/material.dart';

import 'package:flutter_luckin_coffee/utils/global.dart';

class SelfStore extends StatefulWidget {
  SelfStore({Key key}) : super(key: key);

  _SelfStoreState createState() => _SelfStoreState();
}

class _SelfStoreState extends State<SelfStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: '门店自提', context: context, actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 10),
          child: Row(
            children: <Widget>[
              Text(
                '北京',
                style: TextStyle(
                    color: Color.fromRGBO(56, 56, 56, 1), fontSize: 12),
              ),
              Icon(
                IconData(0xe622, fontFamily: 'iconfont'),
                size: 20,
                color: Color.fromRGBO(56, 56, 56, 1),
              )
            ],
          ),
        )
      ]),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            AddressRow(),
            AddressRow(),
            AddressRow(),
            AddressRow(),
            AddressRow(),
            AddressRow(),
            AddressRow(),
            AddressRow(),
            AddressRow(),
            AddressRow(),
            AddressRow(
              borderBottom: false,
            ),
          ],
        ),
      ),
    );
  }
}

class AddressRow extends StatelessWidget {
  final bool borderBottom;

  AddressRow({this.borderBottom = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(border: cuBorderBottom(show: borderBottom)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '青年汇店(No.1795)',
                  style: TextStyle(
                      color: Color.fromRGBO(56, 56, 56, 1), fontSize: 16),
                ),
                Text(
                  '55m',
                  style: TextStyle(
                      color: Color.fromRGBO(56, 56, 56, 1), fontSize: 14),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 15,
                        height: 20,
                        child: Icon(
                          Icons.access_alarm,
                          color: Color.fromRGBO(217, 217, 217, 1),
                          size: 12,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1),
                        child: Text(
                          '07:00 - 20:00',
                          style: TextStyle(
                              color: Color.fromRGBO(217, 217, 217, 1),
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Text(
                          '查看详情',
                          style: TextStyle(
                              color: Color.fromRGBO(85, 122, 157, 1),
                              fontSize: 11),
                        ),
                        onTap: () =>
                            Navigator.pushNamed(context, '/store_detail'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromRGBO(85, 122, 157, 1),
                          size: 11,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  width: 15,
                  height: 20,
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Color.fromRGBO(166, 166, 166, 1),
                    size: 12,
                  ),
                ),
                Container(
                  child: Text(
                    '朝阳区朝阳北路青年汇102号楼一号3室',
                    style: TextStyle(
                        color: Color.fromRGBO(166, 166, 166, 1), fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
