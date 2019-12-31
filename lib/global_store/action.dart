import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GlobalStoreAction { action }

class GlobalStoreActionCreator {
  static Action onAction() {
    return const Action(GlobalStoreAction.action);
  }
}
