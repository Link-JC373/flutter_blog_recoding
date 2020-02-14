import 'dart:convert';
import 'dart:developer';

import 'package:blog_flutter/model/favArticleList.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<FavDetailState> buildEffect() {
  return combineEffects(<Object, Effect<FavDetailState>>{
    FavDetailAction.action: _onAction,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<FavDetailState> ctx) {}
Future _init(Action action, Context<FavDetailState> ctx) async {
  ctx.state.scrollController = ScrollController()
    ..addListener(() async {
      // print('---->moving');
      bool isBottom = ctx.state.scrollController.position.pixels ==
          (ctx.state.scrollController.position.maxScrollExtent);
      if (isBottom) {
        // ctx.dispatch(ResumeActionCreator.changeType('文章'));
        // print('------>到底了');
        await _onLoadMore(action, ctx);
      }
    });
  var params = {
    'userId': ctx.state.userId,
    'favId': ctx.state.favId,
  };
  print(params);
  await DioUtil.request('initFavArticle', formData: params).then((res) {
    if (res != null) {
      res = json.decode(res);
      print(res);
      ctx.dispatch(FavDetailActionCreator.getUser(res['data']['user']));
      ctx.dispatch(FavDetailActionCreator.initFavArticle(res['data']['data']));
    }
  });
}

Future _onLoadMore(Action action, Context<FavDetailState> ctx) async {
  if (ctx.state.favArticleListModel.pageNum <
      ctx.state.favArticleListModel.totalPages) {
    var data = {
      'favId': ctx.state.favId,
      'pageNum': ctx.state.favArticleListModel.pageNum + 1,
    };
    print(data);
    await DioUtil.request('getFavArticle', formData: data).then((res) {
      res = json.decode(res);
      print(res);
      FavArticleListModel favArticleListModel =
          FavArticleListModel(res['data']);
      ctx.dispatch(FavDetailActionCreator.loadMore(favArticleListModel));
    });
  }
}
