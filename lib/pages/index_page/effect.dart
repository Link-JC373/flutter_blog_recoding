import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'state.dart';
import 'action.dart';

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    Lifecycle.initState: _init,
    // IndexAction.onChangeIndex: _onChangeIndex,
  });
}

void _init(Action action, Context<IndexState> ctx) {
  print('======================');
}
