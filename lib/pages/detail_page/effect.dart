import 'dart:convert';

import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<DetailState> buildEffect() {
  return combineEffects(<Object, Effect<DetailState>>{
    Lifecycle.initState: _init,
    DetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DetailState> ctx) {}

Future _init(Action action, Context<DetailState> ctx) async {
  var params = {
    'userId': ctx.state.userId,
    'articleId': ctx.state.articleId,
  };

  await DioUtil.request('getArticleDetail', formData: params).then((res) {
    var data = json.decode(res.toString());
    ctx.dispatch(DetailActionCreator.initAction(data));
  });
}
