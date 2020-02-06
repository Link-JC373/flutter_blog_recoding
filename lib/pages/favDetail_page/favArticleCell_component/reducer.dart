import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FavArticleCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<FavArticleCellState>>{
      FavArticleCellAction.action: _onAction,
    },
  );
}

FavArticleCellState _onAction(FavArticleCellState state, Action action) {
  final FavArticleCellState newState = state.clone();
  return newState;
}
