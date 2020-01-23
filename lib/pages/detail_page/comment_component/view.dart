import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentState state, Dispatch dispatch, ViewService viewService) {
  return Material(
    // color: Colors.white,
    child: InkWell(
      onTap: () {
        dispatch(CommentActionCreator.onJumpToComDetail());
      },
      child: Container(
        // color: Colors.white,
        margin: EdgeInsets.only(top: Adapt.px(20)),
        padding: EdgeInsets.only(bottom: Adapt.px(10)),
        decoration: BoxDecoration(
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
                    state.clr.user.userIcon,
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: Adapt.screenW() * 0.5,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          Text(
                            // 'Name',
                            state.clr.user.username,
                            textAlign: TextAlign.start,
                          ),
                          state.clr.user.disc != null
                              ? Text(
                                  // 'disc',
                                  state.clr.user.disc,
                                  textAlign: TextAlign.start,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Container(
                      width: Adapt.screenW() * 0.07,
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.thumbsUp,
                          size: 12,
                          color: state.isLiked ? Colors.blue : Colors.grey,
                          // color: Colors.blue,
                        ),
                        onPressed: () {
                          dispatch(CommentActionCreator.onAddCommentLikes());
                        },
                      ),
                    ),
                    Container(
                      width: Adapt.screenW() * 0.15,
                      child: state.clr.likedList?.length == null
                          ? Text(' ')
                          : state.clr.likedList?.length == 0
                              ? Text(' ')
                              : Text('${state.clr.likedList.length}'),
                    ),
                    Icon(
                      Icons.message,
                      size: 12,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: Adapt.screenW() * 0.02,
                      right: Adapt.screenW() * 0.02),
                  width: Adapt.screenW() * 0.8,
                  child: Text(
                    state.clr.commentContent,
                    softWrap: true,
                  ),
                ),
                state.clr.tcResult.length > 0
                    ? Container(
                        margin: EdgeInsets.only(
                            top: Adapt.px(10), bottom: Adapt.px(10)),
                        color: Colors.grey[200],
                        width: Adapt.screenW() * 0.8,
                        padding: EdgeInsets.fromLTRB(Adapt.px(20), Adapt.px(20),
                            Adapt.px(20), Adapt.px(20)),
                        // child: Text(
                        //   '我是评论评论的评论我是评论评论的评论我是评论评论的评论我是评论评论的评论我是评论评论的评论我是评论评论的评论我是评论评论的评论',
                        //   softWrap: true,
                        // ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: state.clr.tcResult.length > 3
                              ? <Widget>[
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: new NeverScrollableScrollPhysics(),
                                    itemCount: 3,
                                    itemBuilder: dispatch(
                                        CommentActionCreator.onCreateComment()),
                                    // itemBuilder: (context, ),
                                  ),
                                  Text(
                                    '查看${state.clr.tcResult.length}评论>',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ]
                              : [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: new NeverScrollableScrollPhysics(),
                                    itemCount: state.clr.tcResult.length,
                                    itemBuilder: dispatch(
                                        CommentActionCreator.onCreateComment()),
                                    // itemBuilder: (context, ),
                                  ),
                                ],
                        ))
                    : Container(),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
