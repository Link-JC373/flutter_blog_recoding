import 'package:fish_redux/fish_redux.dart';

class FavListState implements Cloneable<FavListState> {

  @override
  FavListState clone() {
    return FavListState();
  }
}

FavListState initState(Map<String, dynamic> args) {
  return FavListState();
}
