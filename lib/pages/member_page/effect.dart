import 'package:blog_flutter/model/user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<MemberState> buildEffect() {
  return combineEffects(<Object, Effect<MemberState>>{
    MemberAction.action: _onAction,
    MemberAction.onHandleClick: _onHandleClick,
    MemberAction.onJumpToFav: _onJumpToFav,
  });
}

void _onAction(Action action, Context<MemberState> ctx) {}
void _onHandleClick(Action action, Context<MemberState> ctx) {
  if (ctx.state.userInfo != null) {
    User user = User(ctx.state.userInfo);
    print(ctx.state.userInfo);
    Navigator.of(ctx.context).pushNamed('resume_page', arguments: {
      'isSelf': true,
      'user': user,
    });
  } else {
    Navigator.of(ctx.context).pushNamed('login_page');
  }
}

void _onJumpToFav(Action action, Context<MemberState> ctx) {
  if (ctx.state.userInfo != null) {
    Navigator.of(ctx.context).pushNamed('favorites_page', arguments: {
      'userId': ctx.state.userInfo['userId'],
    });
  } else {
    Navigator.of(ctx.context).pushNamed('login_page');
  }
}
