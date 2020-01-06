import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<MemberState> buildEffect() {
  return combineEffects(<Object, Effect<MemberState>>{
    MemberAction.action: _onAction,
    MemberAction.onHandleClick: _onHandleClick,
  });
}

void _onAction(Action action, Context<MemberState> ctx) {}
void _onHandleClick(Action action, Context<MemberState> ctx) {
  if (ctx.state.userInfo != null) {
    Navigator.of(ctx.context).pushNamed('changeInfo_page');
  } else {
    Navigator.of(ctx.context).pushNamed('login_page');
  }
}
