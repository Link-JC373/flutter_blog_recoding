import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/model/favorites.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
// import 'package:flutter/cupertino.dart' hide Action;

//TODO replace with your own action
enum DetailAction {
  action,
  initAction,
  onCommentClick,
  onLikeAction,
  clickBlank,
  upLikeData,
  onGoToLogin,
  onNotification,
  onAddCommentList,
  addCommentList,
  bindScroll,
  getForcus,
  onAddComment,
  refreshCommentList,
  getFavList,
  onGetFavState,
  onJumpToResume,
}

class DetailActionCreator {
  static Action onAction() {
    return const Action(DetailAction.action);
  }

  static Action onJumpToResume(User user) {
    return Action(DetailAction.onJumpToResume, payload: user);
  }

  static Action onAddComment() {
    return const Action(DetailAction.onAddComment);
  }

  static Action onGetFavState() {
    return const Action(DetailAction.onGetFavState);
  }

  static Action getFavList(FavListModel favListModel) {
    return Action(DetailAction.getFavList, payload: favListModel);
  }

  static Action onNotification(ScrollNotification notification) {
    return Action(DetailAction.onNotification, payload: notification);
  }

  static Action bindScroll(ScrollController scrollController) {
    return Action(DetailAction.bindScroll, payload: scrollController);
  }

  static Action addCommentList(CommentListModel commentListModel) {
    return Action(DetailAction.addCommentList, payload: commentListModel);
  }

  static Action refreshCommentList(CommentListModel commentListModel) {
    return Action(DetailAction.refreshCommentList, payload: commentListModel);
  }

  static Action initAction(var detailData) {
    return Action(DetailAction.initAction, payload: detailData);
  }

  static Action onCommentClick() {
    return Action(DetailAction.onCommentClick);
  }

  static Action clickBlank() {
    return Action(DetailAction.clickBlank);
  }

  static Action upLikeData() {
    return Action(DetailAction.upLikeData);
  }

  static Action likeAction() {
    return Action(DetailAction.onLikeAction);
  }

  static Action onGoToLogin() {
    return Action(DetailAction.onGoToLogin);
  }

  static Action onAddCommentList() {
    return Action(DetailAction.onNotification);
  }

  static Action getForcus() {
    return const Action(DetailAction.getForcus);
  }
}
