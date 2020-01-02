import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.initTabs: _initTabs,
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
