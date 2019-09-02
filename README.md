<!--
 * @Author: meetqy
 * @since: 2019-08-10 16:41:08
 * @lastTime: 2019-09-02 16:18:27
 * @LastEditors: meetqy
 -->
# flutter_luckin_coffee

flutter实战demo，仿luckin coffee。

![flutter_luckin_coffee_logo](./readme/images/githead.png)

## 前言

- 为什么会有这个项目？

> 了解到了flutter这个框架，并且和rn和uniapp的实现跨平台的思路完全不一样。做了一些demo之后，感觉挺有意思的，所以想做一个完整的项目，体验学习一下。

- 为什么用luckin coffee？

> luckin coffee在网上能搜索到原型+设计图好像是开源的，为了方便。[luckin coffee原型+设计图](https://www.xiaopiu.com/user?uid=5d478fe8174ff47f357b8b00&tab=collectProject&libPop=project&libId=5c306b252d5cd56e70a1e640)

##### - 注： 正常下单请到luckin coffee官方客户端

## 安卓扫描二维码下载

![](./Android.png)

## version

``` bash
Flutter 1.7.8+hotfix.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 20e59316b8 (4 weeks ago) • 2019-07-18 20:04:33 -0700
Engine • revision fee001c93f
Tools • Dart 2.4.0
```

## 版本计划 · 当前版本 v1.0.0

### - v1.0版本侧重于页面实现

- [x] 完成所有页面的开发（不包括动画交互) tag: v1.0.0-完成所有页面的开发（不包括动画交互）
- [ ] 完成动画交互
- [ ] 优化代码

### - v2.0版本侧重于前后端交互（后端用api工厂）

- [ ] 接入api工厂
- [ ] 准备app所需要的数据
- [ ] 完成联调

### - v3.0版本侧重优化总结

- [ ] code review

## 当前版本进度 - 动画交互 & 代码优化

解决v1.0.0所遗留的一些问题；实现大部分动画、按钮、输入框、表单等交互效果以及代码优化。

- [ ] 菜单页面，NestedScrollView里面使用ListView，对ListView增加controller会导致NestedScrollView失效。
- [ ] 选择区号页面，动画效果（和iphone电话薄的效果一样）没有找到实现的方法。
- [ ] 非bottomNavigationBar页面如何跳转到bottomNavigationBar页面。
- [ ] 曲面屏兼容问题，固定在最底部的widget，使用SafeArea底部会空出来（eg：确认订单页面）。

> 以上是上个版本遗留的问题 ----------------------------

- [ ] 通用颜色整理
- [ ] 单选按钮交互动画实现及封装
- [ ] 步进器的实现及封装
- [ ] 常用文字 & 颜色 & 大小封装
- [ ] 项目page目录的结构优化
- [x] 通用按钮的封装
- [x] 对封装的按钮写一个demo并编写文档
- [ ] 关注 & 取消关注封装
- [ ] 页面关联
- [ ] 路由传参优化
- [ ] 路由守卫的实现
- [ ] 上拉加载，下拉刷新的实现
- [ ] 上拉加载，下拉刷新的封装以及优化
- [ ] 常用行的封装 & 优化
- [ ] 将封装好的组件，接入对应页面

## backlog

[v1.x.x](./readme/backlog/v1.x.x.md)

## 项目中所封装的组件

- [Button](./lib/pages/test/button)

## 开发规范

[flutter_luckin_coffee开发规范](./readme/开发规范.md)

## 项目目录

``` tree
.
├── lib                                         // 项目源代码
│   ├── assets                                  // 静态资源文件
│   ├── constants                               // 全局常量
│   ├── createIconfont.dart                     // 通过iconfont自动生成Icon
│   ├── main.dart                               // 入口文件
│   ├── pages                                   // 页面
│   │   └── toolbar                             // 导航栏
│   ├── routes                                  // 路由配置
│   ├── utils                                   // 公用方法
│   └── widgets                                 // 公用widge
├── readme                                      // README.md相关
└── test                                        // 测试文件夹
```

## 预览图

更多预览图请到[readme/images](./readme/images)下查看。

<img src="./readme/images/1.gif" width="375"/>