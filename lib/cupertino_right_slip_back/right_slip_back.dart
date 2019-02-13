import 'package:flutter/cupertino.dart';

class RightSlipBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          width: 100.0,
          height: 100.0,
          color: CupertinoColors.activeGreen,
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                // 点击创建自己同样的页面，主要用来测试右滑返回，因为Cupertino自带了右滑返回效果
                builder: (BuildContext context) => RightSlipBack())),
          ),
        ),
      ),
    );
  }
}
