import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class AddArticleState implements Cloneable<AddArticleState> {
  TextEditingController textController;
  @override
  AddArticleState clone() {
    return AddArticleState()..textController = textController;
  }
}

AddArticleState initState(Map<String, dynamic> args) {
  return AddArticleState();
}
