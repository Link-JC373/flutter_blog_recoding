import 'package:blog_flutter/model/commentList.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<CommentState> buildEffect() {
  return combineEffects(<Object, Effect<CommentState>>{
    CommentAction.action: _onAction,
    CommentAction.onCreateComment: _onCreateComment,
    CommentAction.onJumpToComDetail: _onJumpToComDetail,
    CommentAction.onAddCommentLikes: onAddCommentLikes,
  });
}

void _onAction(Action action, Context<CommentState> ctx) {}
Future onAddCommentLikes(Action action, Context<CommentState> ctx) async {
  if (ctx.state.userInfo == null) {
    Navigator.pushNamed(ctx.context, 'login_page');
  } else {
    var data = {
      'userId': ctx.state.userInfo['userId'],
      'commentId': ctx.state.clr.ctaId,
      'flag': ctx.state.isLiked
    };
    await DioUtil.request('changeCommentLikes', formData: data).then((res) {
      ctx.dispatch(CommentActionCreator.changeLikes(ctx.state.index));
    });
  }
  // print(ctx.state.index);
}

void _onJumpToComDetail(Action action, Context<CommentState> ctx) {
  Navigator.pushNamed(ctx.context, 'commentDetail_page',
      arguments: <String, CommentListResult>{
        'clr': ctx.state.clr,
      });
}

dynamic _onCreateComment(Action action, Context<CommentState> ctx) {
  return (BuildContext context, int index) {
    if (ctx.state.clr.tcResult[index].tcId != ctx.state.clr.user.userId) {
      return Text(
        '${ctx.state.clr.tcResult[index].user.username} 回复 ${ctx.state.clr.tcResult[index].tcName} : ${ctx.state.clr.tcResult[index].commentContent}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    } else {
      return Text(
        '${ctx.state.clr.tcResult[index].user.username} : ${ctx.state.clr.tcResult[index].commentContent}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    }
  };
}
