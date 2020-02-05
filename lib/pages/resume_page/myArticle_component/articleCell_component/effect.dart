import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ArticleCellState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleCellState>>{
    ArticleCellAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ArticleCellState> ctx) {
}
