import 'package:flutter/material.dart';
import 'draggable_box.dart';

class DropBox extends StatefulWidget {
  @override
  _DropBoxState createState() => _DropBoxState();
}

class _DropBoxState extends State<DropBox> {
  Color _boxColor = Colors.blueGrey; // 盒子默认颜色

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖拽接收数据'),
      ),
      body: Stack(
        children: <Widget>[
          DraggableBox(
            boxOffset: Offset(80.0, 80.0),
            boxColor: Colors.lightGreen,
          ),
          DraggableBox(
            boxOffset: Offset(200.0, 80.0),
            boxColor: Colors.tealAccent,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color) => _boxColor = color,
              builder: (context, candidateData, rejectedData) => Container(
                    width: 200.0,
                    height: 200.0,
                    color: _boxColor,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
