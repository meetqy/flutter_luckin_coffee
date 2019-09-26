/*
 * @Author: meetqy
 * @since: 2019-08-06 11:54:12
 * @lastTime: 2019-09-26 14:46:43
 * @LastEditors: meetqy
 */

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/arow/ARow.dart';
import 'package:flutter_luckin_coffee/provider/CounterModel.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:flutter_luckin_coffee/widgets/TakeOutBtn/index.dart';
import 'package:flutter_luckin_coffee/widgets/index.dart';
import 'package:provider/provider.dart';

class Args {
  static num a = 1;
  static num b = 2;
  static List c = [1,2,3,4];
}
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
              height: G.screenHeight() > 800 ? 288 : 208,
            ),
          ),

          // 扫描二维码
          Positioned(
            top: 50,
            right: 10,
            child: rightChild(
              icon: icontupian4(size: 20, color: hex('#fff')),
              bgColor: rgba(0, 0, 0, .3),
              showBorder: false
            )
          ,)
        ],),
        
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: <Widget>[
            ARow(
              height: 70,
              padding: EdgeInsets.all(0),
              leftChild: leftChild(
                title: '火车南站',
                desc: '距您53m',
                titleBlod: false
              ),
              rightChild: TakeOutBtn(),
            ),

            ARow(
              height: 70,
              padding: EdgeInsets.all(0),
              leftChild: leftChild(
                title: '现在下单',
                desc: 'ORDER NOW'
              ),
              rightChild: rightChild(
                icon: icontupian3(color: rgba(99, 71, 58, 1), size: 20),
              ),
              onPressed: () => G.pushNamed('/menu', arguments: {'msg': 'home to menu'})
            ),  

            Consumer<CounterModel>(
              builder: (BuildContext context, CounterModel _counter, Widget child) {
                return ARow(
                  height: 70,
                  padding: EdgeInsets.all(0),
                  leftChild: leftChild(
                    title: '咖啡钱包${_counter.value}',
                    desc: 'COFFRR WALLET'
                  ),
                  rightChild: rightChild(
                    icon: icontupian(size: 20, color: rgba(104, 68, 60, 1)),
                  ),
                  onPressed: () {
                    _counter.add();
                  },
                );
              },
            ),

            ARow(
              height: 70,
              padding: EdgeInsets.all(0),
              leftChild: leftChild(
                title: '送Ta咖啡',
                desc: 'SEND COFFEE'
              ),
              rightChild: rightChild(
                icon: icontupian1(size: 20, color: rgba(104, 68, 60, 1)),
              ),
            ),

            ARow(
              height: 70,
              padding: EdgeInsets.all(0),
              leftChild: leftChild(
                title: '组件列表',
                desc: 'CONPONENTS LIST'
              ),
              rightChild: rightChild(
                icon: iconorder(size: 20, color: rgba(104, 68, 60, 1)),
              ),
              onPressed: () => G.pushNamed('/example_widgets_list', arguments: {'msg': 'home to list'})
            ),
            
            Container(
              child: Image.asset('lib/assets/images/home/bottom_bar.png'),
            )
          ],),
        ),

      ],),
    );
  }

  Container rightChild({
    Widget icon,
    Color bgColor,
    bool showBorder = true
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: showBorder ? rgba(99, 71, 58, 1) : Colors.transparent) ,
        borderRadius: BorderRadius.circular(20)
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
        Row(children: <Widget>[
          Text(title, style: TextStyle(
            color: rgba(56, 56, 56, 1),
            fontSize: 16,
            fontWeight: titleBlod ? FontWeight.bold : FontWeight.normal
          ),)
        ],),
        Row(children: <Widget>[
          Text(desc, style: TextStyle(
            color: rgba(128, 128, 128, 1),
            fontSize: 12
          ),)
        ],)
      ],
    );
  }
}