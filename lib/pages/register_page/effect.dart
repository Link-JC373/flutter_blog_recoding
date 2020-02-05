import 'dart:convert';

import 'package:blog_flutter/custom_widgets/custom_stfstate.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    RegisterAction.action: _onAction,
    RegisterAction.onRegister: _onRegister,
    Lifecycle.initState: _onInit,
    Lifecycle.build: _onBuild,
    Lifecycle.dispose: _onDispose
  });
}

void _onInit(Action action, Context<RegisterState> ctx) {
  ctx.state.accountFocusNode = FocusNode();
  ctx.state.pwdFocusNode = FocusNode();
  ctx.state.checkPWFocusNode = FocusNode();
  final ticker = ctx.stfState as CustomstfState;
  ctx.state.animationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 2000));
  ctx.state.submitAnimationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 1000));
}

void _onBuild(Action action, Context<RegisterState> ctx) {
  Future.delayed(Duration(milliseconds: 150),
      () => ctx.state.animationController.forward());
}

void _onDispose(Action action, Context<RegisterState> ctx) {
  ctx.state.animationController.dispose();
  ctx.state.accountFocusNode.dispose();
  ctx.state.pwdFocusNode.dispose();
  ctx.state.submitAnimationController.dispose();
}

void _onAction(Action action, Context<RegisterState> ctx) {}
Future _onRegister(Action action, Context<RegisterState> ctx) async {
  ctx.state.submitAnimationController.forward();

  if (ctx.state.account != '' &&
      ctx.state.pwd != '' &&
      ctx.state.checkPW != '') {
    if (ctx.state.pwd == ctx.state.checkPW) {
      var data = {
        'userName': ctx.state.account,
        'passWord': ctx.state.pwd,
      };
      await DioUtil.request('register', formData: data).then((res) {
        res = json.decode(res);
        // print(res['message']);
        if (res['data']['state'] == 200) {
          ctx.state.submitAnimationController.reverse();

          Navigator.of(ctx.context).pop();
          Fluttertoast.showToast(
            msg: "注册成功",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          Fluttertoast.showToast(
            msg: "${res['data']['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      });
      ctx.state.submitAnimationController.reverse();
    } else {
      ctx.state.submitAnimationController.reverse();

      Fluttertoast.showToast(
        msg: "两次密码不相同",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  } else {
    ctx.state.submitAnimationController.reverse();

    Fluttertoast.showToast(
      msg: "请输入用户名密码和确认密码",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
