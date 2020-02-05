import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyArticleAction { action }

class MyArticleActionCreator {
  static Action onAction() {
    return const Action(MyArticleAction.action);
  }
}
