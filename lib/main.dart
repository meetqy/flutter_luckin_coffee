import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/get_pages.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Flutter Luckin Coffee',
    initialRoute: '/',
    getPages: pages,
  ));
}
