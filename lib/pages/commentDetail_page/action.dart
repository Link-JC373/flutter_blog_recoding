import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommentDetailAction { action }

class CommentDetailActionCreator {
  static Action onAction() {
    return const Action(CommentDetailAction.action);
  }
}
