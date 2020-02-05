import 'dart:convert';

import 'package:blog_flutter/model/user.dart';

class MyCommentListModel {
  int page;
  int totalPages;
  List<MyCommentListResult> results;
  // List<MyToCommentListResult> tcResults;
  MyCommentListModel.fromParams({this.page, this.totalPages, this.results});
  factory MyCommentListModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new MyCommentListModel.fromJson(json.decode(jsonStr))
          : new MyCommentListModel.fromJson(jsonStr);

  MyCommentListModel.fromJson(jsonRes) {
    page = jsonRes['pageNum'];
    print(page);
    totalPages = jsonRes['totalPages'];
    if (jsonRes['commentRes']['rows'] == null &&
        jsonRes['ctcRes']['rows'] == null) {
      results = null;
    } else {
      results = [];
    }

    var cList = results == null ? [] : jsonRes['commentRes']['rows'];
    for (int i = 0; i < cList.length; i++) {
      results.add(
          cList[i] == null ? null : new MyCommentListResult.fromJson(cList[i]));
    }
    var ctcList = results == null ? [] : jsonRes['ctcRes']['rows'];
    for (int i = 0; i < ctcList.length; i++) {
      results.add(ctcList[i] == null
          ? null
          : new MyCommentListResult.fromJson(ctcList[i]));
    }
  }
}

class MyCommentListResult {
  User user;
  int articleId;
  String commentContent;
  String articleTitle;
  String articleIntroduce;
  MyCommentListResult.fromParams({
    this.user,
    this.commentContent,
    this.articleTitle,
    this.articleIntroduce,
    this.articleId,
  });

  MyCommentListResult.fromJson(jsonRes) {
    user = User.fromJson(jsonRes['user']);
    articleId = jsonRes['blog_article']['id'];
    articleIntroduce = jsonRes['blog_article']['introduce'];
    articleTitle = jsonRes['blog_article']['title'];
    commentContent = jsonRes['comment_content'];
  }
}
