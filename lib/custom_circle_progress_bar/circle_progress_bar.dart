import 'package:flutter/material.dart';

import 'dart:math';

class CircleProgressBar extends StatelessWidget {
  final double stokeWidth; // 圆圈宽度
  final double radius; // 半径
  final bool strokeCapRound; // 滚动的进度条两端是否是圆角
  final double value; // 当前进度，取值范围 [0.0-1.0]
  final Color backgroundColor; // 进度条背景色
  final double totalAngle; // 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final List<Color> colors; // 渐变色
  final List<double> stop; // 渐变色的终止点，对应上面colors属性

  CircleProgressBar({
    Key key,
    this.stokeWidth = 2.0,
    this.strokeCapRound = true,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.totalAngle = pi * 2,
    this.value,
    this.stop,
    @required this.radius,
    @required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    if (strokeCapRound) {
      _offset = asin(stokeWidth / (radius * 2 - stokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _CircleProgressPainter(
          stokeWidth: stokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          total: totalAngle,
          radius: radius,
          colors: _colors,
        ),
      ),
    );
  }
}

// 实现画笔
class _CircleProgressPainter extends CustomPainter {
  final double stokeWidth; // 圆宽度
  final bool strokeCapRound; // 进度条是否圆角
  final double value; // 进度值
  final Color backgroundColor; // 背景色
  final List<Color> colors; // 渐变色
  final double total; // 总弧度
  final double radius; // 半径
  final List<double> stop; // 渐变色结束点
  _CircleProgressPainter(
      {this.stokeWidth = 10.0,
      this.strokeCapRound = true,
      this.backgroundColor = const Color(0xffeeeeee),
      this.radius,
      this.value,
      this.total = pi * 2,
      this.stop,
      @required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = stokeWidth / 2.0;
    double _value = (value ?? .0);
    _value =
        _value.clamp(0.0, 1.0) * total; // clamp限定一个范围，值在范围内则返回这个值，不在范围内则返回最大值
    double _start = 0.0;

    // 圆角的时候使用反正弦函数调整偏移度数
    if (strokeCapRound) {
      _start = asin(stokeWidth / (size.width - stokeWidth));
    }
    Rect rect = Offset(_offset, _offset) &
        Size(size.width - stokeWidth, size.height - stokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = stokeWidth;

    // 绘制背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }

    // 应用渐变绘制前景
    if (_value > 0) {
      paint.shader = SweepGradient(
              startAngle: 0.0, endAngle: _value, colors: colors, stops: stop)
          .createShader(rect);
      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(_CircleProgressPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CircleProgressPainter oldDelegate) => false;
}
