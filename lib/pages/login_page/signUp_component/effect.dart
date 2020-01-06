import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SignUpState> buildEffect() {
  return combineEffects(<Object, Effect<SignUpState>>{
    SignUpAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SignUpState> ctx) {
}
