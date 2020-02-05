import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentCellState>>{
      CommentCellAction.action: _onAction,
    },
  );
}

CommentCellState _onAction(CommentCellState state, Action action) {
  final CommentCellState newState = state.clone();
  return newState;
}
