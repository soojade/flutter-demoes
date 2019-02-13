import 'package:flutter/material.dart';
import 'package:flutter_demoes/bezier_clipper/bezier_clipper.dart'; // 贝塞尔曲线剪切效果
// import 'package:flutter_demoes/accordion_list/accordion_list.dart'; // 手风琴列表
// import 'package:flutter_demoes/collapse_panel/collapse_panel.dart'; // 可折叠的磁贴
//import 'package:flutter_demoes/wrap_layout/wrap_layout.dart'; // wrap 流式布局
// import 'package:flutter_demoes/search_bar/search_bar.dart';  // 搜索栏
// import 'package:flutter_demoes/keep_alive_tab/keep_alive_tab.dart'; // 保持状态的tab
// import 'package:flutter_demoes/frosted_glass/frosted_glass.dart'; // 毛玻璃特效
// import 'package:flutter_demoes/custom_route_animation/pages.dart'; // 自定义路由动画
//import 'package:flutter_demoes/irregular_bottom_appBar/irregular_bottom_appBar.dart'; // 不规则导航
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
      // home: IrregularBottomAppBar(), // 不规则底部工具栏
      // home: Page1(), 自定义路由动画
      // home: FrostedGlass(), // 毛玻璃特效
      // home: KeepAliveTab(), // 保持状态的tab
      // home: SearchBar(), // 搜索栏
      // home: WrapLayout(), // wrap 流式布局
      // home: CollapsePanel(), // 可折叠的磁贴
      // home: AccordionList(), // 手风琴列表
      home: BezierClipper(), // 贝塞尔曲线剪切效果
    );
  }
}
