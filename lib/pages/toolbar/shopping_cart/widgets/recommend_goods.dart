import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/mock/goods_list.dart';

class RecommendGoods extends StatelessWidget {
  final Function onPress;
  final MockGoods data;

  /// 推荐商品
  RecommendGoods({this.data, this.onPress});

  /// 商品图片
  Widget goodsImg(String imgSrc) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(0),
      child: Image.network(
        imgSrc,
        width: 108,
        height: 108,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String desc = data.characteristic;
    desc = desc.length > 20 ? desc.substring(0, 18) + '...' : desc;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 108,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            goodsImg(data.pic),
            Container(
              padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text(
                      '${data.name}',
                      style: TextStyle(
                          fontSize: 11,
                          color: Color.fromRGBO(56, 56, 56, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '$desc',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color.fromRGBO(166, 166, 166, 1), fontSize: 10),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                '¥${data.originalPrice}',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(255, 141, 26, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.add_circle,
                          color: Color.fromRGBO(148, 196, 236, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
