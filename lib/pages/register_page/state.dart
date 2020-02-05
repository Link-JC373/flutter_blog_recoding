import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class RegisterState implements Cloneable<RegisterState> {
  AnimationController animationController;
  AnimationController submitAnimationController;
  FocusNode accountFocusNode;
  FocusNode pwdFocusNode;
  FocusNode checkPWFocusNode;
  String account;
  String pwd;
  String checkPW;
  @override
  RegisterState clone() {
    return RegisterState()
      ..animationController = animationController
      ..submitAnimationController = submitAnimationController
      ..accountFocusNode = accountFocusNode
      ..checkPWFocusNode = checkPWFocusNode
      ..account = account
      ..checkPW = checkPW
      ..pwd = pwd
      ..pwdFocusNode = pwdFocusNode;
  }
}

RegisterState initState(Map<String, dynamic> args) {
  return RegisterState();
}
