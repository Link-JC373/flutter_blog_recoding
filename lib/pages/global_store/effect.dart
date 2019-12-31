import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalStoreState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalStoreState>>{
    GlobalStoreAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GlobalStoreState> ctx) {
}
