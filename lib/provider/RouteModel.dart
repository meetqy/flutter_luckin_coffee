import 'package:flutter/material.dart';

class RouteModel with ChangeNotifier {
  int _count = 0;
  int get value => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}
