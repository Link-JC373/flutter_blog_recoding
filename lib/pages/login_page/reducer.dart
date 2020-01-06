import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.action: _onAction,
      LoginAction.accountChange: _onAccountChanged,
      LoginAction.pwdChange: _onPwdChanged
    },
  );
}

LoginState _onAction(LoginState state, Action action) {
  final LoginState newState = state.clone();
  return newState;
}

LoginState _onAccountChanged(LoginState state, Action action) {
  String account = action.payload ?? '';
  final LoginState newState = state.clone();
  newState.userName = account;
  return newState;
}

LoginState _onPwdChanged(LoginState state, Action action) {
  String pwd = action.payload ?? '';
  final LoginState newState = state.clone();
  newState.passWord = pwd;
  return newState;
}
