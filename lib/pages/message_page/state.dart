import 'dart:ui';

import 'package:blog_flutter/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

class MessageState implements GlobalBaseState, Cloneable<MessageState> {
  @override
  MessageState clone() {
    return MessageState()..userInfo = userInfo;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

MessageState initState(Map<String, dynamic> args) {
  return MessageState();
}
