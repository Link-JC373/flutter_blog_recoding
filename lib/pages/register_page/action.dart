import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RegisterAction {
  action,
  accountChanged,
  pwdChanged,
  checkPWChanged,
  onRegister,
}

class RegisterActionCreator {
  static Action onAction() {
    return const Action(RegisterAction.action);
  }

  static Action onRegister() {
    return const Action(RegisterAction.onRegister);
  }

  static Action accountChanged(String t) {
    return Action(RegisterAction.accountChanged, payload: t);
  }

  static Action pwdChanged(String t) {
    return Action(RegisterAction.pwdChanged, payload: t);
  }

  static Action checkPWChanged(String t) {
    return Action(RegisterAction.checkPWChanged, payload: t);
  }
}
