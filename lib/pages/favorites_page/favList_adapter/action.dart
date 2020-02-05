import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavListAction { action }

class FavListActionCreator {
  static Action onAction() {
    return const Action(FavListAction.action);
  }
}
