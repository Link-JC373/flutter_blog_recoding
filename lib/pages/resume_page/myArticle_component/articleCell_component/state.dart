import 'package:blog_flutter/model/articleList.dart';
import 'package:fish_redux/fish_redux.dart';

class ArticleCellState implements Cloneable<ArticleCellState> {
  ArticleListResult alr;
  @override
  ArticleCellState clone() {
    return ArticleCellState()..alr = alr;
  }
}

ArticleCellState initState(Map<String, dynamic> args) {
  return ArticleCellState();
}
