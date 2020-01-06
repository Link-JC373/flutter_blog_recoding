import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MemberState> buildReducer() {
  return asReducer(
    <Object, Reducer<MemberState>>{
      MemberAction.action: _onAction,
    },
  );
}

MemberState _onAction(MemberState state, Action action) {
  final MemberState newState = state.clone();
  return newState;
}
