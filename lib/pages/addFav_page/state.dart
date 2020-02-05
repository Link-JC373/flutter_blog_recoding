import 'package:blog_flutter/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class AddFavState implements GlobalBaseState, Cloneable<AddFavState> {
  TextEditingController textFavNameController = TextEditingController();
  @override
  AddFavState clone() {
    return AddFavState()
      ..textFavNameController = textFavNameController
      ..userInfo = userInfo;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

AddFavState initState(Map<String, dynamic> args) {
  return AddFavState();
}
