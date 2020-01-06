import 'package:blog_flutter/custom_widgets/search_widget.dart';
import 'package:blog_flutter/custom_widgets/show_article_list.dart';
import 'package:blog_flutter/pages/home_page/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'state.dart';

Widget homeBuildView(
    HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 85.0,
            floating: true,
            //固定在顶部
            pinned: true,
            snap: false,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: SearchBarDelegate());
                  })
            ],
            title: Text('playMate'),

            bottom: TabBar(
              controller: state.tabController,
              tabs: state.tabs,
            ),
          )
        ];
      },
      body: TabBarView(
          controller: state.tabController,
          children: state.tabNumber.map((int number) {
            return NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  dispatch(HomeActionCreator.scrollAction(
                      scrollNotification.metrics.pixels));
                }
                return false;
              },
              // child: viewService.buildComponent('list$number'),
              child: ShowArticleList(
                url: 'getArticleList',
                articleTypeId: number,
              ),
            );
          }).toList()),
    ),
    floatingActionButton: state.isShowAdd
        ? FloatingActionButton(
            onPressed: () {
              dispatch(HomeActionCreator.addNumber());
            },
            child: Icon(Icons.add, color: Colors.white),
          )
        : null,
  );
}
