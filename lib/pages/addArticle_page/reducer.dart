import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddArticleState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddArticleState>>{
      AddArticleAction.action: _onAction,
      AddArticleAction.changeChoose: _changeChoose,
    },
  );
}

AddArticleState _onAction(AddArticleState state, Action action) {
  final AddArticleState newState = state.clone();
  return newState;
}

AddArticleState _changeChoose(AddArticleState state, Action action) {
  final AddArticleState newState = state.clone();
  newState.onChoose = action.payload;
  return newState;
}
