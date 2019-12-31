import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'pages/index_page/page.dart';
import 'pages/home_page/page.dart';
import 'pages/member_page/page.dart';
// import 'pages/detail_page/page.dart';
// import 'global_store/state.dart';
// import 'global_store/store.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'home_page': HomePage(),
      // 'detail_page': DetailPage(),
      'member_page': MemberPage(),
      'index_page': IndexPage(),
    },
    // visitor: (String path, Page<Object, dynamic> page) {
    //   /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
    //   /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
    //   if (page.isTypeof<GlobalBaseState>()) {
    //     /// 建立 AppStore 驱动 PageStore 的单向数据连接
    //     /// 1. 参数1 AppStore
    //     /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
    //     page.connectExtraStore<GlobalState>(GlobalStore.store,
    //         (Object pagestate, GlobalState appState) {
    //       final GlobalBaseState p = pagestate;
    //       if (p.themeColor != appState.themeColor) {
    //         if (pagestate is Cloneable) {
    //           final Object copy = pagestate.clone();
    //           final GlobalBaseState newState = copy;
    //           newState.themeColor = appState.themeColor;
    //           return newState;
    //         }
    //       }
    //       return pagestate;
    //     });
    //   }
    // },
  );

  return MaterialApp(
    title: 'BlogFlutter',
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
