import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.initTabs: _initTabs,
      HomeAction.scrollAct: _scrollAct,
      HomeAction.tapBar: _tapBar,
      HomeAction.addNumber: _addNumber,
    },
  );
}

HomeState _initTabs(HomeState state, Action action) {
  var initData = action.payload ?? {};

  final HomeState newState = state.clone();
  newState.tabs = initData['tabs'];
  newState.tabNumber = initData['tabNumber'];
  newState.tabController = initData['_tabController'];
  return newState;
}

HomeState _scrollAct(HomeState state, Action action) {
  dynamic offset = action.payload ?? {};
  const APPBAE_SCROLL_OFFSET = 100;
  final HomeState newState = state.clone();

  double alpha = offset / APPBAE_SCROLL_OFFSET;
  if (alpha == 0) {
    newState.isShowAdd = true;
  }
  if (alpha > 0 && newState.isShowAdd == true) {
    newState.isShowAdd = false;
  }
  return newState;
}

HomeState _tapBar(HomeState state, Action action) {
  int index = action.payload ?? {};
  final HomeState newState = state.clone();
  newState.tabIndex = index;
  // print(newState.tabIndex);

  return newState;
}

HomeState _addNumber(HomeState state, Action action) {
  // int index = action.payload ?? {};
  final HomeState newState = state.clone();
  newState.number = state.number + 1;
  // print(newState.tabIndex);

  return newState;
}
