import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ListComponentState> buildReducer() {
  return asReducer(
    <Object, Reducer<ListComponentState>>{
      ListComponentAction.action: _onAction,
    },
  );
}

ListComponentState _onAction(ListComponentState state, Action action) {
  final ListComponentState newState = state.clone();
  return newState;
}
