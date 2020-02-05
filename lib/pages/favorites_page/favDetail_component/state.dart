import 'package:blog_flutter/model/favorites.dart';
import 'package:fish_redux/fish_redux.dart';

class FavDetailState implements Cloneable<FavDetailState> {
  FavListResult result;
  @override
  FavDetailState clone() {
    return FavDetailState()..result = result;
  }
}

FavDetailState initState(Map<String, dynamic> args) {
  return FavDetailState();
}
