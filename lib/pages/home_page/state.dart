import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'components/list_component/state.dart';

class HomeState implements Cloneable<HomeState> {
  List<Widget> tabs;

  List<int> tabNumber;
  TabController tabController;
  String url;

  bool isShowAdd;

  int tabIndex;

  int number;
  @override
  HomeState clone() {
    return HomeState()
      ..tabs = tabs
      ..tabNumber = tabNumber
      ..tabController = tabController
      ..url = url
      ..isShowAdd = isShowAdd
      ..tabIndex = tabIndex
      ..number = number;
  }
}

HomeState initState(Map<String, dynamic> args) {
  final HomeState state = HomeState();
  state.isShowAdd = true;
  state.tabIndex = 0;
  state.number = 0;
  return state;
}

class ListFiConnector extends ConnOp<HomeState, ListComponentState> {
  ListComponentState get(HomeState state) {
    ListComponentState subState = new ListComponentState();
    subState.typeIndex = 0;
    return subState;
  }
}

class ListSeConnector extends ConnOp<HomeState, ListComponentState> {
  ListComponentState get(HomeState state) {
    ListComponentState subState = new ListComponentState();
    subState.typeIndex = 1;
    return subState;
  }
}

class ListThConnector extends ConnOp<HomeState, ListComponentState> {
  ListComponentState get(HomeState state) {
    ListComponentState subState = new ListComponentState();
    subState.typeIndex = 2;
    return subState;
  }
}

class ListFoConnector extends ConnOp<HomeState, ListComponentState> {
  ListComponentState get(HomeState state) {
    ListComponentState subState = new ListComponentState();
    subState.typeIndex = 3;
    return subState;
  }
}
