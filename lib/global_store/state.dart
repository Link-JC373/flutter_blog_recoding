import 'package:fish_redux/fish_redux.dart';
import 'dart:ui';

abstract class GlobalBaseState {
  Color get themeColor;
  set themeColor(Color color);

  get userInfo;
  set userInfo(var u);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor;

  @override
  var userInfo;

  @override
  GlobalState clone() {
    return GlobalState()..userInfo = userInfo;
  }
}
