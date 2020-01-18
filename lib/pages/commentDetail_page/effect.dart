import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommentDetailState> buildEffect() {
  return combineEffects(<Object, Effect<CommentDetailState>>{
    CommentDetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommentDetailState> ctx) {
}
