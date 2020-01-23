import 'package:blog_flutter/pages/commentDetail_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentDetailState>>{
      TcListAction.action: _onAction,
    },
  );
}

CommentDetailState _onAction(CommentDetailState state, Action action) {
  final CommentDetailState newState = state.clone();
  return newState;
}
