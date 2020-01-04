import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ListComponentAction { action }

class ListComponentActionCreator {
  static Action onAction() {
    return const Action(ListComponentAction.action);
  }
}
