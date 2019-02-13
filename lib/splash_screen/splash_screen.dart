import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller; // 动画控制器
  Animation _animation; // 动画

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    // 动画状态监听，结束后页面跳转
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => route == null);
      }
    });

    _controller.forward(); // 播放动画
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // 销毁控制器
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=211749983,3875326247&fm=26&gp=0.jpg',
        scale: 2, // 缩放，默认1，值越大，图越小
        fit: BoxFit.cover,
      ),
    );
  }
}
