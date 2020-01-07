import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ChangeInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<ChangeInfoState>>{
      ChangeInfoAction.action: _onAction,
      ChangeInfoAction.initInfo: _initReducer,
      ChangeInfoAction.changeAvatar: _changeAvatar,
      ChangeInfoAction.changeDisc: _changeDisc,
      ChangeInfoAction.changeUserName: _changeUserName,
    },
  );
}

ChangeInfoState _onAction(ChangeInfoState state, Action action) {
  final ChangeInfoState newState = state.clone();
  return newState;
}

ChangeInfoState _changeAvatar(ChangeInfoState state, Action action) {
  final ChangeInfoState newState = state.clone();
  newState.imgUrl = action.payload ?? '';
  return newState;
}

ChangeInfoState _initReducer(ChangeInfoState state, Action action) {
  final ChangeInfoState newState = state.clone();
  var info = action.payload ?? {};
  print(info);
  newState.imgUrl = info['userIcon'];
  newState.disc = info['disc'];
  newState.userName = info['userName'];
  newState.id = info['userId'];
  return newState;
}

ChangeInfoState _changeDisc(ChangeInfoState state, Action action) {
  final ChangeInfoState newState = state.clone();
  newState.disc = action.payload ?? '';
  return newState;
}

ChangeInfoState _changeUserName(ChangeInfoState state, Action action) {
  final ChangeInfoState newState = state.clone();
  newState.userName = action.payload ?? '';
  print(newState.userName);
  return newState;
}
