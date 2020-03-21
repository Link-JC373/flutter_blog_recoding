import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<FavArticleCellState> buildEffect() {
  return combineEffects(<Object, Effect<FavArticleCellState>>{
    FavArticleCellAction.action: _onAction,
    FavArticleCellAction.onJumpToDetail: _onJumpToDetail,
  });
}

void _onAction(Action action, Context<FavArticleCellState> ctx) {}
void _onJumpToDetail(Action action, Context<FavArticleCellState> ctx) {
  Navigator.of(ctx.context).pushNamed('detail_page', arguments: {
    'id': ctx.state.results.articleId,
  });
}
