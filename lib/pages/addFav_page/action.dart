import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AddFavAction { action, onAddFav }

class AddFavActionCreator {
  static Action onAction() {
    return const Action(AddFavAction.action);
  }

  static Action onAddFav() {
    return const Action(AddFavAction.onAddFav);
  }
}
