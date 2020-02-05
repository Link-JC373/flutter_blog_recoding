import 'dart:convert';

import 'package:blog_flutter/model/articleList.dart';
import 'package:blog_flutter/model/myCommentList.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'state.dart';

Effect<ResumeState> buildEffect() {
  return combineEffects(<Object, Effect<ResumeState>>{
    ResumeAction.action: _onAction,
    ResumeAction.follow: _follow,
    Lifecycle.initState: _init,
    Lifecycle.dispose: _onDispose
  });
}

void _onAction(Action action, Context<ResumeState> ctx) {}
Future _follow(Action action, Context<ResumeState> ctx) async {
  if (ctx.state.userInfo == null) {
    Navigator.of(ctx.context).pushNamed('login_page').then((res) {
      if (res == true) {
        print('login success');
        if (ctx.state.userInfo['userId'] == ctx.state.user.userId)
          ctx.dispatch(ResumeActionCreator.setIsSelfTrue());
      }
    });
  } else {
    // await DioUtil.request('follow').then((res) {});
  }
}

Future _init(Action action, Context<ResumeState> ctx) async {
  // if (ctx.state.isSelf ) {
  //   if (ctx.state.user['userId'] == ctx.state.userId)
  //     ctx.dispatch(ResumeActionCreator.setIsSelfTrue());
  // }

  final Object ticker = ctx.stfState;

  ctx.state.tabController =
      TabController(vsync: ticker, length: ctx.state.tabs.length)
        ..addListener(() async {
          print(ctx.state.tabController.index);
          switch (ctx.state.tabController.index) {
            case 0:
              ctx.dispatch(ResumeActionCreator.changeType('文章'));
              break;
            case 1:
              ctx.dispatch(ResumeActionCreator.changeType('评论'));

              break;
            default:
          }
        });

  // ctx.state.commentController = ScrollController()
  //   ..addListener(() async {
  //     bool isBottom = ctx.state.commentController.position.pixels ==
  //         (ctx.state.commentController.position.maxScrollExtent);
  //     if (isBottom) {
  //       await _onLoadMore(action, ctx);
  //     }
  //   });
  ctx.state.scrollController = ScrollController()
    ..addListener(() async {
      bool isBottom = ctx.state.scrollController.position.pixels ==
          (ctx.state.scrollController.position.maxScrollExtent);
      if (isBottom) {
        // ctx.dispatch(ResumeActionCreator.changeType('文章'));

        await _onLoadMore(action, ctx);
      }
    });
  var data = {'userId': ctx.state.user.userId};
  await DioUtil.request('getArticleList', formData: data).then((res) {
    if (res != null) {
      res = json.decode(res);
      ArticleListModel a = ArticleListModel(res['data']);
      ctx.dispatch(ResumeActionCreator.initMyArticle(a));
    }
  });
  await DioUtil.request('getMyComment', formData: data).then((res) {
    if (res != null) {
      res = json.decode(res);
      MyCommentListModel m = MyCommentListModel(res['data']);
      ctx.dispatch(ResumeActionCreator.initMyComment(m));
    }
  });
}

void _onDispose(Action action, Context<ResumeState> ctx) {
  ctx.state.scrollController.dispose();
}

Future _onLoadMore(Action action, Context<ResumeState> ctx) async {
  print(ctx.state.loadType);
  switch (ctx.state.loadType) {
    case '文章':
      // print(ctx.state.myArticle.page);
      // print(ctx.state.myArticle.totalPages);
      if (ctx.state.myArticle.page < ctx.state.myArticle.totalPages) {
        var data = {
          'userId': ctx.state.userId,
          'pageNum': ctx.state.myArticle.page + 1
        };
        await DioUtil.request('getArticleList', formData: data).then((res) {
          if (res != null) {
            res = json.decode(res);
            ArticleListModel a = ArticleListModel(res['data']);
            var data = {'article': a};
            ctx.dispatch(ResumeActionCreator.loadMore(data));
          }
        });
      } else {
        Fluttertoast.showToast(
          msg: "已经到底了~~~",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
      break;
    case '评论':
      // print(ctx.state.myArticle.page);
      // print(ctx.state.myArticle.totalPages);
      if (ctx.state.myComment.page < ctx.state.myComment.totalPages) {
        var data = {
          'userId': ctx.state.userId,
          'pageNum': ctx.state.myComment.page + 1
        };
        print(data);
        await DioUtil.request('getMyComment', formData: data).then((res) {
          if (res != null) {
            res = json.decode(res);
            MyCommentListModel m = MyCommentListModel(res['data']);
            var data = {'comment': m};
            ctx.dispatch(ResumeActionCreator.loadMore(data));
          }
        });
      } else {
        Fluttertoast.showToast(
          msg: "已经到底了~~~",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey[200],
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
      break;
    default:
  }
}
