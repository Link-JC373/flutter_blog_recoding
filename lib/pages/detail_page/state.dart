import 'package:blog_flutter/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class DetailState implements GlobalBaseState, Cloneable<DetailState> {
  bool isFocus = false;
  int articleId;
  int userId;
  var articleContent;
  bool isLiked;
  int likeCount;

  @override
  DetailState clone() {
    return DetailState()
      ..isFocus = isFocus
      ..articleId = articleId
      ..userId = userId
      ..articleContent = articleContent
      ..isLiked = isLiked
      ..likeCount = likeCount
      ..userInfo = userInfo;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

DetailState initState(Map<String, dynamic> args) {
  print(args);

  var state = DetailState();
  state.articleId = args['id'];
  // args['userId'] != null ? state.userId = args['userId'] : state.userId = 0;
  return state;
}
