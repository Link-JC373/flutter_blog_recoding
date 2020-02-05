import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';
import 'state.dart';

Reducer<FavoritesState> buildReducer() {
  return asReducer(
    <Object, Reducer<FavoritesState>>{
      FavListAction.action: _onAction,
    },
  );
}

FavoritesState _onAction(FavoritesState state, Action action) {
  final FavoritesState newState = state.clone();
  return newState;
}
