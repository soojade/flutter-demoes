import 'package:flutter/material.dart';

class CollapsePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('折叠磁贴'),
      ),
      body: Center(
          child: ExpansionTile(
        title: Text('这里是磁贴标题'),
        leading: Icon(Icons.add_comment),
        backgroundColor: Colors.blueGrey, // 嵌套的子元素会继承颜色，重新设置覆盖
        children: <Widget>[
          ListTile(
            title: Text('这里是展开的内容'),
            subtitle: Text('这大概就是子内容吧'),
          ),
          Center(
              // 嵌套一个磁贴，点开后和父容器并列显示
              child: ExpansionTile(
            title: Text('这里是磁贴标题2'),
            leading: Icon(Icons.bookmark),
            children: <Widget>[
              ListTile(
                title: Text('这里是展开的内容'),
                subtitle: Text('这大概就是子内容吧'),
              ),
            ],
          )),
        ],
//        initiallyExpanded: true, // true表示默认是展开的，不写默认false：关闭
      )),
    );
  }
}
