import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get value => _count;

  void add() {
    print('eeeeeeeeeeeeeeeeeeee');
    _count++;
    notifyListeners();
  }
}
