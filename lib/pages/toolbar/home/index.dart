/*
 * @Author: meetqy
 * @since: 2019-08-06 11:54:12
 * @lastTime: 2019-08-08 09:44:39
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
            HomeRow('火车南站', '距您52m', 
              titleBold: false,
              right: Container(
                padding: EdgeInsets.all(3),
                width: 90,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: rgba(136, 175, 213, 1)),
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 44,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: rgba(136, 175, 213, 1),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text('自提', style: TextStyle(color: rgba(255, 255, 255, 1),fontSize: 12),)
                    ),
                    Container(
                      height: 30,
                      margin: EdgeInsets.only(right: 9),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text('外送', style: TextStyle(color: rgba(136, 175, 213, 1),fontSize: 12),)
                    )
                  ],
                )
              ),
            ),
            HomeRow('现在下单', 'ORDER NOW', 
              right: HomeIcon(
                icontupian3(size: 20, color: rgba(104, 68, 60, 1)),
                margin: EdgeInsets.only(left: 2),
              ),
            ),
            HomeRow('咖啡钱包', 'COFFRR WALLET',
              right: HomeIcon(
                icontupian(size: 20, color: rgba(104, 68, 60, 1)),
                margin: EdgeInsets.only(left: 2),
              ),
            ),
            HomeRow('送Ta咖啡', 'SEND COFFEE',
              right: HomeIcon(
                icontupian1(size: 20, color: rgba(104, 68, 60, 1)),
                margin: EdgeInsets.only(left: 2),
              ),
            ),
            HomeRow('企业账户', 'ENTERPRISE ACCOUNT',
              bottomBorder: false,
              right: HomeIcon(
                icontupian2(size: 20, color: rgba(104, 68, 60, 1)),
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

