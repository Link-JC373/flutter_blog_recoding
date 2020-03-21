import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavArticleCellAction { action, onJumpToDetail }

class FavArticleCellActionCreator {
  static Action onAction() {
    return const Action(FavArticleCellAction.action);
  }

  static Action onJumpToDetail() {
    return Action(FavArticleCellAction.onJumpToDetail);
  }
}
