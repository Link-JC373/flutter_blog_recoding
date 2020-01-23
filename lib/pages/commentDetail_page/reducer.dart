import 'package:blog_flutter/model/commentList.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentDetailState>>{
      CommentDetailAction.action: _onAction,
      CommentDetailAction.initData: _initData,
      CommentDetailAction.loadSubComments: _loadSubComments,
      CommentDetailAction.changeFocus: _changeFocus,
      CommentDetailAction.saveCommentInfo: _saveCommentInfo,
      CommentDetailAction.cleanText: _cleanText,
    },
  );
}

CommentDetailState _onAction(CommentDetailState state, Action action) {
  final CommentDetailState newState = state.clone();
  return newState;
}

CommentDetailState _cleanText(CommentDetailState state, Action action) {
  final CommentDetailState newState = state.clone();
  newState.textController.text = '';
  return newState;
}

CommentDetailState _saveCommentInfo(CommentDetailState state, Action action) {
  final CommentDetailState newState = state.clone();
  newState.addCommentInfo = action.payload ?? {};
  return newState;
}

CommentDetailState _changeFocus(CommentDetailState state, Action action) {
  final CommentDetailState newState = state.clone();
  newState.isFocus = action.payload;
  if (!newState.isFocus) {
    newState.addCommentInfo['tcId'] = state.clr.user.userId;
    newState.addCommentInfo['tcName'] = state.clr.user.username;
  }

  return newState;
}

CommentDetailState _loadSubComments(CommentDetailState state, Action action) {
  final CommentDetailState newState = state.clone();
  print(action.payload);
  newState.clr.tcResult = action.payload ?? List<ToCommentListResult>();
  return newState;
}

CommentDetailState _initData(CommentDetailState state, Action action) {
  final CommentDetailState newState = state.clone();
  newState.addCommentInfo['tcId'] = state.clr.user.userId;
  newState.addCommentInfo['tcName'] = state.clr.user.username;
  // newState.clr = action.payload ?? CommentListResult.fromParams();
  return newState;
}
