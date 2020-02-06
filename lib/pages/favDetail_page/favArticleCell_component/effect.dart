import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FavArticleCellState> buildEffect() {
  return combineEffects(<Object, Effect<FavArticleCellState>>{
    FavArticleCellAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FavArticleCellState> ctx) {
}
