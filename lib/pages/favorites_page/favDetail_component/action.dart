import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavDetailAction {
  action,
  onJumpToDetail,
}

class FavDetailActionCreator {
  static Action onAction() {
    return const Action(FavDetailAction.action);
  }

  static Action onJumpToDetail() {
    return const Action(FavDetailAction.onJumpToDetail);
  }
}
