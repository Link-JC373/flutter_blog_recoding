import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<DetailState>>{
      DetailAction.action: _onAction,
      DetailAction.initAction: _initReducer,
      DetailAction.commentClick: _ccReducer,
      DetailAction.clickBlank: _cbReducer,
    },
  );
}

DetailState _onAction(DetailState state, Action action) {
  final DetailState newState = state.clone();
  return newState;
}

DetailState _ccReducer(DetailState state, Action action) {
  final DetailState newState = state.clone();
  newState.isFocus = true;

  return newState;
}

DetailState _cbReducer(DetailState state, Action action) {
  final DetailState newState = state.clone();
  newState.isFocus = false;

  return newState;
}

DetailState _initReducer(DetailState state, Action action) {
  final DetailState newState = state.clone();
  var detailData = action.payload ?? [];
  // print(detailData['isLike']);
  newState.isLiked = detailData['data']['isLike'];
  newState.articleContent = detailData['data']['article_content'];
  newState.likeCount = detailData['data']['likeCount'];
  print(newState.articleContent);
  return newState;
}
