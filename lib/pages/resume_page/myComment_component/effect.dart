import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MyCommentState> buildEffect() {
  return combineEffects(<Object, Effect<MyCommentState>>{
    MyCommentAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MyCommentState> ctx) {
}
