<!--
 * @Author: meetqy
 * @since: 2019-08-10 16:41:08
 * @lastTime: 2019-09-29 17:45:47
 * @LastEditors: meetqy
 -->
# flutter_luckin_coffee

A complete flutter simulation luckin coffee demo, using the API factory as the background.

flutter实战demo，仿luckin coffee。

![alt text](./readme/images/githead1.png)

## 前言

- 为什么会有这个项目？

> 了解到了flutter这个框架，并且和rn和uniapp的实现跨平台的思路完全不一样。做了一些demo之后，感觉挺有意思的，所以想做一个完整的项目，体验学习一下。

- 为什么用luckin coffee？

> luckin coffee在网上能搜索到原型+设计图好像是开源的，为了方便。[luckin coffee原型+设计图](https://www.xiaopiu.com/square?libPop=project&libId=5c306b252d5cd56e70a1e640)

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

## 版本计划 · 当前版本 v2.0.0

### - v1.0版本侧重于页面实现

- [x] 完成所有页面的开发（不包括动画交互) tag: v1.0.0-完成所有页面的开发（不包括动画交互）
- [x] 完成动画交互
- [x] 优化代码

### - v2.0版本侧重于前后端交互（后端用api工厂）

- [ ] 接入api工厂
- [ ] 准备app所需要的数据
- [ ] 完成联调

### - v3.0版本侧重优化总结

- [ ] code review

## 当前版本进度 - 数据准备&联调

v1.0版本所遗留的问题

- [ ] 选择区号页面，动画效果（和iphone电话薄的效果一样）没有找到实现的方法。
- [ ] 待实现：菜单界面，点击左侧菜单，右侧商品列表跳转
- [ ] 待解决：从非toolbar页面跳转到toolbar页面的入场动画不一致

> 以上是上个版本遗留的问题 ----------------------------

- [ ] provider调研
- [ ] 接入provider
- [x] 网络请求调研
- [ ] 在api工厂，准备app需要的数据
- [x] 菜单联调
- [ ] 请求等待返回数据增加loading
- [ ] 商品详情联调
- [ ] 订单联调
- [ ] 购物车联调

## backlog

- [v1.x.x](./readme/backlog/v1.x.x.md)
- [v2.x.x](./readme/backlog/v2.x.x.md)

## 项目中所封装的组件

- [AButton 按钮](./lib/components/abutton)
- [AStepper 步进器](./lib/components/astepper)
- [ADialog 弹出框](./lib/components/adialog)
- [ARow 行](./lib/components/arow)
- [ACheckBox 复选框](./lib/components/acheckbox)


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

<img src="./readme/images/1.gif" width="375"/>&emsp;&emsp;&emsp;&emsp;<img src="./readme/images/2.gif" width="375"/>
