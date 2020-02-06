import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavArticleListAction { action }

class FavArticleListActionCreator {
  static Action onAction() {
    return const Action(FavArticleListAction.action);
  }
}
