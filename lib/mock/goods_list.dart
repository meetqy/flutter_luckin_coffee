import 'package:flutter_luckin_coffee/mock/goods_category.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

class MockGoods {
  final int categoryId;
  final String characteristic;
  final int originalPrice;
  final String name;
  final String pic;

  const MockGoods({
    this.categoryId,
    this.characteristic,
    this.originalPrice,
    this.name,
    this.pic,
  });

  static List<MockGoods> _data = [];

  static data() {
    var category = MockGoodsCategory.data();
    if (_data.isEmpty) {
      category.forEach((element) {
        var categoryId = category.indexOf(element);

        List.generate(mock.integer(min: 1, max: 9), (index) {
          _data.add(
            MockGoods(
                categoryId: categoryId,
                characteristic: mock.cword(max: 36),
                originalPrice: mock.integer(min: 9, max: 99),
                name: mock.cword(max: 6),
                pic:
                    'https://cdn.wcao.cc/assets/avatar/coffee/${mock.integer(min: 1, max: 12)}.jpg'),
          );
        });
      });
    }

    return _data;
  }
}
