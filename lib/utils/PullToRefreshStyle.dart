import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


/// 下拉刷新样式
class PullToRefreshStyle {

  /// 顶部样式
  header() {
    return CustomHeader(
      builder: (BuildContext context, RefreshStatus mode) {
        print({
          'header': mode
        });
        return Container(
          height: 44.0,
          child: Center(child:CupertinoActivityIndicator()),
        );
      },
    );
  }

  /// 底部样式
  footer() {
    return CustomFooter(
      builder: (BuildContext context,LoadStatus mode){
        print({
          'footer': mode
        });
        Widget body;
        if(mode == LoadStatus.noMore) {
          body = Text('--- 到底了 ---', style: TextStyle(
            color: G.colors.green
          ),);
        } else {
          body = CupertinoActivityIndicator();
        }
        return Container(
          height: 44.0,
          child: Center(child:body),
        );
      },
    );
  }
}



