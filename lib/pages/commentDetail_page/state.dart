import 'package:fish_redux/fish_redux.dart';

class CommentDetailState implements Cloneable<CommentDetailState> {

  @override
  CommentDetailState clone() {
    return CommentDetailState();
  }
}

CommentDetailState initState(Map<String, dynamic> args) {
  return CommentDetailState();
}
