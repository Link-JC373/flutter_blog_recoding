import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ArticleListAdapterAction { action }

class ArticleListAdapterActionCreator {
  static Action onAction() {
    return const Action(ArticleListAdapterAction.action);
  }
}
