import 'package:blog_flutter/pages/favDetail_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FavDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<FavDetailState>>{
      FavArticleListAction.action: _onAction,
    },
  );
}

FavDetailState _onAction(FavDetailState state, Action action) {
  final FavDetailState newState = state.clone();
  return newState;
}
