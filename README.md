<!--
 * @Author: meetqy
 * @since: 2019-08-10 16:41:08
 * @lastTime: 2019-08-20 10:01:01
 * @LastEditors: meetqy
 -->
# flutter_luckin_coffee

flutter实战demo，仿luckin coffee。

## 前言

- 为什么会有这个项目？

> 了解到了flutter这个框架，并且和rn和uniapp的实现跨平台的思路完全不一样。做了一些demo之后，感觉挺有意思的，所以想做一个完整的项目，体验学习一下。

- 为什么用luckin coffee？不知道这算不算侵权

> luckin coffee在网上能搜索到原型+设计图好像是开源的，为了方便。[luckin coffee原型+设计图](https://www.xiaopiu.com/user?uid=5d478fe8174ff47f357b8b00&tab=collectProject&libPop=project&libId=5c306b252d5cd56e70a1e640)

##### - 注： 正常下单请到luckin coffee官方客户端

## version

``` bash
Flutter 1.7.8+hotfix.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 20e59316b8 (4 weeks ago) • 2019-07-18 20:04:33 -0700
Engine • revision fee001c93f
Tools • Dart 2.4.0
```

## 版本计划

### - v1.0版本侧重于页面实现

- 完成所有页面的开发（不包括动画交互）
- 完成动画交互
- 优化代码

### - v2.0版本侧重于前后端交互（后端用api工厂）

- 接入api工厂
- 准备app所需要的数据
- 完成联调

### - v3.0版本侧重优化总结

- code review

## 安卓扫描二维码下载

![](./Android.png)

## 开发规范

[flutter_luckin_coffee开发规范](./readme/开发规范.md)

## backlog

[v1.0.0 60个静态界面开发（不包括交互）](./readme/backlog/v1.0.0.md)

##### -  注：v1.0.0只注重ui界面开发，难一点的动画||交互效果会单独提出来，下个迭代在开发

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
└── test                                        // 测试文件夹（后期可能会放在每个对应的page下面）
```

## 预览图

更多预览图请到[readme/images](./readme/images)下查看。

<img src="./readme/images/1.gif" width="375"/>