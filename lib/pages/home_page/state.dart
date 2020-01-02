import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class HomeState implements Cloneable<HomeState> {
  List<Widget> tabs;

  List<int> tabNumber;
  TabController tabController;
  String url;
  @override
  HomeState clone() {
    return HomeState()
      ..tabs = tabs
      ..tabNumber = tabNumber
      ..tabController = tabController
      ..url = url;
  }
}

HomeState initState(Map<String, dynamic> args) {
  final HomeState state = HomeState();
  return state;
}
