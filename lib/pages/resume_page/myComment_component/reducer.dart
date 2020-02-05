import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyCommentState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyCommentState>>{
      MyCommentAction.action: _onAction,
    },
  );
}

MyCommentState _onAction(MyCommentState state, Action action) {
  final MyCommentState newState = state.clone();
  return newState;
}
