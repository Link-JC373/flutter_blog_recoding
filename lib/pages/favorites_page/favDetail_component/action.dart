import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavDetailAction { action }

class FavDetailActionCreator {
  static Action onAction() {
    return const Action(FavDetailAction.action);
  }
}
