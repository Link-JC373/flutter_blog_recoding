import 'package:blog_flutter/model/favArticleList.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavDetailAction {
  action,
  initFavArticle,
  getUser,
  loadMore,
}

class FavDetailActionCreator {
  static Action onAction() {
    return const Action(FavDetailAction.action);
  }

  static Action getUser(var user) {
    return Action(FavDetailAction.getUser, payload: user);
  }

  static Action initFavArticle(var data) {
    return Action(FavDetailAction.initFavArticle, payload: data);
  }

  static Action loadMore(FavArticleListModel data) {
    return Action(FavDetailAction.loadMore, payload: data);
  }
}
