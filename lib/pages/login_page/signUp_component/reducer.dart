import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SignUpState> buildReducer() {
  return asReducer(
    <Object, Reducer<SignUpState>>{
      SignUpAction.action: _onAction,
    },
  );
}

SignUpState _onAction(SignUpState state, Action action) {
  final SignUpState newState = state.clone();
  return newState;
}
