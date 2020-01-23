import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ToCommentState> buildReducer() {
  return asReducer(
    <Object, Reducer<ToCommentState>>{
      ToCommentAction.action: _onAction,
    },
  );
}

ToCommentState _onAction(ToCommentState state, Action action) {
  final ToCommentState newState = state.clone();
  return newState;
}
