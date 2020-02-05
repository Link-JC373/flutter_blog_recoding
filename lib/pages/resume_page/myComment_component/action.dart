import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyCommentAction { action }

class MyCommentActionCreator {
  static Action onAction() {
    return const Action(MyCommentAction.action);
  }
}
