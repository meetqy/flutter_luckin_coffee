<!--
 * @Author: meetqy
 * @since: 2019-08-10 16:41:08
 * @lastTime: 2019-11-04 11:41:20
 * @LastEditors: meetqy
 -->
 ![app_head](./readme/images/githead1.png)
 
# flutter_luckin_coffee

flutter实战之瑞幸咖啡，flutter高保真还原luckin coffee。

- 注：开发规范是最近才加入的（引用的flutter-go），所以代码很多地方不符合规范。

## 前言

- 为什么会有这个项目？

> 了解到了flutter这个框架，并且和rn和uniapp的实现跨平台的思路完全不一样。做了一些demo之后，感觉挺有意思的，所以想做一个完整的项目，体验学习一下。

- 为什么用luckin coffee？

> luckin coffee在网上能搜索到开源的原型+设计图,简直方便的不行。[luckin coffee原型+设计图](https://www.xiaopiu.com/square?libPop=project&libId=5c306b252d5cd56e70a1e640)

##### - 注： 正常下单请到luckin coffee官方客户端

## 安卓扫描二维码下载

![](./Android.png)

## flutter版本信息

``` bash
Flutter 1.7.8+hotfix.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 20e59316b8 (4 weeks ago) • 2019-07-18 20:04:33 -0700
Engine • revision fee001c93f
Tools • Dart 2.4.0
```

## 当前版本进度 - v3.0.0
> v1.0版本所遗留的问题
- [ ] 选择区号页面，动画效果（和iphone电话薄的效果一样）没有找到实现的方法。
- [ ] 待实现：菜单界面，点击左侧菜单，右侧商品列表跳转
- [ ] 待解决：从非toolbar页面跳转到toolbar页面的入场动画不一致
> v3.0.0
- [ ] 修改代码，符合新的代码规范
- [ ] code review

### - v1.0版本侧重于页面实现
- [x] 完成所有页面的开发（不包括动画交互) tag: v1.0.0-完成所有页面的开发（不包括动画交互）
- [x] 完成动画交互
- [x] 优化代码

### - v2.0版本侧重于前后端交互（后端用api工厂）
- [x] 接入api工厂
- [x] 准备app所需要的数据
- [x] 完成联调

### - v3.0版本侧重优化总结
- [x] code review

## backlog
- [v1.x.x](./readme/backlog/v1.x.x.md)
- [v2.x.x](./readme/backlog/v2.x.x.md)

## 项目中自己封装的组件
- [AButton 按钮](./lib/components/abutton)
- [AStepper 步进器](./lib/components/astepper)
- [ADialog 弹出框](./lib/components/adialog)
- [ARow 行](./lib/components/arow)
- [ACheckBox 复选框](./lib/components/acheckbox)

## 项目中所用到的插件及作用
- [flutter_swiper](https://github.com/best-flutter/flutter_swiper) - 轮播图
- [provider](https://github.com/rrousselGit/provider) - 状态管理
- [pull_to_refresh](https://github.com/bytedance/pull_to_refresh) - 上拉加载，下拉刷新
- [dio](https://github.com/flutterchina/dio) - 网络请求
- [json_annotation](https://github.com/dart-lang/json_serializable/tree/master/json_annotation)+[json_serializable](https://github.com/dart-lang/json_serializable) - json序列化
- [fluttertoast](https://github.com/PonnamKarthik/FlutterToast) - toast
- [shared_preferences](https://github.com/flutter/plugins/tree/master/packages/shared_preferences) - 本地缓存
- [iconfont_dart](https://github.com/meetqy/iconfont_dart) iconfont转换成className的调用方式
- [color_dart](https://github.com/meetqy/color_dart) - 配合vscode插件在代码中显示颜色

## 开发规范
[flutter-go的开发规范](https://github.com/alibaba/flutter-go/blob/master/Flutter_Go%20%E4%BB%A3%E7%A0%81%E5%BC%80%E5%8F%91%E8%A7%84%E8%8C%83.md)

## 项目目录
``` tree
.
├── lib                                         // 项目源代码
│   ├── assets                                  // 静态资源文件
|   ├── components                              // 首页组件列表，包括所组件
│   ├── constants                               // 全局常量
│   ├── createIconfont.dart                     // 通过iconfont自动生成Icon
│   ├── main.dart                               // 入口文件
│   ├── pages                                   // 页面
│   │   └── toolbar                             // 导航栏
│   ├── routes                                  // 路由配置
│   ├── utils                                   // 公用方法
│   └── widgets                                 // 公用widge
├── readme                                      // README.md相关
```
## 随便看看吧
<img src="./readme/images/1.gif" width="375"/> | <img src="./readme/images/2.gif" width="375"/>
---- | ---
