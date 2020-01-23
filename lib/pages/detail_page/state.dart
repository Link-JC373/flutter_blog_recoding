import 'package:blog_flutter/global_store/state.dart';
import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:blog_flutter/pages/detail_page/comment_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class DetailState implements GlobalBaseState, Cloneable<DetailState> {
  bool isFocus = false;
  int articleId;
  int userId;
  var articleContent;
  bool isLiked;
  int likeCount;
  User author;

  TextEditingController textController = new TextEditingController();
  ScrollController scrollController = new ScrollController();
  CommentListModel commentList =
      new CommentListModel.fromParams(results: List<CommentListResult>());

  @override
  DetailState clone() {
    return DetailState()
      ..isFocus = isFocus
      ..articleId = articleId
      ..userId = userId
      ..articleContent = articleContent
      ..isLiked = isLiked
      ..likeCount = likeCount
      ..commentList = commentList
      ..userInfo = userInfo
      ..author = author
      ..scrollController = scrollController;
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

// class CommentConnect extends ConnOp<DetailState, CommentState> {
//   @override
//   CommentState get(DetailState state) {
//     CommentState subState = CommentState();
//     return subState;
//   }
// }
