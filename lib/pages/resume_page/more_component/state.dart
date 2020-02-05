import 'package:blog_flutter/pages/resume_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

class MoreState implements Cloneable<MoreState> {
  int userId;
  @override
  MoreState clone() {
    return MoreState()..userId = userId;
  }
}

MoreState initState(Map<String, dynamic> args) {
  return MoreState();
}

class MoreConnector extends ConnOp<ResumeState, MoreState> {
  @override
  MoreState get(ResumeState state) {
    MoreState substate = new MoreState();
    substate.userId = state.user.userId;
    // substate.tvcoming = state.tvcoming;
    // substate.tvController = state.tvController;
    return substate;
  }

  @override
  void set(ResumeState state, MoreState subState) {
    // state.tvcoming = subState.tvcoming;
  }
}
