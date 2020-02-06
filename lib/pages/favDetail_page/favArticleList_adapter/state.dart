import 'package:fish_redux/fish_redux.dart';

class FavArticleListState implements Cloneable<FavArticleListState> {

  @override
  FavArticleListState clone() {
    return FavArticleListState();
  }
}

FavArticleListState initState(Map<String, dynamic> args) {
  return FavArticleListState();
}
