/*
 * @Author: meetqy
 * @since: 2019-08-06 11:54:12
 * @lastTime: 2019-09-07 14:18:01
 * @LastEditors: meetqy
 */

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/global.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';
import 'package:flutter_luckin_coffee/widgets/TakeOutBtn/index.dart';
import 'package:flutter_luckin_coffee/widgets/index.dart';

import 'widgets/HomeIcon.dart';
import 'widgets/HomeRow.dart';


class Home extends StatefulWidget {
  static _HomeState _homeState;

  Home() {
    _homeState = _HomeState();
  }

  getAppBar() => _homeState.createAppBar();

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        // 头部banner
        Stack(children: <Widget>[
          // 轮播图
          Positioned(child: 
            CustomSwiper(
              [
                'lib/assets/images/home/swiper1.jpg',
                'lib/assets/images/home/swiper2.jpg',
                'lib/assets/images/home/swiper3.jpg',
              ],
              height: screenHeight(context) > 800 ? 288 : 208,
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
              right: new TakeOutBtn()
            ),
            HomeRow('现在下单', 'ORDER NOW', 
              right: HomeIcon(
                icontupian3(size: 20, color: rgba(104, 68, 60, 1)),
                margin: EdgeInsets.only(left: 2),
              ),
              onPress: () {
                
              }
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
            HomeRow('组件列表', 'ENTERPRISE ACCOUNT',
              bottomBorder: false,
              right: HomeIcon(
                icontupian2(size: 20, color: rgba(104, 68, 60, 1)),
                margin: EdgeInsets.only(left: 1, bottom: 3),
              ),
              onPress: () {
                G.pushNamed('/explame_widgets_list', arguments: {'msg': 'home to list'});
              },
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


