import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentState>>{
      CommentAction.action: _onAction,
      CommentAction.changeLikes: _changeLikes,
    },
  );
}

CommentState _onAction(CommentState state, Action action) {
  final CommentState newState = state.clone();
  return newState;
}

CommentState _changeLikes(CommentState state, Action action) {
  final CommentState newState = state.clone();

  if (newState.index == action.payload) {
    if (newState.isLiked) {
      newState.clr.likedList.remove(state.userInfo['userId']);
    } else {
      newState.clr.likedList.add(state.userInfo['userId']);
    }
    newState.isLiked = !newState.isLiked;
  }

  return newState;
}
