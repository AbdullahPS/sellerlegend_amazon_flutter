import 'screens/home.dart';
import 'package:flutter/material.dart';
import 'screens/test.dart';

void main() => runApp(WaterApp());

class WaterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'WaterApp', home: Home(), routes: {
      Home.routePathName: (ctx) => Home(),
      Test.routePathName: (ctx) => Test()
    });
  }
}
