import 'package:flutter/material.dart';

class AccordionList extends StatefulWidget {
  @override
  _AccordionListState createState() => _AccordionListState();
}

class _AccordionListState extends State<AccordionList> {
  int currentIndex = -1; // 当前索引
  List<int> indexList; // 存放所有的索引
  List<Accordion> accordionList; // 存放每个磁贴

  // 使用构造方法初始化定义的列表
  _AccordionListState() {
    indexList = [];
    accordionList = [];
    // 设定列表只有10个磁贴
    for (int i = 0; i < 10; i++) {
      indexList.add(i);
      accordionList.add(Accordion(i, false));
    }
  }

  // 修改展开闭合状态
  _setTag(int index, bool isExpanded) {
    setState(() {
      accordionList.forEach((item) {
        item.isExpanded = false; // 每次都重新全部设为false，这样同时只能有一个是打开的
        if (item.index == index) {
          item.isExpanded = !isExpanded;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手风琴效果展示'),
      ),
      // ExpansionPanelList 必须包含在一个可滚动组件中，
      // 而 SingleChildScrollView 是最简单的滚动组件
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) =>
              _setTag(index, isExpanded), // 通过回调函数更改开合状态
          children: indexList
              .map(
                (index) => ExpansionPanel(
                    headerBuilder: (context, isExpanded) => ListTile(
                          title: Text('No.$index'),
                        ),
                    body: ListTile(
                      title: Text('我是$index号'),
                    ),
                    isExpanded: accordionList[index].isExpanded // 是否打开
                    ),
              )
              .toList(), // 转换成列表
        ),
      ),
    );
  }
}

// 定义一个类来保存每个磁贴的属性
class Accordion {
  int index;
  bool isExpanded;
  Accordion(this.index, this.isExpanded);
}
