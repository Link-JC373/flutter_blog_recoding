import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/pages/detail_page/comment_component/component.dart';
import 'package:blog_flutter/pages/detail_page/comment_component/state.dart';
import 'package:blog_flutter/pages/detail_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class ComListAdapter extends DynamicFlowAdapter<DetailState> {
  ComListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'commentPart': CommentComponent(),
          },
          connector: _ComListConnector(),
          reducer: buildReducer(),
        );
}

class _ComListConnector extends ConnOp<DetailState, List<ItemBean>> {
  @override
  List<ItemBean> get(DetailState state) {
    List<ItemBean> items = [];
    if (state.commentList?.results != null) {
      if (state.commentList.results.isNotEmpty == true) {
        int index = 0;
        for (var i in state.commentList.results) {
          // print(i.ctaId);
          CommentState subState = CommentState();
          subState.clr = i;
          subState.userInfo = state.userInfo;
          if (state.userInfo == null) {
            subState.isLiked = false;
          } else if (i.likedList.indexOf(state.userInfo['userId']) == -1) {
            subState.isLiked = false;
          } else {
            subState.isLiked = true;
          }
          subState.articleId = state.articleId;
          subState.index = index;
          index++;

          items.add(ItemBean('commentPart', subState));
        }
      }
    }

    return items;
  }

  @override
  void set(DetailState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
