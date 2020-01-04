import 'package:fish_redux/fish_redux.dart';

enum HomeAction {
  initTabs,
  scrollAct,
  tapBar,
  addNumber,
}

class HomeActionCreator {
  static Action initTabs(var initData) {
    return Action(HomeAction.initTabs, payload: initData);
  }

  static Action scrollAction(var offset) {
    return Action(HomeAction.scrollAct, payload: offset);
  }

  static Action tapBar(int index) {
    return Action(HomeAction.scrollAct, payload: index);
  }

  static Action addNumber() {
    return Action(HomeAction.addNumber);
  }
}
