import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class SignInState implements Cloneable<SignInState> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusScopeNode focusScopeNode = FocusScopeNode();

  GlobalKey<FormState> signInFormKey = GlobalKey();

  bool isShowPassWord = false;

  String userName;
  String passWord;

  @override
  SignInState clone() {
    return SignInState()
      ..emailFocusNode = emailFocusNode
      ..passwordFocusNode = passwordFocusNode
      ..focusScopeNode = focusScopeNode
      ..isShowPassWord = isShowPassWord
      ..userName = userName
      ..passWord = passWord;
  }
}

SignInState initState(Map<String, dynamic> args) {
  return SignInState();
}
