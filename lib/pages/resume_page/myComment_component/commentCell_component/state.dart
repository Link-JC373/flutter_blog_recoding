import 'package:blog_flutter/model/myCommentList.dart';
import 'package:fish_redux/fish_redux.dart';

class CommentCellState implements Cloneable<CommentCellState> {
  MyCommentListResult result;
  @override
  CommentCellState clone() {
    return CommentCellState()..result = result;
  }
}

CommentCellState initState(Map<String, dynamic> args) {
  return CommentCellState();
}
