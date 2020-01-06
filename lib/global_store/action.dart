import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GlobalStoreAction {
  action,
  loginAction,
}

class GlobalStoreActionCreator {
  static Action onAction() {
    return const Action(GlobalStoreAction.action);
  }

  static Action loginAction(var userInfo) {
    return Action(GlobalStoreAction.loginAction, payload: userInfo);
  }
}
