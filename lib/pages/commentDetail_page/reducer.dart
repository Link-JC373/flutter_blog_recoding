import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentDetailState>>{
      CommentDetailAction.action: _onAction,
    },
  );
}

CommentDetailState _onAction(CommentDetailState state, Action action) {
  final CommentDetailState newState = state.clone();
  return newState;
}
