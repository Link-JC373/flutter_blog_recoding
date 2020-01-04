import 'package:blog_flutter/custom_widgets/keepalive_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';
import 'action.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  return Builder(
    builder: (context) {
      final pageController = PageController();
      Widget _buildPage(Widget page) {
        return KeepAliveWidget(page);
      }

      return Scaffold(
        // appBar: AppBar(
        //   title: Text('test'),
        // ),
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.currentIndex,
          items: state.bottomTabs,
          onTap: (int index) {
            pageController.jumpToPage(index);
          },
        ),
        body: PageView(
          physics: ClampingScrollPhysics(),
          children: state.pages.map(_buildPage).toList(),
          controller: pageController,
          onPageChanged: (int i) =>
              dispatch(IndexActionCreator.onTapChanged(i)),
        ),
        // body: Center(
        //   child: Text('Test LifeCycle'),
        // ),
      );
    },
  );
  // return Scaffold(
  //   appBar: AppBar(
  //     title: Text('test'),
  //   ),
  //   body: Center(
  //     child: Text('Test LifeCycle'),
  //   ),
  // );
}
