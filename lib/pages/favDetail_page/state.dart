import 'package:fish_redux/fish_redux.dart';

class FavDetailState implements Cloneable<FavDetailState> {

  @override
  FavDetailState clone() {
    return FavDetailState();
  }
}

FavDetailState initState(Map<String, dynamic> args) {
  return FavDetailState();
}
