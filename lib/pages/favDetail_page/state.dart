import 'package:blog_flutter/model/favArticleList.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class FavDetailState implements Cloneable<FavDetailState> {
  bool isSelf = false;
  User user;
  int userId;
  ScrollController scrollController;
  int favId;
  FavArticleListModel favArticleListModel;
  @override
  FavDetailState clone() {
    return FavDetailState()
      ..isSelf = isSelf
      ..scrollController = scrollController
      ..userId = userId
      ..favArticleListModel = favArticleListModel
      ..favId = favId
      ..user = user;
  }
}

FavDetailState initState(Map<String, dynamic> args) {
  FavDetailState state = FavDetailState();
  state.favId = args['favId'];
  state.userId = args['userId'];
  return state;
}
