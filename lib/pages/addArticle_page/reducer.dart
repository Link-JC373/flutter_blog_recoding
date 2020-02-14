import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddArticleState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddArticleState>>{
      AddArticleAction.action: _onAction,
    },
  );
}

AddArticleState _onAction(AddArticleState state, Action action) {
  final AddArticleState newState = state.clone();
  return newState;
}
