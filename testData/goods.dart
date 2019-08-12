/// 商品

final goods = [
  {
    "name": "摩卡",
    
  }
];


/// 创建商品信息
/// ```
/// @param {String} name - 名字
/// @param {String} enName - 英文名字
/// @param {String} spec - 规格
/// @param {List} temperature - 温度
/// @param {List} sugar - 糖度
/// @param {List} cream - 奶油
/// ```
Map _createGoods({
  String name, 
  String enName,
  String spec,
  List temperature,
  List sugar,
  List cream
}) {
  return {
    "name": name,
    "spec": spec,
    "temperature": temperature == null ? [] : temperature,
    "sugar": sugar == null ? [] : sugar ,
    "cream": cream == null ? [] : cream ,
  };
}