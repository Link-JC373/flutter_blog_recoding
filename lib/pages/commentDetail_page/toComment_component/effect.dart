import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ToCommentState> buildEffect() {
  return combineEffects(<Object, Effect<ToCommentState>>{
    ToCommentAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ToCommentState> ctx) {
}
