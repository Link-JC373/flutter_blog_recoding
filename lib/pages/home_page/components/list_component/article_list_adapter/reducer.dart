import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ArticleListAdapterState> buildReducer() {
  return asReducer(
    <Object, Reducer<ArticleListAdapterState>>{
      ArticleListAdapterAction.action: _onAction,
    },
  );
}

ArticleListAdapterState _onAction(ArticleListAdapterState state, Action action) {
  final ArticleListAdapterState newState = state.clone();
  return newState;
}
