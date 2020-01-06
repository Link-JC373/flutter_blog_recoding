import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SignUpAction { action }

class SignUpActionCreator {
  static Action onAction() {
    return const Action(SignUpAction.action);
  }
}
