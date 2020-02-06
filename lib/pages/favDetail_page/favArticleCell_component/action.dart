import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavArticleCellAction { action }

class FavArticleCellActionCreator {
  static Action onAction() {
    return const Action(FavArticleCellAction.action);
  }
}
