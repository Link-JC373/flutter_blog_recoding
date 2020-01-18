import 'dart:convert';

class CommentListModel {
  int page;
  int totalPages;
  int totalResults;
  List<CommentListResult> results;
  List<int> likedList;

  CommentListModel.fromParams({this.page, this.totalPages, this.results});

  factory CommentListModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new CommentListModel.fromJson(json.decode(jsonStr))
          : new CommentListModel.fromJson(jsonStr);

  CommentListModel.fromJson(jsonRes) {
    page = jsonRes['pageNum'];
    totalPages = jsonRes['total_pages'];
    totalResults = jsonRes['count'];
    results = jsonRes['rows'] == null ? null : [];

    var list = results == null ? [] : jsonRes['rows'];
    for (int i = 0; i < list.length; i++) {
      results.add(
          list[i] == null ? null : new CommentListResult.fromJson(list[i]));
    }
  }
  // for (var resultsItem in results == null ? [] : jsonRes['results']) {
  //   print('=====');
  //   results.add(resultsItem == null
  //       ? null
  //       : new CommentListResult.fromJson(resultsItem));
  // }
}

class CommentListResult {
  int ctaId;
  int likeCounts;
  // int time;`
  bool isLiked;
  String commentContent;
  User user;

  CommentListResult.fromParams({
    this.ctaId,
    this.likeCounts,
    this.commentContent,
    this.user,
  });

  CommentListResult.fromJson(jsonRes) {
    // print(int.parse(jsonRes['like_counts']));
    print(jsonRes['like_counts']);
    ctaId = jsonRes['comment_id'];
    commentContent = jsonRes['comment_content'];
    likeCounts = jsonRes['like_counts'];
    isLiked = jsonRes['is_liked'];
    user = User.fromJson(jsonRes['user']);
  }
}

class User {
  String userIcon;
  String username;
  String disc;
  int userId;
  User.fromParams({
    this.userIcon,
    this.disc,
    this.username,
    this.userId,
  });

  User.fromJson(jsonRes) {
    userId = jsonRes['id'];
    username = jsonRes['username'];
    userIcon = jsonRes['user_icon'];
    disc = jsonRes['disc'];
  }
}
