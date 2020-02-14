import 'package:blog_flutter/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class HomeState implements GlobalBaseState, Cloneable<HomeState> {
  List<Widget> tabs;
  TabController tabController;
  List<int> tabNumber;

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
      ..userInfo = userInfo
      ..isShowAdd = isShowAdd
      ..tabIndex = tabIndex
      ..number = number;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

HomeState initState(Map<String, dynamic> args) {
  final HomeState state = HomeState();
  state.isShowAdd = true;
  state.tabIndex = 0;
  state.number = 0;
  return state;
}
