<!--
 * @Author: meetqy
 * @since: 2019-11-04 11:31:29
 * @lastTime: 2019-11-18 10:24:44
 * @LastEditors: meetqy
 -->
![app_head](./readme/images/githead1.png)

# flutter_luckin_coffee

> flutter luckin coffee application（仿瑞幸咖啡）

## 目录

- [前言](#前言)
- [flutter版本信息](#flutter版本信息)
- [扫码下载体验](#扫码下载体验)
- [安装](#安装)
- [相关插件](#相关插件)
- [待完善](#待完善)
- [维护者](#维护者)
- [欢迎PR](#欢迎PR)
- [预览](#预览)

## 前言

Q：为什么会有这个项目？

> 了解到了flutter这个框架，并且和rn和uniapp的实现跨平台的思路完全不一样。做了一些demo之后，感觉挺有意思的，所以想做一个完整的项目，体验学习一下。

Q：为什么用luckin coffee？

> luckin coffee在网上能搜索到开源的原型+设计图,简直方便的不行。[luckin coffee原型+设计图](https://www.xiaopiu.com/square?libPop=project&libId=5c306b252d5cd56e70a1e640)

Q：数据从哪里来？

> [api工厂](https://www.it120.cc/)配置商城数据，网站提供接口。

## flutter版本信息

``` sh
flutter --verison
```

``` sh
Flutter 1.9.1+hotfix.6 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 68587a0916 (7 weeks ago) • 2019-09-13 19:46:58 -0700
Engine • revision b863200c37
Tools • Dart 2.5.0
```

## 扫码下载体验

> 由于最近蒲公英更新弄掉了数据，本地安卓打包失败，没有找到原因，暂不提供安卓下载体验。

## 安装

这个项目使用 [flutter](https://github.com/flutter/flutter). 请确保你本地安装了它们。

1. 检查版本号是否正确
```sh
flutter --version
```

2. 运行一下命令查看是否需要安装其他依赖
``` sh
flutter doctor
```

3. 运行启动
```
flutter pub get
flutter run
```

## 相关插件

插件 | 说明
---- | ----
[flutter_swiper](https://github.com/best-flutter/flutter_swiper) | 轮播图
[provider](https://github.com/rrousselGit/provider) | 状态管理
[pull_to_refresh](https://github.com/bytedance/pull_to_refresh) | 上拉加载，下拉刷新
[dio](https://github.com/flutterchina/dio) | 网络请求
[json_annotation](https://github.com/dart-lang/json_serializable/tree/master/json_annotation)+[json_serializable](https://github.com/dart-lang/json_serializable) | json序列化
[fluttertoast](https://github.com/PonnamKarthik/FlutterToast) | toast
[shared_preferences](https://github.com/flutter/plugins/tree/master/packages/shared_preferences) | 本地缓存
[iconfont_dart](https://github.com/meetqy/iconfont_dart) | 快速将iconfont生成项目中可以直接调用的icon
[color_dart](https://github.com/meetqy/color_dart) | 配合vscode插件在代码中显示颜色

## 待完善

* 菜单页面锚点功能未实现
* 代码不符合开发规范
* 优化当前代码
* 订单数据目前是写死的假数据，api工厂暂时没有处理订单的接口，短时间之内不会联调。

## 维护者

[@meetqy](https://github.com/meetqy).

## 欢迎PR

非常欢迎一起学习flutter! [提一个Issue](https://github.com/meetqy/flutter_luckin_coffee/issues/new) 或者提交一个 Pull Request.

## 预览

<img src="./readme/images/1.gif" width="375"/> | <img src="./readme/images/2.gif" width="375"/> 
---- | ----
