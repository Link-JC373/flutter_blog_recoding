import 'package:fish_redux/fish_redux.dart';

class FavArticleCellState implements Cloneable<FavArticleCellState> {

  @override
  FavArticleCellState clone() {
    return FavArticleCellState();
  }
}

FavArticleCellState initState(Map<String, dynamic> args) {
  return FavArticleCellState();
}
