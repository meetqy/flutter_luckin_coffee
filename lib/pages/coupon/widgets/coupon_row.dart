import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';

class CouponRow extends StatelessWidget {
  const CouponRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: hex('#fff'),
      ),
      height: 120,
      padding: EdgeInsets.all(5),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: rgba(242,242,242,1), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),

        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(children: <Widget>[
                Container(
                  width: 85,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 1,color: rgba(242, 242, 242, 1)))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('4', style: TextStyle(
                        color: rgba(144, 192, 239, 1),
                        fontSize: 34
                      ),),
                      Text('.8折', style: TextStyle(
                        color: rgba(144, 192, 239, 1),
                        fontSize: 18
                      ),)
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // left
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('咖啡.果汁', style: TextStyle(
                              color: rgba(56, 56, 56, 1),
                              fontSize: 16
                            ),),
                            Container(
                              margin: EdgeInsets.only(top: 7),
                              child: Text('有效期至2019-01-14', style: TextStyle(
                                color: rgba(166, 166, 166, 1),
                                fontSize: 12
                              ),),
                            )
                          ],
                        ),

                        // right
                        Container(
                          width: 20,
                          height: 20,
                          child: Transform.scale(
                            scale: .8,
                            child: Checkbox(
                              activeColor: rgba(136, 175, 213, 1),
                              value: true, 
                              onChanged: (flag) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                )
              ],),
            ),

            Positioned(
              right: 15,
              bottom: 5,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('使用规则', style: TextStyle(
                      fontSize: 10,
                      color: rgba(166, 166, 166, 1)
                    ),),
                    icontubiao3(color: rgba(153, 153, 153, 1))
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}