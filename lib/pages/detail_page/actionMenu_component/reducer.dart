import 'package:blog_flutter/model/favorites.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ActionMenuState> buildReducer() {
  return asReducer(
    <Object, Reducer<ActionMenuState>>{
      ActionMenuAction.action: _onAction,
      ActionMenuAction.getFavList: _getFavList,
      ActionMenuAction.change: _change,
    },
  );
}

ActionMenuState _onAction(ActionMenuState state, Action action) {
  final ActionMenuState newState = state.clone();
  return newState;
}

ActionMenuState _change(ActionMenuState state, Action action) {
  final ActionMenuState newState = state.clone();
  newState.havingFav = action.payload;
  print(newState.havingFav);
  return newState;
}

ActionMenuState _getFavList(ActionMenuState state, Action action) {
  final ActionMenuState newState = state.clone();
  print('------------>FavList');
  print(action.payload);
  newState.favListModel =
      action.payload ?? FavListModel.fromParams(results: List<FavListResult>());
  print(newState.favListModel.results.length);
  return newState;
}
