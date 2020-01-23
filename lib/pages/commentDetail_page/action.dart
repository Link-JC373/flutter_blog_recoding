import 'package:blog_flutter/model/commentList.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommentDetailAction {
  action,
  initData,
  onAddToComment,
  loadSubComments,
  onCommentClick,
  changeFocus,
  saveCommentInfo,
  onIsLogin,
  cleanText
}

class CommentDetailActionCreator {
  static Action onAction() {
    return const Action(CommentDetailAction.action);
  }

  static Action cleanText() {
    return const Action(CommentDetailAction.cleanText);
  }

  static Action onIsLogin() {
    return const Action(CommentDetailAction.onIsLogin);
  }

  static Action changeFocus(bool isFocus) {
    return Action(CommentDetailAction.changeFocus, payload: isFocus);
  }

  static Action onCommentClick() {
    return const Action(CommentDetailAction.onCommentClick);
  }

  static Action onAddToComment(var data) {
    return Action(CommentDetailAction.onAddToComment, payload: data);
  }

  static Action saveCommentInfo(var data) {
    return Action(CommentDetailAction.saveCommentInfo, payload: data);
  }

  static Action initData() {
    return Action(CommentDetailAction.initData);
  }

  static Action loadSubComments(List<ToCommentListResult> tcResult) {
    return Action(CommentDetailAction.loadSubComments, payload: tcResult);
  }
}
