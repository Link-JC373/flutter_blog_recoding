import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalStoreAction.action: _onAction,
      GlobalStoreAction.loginAction: _loginAction,
    },
  );
}

GlobalState _onAction(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  return newState;
}

GlobalState _loginAction(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  newState.userInfo = action.payload ?? {};
  return newState;
}
