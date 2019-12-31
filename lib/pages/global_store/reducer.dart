import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalStoreState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalStoreState>>{
      GlobalStoreAction.action: _onAction,
    },
  );
}

GlobalStoreState _onAction(GlobalStoreState state, Action action) {
  final GlobalStoreState newState = state.clone();
  return newState;
}
