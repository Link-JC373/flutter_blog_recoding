import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommentAction {
  action,
  onCreateComment,
  onJumpToComDetail,
  onAddCommentLikes,
  changeLikes
}

class CommentActionCreator {
  static Action onAction() {
    return const Action(CommentAction.action);
  }

  static Action onCreateComment() {
    return const Action(CommentAction.onCreateComment);
  }

  static Action onJumpToComDetail() {
    return const Action(CommentAction.onJumpToComDetail);
  }

  static Action onAddCommentLikes() {
    return const Action(CommentAction.onAddCommentLikes);
  }

  static Action changeLikes(int index) {
    return Action(CommentAction.changeLikes, payload: index);
  }
}
