import 'dart:convert';

import 'package:blog_flutter/custom_widgets/custom_stfstate.dart';
import 'package:blog_flutter/global_store/action.dart';
import 'package:blog_flutter/global_store/store.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.build: _onBuild,
    Lifecycle.dispose: _onDispose,
    LoginAction.action: _onAction,
    LoginAction.action: _onGoBack,
    LoginAction.onLoginClicked: _onLoginClicked,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _onGoBack(Action action, Context<LoginState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onInit(Action action, Context<LoginState> ctx) {
  ctx.state.accountFocusNode = FocusNode();
  ctx.state.pwdFocusNode = FocusNode();
  final ticker = ctx.stfState as CustomstfState;
  ctx.state.animationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 2000));
  ctx.state.submitAnimationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 1000));
}

void _onBuild(Action action, Context<LoginState> ctx) {
  Future.delayed(Duration(milliseconds: 150),
      () => ctx.state.animationController.forward());
}

void _onDispose(Action action, Context<LoginState> ctx) {
  ctx.state.animationController.dispose();
  ctx.state.accountFocusNode.dispose();
  ctx.state.pwdFocusNode.dispose();
  ctx.state.submitAnimationController.dispose();
}

Future _onLoginClicked(Action action, Context<LoginState> ctx) async {
  ctx.state.submitAnimationController.forward();
  print(ctx.state.passWord);
  if (ctx.state.userName != '' && ctx.state.passWord != '') {
    var loginData = {
      'userName': ctx.state.userName,
      'passWord': ctx.state.passWord,
    };

    String formData = json.encode(loginData);

    var data = await DioUtil.request('login', formData: formData);
    print(data);
    data = json.decode(data.toString());

    //登录是否成功
    if (data['status'] != 200) {
      Toast.show("${data['message']}", ctx.context,
          duration: 3, gravity: Toast.BOTTOM);
      ctx.state.submitAnimationController.reverse();
    } else {
      GlobalStore.store
          .dispatch(GlobalStoreActionCreator.loginAction(data['data']));
      print(ctx.state.userInfo);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['data']['token']);
      Navigator.of(ctx.context).pop();
    }
  } else {
    Toast.show("请输入用户名密码", ctx.context, duration: 3, gravity: Toast.BOTTOM);
    ctx.state.submitAnimationController.reverse();
  }
  // if (result?.user == null) {
  //   Toast.show("请输入用户名密码", ctx.context,
  //       duration: 3, gravity: Toast.BOTTOM);
  //   ctx.state.submitAnimationController.reverse();
  // } else {
  //   var user = result?.user;
  //   GlobalStore.store.dispatch(GlobalStoreActionCreator.loginAction(user));
  //   BaseApi.updateUser(user.uid, user.email, user.photoUrl, user.displayName,
  //       user.phoneNumber);
  //   Navigator.of(ctx.context).pop({'s': true, 'name': user.displayName});
  // }
}
