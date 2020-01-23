import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TcListAction { action }

class TcListActionCreator {
  static Action onAction() {
    return const Action(TcListAction.action);
  }
}
