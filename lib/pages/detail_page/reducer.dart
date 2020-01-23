import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<DetailState>>{
      DetailAction.action: _onAction,
      DetailAction.initAction: _initReducer,
      DetailAction.getForcus: _getForcus,
      DetailAction.clickBlank: _cbReducer,
      DetailAction.upLikeData: _likeData,
      DetailAction.addCommentList: _addCommentList,
      DetailAction.bindScroll: _bindScroll,
      DetailAction.refreshCommentList: _refreshCommentList,
    },
  );
}

DetailState _onAction(DetailState state, Action action) {
  final DetailState newState = state.clone();
  return newState;
}

DetailState _bindScroll(DetailState state, Action action) {
  final DetailState newState = state.clone();
  newState.scrollController = action.payload;
  return newState;
}

DetailState _addCommentList(DetailState state, Action action) {
  final DetailState newState = state.clone();
  CommentListModel commentList = action.payload ??
      CommentListModel.fromParams(results: List<CommentListResult>());
  print(newState.commentList.page);
  print(commentList.page);
  newState.commentList.page = commentList.page;
  newState.commentList.totalPages = commentList.totalPages;
  newState.commentList.totalResults = commentList.totalResults;
  newState.commentList.results.addAll(commentList.results);
  return newState;
}

DetailState _refreshCommentList(DetailState state, Action action) {
  final DetailState newState = state.clone();
  CommentListModel commentList = action.payload ??
      CommentListModel.fromParams(results: List<CommentListResult>());
  newState.commentList = commentList;
  return newState;
}

DetailState _getForcus(DetailState state, Action action) {
  final DetailState newState = state.clone();

  newState.isFocus = true;

  return newState;
}

DetailState _cbReducer(DetailState state, Action action) {
  final DetailState newState = state.clone();
  newState.isFocus = false;

  return newState;
}

DetailState _likeData(DetailState state, Action action) {
  final DetailState newState = state.clone();
  // var likeData = action.payload ?? {};
  // newState.isLiked = likeData['isLiked'];
  // newState.likeCount = likeData['likeData'];
  // likeData['isLiked'] = !likeData['isLiked'];
  bool isLiked = state.isLiked;

  int likeCount = state.likeCount;
  likeCount = isLiked ? likeCount - 1 : likeCount + 1;
  newState.likeCount = likeCount;
  newState.isLiked = !state.isLiked;

  return newState;
}

DetailState _initReducer(DetailState state, Action action) {
  final DetailState newState = state.clone();
  var detailData = action.payload ?? [];
  // print(detailData['isLike']);
  newState.isLiked = detailData['data']['isLike'];
  newState.articleContent = detailData['data']['article_content'];
  newState.likeCount = detailData['data']['likeCount'];
  newState.author = User(detailData['data']['user']);
  return newState;
}
