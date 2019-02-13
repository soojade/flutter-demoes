import 'package:flutter/material.dart';

class DraggableBox extends StatefulWidget {
  final Offset boxOffset;
  final Color boxColor;

  // 重写构造函数可以传递位置和颜色
  const DraggableBox({Key key, this.boxOffset, this.boxColor})
      : super(key: key);

  @override
  _DraggableBoxState createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.boxOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
          data: widget.boxColor, // 拖拽传送的数据
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.boxColor,
          ),
          // 拖拽过程中的效果
          feedback: Container(
            width: 110.0,
            height: 110.0,
            color: widget.boxColor.withOpacity(0.5),
          ),
          // 松开后的效果
          onDraggableCanceled: (Velocity velocity, Offset offset) {
            setState(() {
              this.offset = offset; // 更改拖拽后的位置
            });
          }),
    );
  }
}
