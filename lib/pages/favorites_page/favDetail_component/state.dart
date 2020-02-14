import 'package:blog_flutter/model/favorites.dart';
import 'package:fish_redux/fish_redux.dart';

class FavDetailState implements Cloneable<FavDetailState> {
  FavListResult result;
  int userId;
  @override
  FavDetailState clone() {
    return FavDetailState()
      ..result = result
      ..userId = userId;
  }
}

FavDetailState initState(Map<String, dynamic> args) {
  return FavDetailState();
}
