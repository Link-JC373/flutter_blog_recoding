import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MoreAction {
  action,
  onJumpToFav,
}

class MoreActionCreator {
  static Action onAction() {
    return const Action(MoreAction.action);
  }

  static Action onJumpToFav() {
    return const Action(MoreAction.onJumpToFav);
  }
}
