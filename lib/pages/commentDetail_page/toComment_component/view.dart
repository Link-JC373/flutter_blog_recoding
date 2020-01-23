import 'package:blog_flutter/pages/commentDetail_page/action.dart';
import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ToCommentState state, Dispatch dispatch, ViewService viewService) {
  return InkWell(
    onTap: () {
      dispatch(CommentDetailActionCreator.onIsLogin());
      var data = {
        'tcId': state.tclr.user.userId,
        'tcName': state.tclr.user.username
      };
      // dispatch(CommentDetailActionCreator.onAddToComment(data));
      print(data);
      dispatch(CommentDetailActionCreator.saveCommentInfo(data));
      dispatch(CommentDetailActionCreator.changeFocus(true));
    },
    child: Container(
      padding: EdgeInsets.only(bottom: Adapt.px(10), top: Adapt.px(30)),
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[300],
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(Adapt.screenW() * 0.03),
            child: Align(
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  state.tclr.user.userIcon,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                // 'Name',
                state.tclr.user.username,
                textAlign: TextAlign.start,
              ),
              Text(
                // 'disc',
                state.tclr.user.disc ?? '',
                textAlign: TextAlign.start,
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: Adapt.screenW() * 0.02,
                      bottom: Adapt.screenW() * 0.02),
                  width: Adapt.screenW() * 0.8,
                  // child: Text(
                  //   state.tclr.commentContent,
                  //   softWrap: true,
                  // ),
                  child: Text(
                    ' 回复 ${state.tclr.tcName} : ${state.tclr.commentContent}',
                    softWrap: true,
                  )),
            ],
          )
        ],
      ),
    ),
  );
}
