import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MoreState> buildReducer() {
  return asReducer(
    <Object, Reducer<MoreState>>{
      MoreAction.action: _onAction,
    },
  );
}

MoreState _onAction(MoreState state, Action action) {
  final MoreState newState = state.clone();
  return newState;
}
