import 'dart:ui';

import 'package:blog_flutter/global_store/state.dart';
import 'package:blog_flutter/model/favorites.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class FavoritesState implements GlobalBaseState, Cloneable<FavoritesState> {
  FavListModel favList =
      new FavListModel.fromParams(results: List<FavListResult>());
  int userId;
  TextEditingController textFavName = TextEditingController();
  bool isSelf = false;
  @override
  FavoritesState clone() {
    return FavoritesState()
      ..favList = favList
      ..userId = userId
      ..userInfo = userInfo
      ..isSelf = isSelf
      ..textFavName = textFavName;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

FavoritesState initState(Map<String, dynamic> args) {
  FavoritesState state = FavoritesState();
  state.userId = args['userId'];
  return state;
}
