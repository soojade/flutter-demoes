import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipOval(
                      child: Image.network(
                        'https://docs.flutter.io/flutter/static-assets/favicon.png',
                        width: 100.0,
                      ),
                    ),
                  ),
                  Text('flutter', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('添加用户'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('设置'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
