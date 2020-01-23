import 'package:blog_flutter/pages/commentDetail_page/state.dart';
import 'package:blog_flutter/pages/commentDetail_page/toComment_component/component.dart';
import 'package:blog_flutter/pages/commentDetail_page/toComment_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class TcListAdapter extends DynamicFlowAdapter<CommentDetailState> {
  TcListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'toComment': ToCommentComponent(),
          },
          connector: _TcListConnector(),
          reducer: buildReducer(),
        );
}

class _TcListConnector extends ConnOp<CommentDetailState, List<ItemBean>> {
  @override
  List<ItemBean> get(CommentDetailState state) {
    List<ItemBean> items = [];

    if (state.clr?.tcResult != null) {
      if (state.clr.tcResult.isNotEmpty == true) {
        for (var i in state.clr.tcResult) {
          ToCommentState subState = ToCommentState();
          subState.tclr = i;

          items.add(ItemBean('toComment', subState));
        }
      }
    }
    return items;
  }

  @override
  void set(CommentDetailState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
