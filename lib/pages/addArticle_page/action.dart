import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AddArticleAction { action, onChangeChoose, onSubmit, changeChoose }

class AddArticleActionCreator {
  static Action onAction() {
    return const Action(AddArticleAction.action);
  }

  static Action onSubmit() {
    return const Action(AddArticleAction.onSubmit);
  }

  static Action onChangeChoose(int typeNumber) {
    return Action(AddArticleAction.onChangeChoose, payload: typeNumber);
  }

  static Action changeChoose(List<bool> typeList) {
    return Action(AddArticleAction.changeChoose, payload: typeList);
  }
}
