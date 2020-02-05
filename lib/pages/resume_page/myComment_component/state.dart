import 'package:blog_flutter/model/myCommentList.dart';
import 'package:blog_flutter/pages/resume_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

class MyCommentState implements Cloneable<MyCommentState> {
  MyCommentListModel commentListModel;
  @override
  MyCommentState clone() {
    return MyCommentState()..commentListModel = commentListModel;
  }
}

MyCommentState initState(Map<String, dynamic> args) {
  return MyCommentState();
}

class MyCommentConnector extends ConnOp<ResumeState, MyCommentState> {
  @override
  MyCommentState get(ResumeState state) {
    MyCommentState substate = new MyCommentState();
    substate.commentListModel = state.myComment;
    // substate.tvcoming = state.tvcoming;
    // substate.tvController = state.tvController;
    return substate;
  }

  @override
  void set(ResumeState state, MyCommentState subState) {
    // state.tvcoming = subState.tvcoming;
  }
}
