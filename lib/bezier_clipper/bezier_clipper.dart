import 'package:flutter/material.dart';

import 'clipper_path.dart';

class BezierClipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('贝塞尔曲线剪切'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: ClipperPath(), // 自定义剪切路径
            // 要剪切的元素，可以是容器、图片等
            child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550037793408&di=961574d134952d1691907314836ad371&imgtype=0&src=http%3A%2F%2Fimage.tupian114.com%2F20140328%2F10002602.jpg'),
//            child: Container(
//
//              color: Colors.deepOrange,
//              height: 200.0,
//            ),
          )
        ],
      ),
    );
  }
}
