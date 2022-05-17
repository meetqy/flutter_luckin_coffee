import 'package:dart_mock/dart_mock.dart' as mock;

class MockGoodsCategory {
  final String name;
  final String desc;

  MockGoodsCategory({this.name, this.desc});

  static List<MockGoodsCategory> _data = [];

  static List<MockGoodsCategory> data() {
    if (_data.isEmpty) {
      ['人气TOP', '大师咖啡', '瑞纳冰', '经典饮品', '健康轻食', '鲜榨果蔬汁'].forEach((item) {
        _data.add(MockGoodsCategory(
          name: item,
          desc: mock.csentence(max: 5),
        ));
      });
    }

    return _data;
  }
}
