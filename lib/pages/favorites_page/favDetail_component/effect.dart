import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FavDetailState> buildEffect() {
  return combineEffects(<Object, Effect<FavDetailState>>{
    FavDetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FavDetailState> ctx) {
}
