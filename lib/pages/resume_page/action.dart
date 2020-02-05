import 'package:blog_flutter/model/articleList.dart';
import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/model/myCommentList.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ResumeAction {
  action,
  initMyArticle,
  initMyComment,
  loadMore,
  setIsSelfTrue,
  follow,
  changeType
}

class ResumeActionCreator {
  static Action onAction() {
    return const Action(ResumeAction.action);
  }

  static Action changeType(String s) {
    return Action(ResumeAction.changeType, payload: s);
  }

  static Action follow() {
    return const Action(ResumeAction.follow);
  }

  static Action loadMore(var data) {
    return Action(ResumeAction.loadMore, payload: data);
  }

  static Action initMyArticle(ArticleListModel data) {
    return Action(ResumeAction.initMyArticle, payload: data);
  }

  static Action initMyComment(MyCommentListModel data) {
    return Action(ResumeAction.initMyComment, payload: data);
  }

  static Action setIsSelfTrue() {
    return Action(ResumeAction.setIsSelfTrue);
  }
}
