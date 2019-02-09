import 'dart:ui'; // ImageFilter类需要引入

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // 设置背景，方便查看效果
      appBar: AppBar(
        title: Text('毛玻璃特效'),
      ),
      body: Stack(
        children: <Widget>[
          // 带约束条件的盒子
          ConstrainedBox(
            constraints: const BoxConstraints.expand(), // 限制条件：可扩展的
            child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1549718272755&di=8d60b8308ab22c8048fa650aaa0e4c55&imgtype=0&src=http%3A%2F%2F1803.img.pp.sohu.com.cn%2Fimages%2Fblog%2F2008%2F7%2F13%2F14%2F13%2F11bc0b06856g214.jpg'),
          ),
          Center(
            child: ClipRect(
              // 可裁切长方形
              child: BackdropFilter(
                // 背景滤镜
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0, // 效果区域大小
                    height: 600.0,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300), // fade 表示明暗度，值越大月亮
                    child: Center(
                      child: Text('毛玻璃特效',
                          style: Theme.of(context)
                              .textTheme
                              .display3), // display显示文字大小，数字越大，字体越大
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
