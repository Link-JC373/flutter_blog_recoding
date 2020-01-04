import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ListComponentState> buildEffect() {
  return combineEffects(<Object, Effect<ListComponentState>>{
    ListComponentAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ListComponentState> ctx) {}
