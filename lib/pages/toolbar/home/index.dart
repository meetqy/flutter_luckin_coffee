/*
 * @Author: meetqy
 * @since: 2019-08-06 11:54:12
 * @lastTime: 2019-08-07 16:22:59
 * @LastEditors: meetqy
 */

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'HomeIcon.dart';
import 'HomeRow.dart';

class Home extends StatefulWidget {
  /// Appbar配置
  final AppBar appbar = null; 

  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: hex('#fff'),
      child: Column(children: <Widget>[
        // 头部banner
        Stack(children: <Widget>[
          // 轮播图
          Positioned(child: 
            Container(
              height: 288,
              child: Swiper(
                itemBuilder: (BuildContext context,int index){
                  return Image.asset('lib/assets/images/home/swiper${index+1}.jpg', fit: BoxFit.cover);
                },
                itemCount: 3,
                pagination: SwiperPagination(
                  builder:  DotSwiperPaginationBuilder(
                    size: 8,
                    activeSize: 8
                  )
                ),
                autoplay: true,
                duration: 500,
                autoplayDelay: 5000
              ),
            ),
          ),

          // 扫描二维码
          Positioned(
            top: 50,
            right: 10,
            child: HomeIcon(
              icontupian4(size: 20, color: hex('#fff')),
              bgColor: rgba(0, 0, 0, .3),
              border: false,
              margin: EdgeInsets.only(right: 3),
            )
          ,)
        ],),
        
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: <Widget>[
            HomeRow('火车南站', '距您52m', titleBold: false,),
            HomeRow('现在下单', 'ORDER NOW', 
              right: HomeIcon(
                icontupian3(size: 20, color: rgba(99, 71, 58, 1)),
                margin: EdgeInsets.only(left: 2),
              ),
            ),
            HomeRow('咖啡钱包', 'COFFRR WALLET',
              right: HomeIcon(
                icontupian(size: 20, color: rgba(99, 71, 58, 1)),
                margin: EdgeInsets.only(left: 2),
              ),
            ),
            HomeRow('送Ta咖啡', 'SEND COFFEE',
              right: HomeIcon(
                icontupian1(size: 20, color: rgba(99, 71, 58, 1)),
                margin: EdgeInsets.only(left: 2),
              ),
            ),
            HomeRow('企业账户', 'ENTERPRISE ACCOUNT',
              bottomBorder: false,
              right: HomeIcon(
                icontupian2(size: 20, color: rgba(99, 71, 58, 1)),
                margin: EdgeInsets.only(left: 1, bottom: 3),
              ),
            ),
            Container(
              child: Image.asset('lib/assets/images/home/bottom_bar.png'),
            )
          ],),
        ),

        
        
      ],),
    );
  }
}

