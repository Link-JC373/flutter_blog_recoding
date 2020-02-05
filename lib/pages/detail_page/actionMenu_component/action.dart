import 'package:blog_flutter/model/favorites.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ActionMenuAction {
  action,
  onChangeFavState,
  getFavList,
  onIsLogin,
  change,
  onCancelFav,
  onFav,
}

class ActionMenuActionCreator {
  static Action onAction() {
    return const Action(ActionMenuAction.action);
  }

  static Action change(bool flag) {
    return Action(ActionMenuAction.change, payload: flag);
  }

  static Action onChangeFavState() {
    return const Action(ActionMenuAction.onChangeFavState);
  }

  static Action getFavList(FavListModel favListModel) {
    return Action(ActionMenuAction.getFavList, payload: favListModel);
  }

  static Action onIsLogin() {
    return Action(ActionMenuAction.onIsLogin);
  }

  static Action onCancelFav(var data) {
    return Action(ActionMenuAction.onCancelFav, payload: data);
  }

  static Action onFav(var data) {
    return Action(ActionMenuAction.onFav, payload: data);
  }
}
