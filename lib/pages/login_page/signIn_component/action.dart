import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SignInAction {
  action,
  editText,
  onEditText,
  saveUserName,
  savePassWord,
  onHandleLogin,
}

class SignInActionCreator {
  static Action onAction() {
    return const Action(SignInAction.action);
  }

  static Action editText(var focusScopeNode) {
    return Action(SignInAction.editText, payload: focusScopeNode);
  }

  static Action onEditText() {
    return const Action(SignInAction.onEditText);
  }

  static Action saveUserName(String userName) {
    return Action(SignInAction.onEditText, payload: userName);
  }

  static Action savePassWord(String passWord) {
    return Action(SignInAction.onEditText, payload: passWord);
  }

  static Action onHandleLogin() {
    return Action(SignInAction.onHandleLogin);
  }
}
