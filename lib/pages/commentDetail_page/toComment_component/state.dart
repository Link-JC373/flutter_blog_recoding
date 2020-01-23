import 'package:fish_redux/fish_redux.dart';
import 'package:blog_flutter/model/commentList.dart';

class ToCommentState implements Cloneable<ToCommentState> {
  ToCommentListResult tclr;

  @override
  ToCommentState clone() {
    return ToCommentState()..tclr = tclr;
  }
}

ToCommentState initState(Map<String, dynamic> args) {
  return ToCommentState();
}
