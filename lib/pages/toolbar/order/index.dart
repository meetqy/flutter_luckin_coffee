import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_luckin_coffee/utils/commonUI.dart';



class Order extends StatefulWidget {
  static _OrderState _orderState;

  getAppBar() {
    return _orderState.createAppBar();
  }
  
  Order() {
    _orderState = _OrderState();
  }

  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> with TickerProviderStateMixin{
  static TabController _tabController;

  static List<Tab> tabs = [
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];

  @override
  void initState() {
    super.initState();
  }

  /// 创建appbar
  AppBar createAppBar() {
    _tabController = TabController(vsync: this, length: tabs.length);

    /// 配置appbar
    return AppBar(
      title: Text(
        "订单列表", 
        style: TextStyle(color: rgba(56, 56, 56, 1), fontSize: 18),
      ),
      bottom: TabBar(
        tabs: tabs,
        controller: _tabController,
      ),
      elevation: 0.0, // 去除底部阴影
      backgroundColor: rgba(255, 255, 255, 1),
    );
  }


  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        Text('123'),
        Text('456'),
        Text('789'),
      ],
      controller: _tabController,
    );
  }
}
