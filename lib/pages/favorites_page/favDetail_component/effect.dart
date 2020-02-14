import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<FavDetailState> buildEffect() {
  return combineEffects(<Object, Effect<FavDetailState>>{
    FavDetailAction.action: _onAction,
    FavDetailAction.onJumpToDetail: _onJumpToDetail,
  });
}

void _onAction(Action action, Context<FavDetailState> ctx) {}
void _onJumpToDetail(Action action, Context<FavDetailState> ctx) {
  print('ReadyToJump ------------>' + '${ctx.state.userId}');
  Navigator.of(ctx.context).pushNamed('favDetail_page', arguments: {
    'favId': ctx.state.result.favId,
    'userId': ctx.state.userId,
  });
}
