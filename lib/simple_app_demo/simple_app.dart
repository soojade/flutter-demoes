import 'package:flutter/material.dart';
import 'drawer.dart';
import 'bottom_app_bar.dart';

class SimpleApp extends StatefulWidget {
  _SimpleAppState createState() => _SimpleAppState();
}

class _SimpleAppState extends State<SimpleApp>
    with SingleTickerProviderStateMixin {
  TabController _tabController; // 控制/监听Tab菜单切换
  List tabs = ['小说', '游戏', '音乐']; // 定义tab栏内容

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("App Name"),
          centerTitle: true, // title是否居中
          backgroundColor: Colors.lightGreen,
          automaticallyImplyLeading:
              true, // 不设定leading自动实现侧边抽屉栏，前提是Scaffold 中设置了 drawer 属性
          bottom: TabBar(
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList())),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs
            .map((e) => Container(
                  alignment: Alignment.center,
                  child: Text(
                    e,
                    textScaleFactor: 3.0,
                  ),
                ))
            .toList(),
      ),
      bottomNavigationBar: MyBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
