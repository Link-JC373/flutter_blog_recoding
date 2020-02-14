import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AddArticleAction { action }

class AddArticleActionCreator {
  static Action onAction() {
    return const Action(AddArticleAction.action);
  }
}
