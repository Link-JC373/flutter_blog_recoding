import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SignInState> buildReducer() {
  return asReducer(
    <Object, Reducer<SignInState>>{
      SignInAction.action: _onAction,
      SignInAction.editText: _editText,
      SignInAction.saveUserName: _saveUserName,
      SignInAction.savePassWord: _savePassWord,
    },
  );
}

SignInState _onAction(SignInState state, Action action) {
  final SignInState newState = state.clone();
  return newState;
}

SignInState _editText(SignInState state, Action action) {
  final SignInState newState = state.clone();
  newState.focusScopeNode = action.payload;
  return newState;
}

SignInState _saveUserName(SignInState state, Action action) {
  final SignInState newState = state.clone();
  newState.userName = action.payload;
  return newState;
}

SignInState _savePassWord(SignInState state, Action action) {
  final SignInState newState = state.clone();
  newState.passWord = action.payload;
  return newState;
}
