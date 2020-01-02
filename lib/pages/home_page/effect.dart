import 'package:blog_flutter/custom_widgets/state_with_ticker_provider.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _initTabs,
  });
}

void _initTabs(Action action, Context<HomeState> ctx) {
  print('initState------------------');
  final List<Widget> tabs = <Widget>[
    Text('推荐'),
    Text('视频教程'),
    Text('学习'),
    Text('娱乐'),
  ];
  final List<int> tabNumber = <int>[
    0,
    1,
    2,
    3,
  ];
  final TickerProvider tickerProvider = ctx.stfState as StateWithTickerProvider;
  var _tabController =
      TabController(vsync: tickerProvider, length: tabs.length);

  _tabController.addListener(() {
    println(_tabController.index);
  });
  print(tabs);
  ctx.dispatch(HomeActionCreator.initTabs({
    'tabs': tabs,
    'tabNumber': tabNumber,
    '_tabController': _tabController
  }));
}
