import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FavDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<FavDetailState>>{
      FavDetailAction.action: _onAction,
    },
  );
}

FavDetailState _onAction(FavDetailState state, Action action) {
  final FavDetailState newState = state.clone();
  return newState;
}
