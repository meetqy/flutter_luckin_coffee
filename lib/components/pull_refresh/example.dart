import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ExamplePullToRefresh extends StatefulWidget {
  ExamplePullToRefresh({Key key}) : super(key: key);

  _TestDemoState createState() => _TestDemoState();
}

class _TestDemoState extends State<ExamplePullToRefresh> {
  static String text = "使用pull_to_refresh插件，不是自己写的";
  List<String> items = [text, text,text,text,text,text,text,text];
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    if(mounted) {
      _refreshController.loadComplete();
      setState(() {
        items = [text, text,text,text,text,text,text,text];
      });
    }
    // if failed,use refreshFailed()
    return _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    if(mounted) {
      // if failed,use loadFailed(),if no data return,use LoadNodata()
      if(items.length >= 10) return _refreshController.loadNoData();
      setState(() {
        items = items + [text, text, text];
      });
    }

    
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: "pull to refresh",
        context: context
      ),
      body: SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header:G.pullToRefreshStyle.header(),
          footer: G.pullToRefreshStyle.footer(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
            itemExtent: 100.0,
            itemCount: items.length,
          ),
        ),
      ),
    );
  }
}

