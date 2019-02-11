import 'package:flutter/material.dart';
import 'asset.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  // 搜索栏右侧按钮图标，点击清除搜索内容
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => query = '',
        )
      ];

  // 搜索栏左侧图标按钮，点击关闭搜索界面
  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null),
      );

  // 搜索结果界面
  @override
  Widget buildResults(BuildContext context) => Container(
        width: 100.0,
        height: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      );

  // 搜索建议和历史
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? suggestionList
        : searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
            title: RichText(
              text: TextSpan(
                  text: suggestions[index].substring(0, query.length), // 匹配字加粗
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text:
                            suggestions[index].substring(query.length), // 不匹配变灰
                        style: TextStyle(color: Colors.grey, fontSize: 20.0))
                  ]),
            ),
          ),
    );
  }
}
