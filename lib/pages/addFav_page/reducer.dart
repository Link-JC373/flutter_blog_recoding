import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddFavState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddFavState>>{
      AddFavAction.action: _onAction,
    },
  );
}

AddFavState _onAction(AddFavState state, Action action) {
  final AddFavState newState = state.clone();
  return newState;
}
