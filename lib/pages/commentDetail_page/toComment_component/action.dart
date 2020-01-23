import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ToCommentAction { action }

class ToCommentActionCreator {
  static Action onAction() {
    return const Action(ToCommentAction.action);
  }
}
