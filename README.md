![app_head](./readme/images/githead1.png)

# flutter_luckin_coffee 2.0

> flutter luckin coffee application（仿瑞幸咖啡）

老版本使用 `api工厂` 的分支 [v1.0](https://gitee.com/meetqy/flutter_luckin_coffee/tree/v1.0/),如果有之前克隆过数据的同学,可以评论区留言或私信我**你的 ID**

## Flutter Version

```
Flutter 2.10.5 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 5464c5bac7 (8 weeks ago) • 2022-04-18 09:55:37 -0700
Engine • revision 57d3bac3dd
Tools • Dart 2.16.2 • DevTools 2.9.2
```

## Wiki

总结，升级 2.0 过程中，遇到问题解决的思路，以及最终使用的方法，希望对你有帮助！！！

[升级 flutter 2.0 总结](https://gitee.com/meetqy/flutter_luckin_coffee/wikis/%E5%8D%87%E7%BA%A72.0%E9%97%AE%E9%A2%98%E6%80%BB%E7%BB%93?sort_id=1729161)

## 升级思路

1. jsonserialize 中之前保留了一份 mockdata.json，使用直接读取 json 的方式代替 dio 请求
2. 移除 dio 相关代码
3. 移除处理请求，数据转换的特殊逻辑
4. mock.js 生成随机数据去替代 mockdata.json
5. `路由方面`的管理和 `provide` 改为`getx`
6. 尽量用原生的方式去替代 a_button, a_checkbox...类似 weight

> 这里不得不说一下，为啥最近又要维护这个项目了，没办法呀公司又开了个 flutter 项目，开发也接近尾声了，有了新的理解，在这个项目上实践一下。

## 进度

- [ ] 本地 mockdata.json 数据替换`api工厂`
- [x] 简化 mockdata 中的数据
- [x] 去掉一些跟 api 工厂强关联的逻辑
- [ ] 升级 flutter 2.10.x
- [ ] 升级插件
- [ ] 移除多余组件，尽量使用原生组件

## 最后大致的方向

项目可能更加会趋向于一个**偏向前端的纯模板**，大家有需要的页面可以直接拷进自己的项目，不用修改很多不必要的逻辑。

类似于这样的：

- [flutter 交友模板](https://github.com/meetqy/flutter_dating_template)
