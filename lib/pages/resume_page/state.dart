import 'package:blog_flutter/global_store/state.dart';
import 'package:blog_flutter/model/articleList.dart';
import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/model/myCommentList.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ResumeState implements GlobalBaseState, Cloneable<ResumeState> {
  List<String> tabs = [
    '文章',
    '评论',
    '更多',
  ];
  TabController tabController;
  ScrollController scrollController;
  MyCommentListModel myComment;
  ArticleListModel myArticle;
  int userId = 1;
  String loadType = '文章';
  bool isSelf;
  User user;
  @override
  ResumeState clone() {
    return ResumeState()
      ..tabController = tabController
      ..scrollController = scrollController
      ..userId = userId
      ..myArticle = myArticle
      ..myComment = myComment
      ..loadType = loadType
      ..user = user
      ..isSelf = isSelf
      ..userInfo = userInfo
      ..tabs = tabs;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

ResumeState initState(Map<String, dynamic> args) {
  ResumeState state = ResumeState();
  // state.userId = args['userId'];
  print(args);
  state.user = args['user'];
  // print(state.user.username);
  state.isSelf = args['isSelf'];
  return state;
}
