import 'dart:convert';

class FavListModel {
  List<FavListResult> results;

  FavListModel.fromParams({this.results});

  factory FavListModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new FavListModel.fromJson(json.decode(jsonStr))
          : new FavListModel.fromJson(jsonStr);

  FavListModel.fromJson(jsonRes) {
    results = jsonRes['data'] == null ? null : [];
    // likedList = jsonRes['likedList'] == null ? null : [];
    var list = results == null ? [] : jsonRes['data'];
    for (int i = 0; i < list.length; i++) {
      results.add(list[i] == null ? null : new FavListResult.fromJson(list[i]));
    }
  }
}

class FavListResult {
  String favName;
  int favId;
  int favCount;
  bool isFav;

  FavListResult.fromParams(
      {this.favCount, this.favName, this.favId, this.isFav});

  FavListResult.fromJson(jsonRes) {
    favName = jsonRes['fav_name'];
    favId = jsonRes['fav_id'];
    favCount = jsonRes['articles_favorites'].length;
    isFav = false;
    for (var i in jsonRes['articles_favorites']) {
      if (i['fav_id'] == favId) {
        isFav = true;
      }
    }
  }
}
