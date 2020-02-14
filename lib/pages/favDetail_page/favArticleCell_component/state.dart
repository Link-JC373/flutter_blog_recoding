import 'package:blog_flutter/model/favArticleList.dart';
import 'package:fish_redux/fish_redux.dart';

class FavArticleCellState implements Cloneable<FavArticleCellState> {
  FavArticleListResult results;
  @override
  FavArticleCellState clone() {
    return FavArticleCellState()..results = results;
  }
}

FavArticleCellState initState(Map<String, dynamic> args) {
  return FavArticleCellState();
}
