import 'dart:async';
import 'dart:convert';

import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/model/favorites.dart';
import 'package:blog_flutter/model/user.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'comList_adapter/action.dart';
import 'state.dart';

Effect<DetailState> buildEffect() {
  return combineEffects(<Object, Effect<DetailState>>{
    Lifecycle.initState: _init,
    DetailAction.action: _onAction,
    DetailAction.onLikeAction: _onLikeEffect,
    DetailAction.onGoToLogin: _onGoToLogin,
    DetailAction.onCommentClick: _onCommentClick,
    DetailAction.onAddComment: _onAddComment,
    DetailAction.onGetFavState: _onGetFavState,
    DetailAction.onJumpToResume: _onJumpToResume,
  });
}

void _onAction(Action action, Context<DetailState> ctx) {}
void _onJumpToResume(Action action, Context<DetailState> ctx) {
  bool flag = false;
  User user = action.payload;
  // print('----------------->');
  // print(user.userId);
  if (ctx.state.userInfo != null) {
    // print(ctx.state.userInfo['id']);

    if (ctx.state.userInfo['userId'] == user.userId) {
      flag = true;
    }
  }
  Navigator.of(ctx.context).pushNamed('resume_page', arguments: {
    'user': user,
    'isSelf': flag,
  });
}

Future _onAddComment(Action action, Context<DetailState> ctx) async {
  if (ctx.state.textController.text != null) {
    var formData = {
      'userId': ctx.state.userInfo['userId'],
      'articleId': ctx.state.articleId,
      'commentContent': ctx.state.textController.text
    };
    await DioUtil.request('addComment', formData: formData).then((res) {
      res = json.decode(res);
      print(res['data']);
      CommentListModel model;
      if (res['data'] != null) model = CommentListModel(res['data']);
      ctx.dispatch(DetailActionCreator.refreshCommentList(model));
      ctx.dispatch(DetailActionCreator.clickBlank());
      Fluttertoast.showToast(
        msg: "发表成功",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }
  // print(ctx.state.textController.text);
}

void _onCommentClick(Action action, Context<DetailState> ctx) {
  if (ctx.state.userInfo != null) {
    ctx.dispatch(ctx.dispatch(DetailActionCreator.getForcus()));
  } else {
    _onGoToLogin(action, ctx);
  }
}

void _onGoToLogin(Action action, Context<DetailState> ctx) {
  Navigator.of(ctx.context).pushNamed('login_page').then((res) {
    _init(action, ctx);
  });
}

Future _init(Action action, Context<DetailState> ctx) async {
  //初始化文章
  var params = {
    'userId': ctx.state.userInfo != null ? ctx.state.userInfo['userId'] : 0,
    'articleId': ctx.state.articleId,
  };
  print('init------------------>');

  await DioUtil.request('getArticleDetail', formData: params).then((res) {
    var data = json.decode(res.toString());
    ctx.dispatch(DetailActionCreator.initAction(data));
  });

  //初始化获取评论信息
  _onLoadMore(action, ctx);

//初始化滚动控制监听事件
  ScrollController scrollController = ScrollController();
  int pageNum = 1;
  scrollController.addListener(() {
    // print(ctx.state.scrollController.position.pixels);

    if (ctx.state.scrollController.position.pixels ==
        ctx.state.scrollController.position.maxScrollExtent) {
      pageNum++;
      print('滑动到底部了');
      if (ctx.state.commentList.page < ctx.state.commentList.totalPages) {
        _onLoadMore(action, ctx, pageNum: pageNum);
      }
    }
  });

  ctx.dispatch(DetailActionCreator.bindScroll(scrollController));
}

Future _onLikeEffect(Action action, Context<DetailState> ctx) async {
  // var likeData = action.payload ?? {};
  print(ctx.state.userInfo);
  if (ctx.state.userInfo != null) {
    var addPointData = {
      'articleId': ctx.state.articleId,
      'userId': ctx.state.userInfo['userId']
    };

    // String formData = json.encode(addPointData);

    ctx.state.isLiked
        ? await DioUtil.request('reduceArticlePoint',
            formData: addPointData, context: ctx.context)
        : await DioUtil.request('addArticlePoint',
            formData: addPointData, context: ctx.context);

    ctx.dispatch(DetailActionCreator.upLikeData());
  } else {
    _onGoToLogin(action, ctx);
  }
}

Future _onLoadMore(Action action, Context<DetailState> ctx,
    {pageNum = 1}) async {
  var formData = {
    'pageNum': pageNum,
    'articleId': ctx.state.articleId,
    'userId': ctx.state.userInfo != null ? ctx.state.userInfo['userId'] : 0
  };

  await DioUtil.request('getComments', formData: formData).then((res) {
    res = json.decode(res);
    print(res['data']);
    CommentListModel model;
    if (res['data'] != null) model = CommentListModel(res['data']);
    ctx.dispatch(DetailActionCreator.addCommentList(model));
    // ctx.dispatch(ComListAction.add());
  });
}

Future _onGetFavState(Action action, Context<DetailState> ctx) async {
  var data = {
    'userId': ctx.state.userInfo['userId'],
  };

  var res = await DioUtil.request('getFavorites', formData: data);
  FavListModel favListModel;
  print(res);
  if (res != null) favListModel = FavListModel(res);
  ctx.dispatch(DetailActionCreator.getFavList(favListModel));
}
