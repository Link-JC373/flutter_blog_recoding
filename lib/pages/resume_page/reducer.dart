import 'dart:convert';

import 'package:blog_flutter/model/articleList.dart';
import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/model/myCommentList.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ResumeState> buildReducer() {
  return asReducer(
    <Object, Reducer<ResumeState>>{
      ResumeAction.action: _onAction,
      ResumeAction.initMyArticle: _initMyArticle,
      ResumeAction.initMyComment: _initMyComment,
      ResumeAction.setIsSelfTrue: _setIsSelfTrue,
      ResumeAction.loadMore: _loadMore,
      ResumeAction.changeType: _changeType,
    },
  );
}

ResumeState _onAction(ResumeState state, Action action) {
  final ResumeState newState = state.clone();
  return newState;
}

ResumeState _changeType(ResumeState state, Action action) {
  final ResumeState newState = state.clone();
  print(action.payload);
  newState.loadType = action.payload;
  print(newState.loadType);
  return newState;
}

ResumeState _setIsSelfTrue(ResumeState state, Action action) {
  final ResumeState newState = state.clone();
  newState.isSelf = true;
  return newState;
}

ResumeState _loadMore(ResumeState state, Action action) {
  // final CommentListModel c = action.payload ??
  //     CommentListModel.fromParams(results: List<CommentListResult>());
  // final ArticleListModel a = action.payload ??
  //     ArticleListModel.fromParams(results: List<ArticleListResult>());

  final ResumeState newState = state.clone();

  switch (newState.loadType) {
    case '文章':
      var data = action.payload ??
          {
            'article':
                ArticleListModel.fromParams(results: List<ArticleListResult>())
          };
      final ArticleListModel a = data['article'];
      newState.myArticle.page = a.page;

      newState.myArticle.results.addAll(a.results);
      break;
    case '评论':
      var data = action.payload ??
          {
            'comment': MyCommentListModel.fromParams(
                results: List<MyCommentListResult>())
          };
      final MyCommentListModel c = data['comment'];
      newState.myComment.page = c.page;
      newState.myComment.results.addAll(c.results);
      break;
    default:
  }
  return newState;
}

ResumeState _initMyComment(ResumeState state, Action action) {
  final MyCommentListModel c = action.payload ??
      MyCommentListModel.fromParams(results: List<MyCommentListResult>());
  final ResumeState newState = state.clone();
  newState.myComment = c;
  return newState;
}

ResumeState _initMyArticle(ResumeState state, Action action) {
  final ArticleListModel a = action.payload ??
      ArticleListModel.fromParams(results: List<ArticleListResult>());
  final ResumeState newState = state.clone();
  newState.myArticle = a;

  return newState;
}
