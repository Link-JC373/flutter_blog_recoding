import 'package:blog_flutter/model/favorites.dart';
import 'package:blog_flutter/pages/detail_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

class ActionMenuState implements Cloneable<ActionMenuState> {
  bool havingFav = false;
  FavListModel favListModel;
  int articleId;
  //  =
  //     new FavListModel.fromParams(results: List<FavListResult>());
  var userInfo = {};
  @override
  ActionMenuState clone() {
    return ActionMenuState()
      ..havingFav = havingFav
      ..favListModel = favListModel
      ..articleId = articleId
      ..userInfo = userInfo;
  }
}

ActionMenuState initState(Map<String, dynamic> args) {
  return ActionMenuState();
}

class ActionMenuConnector extends ConnOp<DetailState, ActionMenuState> {
  @override
  ActionMenuState get(DetailState state) {
    ActionMenuState subState = new ActionMenuState();
    subState.havingFav = state.havingFav;
    subState.userInfo = state.userInfo;
    subState.favListModel = state.favListModel;
    subState.articleId = state.articleId;
    return subState;
  }

  @override
  void set(DetailState state, ActionMenuState subState) {
    state.havingFav = subState.havingFav;
    state.favListModel = subState.favListModel;
    // return substate;
  }
}
