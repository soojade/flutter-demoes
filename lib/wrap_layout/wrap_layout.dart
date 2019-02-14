import 'package:flutter/material.dart';

class WrapLayout extends StatefulWidget {
  @override
  _WrapLayoutState createState() => _WrapLayoutState();
}

class _WrapLayoutState extends State<WrapLayout> {
  List<Widget> imgList; // 存储展示的图片

  @override
  void initState() {
    super.initState();
    imgList = List<Widget>()..add(addButton()); // 初始化list
  }

  Widget addButton() {
    // 使用手势识别控件给没有触发事件的child绑定事件
    return GestureDetector(
      onTap: () {
        // 这里只放9个图片
        if (imgList.length < 9) {
          // 必须使用setState来更新状态
          setState(() {
            imgList.insert(imgList.length - 1, addImg()); // 点击添加图片
          });
        }
      },
      // 使用padding 自动边距方便布局
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.red,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  // 添加图片
  Widget addImg() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      // 额外添加的透明效果，子控件会继承父容器的透明度，
      // 假如父容器透明，子控件透明度设置1.0也还是会透明，
      // 子控件的透明度只有比父容器的透明度小时，才有效。
      child: Opacity(
        opacity: 0.5,
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.lightBlue,
          child: Center(
            child: Text('图片'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 使用媒体查询获取屏幕宽高，来设置Container的宽和高
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wap流式布局'),
      ),
      body: Center(
        child: Opacity(
          // 添加透明效果
          opacity: 0.8,
          child: Container(
            alignment: Alignment.topCenter,
            width: screenW,
            height: screenH / 2,
            color: Colors.lightGreen,
            child: Wrap(
              // 流式布局
              children: imgList,
              spacing: 10.0, // 图片间距
            ),
          ),
        ),
      ),
    );
  }
}
