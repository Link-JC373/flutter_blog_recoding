import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(<Object, Reducer<IndexState>>{
    IndexAction.changeIndex: _changeIndexReducer,
    IndexAction.tabchanged: _onTapChanged
  });
}

IndexState _changeIndexReducer(IndexState state, Action action) {
  final int index = action.payload ?? 0;
  final IndexState newState = state.clone();
  newState.currentIndex = index;

  return newState;
}

IndexState _onTapChanged(IndexState state, Action action) {
  final int newindex = action.payload ?? 0;
  final IndexState newState = state.clone();
  newState.currentIndex = newindex;
  return newState;
}
