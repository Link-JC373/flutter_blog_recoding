import 'package:blog_flutter/model/favorites.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavoritesAction {
  action,
  onAddFav,
  getFavList,
  changeIsSelf,
  onShowDialog,
}

class FavoritesActionCreator {
  static Action onAction() {
    return const Action(FavoritesAction.action);
  }

  static Action onAddFav(String favName) {
    return Action(FavoritesAction.onAddFav, payload: favName);
  }

  static Action getFavList(FavListModel favListModel) {
    return Action(FavoritesAction.getFavList, payload: favListModel);
  }

  static Action onShowDialog() {
    return Action(FavoritesAction.onShowDialog);
  }

  static Action changeIsSelf(bool flag) {
    return Action(FavoritesAction.changeIsSelf, payload: flag);
  }
}
