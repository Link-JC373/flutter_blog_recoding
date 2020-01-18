import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ComListAction { action }

class ComListActionCreator {
  static Action onAction() {
    return const Action(ComListAction.action);
  }
}
