import 'dart:convert';

import 'package:blog_flutter/model/user.dart';

class ArticleListModel {
  int page;
  int totalPages;
  int totalResults;
  List<ArticleListResult> results;
  ArticleListModel.fromParams({this.page, this.totalPages, this.results});

  factory ArticleListModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new ArticleListModel.fromJson(json.decode(jsonStr))
          : new ArticleListModel.fromJson(jsonStr);

  ArticleListModel.fromJson(jsonRes) {
    page = jsonRes['pageNum'];
    totalPages = jsonRes['total_pages'];
    totalResults = jsonRes['count'];
    results = jsonRes['rows'] == null ? null : [];
    // likedList = jsonRes['likedList'] == null ? null : [];
    var list = results == null ? [] : jsonRes['rows'];
    for (int i = 0; i < list.length; i++) {
      results.add(
          list[i] == null ? null : new ArticleListResult.fromJson(list[i]));
    }
  }
}

class ArticleListResult {
  User user;
  int articleId;
  int likeCount;
  int commentCount;
  String title;
  String blogType;
  String introduce;
  ArticleListResult.fromParams({
    this.user,
    this.articleId,
    this.title,
    this.introduce,
    this.blogType,
    this.likeCount,
    this.commentCount,
  });

  ArticleListResult.fromJson(jsonRes) {
    user = User.fromJson(jsonRes['user']);
    articleId = jsonRes['id'];
    title = jsonRes['title'];
    likeCount = jsonRes['likeCount'];
    blogType = jsonRes['blog_type']['typename'];
    commentCount =
        jsonRes['comments'].length = jsonRes['comments_to_comments'].length;
    introduce = jsonRes['introduce'] ?? '这个人 居然不写简介....';
  }
}
