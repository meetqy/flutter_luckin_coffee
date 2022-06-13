import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';

class SelectRow extends StatelessWidget {
  SelectRow();

  Container _createRadio(bool isActive, String text) {
    return Container(
      key: Key(text),
      margin: EdgeInsets.only(right: 10),
      child: AButton.normal(
        width: 80,
        height: 30,
        borderRadius: BorderRadius.circular(15),
        child: Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
        plain: true,
        color: isActive ? Colors.white : Color.fromRGBO(204, 192, 180, 1),
        bgColor: isActive ? Color.fromRGBO(204, 192, 180, 1) : Colors.white,
        borderColor:
            isActive ? Colors.transparent : Color.fromRGBO(204, 192, 180, 1),
        onPressed: () {
          // Map<String, dynamic> type = {
          //   "typeId": data.id,
          //   "childId": item.id,
          //   "typeName": data.name,
          //   "childName": item.name
          // };

          // onChange(type);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 6),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 65,
                  alignment: Alignment.center,
                  height: 30,
                  child: Text(
                    '温度',
                    style: TextStyle(color: Color.fromRGBO(56, 56, 56, 1)),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Wrap(
                      children: [
                        _createRadio(false, '冰'),
                        _createRadio(true, '热')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
