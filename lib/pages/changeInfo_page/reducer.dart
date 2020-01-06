import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ChangeInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<ChangeInfoState>>{
      ChangeInfoAction.action: _onAction,
    },
  );
}

ChangeInfoState _onAction(ChangeInfoState state, Action action) {
  final ChangeInfoState newState = state.clone();
  return newState;
}
