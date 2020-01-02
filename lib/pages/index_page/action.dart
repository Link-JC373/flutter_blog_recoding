import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'state.dart';

enum IndexAction {
  changeIndex,
  onChangeIndex,
  tabchanged,
}

class IndexActionCreator {
  static Action changeIndexAction(int index) {
    return Action(IndexAction.changeIndex, payload: index);
  }

  static Action onChangeAction(var currentPage) {
    return Action(IndexAction.onChangeIndex, payload: currentPage);
  }

  static Action onTapChanged(int index) {
    return Action(IndexAction.tabchanged, payload: index);
  }
}
