import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchbarComponentState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchbarComponentState>>{
      SearchbarComponentAction.action: _onAction,
    },
  );
}

SearchbarComponentState _onAction(SearchbarComponentState state, Action action) {
  final SearchbarComponentState newState = state.clone();
  return newState;
}
