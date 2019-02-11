import 'package:flutter/material.dart';
import 'serch_bar_delegate.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('带搜索历史和推荐的搜索栏'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: SearchBarDelegate()),
          )
        ],
      ),
    );
  }
}
