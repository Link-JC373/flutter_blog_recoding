import 'package:fish_redux/fish_redux.dart';

class ArticleListAdapterState implements Cloneable<ArticleListAdapterState> {

  @override
  ArticleListAdapterState clone() {
    return ArticleListAdapterState();
  }
}

ArticleListAdapterState initState(Map<String, dynamic> args) {
  return ArticleListAdapterState();
}
