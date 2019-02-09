import 'package:flutter/material.dart';
import 'package:flutter_demoes/irregular_bottom_appBar/irregular_bottom_appBar.dart'; // 不规则导航
// import 'package:flutter_demoes/bottom_navigation_bar/bottom_navigation.dart'; // 底部导航栏

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 去除debug模式时右上角的斜杠
      title: 'flutter 小练习',
      // theme: ThemeData.light(),
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      // home: BottomNavigation(), // 底部导航栏
      home: IrregularBottomAppBar(),
    );
  }
}
