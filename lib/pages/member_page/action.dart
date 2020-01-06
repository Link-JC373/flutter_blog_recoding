import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MemberAction {
  action,
  onHandleClick,
}

class MemberActionCreator {
  static Action onAction() {
    return const Action(MemberAction.action);
  }

  static Action onHandleClick() {
    return const Action(MemberAction.onHandleClick);
  }
}
