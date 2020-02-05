import 'package:blog_flutter/model/articleList.dart';
import 'package:blog_flutter/pages/resume_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class MyArticleState implements Cloneable<MyArticleState> {
  ArticleListModel articleList =
      new ArticleListModel.fromParams(results: List<ArticleListResult>());
  ScrollController articleController;
  @override
  MyArticleState clone() {
    return MyArticleState()
      ..articleList = articleList
      ..articleController = articleController;
  }
}

MyArticleState initState(Map<String, dynamic> args) {
  return MyArticleState();
}

class MyArticleConnector extends ConnOp<ResumeState, MyArticleState> {
  @override
  MyArticleState get(ResumeState state) {
    MyArticleState substate = new MyArticleState();
    substate.articleList = state.myArticle;
    // print(state.myArticle);
    // substate.articleController = state.articleController;
    return substate;
  }

  @override
  void set(ResumeState state, MyArticleState subState) {
    state.myArticle = subState.articleList;
  }
}
