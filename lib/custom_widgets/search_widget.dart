import 'package:flutter/material.dart';

// import 'show_article_list.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  // @override
  // String get searchFieldLable => '要搜点什么呢....';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => {query = ""},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () => {
        close(context, null),
      },
    );
  }

  String url = 'searchSomeThing'; //设置请求接口的url
  @override
  Widget buildResults(BuildContext context) {
    //搜索结果
    // return ShowArticleList(
    //   url: url,
    //   searchContent: query,
    // );
    return Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //查询建议
    // final suggestionList = query.isEmpty
    //     ? recentSuggest
    //     : searchList.where((input) => input.startsWith(query)).toList();

    // return ListView.builder(
    //   itemCount: suggestionList.length,
    //   itemBuilder: (context, index) => ListTile(
    //     title: RichText(
    //       text: TextSpan(
    //           text: suggestionList[index].substring(0, query.length),
    //           style:
    //               TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //           children: [
    //             TextSpan(
    //               text: suggestionList[index].substring(query.length),
    //               style: TextStyle(color: Colors.grey),
    //             )
    //           ]),
    //     ),
    //   ),
    // );
    return Text('');
  }
}
