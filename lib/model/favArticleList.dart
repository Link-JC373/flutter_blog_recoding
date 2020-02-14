import 'dart:convert';

class FavArticleListModel {
  List<FavArticleListResult> results;
  int pageNum;
  int totalPages;
  int count;
  String updatedAt;
  String favName;
  FavArticleListModel.fromParams({
    this.results,
    this.pageNum,
    this.totalPages,
    this.count,
    this.favName,
    this.updatedAt,
  });

  factory FavArticleListModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new FavArticleListModel.fromJson(json.decode(jsonStr))
          : new FavArticleListModel.fromJson(jsonStr);

  FavArticleListModel.fromJson(jsonRes) {
    pageNum = jsonRes['pageNum'];
    totalPages = jsonRes['total_pages'];
    count = jsonRes['count'];
    favName = jsonRes['fav_name'];
    updatedAt = jsonRes['updatedAt'];
    results = jsonRes['rows'] == null ? null : [];
    // likedList = jsonRes['likedList'] == null ? null : [];
    var list = results == null ? [] : jsonRes['rows'];
    for (int i = 0; i < list.length; i++) {
      results.add(
          list[i] == null ? null : new FavArticleListResult.fromJson(list[i]));
    }
  }
}

class FavArticleListResult {
  String createdAt;
  int articleId;
  String title;
  String authorName;

  FavArticleListResult.fromParams(
      {this.createdAt, this.articleId, this.authorName, this.title});

  FavArticleListResult.fromJson(jsonRes) {
    createdAt = jsonRes['createdAt'];
    articleId = jsonRes['blog_article']['id'];
    title = jsonRes['blog_article']['title'];
    authorName = jsonRes['blog_article']['user']['username'];
  }
}
