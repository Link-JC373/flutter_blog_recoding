import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction {
  action,
  changePage,
  onGoBack,
  onLoginClicked,
  accountChange,
  pwdChange,
  onRegister,
}

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onRegister() {
    return const Action(LoginAction.onRegister);
  }

  static Action changePage(int index) {
    return Action(LoginAction.changePage, payload: index);
  }

  static Action onGoBack() {
    return Action(LoginAction.onGoBack);
  }

  static Action onLoginClicked() {
    return Action(LoginAction.onLoginClicked);
  }

  static Action onAccountChange(String account) {
    return Action(LoginAction.accountChange, payload: account);
  }

  static Action onPwdChange(String pwd) {
    return Action(LoginAction.pwdChange, payload: pwd);
  }
}
