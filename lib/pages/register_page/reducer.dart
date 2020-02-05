import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RegisterState> buildReducer() {
  return asReducer(
    <Object, Reducer<RegisterState>>{
      RegisterAction.action: _onAction,
      RegisterAction.accountChanged: _onAccountChanged,
      RegisterAction.pwdChanged: _onPwdChanged,
      RegisterAction.checkPWChanged: _onCheckPWChanged,
    },
  );
}

RegisterState _onAction(RegisterState state, Action action) {
  final RegisterState newState = state.clone();
  return newState;
}

RegisterState _onAccountChanged(RegisterState state, Action action) {
  String account = action.payload ?? '';
  final RegisterState newState = state.clone();
  newState.account = account;
  return newState;
}

RegisterState _onPwdChanged(RegisterState state, Action action) {
  String pwd = action.payload ?? '';
  final RegisterState newState = state.clone();
  newState.pwd = pwd;
  return newState;
}

RegisterState _onCheckPWChanged(RegisterState state, Action action) {
  String checkPW = action.payload ?? '';
  final RegisterState newState = state.clone();
  newState.checkPW = checkPW;
  return newState;
}
