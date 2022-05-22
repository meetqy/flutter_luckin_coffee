import 'package:flutter/material.dart';

import 'widgets/order_list_row.dart';

class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> with TickerProviderStateMixin {
  List<Tab> tabs = [
    Tab(
      text: '全部',
    ),
    Tab(
      text: "未完成",
    ),
    Tab(
      text: "已完成",
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "订单列表",
          style: TextStyle(
              color: Color.fromRGBO(56, 56, 56, 1),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(44),
          child: Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: TabBar(
              tabs: tabs,
              labelColor: Color.fromRGBO(136, 175, 213, 1),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              unselectedLabelColor: Color.fromRGBO(80, 80, 80, 1),
              controller: _tabController,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Container(
        color: Color.fromRGBO(248, 248, 248, 1),
        child: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                OrderListRow(1,
                    orderNum: '23847563928174',
                    address: '北京市朝阳区青年汇佳园10号...',
                    goodsName: '榛果拿铁',
                    price: 20,
                    time: '2019-01-08 08:05',
                    onPress: () => Navigator.pushNamed(context, '/order_detail',
                        arguments: {"status": 2})),
                OrderListRow(
                  2,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
                OrderListRow(
                  2,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
                OrderListRow(
                  2,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
                OrderListRow(
                  3,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                OrderListRow(
                  1,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
                OrderListRow(
                  1,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
                OrderListRow(
                  1,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                OrderListRow(
                  2,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
                OrderListRow(
                  2,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
                OrderListRow(
                  2,
                  orderNum: '23847563928174',
                  address: '北京市朝阳区青年汇佳园10号...',
                  goodsName: '榛果拿铁',
                  price: 20,
                  time: '2019-01-08 08:05',
                ),
              ],
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
