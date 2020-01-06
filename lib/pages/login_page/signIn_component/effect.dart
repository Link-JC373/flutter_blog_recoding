import 'dart:convert';

import 'package:blog_flutter/global_store/action.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:shared_preferences/shared_preferences.dart';
import 'action.dart';
import 'state.dart';

Effect<SignInState> buildEffect() {
  return combineEffects(<Object, Effect<SignInState>>{
    SignInAction.action: _onAction,
    SignInAction.onEditText: _onEditText,
    SignInAction.onHandleLogin: _onHandleLogin,
  });
}

void _onAction(Action action, Context<SignInState> ctx) {}
void _onEditText(Action action, Context<SignInState> ctx) {
  if (ctx.state.focusScopeNode == null) {
    var focusScopeNode = FocusScope.of(ctx.context);
    ctx.dispatch(SignInActionCreator.editText(focusScopeNode));
  }
  ctx.state.focusScopeNode.requestFocus(ctx.state.passwordFocusNode);
}

Future _onHandleLogin(Action action, Context<SignInState> ctx) async {
  if (ctx.state.signInFormKey.currentState.validate()) {
    ctx.state.signInFormKey.currentState.save();
    // signIn();
    var loginData = {
      'userName': ctx.state.userName,
      'passWord': ctx.state.passWord,
    };

    String formData = json.encode(loginData);

    var data = await DioUtil.request('login', formData: formData);

    // if (DioUtil.loading) {
    //   SpinKitRing(color: Colors.blue);/'
    // }

    data = json.decode(data.toString());

    if (data['status'] == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', data['token']);
      prefs.setInt('userId', data['userId']);

      // Provider.of<IsLoginModal>(context).changeLoginState(true);

      // Provider.of<IsLoginModal>(context).changeUserInfo(data['data']);

      // Provider.of<IsLoginModal>(context).changeUserId(data['data']['userId']);
      // Provider.of<IsLoginModal>(context)
      //     .changeUserName(data['data']['userName']);
      ctx.dispatch(GlobalStoreActionCreator.loginAction(data));
      Navigator.of(ctx.context).pop();
    } else {
      return Scaffold.of(ctx.context).showSnackBar(
        SnackBar(
          content: Text('${data['message']}'),
        ),
      );
    }
  } else {
    return '';
  }
}
