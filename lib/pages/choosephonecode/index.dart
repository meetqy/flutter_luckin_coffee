import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class ChoosePhoneCode extends StatefulWidget {
  ChoosePhoneCode({Key key}) : super(key: key);

  _ChoosePhoneCodeState createState() => _ChoosePhoneCodeState();
}

class _ChoosePhoneCodeState extends State<ChoosePhoneCode> {
  static ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener((){
    });

    super.initState();
  }

  ds() {
    var a = [1,2,3,4,5,6,6];

    List<Widget> arr = [];

    a.forEach((val){
      arr.add(Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                border: G.borderBottom()
              ),
              child: Text('$val'),
            ),
          )
        ],
      ));
    });

    return arr;
  }


  listRow(String name) {
    ValueKey _key = ValueKey('$name');
    return Column(
      key: _key,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5),
          height: 50,
          color: hex('#fff'),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(name, style: TextStyle(
                color: rgba(56, 56, 56, 1),
                fontSize: 15
              ),),
              Text('+86', style: TextStyle(
                color: rgba(166, 166, 166, 1),
                fontSize: 15
              ),)
            ],
          ),
        ),
        Column(
          children: ds()
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: customAppbar(
          title: '选择手机区号'
        ),
        body: NestedScrollView(
          controller: _controller,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                //  expandedHeight: 100,
                  floating: false,
                  pinned: true,
                  backgroundColor: hex('#333'),
                  leading: Container(
                    alignment: Alignment.center,
                    child: Text('A', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: hex('#fff')),),
                  ),
                  title: null,
                )
              ];
            },
            body: Container(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: <Widget>[
                  listRow('A'),listRow('B'),listRow('C'),listRow('D'),
                  listRow('E'),listRow('F'),listRow('G'),listRow('H'),
                  listRow('I'),listRow('J'),listRow('K'),listRow('L'),
                  listRow('M'),listRow('N'),listRow('O'),listRow('P'),
                  listRow('Q'),listRow('R'),listRow('S'),listRow('T'),
                  listRow('U'),listRow('V'),listRow('W'),listRow('X'),
                  listRow('Y'),listRow('Z')
            ],
          ),
        ),
      ),
    );
  }
}