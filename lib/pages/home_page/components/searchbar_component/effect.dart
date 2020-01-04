import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchbarComponentState> buildEffect() {
  return combineEffects(<Object, Effect<SearchbarComponentState>>{
    SearchbarComponentAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SearchbarComponentState> ctx) {
}
