import 'dart:convert';

import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
// import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'action.dart';
import 'state.dart';

Effect<CommentDetailState> buildEffect() {
  return combineEffects(<Object, Effect<CommentDetailState>>{
    Lifecycle.initState: _init,
    CommentDetailAction.action: _onAction,
    CommentDetailAction.onAddToComment: _onAddToComment,
    CommentDetailAction.onCommentClick: _onCommentClick,
    CommentDetailAction.onIsLogin: _onIsLogin,
    // CommentDetailAction.onSaveCommentInfo: _onSaveCommentInfo,
  });
}

void _onAction(Action action, Context<CommentDetailState> ctx) {}
void _onIsLogin(Action action, Context<CommentDetailState> ctx) {
  if (ctx.state.userInfo == null) {
    Navigator.pushNamed(
      ctx.context,
      'login_page',
    );
  }
}

Future _onCommentClick(Action action, Context<CommentDetailState> ctx) async {
  if (ctx.state.userInfo == null) {
    Navigator.pushNamed(
      ctx.context,
      'login_page',
    );
  } else {
    // await DioUtil.request('addToComment');
    // _onload(action, ctx);
    ctx.dispatch(CommentDetailActionCreator.changeFocus(true));
  }
}

Future _onAddToComment(Action action, Context<CommentDetailState> ctx) async {
  // _onIsLogin(action, ctx);
  if (ctx.state.textController.text != null) {
    var data = action.payload ?? {'tcId': 0, 'tcName': ''};

    //这里处理的有误，没有很好的区分出来什么是评论主评论的评论和评论二级评论的评论，只能靠 tcId是否为 0来判断
    var formData = {
      'userId': ctx.state.userInfo['userId'],
      'tcId': ctx.state.addCommentInfo['tcId'],
      'tcName': ctx.state.addCommentInfo['tcName'],
      'commentId': ctx.state.clr.ctaId,
      'commentContent': ctx.state.textController.text
    };
    await DioUtil.request('addToComment', formData: formData).then((res) async {
      res = json.decode(res);
      print(res['data']);
      Fluttertoast.showToast(
        msg: "发表成功",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );

      ctx.dispatch(CommentDetailActionCreator.changeFocus(false));
      ctx.dispatch(CommentDetailActionCreator.cleanText());
      await _onload(action, ctx);
    });
  }
}

Future _onload(Action action, Context<CommentDetailState> ctx) async {
  var formData = {
    'commentId': ctx.state.clr.ctaId,
  };
  await DioUtil.request('getToComments', formData: formData).then((res) {
    res = json.decode(res);
    print(res['data']);
    List<ToCommentListResult> tcResult = List<ToCommentListResult>();
    tcResult = res['data'] == null ? null : [];

    var list = tcResult == null ? [] : res['data'];
    for (int i = 0; i < list.length; i++) {
      tcResult.add(
          list[i] == null ? null : new ToCommentListResult.fromJson(list[i]));
    }
    print('------>');
    ctx.dispatch(CommentDetailActionCreator.loadSubComments(tcResult));
  });
}

void _init(Action action, Context<CommentDetailState> ctx) {
  // var data = ModalRoute.of(ctx.context).settings.arguments;
  // print(data);
  // ctx.state.clr = data['clr'];
  ctx.dispatch(CommentDetailActionCreator.initData());
}
