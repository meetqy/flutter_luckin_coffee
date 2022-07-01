import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_row/a_row.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:get/get.dart';

class Mine extends StatefulWidget {
  static _MineState _mineState;

  getAppBar() => _mineState.createAppBar();

  Mine() {
    _mineState = _MineState();
  }

  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(248, 248, 248, 1),
        child: Column(
          children: <Widget>[
            // 头部
            Container(
              alignment: Alignment.centerLeft,
              height: 180,
              color: Color.fromRGBO(100, 68, 60, 1),
              padding: EdgeInsets.only(left: 20, right: 20, top: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Icon(
                      Icons.person,
                      size: 24,
                      color: Color.fromRGBO(255, 255, 255, .9),
                    ),
                  ),
                  buildUser(),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  ARow(
                    height: 50,
                    padding: EdgeInsets.all(0),
                    leftChild: Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.badge_rounded,
                        color: Color.fromRGBO(220, 220, 220, 1),
                        size: 20,
                      ),
                    ),
                    centerChild: Text('个人资料'),
                    rightChild: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(228, 228, 228, 1),
                      size: 16,
                    ),
                  ),
                  ARow(
                    height: 50,
                    padding: EdgeInsets.all(0),
                    leftChild: Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(
                          Icons.card_giftcard,
                          color: Color.fromRGBO(220, 220, 220, 1),
                          size: 20,
                        ),
                      ),
                    ),
                    centerChild: Text('咖啡钱包'),
                    rightChild: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(228, 228, 228, 1),
                      size: 16,
                    ),
                  ),
                  ARow(
                    height: 50,
                    padding: EdgeInsets.all(0),
                    leftChild: Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Icon(
                          Icons.discount_sharp,
                          color: Color.fromRGBO(220, 220, 220, 1),
                          size: 20,
                        ),
                      ),
                    ),
                    centerChild: Text('优惠券'),
                    rightChild: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(228, 228, 228, 1),
                      size: 16,
                    ),
                    onPressed: () => Get.toNamed('/coupon'),
                  ),
                  ARow(
                    height: 50,
                    padding: EdgeInsets.all(0),
                    leftChild: Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Icon(
                          Icons.explicit_sharp,
                          color: Color.fromRGBO(220, 220, 220, 1),
                          size: 20,
                        ),
                      ),
                    ),
                    centerChild: Text('兑换优惠'),
                    rightChild: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(228, 228, 228, 1),
                      size: 16,
                    ),
                  ),
                  ARow(
                    height: 50,
                    padding: EdgeInsets.all(0),
                    leftChild: Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Icon(
                          Icons.inventory,
                          color: Color.fromRGBO(220, 220, 220, 1),
                          size: 20,
                        ),
                      ),
                    ),
                    centerChild: Text('发票管理'),
                    rightChild: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(228, 228, 228, 1),
                      size: 16,
                    ),
                    border: cuBorderBottom(show: false),
                  ),
                ],
              ),
            ),

            ARow(
              height: 50,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 15),
              leftChild: Container(
                width: 30,
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Icon(
                    Icons.favorite,
                    color: Color.fromRGBO(220, 220, 220, 1),
                    size: 20,
                  ),
                ),
              ),
              centerChild: Text('帮助反馈'),
              rightChild: Icon(
                Icons.arrow_forward_ios,
                color: Color.fromRGBO(228, 228, 228, 1),
                size: 16,
              ),
              border: cuBorderBottom(show: false),
            ),

            Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset(
                  'lib/assets/images/mine/mine2.jpg',
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }

  ARow buildUser() {
    return ARow(
      height: 55,
      color: Colors.transparent,
      border: cuBorderBottom(show: false),
      padding: EdgeInsets.all(0),
      leftChild: ClipRRect(
          borderRadius: new BorderRadius.circular(27),
          child: Image.asset(
            'lib/assets/images/mine/mine1.png',
            width: 55,
            height: 55,
            fit: BoxFit.cover,
          )),
      centerChild: Container(
        margin: EdgeInsets.only(left: 10),
        child: Text(
          "UserName",
          style:
              TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 18),
        ),
      ),
      rightChild: Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Color.fromRGBO(255, 255, 255, .6),
      ),
      onPressed: () {
        Get.toNamed('/login_mail');
      },
    );
  }
}
