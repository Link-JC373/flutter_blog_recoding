import 'package:fish_redux/fish_redux.dart';

import 'commentCell_component/component.dart';
import 'commentCell_component/state.dart';
import 'reducer.dart';
import 'state.dart';

class MyCommentListAdapter extends DynamicFlowAdapter<MyCommentState> {
  MyCommentListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'articleCell': CommentCellComponent(),
          },
          connector: _CommentListConnector(),
          reducer: buildReducer(),
        );
}

class _CommentListConnector extends ConnOp<MyCommentState, List<ItemBean>> {
  @override
  List<ItemBean> get(MyCommentState state) {
    List<ItemBean> items = [];
    // print('=====================');
    // print(state.articleList?.results);
    if (state.commentListModel?.results != null) {
      if (state.commentListModel.results.isNotEmpty == true) {
        for (var i in state.commentListModel.results) {
          // print('++++++++++++++');
          CommentCellState subState = CommentCellState();
          subState.result = i;
          // print(i);
          items.add(ItemBean('articleCell', subState));
        }
      }
    }
    return items;
  }

  @override
  void set(MyCommentState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
