import 'package:blog_flutter/model/favorites.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FavoritesState> buildReducer() {
  return asReducer(
    <Object, Reducer<FavoritesState>>{
      FavoritesAction.action: _onAction,
      FavoritesAction.changeIsSelf: _changeIsSelf,
      FavoritesAction.getFavList: _getFavList,
    },
  );
}

FavoritesState _onAction(FavoritesState state, Action action) {
  final FavoritesState newState = state.clone();
  return newState;
}

FavoritesState _changeIsSelf(FavoritesState state, Action action) {
  final FavoritesState newState = state.clone();
  newState.isSelf = action.payload;
  return newState;
}

FavoritesState _getFavList(FavoritesState state, Action action) {
  final FavoritesState newState = state.clone();
  newState.favList =
      action.payload ?? FavListModel.fromParams(results: List<FavListResult>());
  return newState;
}
