import 'dart:async';
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
    DetailAction.onLikeAction: _onLikeEffect,
    DetailAction.onGoToLogin: _onGoToLogin,
  });
}

void _onAction(Action action, Context<DetailState> ctx) {}

void _onGoToLogin(Action action, Context<DetailState> ctx) {
  Navigator.of(ctx.context).pushNamed('login_page');
}

Future _init(Action action, Context<DetailState> ctx) async {
  var params = {
    'userId': ctx.state.userInfo != null ? ctx.state.userInfo['userId'] : 0,
    'articleId': ctx.state.articleId,
  };
  print('init------------------>');

  await DioUtil.request('getArticleDetail', formData: params).then((res) {
    var data = json.decode(res.toString());
    ctx.dispatch(DetailActionCreator.initAction(data));
  });
}

Future _onLikeEffect(Action action, Context<DetailState> ctx) async {
  // var likeData = action.payload ?? {};
  print(ctx.state.userInfo);
  if (ctx.state.userInfo != null) {
    var addPointData = {
      'articleId': ctx.state.articleId,
      'userId': ctx.state.userInfo['userId']
    };

    String formData = json.encode(addPointData);

    ctx.state.isLiked
        ? await DioUtil.request('reduceArticlePoint',
            formData: formData, context: ctx.context)
        : await DioUtil.request('addArticlePoint',
            formData: formData, context: ctx.context);

    // likeData['isLiked'] = !likeData['isLiked'];

    // likeData['likeCount'] = likeData['isLiked']
    //     ? likeData['likeCount'] - 1
    //     : likeData['likeCount'] + 1;

    ctx.dispatch(DetailActionCreator.upLikeData());
  } else {
    Navigator.of(ctx.context).pushNamed('login_page').then((res) {
      _init(action, ctx);
    });
  }
}
