import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SearchbarComponentAction { action }

class SearchbarComponentActionCreator {
  static Action onAction() {
    return const Action(SearchbarComponentAction.action);
  }
}
