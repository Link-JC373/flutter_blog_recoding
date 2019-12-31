import 'package:fish_redux/fish_redux.dart';

enum HomeAction { initTabs }

class HomeActionCreator {
  static Action initTabs(var initData) {
    return Action(HomeAction.initTabs, payload: initData);
  }
}
