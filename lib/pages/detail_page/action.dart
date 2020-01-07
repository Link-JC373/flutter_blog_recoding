import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DetailAction {
  action,
  initAction,
  commentClick,
  onLikeAction,
  clickBlank,
  upLikeData,
  onGoToLogin
}

class DetailActionCreator {
  static Action onAction() {
    return const Action(DetailAction.action);
  }

  static Action initAction(var detailData) {
    return Action(DetailAction.initAction, payload: detailData);
  }

  static Action commentClick() {
    return Action(DetailAction.commentClick);
  }

  static Action clickBlank() {
    return Action(DetailAction.clickBlank);
  }

  static Action upLikeData() {
    return Action(DetailAction.upLikeData);
  }

  static Action likeAction() {
    return Action(DetailAction.onLikeAction);
  }

  static Action onGoToLogin() {
    return Action(DetailAction.onGoToLogin);
  }
}
