import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MyArticleState> buildEffect() {
  return combineEffects(<Object, Effect<MyArticleState>>{
    MyArticleAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MyArticleState> ctx) {
}
