import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import '../home_page/view.dart';
import '../home_page/state.dart';
import '../member_page/view.dart';
import '../member_page/state.dart';

class IndexState implements Cloneable<IndexState> {
  int currentIndex = 0;
  List<Widget> pages;

  List<BottomNavigationBarItem> bottomTabs;

  PageController pageController;

  @override
  IndexState clone() {
    // TODO: implement clone
    return IndexState()
      ..pages = pages
      ..currentIndex = currentIndex
      ..bottomTabs = bottomTabs;
  }

  @override
  String toString() {
    return 'IndexState{currentPage: $currentIndex }';
  }
}

IndexState initState(Map<String, dynamic> args) {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    // BottomNavigationBarItem(
    //     icon: Icon(CupertinoIcons.search), title: Text('分类')),
    // BottomNavigationBarItem(
    //     icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),
  ];

  final IndexState state = IndexState();
  state.bottomTabs = bottomTabs;
  state.pages = args['pages'];
  // state.tabBodies = tabBodies;
  // state.currentIndex = 0;
  // state.currentPage = tabBodies[0];
  // return state;
  return state;
}
