import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ChangeInfoState> buildEffect() {
  return combineEffects(<Object, Effect<ChangeInfoState>>{
    ChangeInfoAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ChangeInfoState> ctx) {
}
