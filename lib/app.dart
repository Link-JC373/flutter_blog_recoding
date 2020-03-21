import 'package:blog_flutter/pages/addArticle_page/page.dart';
import 'package:blog_flutter/pages/addFav_page/page.dart';
import 'package:blog_flutter/pages/changeInfo_page/page.dart';
import 'package:blog_flutter/pages/commentDetail_page/page.dart';
import 'package:blog_flutter/pages/favDetail_page/page.dart';
import 'package:blog_flutter/pages/favorites_page/page.dart';
import 'package:blog_flutter/pages/message_page/page.dart';
import 'package:blog_flutter/pages/resume_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'global_store/state.dart';
import 'global_store/store.dart';
import 'pages/index_page/page.dart';
import 'pages/home_page/page.dart';
import 'pages/login_page/page.dart';
import 'pages/member_page/page.dart';
import 'pages/detail_page/page.dart';
import 'pages/register_page/page.dart';
// import 'global_store/state.dart';
// import 'global_store/store.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'home_page': HomePage(),
      'detail_page': DetailPage(),
      'member_page': MemberPage(),
      'index_page': IndexPage(),
      'login_page': LoginPage(),
      'register_page': RegisterPage(),
      'changeInfo_page': ChangeInfoPage(),
      'commentDetail_page': CommentDetailPage(),
      'favorites_page': FavoritesPage(),
      'addFav_page': AddFavPage(),
      'resume_page': ResumePage(),
      'favDetail_page': FavDetailPage(),
      'message_page': MessagePage(),
      'addArticle_page': AddArticlePage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
      /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
      if (page.isTypeof<GlobalBaseState>()) {
        page.connectExtraStore<GlobalState>(GlobalStore.store,
            (Object pagestate, GlobalState appState) {
          final GlobalBaseState p = pagestate;
          if (p.themeColor != appState.themeColor ||
              p.userInfo != appState.userInfo) {
            if (pagestate is Cloneable) {
              final Object copy = pagestate.clone();
              final GlobalBaseState newState = copy;
              newState.themeColor = appState.themeColor;

              newState.userInfo = appState.userInfo;
              return newState;
            }
          }
          return pagestate;
        });
      }
    },
  );

  return MaterialApp(
    title: 'playMate',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: routes.buildPage('index_page', {
      'pages': [
        routes.buildPage('home_page', null),
        routes.buildPage('member_page', null),
      ]
    }),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
