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
  state.tabs = <Widget>[
    Text('推荐'),
    Text('视频教程'),
    Text('学习'),
    Text('娱乐'),
  ];
  state.tabNumber = <int>[
    0,
    1,
    2,
    3,
  ];
  // final TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  // var _tabController =
  //     TabController(vsync: tickerProvider, length: state.tabs.length);

  // _tabController.addListener(() {
  //   println(_tabController.index);
  // });
  // state.url = 'getArticleList';
  // state._tabController = TabController(vsync: this, length: state.tabs.length);
  return state;
}
