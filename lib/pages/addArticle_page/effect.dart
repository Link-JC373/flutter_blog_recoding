import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AddArticleState> buildEffect() {
  return combineEffects(<Object, Effect<AddArticleState>>{
    AddArticleAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AddArticleState> ctx) {
}
