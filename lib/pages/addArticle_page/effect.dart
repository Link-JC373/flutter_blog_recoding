import 'dart:convert';

import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'state.dart';

Effect<AddArticleState> buildEffect() {
  return combineEffects(<Object, Effect<AddArticleState>>{
    AddArticleAction.action: _onAction,
    AddArticleAction.onSubmit: _onSubmit,
    AddArticleAction.onChangeChoose: _onChangeChoose,
  });
}

void _onAction(Action action, Context<AddArticleState> ctx) {}
Future _onSubmit(Action action, Context<AddArticleState> ctx) async {
  Map<int, bool> map = ctx.state.onChoose.asMap();
  int index = 0;
  map.keys.map((f) {
    if (map[f]) {
      index = f;
    }
  });
  // ctx.state.onChoose.map((f) {
  //   if (f) {}
  // });
  var data = {
    'userId': ctx.state.userInfo['userId'],
    'title': ctx.state.titleTextController.text,
    'introduce': ctx.state.introduceTextController.text,
    'articleContent': ctx.state.contentTextController.text,
    'typeid': index + 1,
  };
  print(data);
  await DioUtil.request('addArticle', formData: data).then((onValue) {
    onValue = json.decode(onValue);
    if (onValue['data']['status'] == 200) {
      Fluttertoast.showToast(
        msg: "分享成功",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(ctx.context).pop();
    } else {
      Fluttertoast.showToast(
        msg: "${data['message']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  });
}

void _onChangeChoose(Action action, Context<AddArticleState> ctx) {
  List<bool> changeType = [false, false, false];
  changeType[action.payload] = true;
  ctx.dispatch(AddArticleActionCreator.changeChoose(changeType));
}
