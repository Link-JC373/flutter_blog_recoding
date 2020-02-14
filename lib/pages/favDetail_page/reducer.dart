import 'package:blog_flutter/model/favArticleList.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FavDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<FavDetailState>>{
      FavDetailAction.action: _onAction,
      FavDetailAction.getUser: _getUser,
      FavDetailAction.loadMore: _loadMore,
      FavDetailAction.initFavArticle: _initFavArticle,
    },
  );
}

FavDetailState _onAction(FavDetailState state, Action action) {
  final FavDetailState newState = state.clone();
  return newState;
}

FavDetailState _loadMore(FavDetailState state, Action action) {
  final FavDetailState newState = state.clone();
  FavArticleListModel favArticleListModel =
      action.payload ?? FavArticleListModel(List<FavArticleListResult>());
  newState.favArticleListModel.pageNum = favArticleListModel.pageNum;
  newState.favArticleListModel.count = favArticleListModel.count;
  newState.favArticleListModel.updatedAt = favArticleListModel.updatedAt;
  print(newState.favArticleListModel.results);
  print(favArticleListModel.results);
  newState.favArticleListModel.results.addAll(favArticleListModel.results);
  return newState;
}

FavDetailState _initFavArticle(FavDetailState state, Action action) {
  final FavDetailState newState = state.clone();
  newState.favArticleListModel = action.payload != null
      ? FavArticleListModel(action.payload)
      : FavArticleListModel.fromParams(results: List<FavArticleListResult>());
  return newState;
}

FavDetailState _getUser(FavDetailState state, Action action) {
  final FavDetailState newState = state.clone();
  print(action.payload);
  User user = action.payload != null ? User(action.payload) : User({});
  print('=============');
  print(user.username);
  newState.user = user;
  return newState;
}
