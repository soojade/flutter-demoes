import 'package:flutter/material.dart';

class ClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path(); // 剪切路径
    var _w = size.width; // 剪切目标的宽
    var _h = size.height; // 剪切目标的高
    var _controlPoint1 = Offset(_w / 4, _h); // 控制点
    var _endPoint1 = Offset(_w / 2.2, _h - 40); // 结束点
    var _controlPoint2 = Offset(_w / 4 * 3, _h - 90);
    var _endPoint2 = Offset(_w, _h - 60);

    path
      ..lineTo(0, 0)
      ..lineTo(0, _h - 10)
      ..quadraticBezierTo(
          _controlPoint1.dx, _controlPoint1.dy, _endPoint1.dx, _endPoint1.dy)
      ..quadraticBezierTo(
          _controlPoint2.dx, _controlPoint2.dy, _endPoint2.dx, _endPoint2.dy)
      ..lineTo(_w, _h - 60)
      ..lineTo(_w, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // 必须要覆写的方法，没有改动，返回false
  }
}
