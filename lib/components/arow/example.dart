import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/arow/ARow.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class ExampleARow extends StatefulWidget {
  ExampleARow({Key key}) : super(key: key);

  _ExampleARowState createState() => _ExampleARowState();
}

class _ExampleARowState extends State<ExampleARow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'ARow',
        context: context
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: ARow(
              leftChild: Container(
                width: 30,
                child: icontupian5(color: rgba(228, 228, 228, 1)),
              ),
              centerChild: Text('个人信息', style: TextStyle(color: rgba(56, 56, 56, 1)),),
              rightChild: Row(children: <Widget>[
                Text('7张', style: TextStyle(color: rgba(166, 166, 166, 1)),),
                icontupian6(color: rgba(228, 228, 228, 1), size: 14)
              ],),
            )
          ),

          Container(
            child: ARow(
              border: G.borderBottom(show: false),
              leftChild: Container(
                width: 30,
                child: Container(
                  padding: EdgeInsets.only(bottom: 3, right: 1),
                  child: icontupian11(color: rgba(228, 228, 228, 1), size: 20),
                ),
              ),
              centerChild: Text('咖啡钱包', style: TextStyle(color: rgba(56, 56, 56, 1)),),
              rightChild: Row(children: <Widget>[
                Text('7张', style: TextStyle(color: rgba(166, 166, 166, 1)),),
                icontupian6(color: rgba(228, 228, 228, 1), size: 14)
              ],),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                ARow(
                  height: 70,
                  leftChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('现在下单', style: TextStyle(
                        color: rgba(56, 56, 56, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16  
                      ),),
                      Text('ORDER NOW', style: TextStyle(
                        color: rgba(128, 128, 128, 1),
                        fontSize: 10
                      ),)
                    ],
                  ),
                  rightChild: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: rgba(99, 71, 58, 1)),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 2),
                      child: icontupian3(color: rgba(99, 71, 58, 1), size: 20),
                    ),
                  ),
                ),

                ARow(
                  height: 70,
                  border: G.borderBottom(show: false),
                  leftChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('咖啡钱包', style: TextStyle(
                            color: rgba(56, 56, 56, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16  
                          ),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('COFFRR WALLET', style: TextStyle(
                            color: rgba(128, 128, 128, 1),
                            fontSize: 10
                          ),),
                        ],
                      )
                    ],
                  ),
                  rightChild: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: rgba(99, 71, 58, 1)),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 2),
                      child: icontupian(color: rgba(99, 71, 58, 1), size: 20),
                    ),
                  ),
                ),
              
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ARow(
                        centerChild: Container(
                          alignment: Alignment.center,
                          child: Text('这是centerChild'),
                        ),
                      ),
                    ),
                    Container(
                      child: ARow(
                        centerChild: Text('这是centerChild'),
                      ),
                    ),
                  ],
                ),

                
              ],
            ),
          )
        ],
      )
    );
  }
}