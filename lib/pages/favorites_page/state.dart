import 'dart:ui';

import 'package:blog_flutter/global_store/state.dart';
import 'package:blog_flutter/model/favorites.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class FavoritesState implements Cloneable<FavoritesState> {
  FavListModel favList =
      new FavListModel.fromParams(results: List<FavListResult>());
  int userId;
  TextEditingController textFavName = TextEditingController();
  @override
  FavoritesState clone() {
    return FavoritesState()
      ..favList = favList
      ..textFavName = textFavName;
  }
}

FavoritesState initState(Map<String, dynamic> args) {
  FavoritesState state = FavoritesState();
  state.userId = args['userId'];
  return state;
}
