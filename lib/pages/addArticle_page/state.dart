import 'package:blog_flutter/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class AddArticleState implements GlobalBaseState, Cloneable<AddArticleState> {
  TextEditingController titleTextController = new TextEditingController();
  TextEditingController introduceTextController = new TextEditingController();
  TextEditingController contentTextController = new TextEditingController();
  List<bool> onChoose = [
    true,
    false,
    false,
  ];
  @override
  AddArticleState clone() {
    return AddArticleState()
      ..titleTextController = titleTextController
      ..themeColor = themeColor
      ..userInfo = userInfo
      ..onChoose = onChoose
      ..introduceTextController = introduceTextController
      ..contentTextController = contentTextController;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

AddArticleState initState(Map<String, dynamic> args) {
  return AddArticleState();
}
