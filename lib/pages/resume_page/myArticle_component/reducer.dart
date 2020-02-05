import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyArticleState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyArticleState>>{
      MyArticleAction.action: _onAction,
    },
  );
}

MyArticleState _onAction(MyArticleState state, Action action) {
  final MyArticleState newState = state.clone();
  return newState;
}
