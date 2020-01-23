import 'dart:convert';

import 'user.dart';

class CommentListModel {
  int page;
  int totalPages;
  int totalResults;
  List<CommentListResult> results;

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
    // likedList = jsonRes['likedList'] == null ? null : [];
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
  // int time;
  bool isLiked;
  String commentContent;
  User user;
  List<int> likedList;
  List<ToCommentListResult> tcResult;

  CommentListResult.fromParams({
    this.ctaId,
    this.likeCounts,
    this.commentContent,
    this.user,
    this.likedList,
    this.tcResult,
  });

  CommentListResult.fromJson(jsonRes) {
    // print(int.parse(jsonRes['like_counts']));
    ctaId = jsonRes['comment_id'];
    commentContent = jsonRes['comment_content'];
    likeCounts = jsonRes['like_counts'];
    isLiked = jsonRes['is_liked'];
    user = User.fromJson(jsonRes['user']);
    tcResult = jsonRes['comments_to_comments'] == null ? null : [];
    likedList = jsonRes['comment_likes'] == null ? null : [];
    var list = tcResult == null ? [] : jsonRes['comments_to_comments'];
    for (int i = 0; i < list.length; i++) {
      tcResult.add(
          list[i] == null ? null : new ToCommentListResult.fromJson(list[i]));
    }

    var copyLikeList = jsonRes['comment_likes'] ?? [];
    for (var i = 0; i < copyLikeList.length; i++) {
      print('==============> copylist');
      print(copyLikeList[i]);
      likedList.add(copyLikeList[i]['user_id']);
    }
    print('----------->likedList');
    print(likedList);
  }
}

class ToCommentListResult {
  String commentContent;
  User user;
  int ctcId;
  int tcId;
  String tcName;

  ToCommentListResult.fromParams({
    this.commentContent,
    this.user,
    this.ctcId,
    this.tcId,
    this.tcName,
  });

  ToCommentListResult.fromJson(jsonRes) {
    commentContent = jsonRes['comment_content'];
    ctcId = jsonRes['ctc_id'];
    tcId = jsonRes['tc_id'];
    tcName = jsonRes['tc_name'];
    user = User.fromJson(jsonRes['user']);
  }
}
