import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_row/a_row.dart';
import 'package:flutter_luckin_coffee/components/custom_swiper/index.dart';
import 'package:flutter_luckin_coffee/components/take_out_btn/index.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // 头部banner
          Stack(
            children: <Widget>[
              // 轮播图
              Positioned(
                child: CustomSwiper(
                  [
                    'lib/assets/images/home/swiper1.jpg',
                    'lib/assets/images/home/swiper2.jpg',
                    'lib/assets/images/home/swiper3.jpg',
                  ],
                  height: 208 + Get.statusBarHeight,
                ),
              ),

              // 扫描二维码
              Positioned(
                top: 50,
                right: 10,
                child: rightChild(
                  icon: Icon(Icons.camera_alt),
                  bgColor: Color.fromRGBO(0, 0, 0, .3),
                  showBorder: false,
                ),
              )
            ],
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                ARow(
                  height: 70,
                  padding: EdgeInsets.all(0),
                  leftChild:
                      leftChild(title: '火车南站', desc: '距您53m', titleBlod: false),
                  rightChild: TakeOutBtn(),
                ),
                ARow(
                  height: 70,
                  padding: EdgeInsets.all(0),
                  leftChild: leftChild(title: '现在下单', desc: 'ORDER NOW'),
                  rightChild: rightChild(
                    icon: Icon(
                      Icons.shopping_bag,
                      color: Color.fromRGBO(99, 71, 58, 1),
                      size: 20,
                    ),
                  ),
                  onPressed: () => {},
                ),
                ARow(
                  height: 70,
                  padding: EdgeInsets.all(0),
                  leftChild: leftChild(title: '咖啡钱包', desc: 'COFFRR WALLET'),
                  rightChild: rightChild(
                    icon: Icon(
                      Icons.wallet_giftcard,
                      size: 20,
                      color: Color.fromRGBO(104, 68, 60, 1),
                    ),
                  ),
                ),
                ARow(
                  height: 70,
                  padding: EdgeInsets.all(0),
                  leftChild: leftChild(title: '送Ta咖啡', desc: 'SEND COFFEE'),
                  rightChild: rightChild(
                    icon: Icon(Icons.coffee,
                        size: 20, color: Color.fromRGBO(104, 68, 60, 1)),
                  ),
                ),
                ARow(
                  height: 70,
                  padding: EdgeInsets.all(0),
                  leftChild:
                      leftChild(title: '企业账号', desc: 'ENTERPRISE ACCOUNT'),
                  rightChild: rightChild(
                    icon: Icon(
                      Icons.article_rounded,
                      size: 20,
                      color: Color.fromRGBO(104, 68, 60, 1),
                    ),
                  ),
                  onPressed: () => {},
                ),
                Container(
                  child: Image.asset('lib/assets/images/home/bottom_bar.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rightChild({Icon icon, Color bgColor, bool showBorder = true}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color:
              showBorder ? Color.fromRGBO(99, 71, 58, 1) : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 2),
        child: icon,
      ),
    );
  }

  Column leftChild({String title, String desc, bool titleBlod = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Color.fromRGBO(56, 56, 56, 1),
                  fontSize: 16,
                  fontWeight: titleBlod ? FontWeight.bold : FontWeight.normal),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              desc,
              style: TextStyle(
                  color: Color.fromRGBO(128, 128, 128, 1), fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}
