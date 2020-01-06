import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

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
