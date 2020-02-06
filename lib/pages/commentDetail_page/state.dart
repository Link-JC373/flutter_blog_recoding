import 'dart:ui';

import 'package:blog_flutter/global_store/state.dart';
import 'package:blog_flutter/model/commentList.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class CommentDetailState
    implements GlobalBaseState, Cloneable<CommentDetailState> {
  CommentListResult clr;

  int articleId;
  TextEditingController textController = TextEditingController();
  bool isFocus = false;

  var addCommentInfo = {};

  @override
  CommentDetailState clone() {
    return CommentDetailState()
      ..clr = clr
      ..userInfo = userInfo
      ..textController = textController
      ..articleId = articleId
      ..addCommentInfo = addCommentInfo;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

CommentDetailState initState(Map<String, dynamic> args) {
  CommentDetailState newState = CommentDetailState();
  newState.clr = args['clr'];
  newState.articleId = args['articleId'];
  return newState;
}
