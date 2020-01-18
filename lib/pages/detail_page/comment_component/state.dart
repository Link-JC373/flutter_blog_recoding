import 'package:blog_flutter/model/commentList.dart';
import 'package:fish_redux/fish_redux.dart';

class CommentState implements Cloneable<CommentState> {
  CommentListResult clr;

  @override
  CommentState clone() {
    return CommentState()..clr;
  }
}

CommentState initState(Map<String, dynamic> args) {
  return CommentState();
}
