import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'state.dart';

Widget homeBuildView(
    HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    // body: NestedScrollView(
    //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //     return <Widget>[
    //       SliverAppBar(
    //         expandedHeight: 85.0,
    //         floating: true,
    //         //固定在顶部
    //         pinned: true,
    //         snap: false,
    //         actions: <Widget>[
    //           IconButton(
    //               icon: Icon(Icons.search),
    //               onPressed: () {
    //                 showSearch(context: context, delegate: SearchBarDelegate());
    //               })
    //         ],
    //         title: Text('playMate'),

    //         bottom: TabBar(
    //           controller: state.tabController,
    //           tabs: state.tabs,
    //         ),
    //       )
    //     ];
    //   },
    //   body: Text('Home'),
    // ),
    appBar: AppBar(
      title: Text('test'),
    ),
    body: Center(
      child: Text('Test LifeCycle'),
    ),
  );
}
