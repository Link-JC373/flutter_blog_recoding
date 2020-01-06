import 'package:blog_flutter/global_store/state.dart';
import 'package:blog_flutter/pages/login_page/signIn_component/state.dart';
import 'package:blog_flutter/pages/login_page/signUp_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

class LoginState implements GlobalBaseState, Cloneable<LoginState> {
  AnimationController animationController;
  AnimationController submitAnimationController;
  FocusNode accountFocusNode;
  FocusNode pwdFocusNode;

  String userName;
  String passWord;
  @override
  LoginState clone() {
    return LoginState()
      ..accountFocusNode = accountFocusNode
      ..pwdFocusNode = pwdFocusNode
      ..userName = userName
      ..passWord = passWord
      ..animationController = animationController
      ..submitAnimationController = submitAnimationController;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}

class SignInConnector extends ConnOp<LoginState, SignInState> {
  @override
  SignInState get(LoginState login) {
    final SignInState state = SignInState();
    return state;
  }
}

class SignUpConnector extends ConnOp<LoginState, SignUpState> {
  @override
  SignUpState get(LoginState login) {
    final SignUpState state = SignUpState();
    return state;
  }
}
