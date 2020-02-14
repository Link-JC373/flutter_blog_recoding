import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MemberAction {
  action,
  onHandleClick,
  onJumpToFav,
  onJumpToMsg,
}

class MemberActionCreator {
  static Action onAction() {
    return const Action(MemberAction.action);
  }

  static Action onJumpToMsg() {
    return const Action(MemberAction.onJumpToMsg);
  }

  static Action onHandleClick() {
    return const Action(MemberAction.onHandleClick);
  }

  static Action onJumpToFav() {
    return const Action(MemberAction.onJumpToFav);
  }
}
