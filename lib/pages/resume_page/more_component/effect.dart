import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<MoreState> buildEffect() {
  return combineEffects(<Object, Effect<MoreState>>{
    MoreAction.action: _onAction,
    MoreAction.onJumpToFav: _onJumpToFav,
  });
}

void _onAction(Action action, Context<MoreState> ctx) {}
void _onJumpToFav(Action action, Context<MoreState> ctx) {
  Navigator.of(ctx.context).pushNamed('favorites_page', arguments: {
    'userId': ctx.state.userId,
  });
}
