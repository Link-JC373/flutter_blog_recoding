import 'dart:ui';

import 'package:blog_flutter/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

class MemberState implements GlobalBaseState, Cloneable<MemberState> {
  @override
  Color themeColor;

  @override
  var userInfo;

  @override
  MemberState clone() {
    return MemberState()..userInfo = userInfo;
  }
}

MemberState initState(Map<String, dynamic> args) {
  return MemberState();
}
