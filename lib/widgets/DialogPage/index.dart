import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/abutton/index.dart';
import 'package:flutter_luckin_coffee/components/astepper/AStepper.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/widgets/DacaiSay.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/widgets/RadiusBtn.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/widgets/SelectRow.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:flutter_luckin_coffee/widgets/FullScreenDialog/index.dart';

Widget circelIcon({Icon icon, Function onPress, Color bgColor}) {
  return InkWell(
    child: Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor == null ? rgba(0, 0, 0, 0.3) : bgColor,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: icon
    ),
    onTap: () {
      if(onPress!=null) {
        onPress();
      }
    },
  );
}

final dialogPage = FullScreenDialog(
  closeChild: CloseDialog(
    right: 10,
    top: 10,
    child: Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: rgba(0, 0, 0, 0.3),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: iconhebingxingzhuang(color: hex('#fff'), size: 16),
    )
  ),
  
  child: Container(
    width: 335,
    height: 580,
    child: Column(children: <Widget>[
      Stack(children: <Widget>[
        Container(
          width: 335,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.asset('lib/assets/images/menu/dialog1.jpg', height: 150, fit: BoxFit.cover,),
          ),
        ),

        Positioned(
          left: 10,
          top: 10,
          child: circelIcon(
            icon: iconsc(color: hex('#fff'), size: 16),
          )
        ),

        Positioned(
          left: 15,
          bottom: 15,
          child: Column(children: <Widget>[
            Text('标准美式', 
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: hex('#fff')),
            ),
            Text('PingFang SC', 
              style: TextStyle(fontSize: 14,color: hex('#fff')),
            )
          ],),
        )
      ],),

      // 商品信息 滚动部分
      Expanded(
        child: Container(
          color: hex('#fff'),
          padding: EdgeInsets.only(top: 12),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              // 选择口味 大小等
              Container(child: 
                Column(children: <Widget>[
                  SelectRow(
                    "规格",
                    rightContainer: <Widget>[
                      RadiusBtn('大', isActive: true,),
                      RadiusBtn('小', isActive: false,),
                    ],
                  ),
                  SelectRow(
                    "温度",
                    rightContainer: <Widget>[
                      RadiusBtn('冰', isActive: false,),
                      RadiusBtn('热', isActive: true,),
                    ],
                  ),
                  SelectRow(
                    "糖",
                    rightContainer: <Widget>[
                      RadiusBtn('无糖', isActive: false,),
                      RadiusBtn('半塘', isActive: true,),
                      RadiusBtn('单份糖', isActive: false,),
                      RadiusBtn('香草3元', isActive: false,),
                      RadiusBtn('榛子3元', isActive: false,),
                    ],
                  ),
                  SelectRow(
                    "奶",
                    rightContainer: <Widget>[
                      RadiusBtn('无奶', isActive: true,),
                      RadiusBtn('单份奶', isActive: false,),
                      RadiusBtn('双份奶', isActive: false,),
                    ],
                  ),
                ],),
              ),

              // 分隔线
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    border: G.borderBottom()
                  ),
                ),
              ),

              // 大咖说
              Container(
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(child: 
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text('大咖说', style: TextStyle(color: rgba(56, 56, 56, 1),fontSize: 13),),
                      )
                    ,),
                  ],),

                  Column(children: <Widget>[
                    DacaiSay(
                      avatar: 'lib/assets/images/menu/author1.jpg',
                      name: 'Andrea Lattuada',
                      label: 'WBC意大利冠军',
                      desc: '咖啡好味道，生都八分。研磨、烘焙、虫蛀、萃取，我愿意就这样，用医生，去打磨一杯咖啡的乡村',
                      time: '2018-09-22 10:22'
                    ),
                  ],)
                ],),  
              ),
            
              // 商品描述
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(child: 
                        Text('商品描述',style: TextStyle(color: rgba(56, 56, 56, 1),fontSize: 13),),
                      )
                    ],),
                    
                    Row(children: <Widget>[
                      Expanded(child: 
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text('浓缩咖啡与牛奶批次融合，加入祥龙巧克力风味。（建议到店引用，脑油融化钱口味更佳）\n主要原菜鸟：浓缩开发，牛娜，巧克力酱，交大奶油（喊小草风味糖浆），\n图片仅供参考，请以实物为准。建议送达后尽快引用。',
                            style: TextStyle(
                              fontSize: 12,
                              color: rgba(128, 128, 128, 1)
                            ),
                          )
                        )
                      ,)
                    ],)
                ],),
              )
            ],)
          ),
        ),
      ),

      // 选择数量
      Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: rgba(242, 242, 242, 1), width: 1),
            bottom:  BorderSide(color: rgba(242, 242, 242, 1), width: 1),
          ),
          color: hex('#fff'),
        ),
        height: 60,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text('￥27', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: rgba(56, 56, 56, 1)),
                ),
              ),
              
              AStepper()
            ],),
            Container(
              alignment: Alignment.centerLeft,
              child: 
                Text('标准美式 ¥21+ 无糖 ¥0+ 无奶 ¥0',
                style: TextStyle(
                  color: rgba(80, 80, 80, 1),
                  fontSize: 10
                ),
              )
            )
            
        ],),
      ),

      // 底部按钮
      Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
          color: hex('#fff'),
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AButton.icon(
              icon: icontupian17(size: 14,),
              textChild: Text('充2赠1', style: TextStyle(fontSize: 12),),
              color: hex('#fff'),
              bgColor: rgba(255, 129, 2, 1),
              height: 32,
              onPressed: () => {}
            ),
            AButton.icon(
              height: 32,
              icon: iconsc(size: 14,),
              textChild: Text('收藏口味', style: TextStyle(fontSize: 12),),
              color: rgba(136, 175, 213, 1),
              bgColor: rgba(136, 175, 213, 0.3),
              onPressed: () => {}
            ),
            AButton.icon(
              height: 32,
              icon: icongouwuche(size: 14,),
              bgColor: rgba(136, 175, 213, 1),
              color: hex('#fff'),
              textChild: Text('加入购物车', style: TextStyle(fontSize: 12),),
              onPressed: () => {}
            )
          ],
        ),
      )
    ],)
  )
);

