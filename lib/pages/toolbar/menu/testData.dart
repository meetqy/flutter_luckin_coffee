final menuList = {
  "1": {
    "id": 1,
    "name": "人气Top",
  },
  "2": {"id": 2,"name": "大师咖啡", "desc": "WBC（世界咖啡师大赛）冠军团队拼配 \n2018 IIAC国际咖啡品鉴大赛金奖咖啡豆"},
  "3": {"id": 3,"name": "零度拿铁"},
  "4": {"id": 4,"name": "瑞纳冰"},
  "5": {"id": 5,"name": "经典饮品"},
  "6": {"id": 6,"name": "健康轻食"},
  "7": {"id": 7,"name": "鲜榨果蔬汁"},
};

final goodsList = [
  {
    "id": 1,
    "list": [
      {
        "id": 1001,
        "name": "榛果拿铁",
        "imgsrc": 'lib/assets/images/menu/goods1.png',
        "desc": "Hazlnut Latte",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        "active": "买3赠1",
        // "recomment": {      // 推荐
        //   "spec": spec["1"],
        //   "temperature": temperature["1"],
        //   "sugar": sugar["2"],
        // }
      },
      {
        "id": 1002,
        "name": "桃桃冰",
        "imgsrc": 'lib/assets/images/menu/goods.png',
        "desc": "Peach & Rose Exfreezo",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        "active": "买2赠1"
        // "recomment": {      // 推荐
        //   "spec": spec["1"],
        //   "temperature": temperature["1"],
        //   "sugar": sugar["2"],
        // }
      },
    ]
  },
  {
    "id": 2,
    "list": [
      {
        "id": 2001,
        "name": "榛果拿铁-大师咖啡",
        "imgsrc": 'lib/assets/images/menu/goods2.png',
        "desc": "Hazlnut Latte",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        "active": "满20减5",
        "recomment": {      // 推荐
          "spec": spec["1"],
          "temperature": temperature["1"],
          "sugar": sugar["2"],
        }
      },
      {
        "id": 2002,
        "name": "桃桃冰-大师咖啡",
        "imgsrc": 'lib/assets/images/menu/goods3.png',
        "desc": "Peach & Rose Exfreezo",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        // "recomment": {      // 推荐
        //   "spec": spec["1"],
        //   "temperature": temperature["1"],
        //   "sugar": sugar["2"],
        // }
      },
    ]
  },
  {
    "id": 3,
    "list": [
      {
        "id": 3001,
        "name": "榛果拿铁-零度拿铁",
        "imgsrc": 'lib/assets/images/menu/goods.png',
        "desc": "Hazlnut Latte",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        "active": "满20减5",
        "recomment": {      // 推荐
          "spec": spec["1"],
          "temperature": temperature["1"],
          "sugar": sugar["2"],
        }
      },
      {
        "id": 3002,
        "name": "桃桃冰-零度拿铁",
        "imgsrc": 'lib/assets/images/menu/goods.png',
        "desc": "Peach & Rose Exfreezo",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        "recomment": {      // 推荐
          "spec": spec["1"],
          "temperature": temperature["1"],
          "sugar": sugar["2"],
        }
      },
    ]
  },
  {
    "id": 4,
    "list": [
      {
        "id": 4001,
        "name": "榛果拿铁-瑞纳冰",
        "imgsrc": 'lib/assets/images/menu/goods.png',
        "desc": "Hazlnut Latte",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "active": "买3赠1",
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        // "recomment": {      // 推荐
        //   "spec": spec["1"],
        //   "temperature": temperature["1"],
        //   "sugar": sugar["2"],
        // }
      },
      {
        "id": 4002,
        "name": "桃桃冰-瑞纳冰",
        "imgsrc": 'lib/assets/images/menu/goods2.png',
        "desc": "Peach & Rose Exfreezo",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        "recomment": {      // 推荐
          "spec": spec["1"],
          "temperature": temperature["1"],
          "sugar": sugar["2"],
        }
      },
    ]
  },
  {
    "id": 5,
    "list": [
      {
        "id": 5001,
        "name": "榛果拿铁-经典饮品",
        "imgsrc": 'lib/assets/images/menu/goods1.png',
        "desc": "Hazlnut Latte",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        // "recomment": {      // 推荐
        //   "spec": spec["1"],
        //   "temperature": temperature["1"],
        //   "sugar": sugar["2"],
        // }
      },
      {
        "id": 5002,
        "name": "桃桃冰-经典饮品",
        "imgsrc": 'lib/assets/images/menu/goods.png',
        "desc": "Peach & Rose Exfreezo",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        // "recomment": {      // 推荐
        //   "spec": spec["1"],
        //   "temperature": temperature["1"],
        //   "sugar": sugar["2"],
        // }
      },
    ]
  },
  {
    "id": 6,
    "list": [
      {
        "id": 6001,
        "name": "榛果拿铁-健康轻食",
        "imgsrc": 'lib/assets/images/menu/goods3.png',
        "desc": "Hazlnut Latte",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        "recomment": {      // 推荐
          "spec": spec["1"],
          "temperature": temperature["1"],
          "sugar": sugar["2"],
          "active": "买3赠1",
        }
      },
      {
        "id": 6002,
        "name": "桃桃冰-健康轻食",
        "imgsrc": 'lib/assets/images/menu/goods.png',
        "desc": "Peach & Rose Exfreezo",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        "recomment": {      // 推荐
          "spec": spec["1"],
          "temperature": temperature["1"],
          "sugar": sugar["2"],
        }
      },
    ]
  },
  {
    "id": 7,
    "list": [
      {
        "id": 7001,
        "name": "榛果拿铁-鲜榨果蔬汁",
        "imgsrc": 'lib/assets/images/menu/goods1.png',
        "desc": "Hazlnut Latte",
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        "recomment": {      // 推荐
          "spec": spec["1"],
          "temperature": temperature["1"],
          "sugar": sugar["2"],
        }
      },
      {
        "id": 7002,
        "name": "桃桃冰-鲜榨果蔬汁",
        "desc": "Peach & Rose Exfreezo",
        "imgsrc": 'lib/assets/images/menu/goods2.png',
        "price": 27,
        "spec": [spec["1"], spec["3"]],         // 规格
        "temperature": [temperature["1"], temperature["2"]],  // 温度
        "sugar": [sugar["2"], sugar["3"]],        // 糖度
        // "recomment": {      // 推荐
        //   "spec": spec["1"],
        //   "temperature": temperature["1"],
        //   "sugar": sugar["2"],
        // }
      },
    ]
  },
];

/// 规格
final spec = {
  "1": {"id": 1, "name": "大"},
  "2": {"id": 2, "name": "中"},
  "3": {"id": 3, "name": "小"},
};

/// 温度
final temperature = {
  "1": {"id": 1, "name": "常温"},
  "2": {"id": 2, "name": "冰"},
  "3": {"id": 3, "name": "热"},
};

/// 糖度
final sugar = {
  "1": {"id": 1, "name": "全糖"},
  "2": {"id": 2, "name": "无糖"},
  "3": {"id": 3, "name": "单份糖"},
  "3": {"id": 3, "name": "半份糖"},
};