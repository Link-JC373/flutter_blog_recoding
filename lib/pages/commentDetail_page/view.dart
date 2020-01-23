import 'package:blog_flutter/pages/detail_page/comment_component/action.dart';
import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentDetailState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();

  return Scaffold(
    appBar: AppBar(
      title: Text('回复'),
    ),
    body: GestureDetector(
      onTap: () {
        dispatch(CommentDetailActionCreator.changeFocus(false));
      },
      child: Container(
        // color: Colors.grey,
        child: Column(
          // shrinkWrap: true,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          bottom: Adapt.px(10), top: Adapt.px(30)),
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
                                  state.clr.user.userIcon,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                // 'Name',
                                state.clr.user.username,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                // 'disc',
                                state.clr.user.disc,
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: Adapt.screenW() * 0.02,
                                    bottom: Adapt.screenW() * 0.02),
                                width: Adapt.screenW() * 0.8,
                                child: Text(
                                  state.clr.commentContent,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey[200],
                      height: Adapt.px(20),
                      width: Adapt.screenW(),
                    ),
                    Container(
                      // margin: EdgeInsets.only(top: Adapt.px(20)),
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
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(Adapt.px(20.0),
                                Adapt.px(20), Adapt.px(20), Adapt.px(20)),
                            child: Text('评论 ${state.clr.tcResult.length}'),
                          ),
                          Container(
                              height: Adapt.px(40.0),
                              child: VerticalDivider(color: Colors.grey)),
                          Container(
                            padding: EdgeInsets.all(Adapt.px(20.0)),
                            child: Text('获赞 ${state.clr.likeCounts}'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: new NeverScrollableScrollPhysics(),
                        itemBuilder: adapter.itemBuilder,
                        itemCount: adapter.itemCount,
                      ),
                    )
                  ],
                ),
              ),
            ),
            state.isFocus
                ? afterForcus(state, dispatch)
                : beforeForcus(state, dispatch)
          ],
        ),
      ),
    ),
  );
}

Widget afterForcus(CommentDetailState state, Dispatch dispatch) {
  return Container(
    color: Colors.white,
    child: Row(
      children: <Widget>[
        SizedBox(
          width: Adapt.px(8),
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.image,
            color: Colors.blue,
            size: 18,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: Adapt.px(8),
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.smile,
            color: Colors.blue,
            size: 18,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: Adapt.px(8),
        ),
        Expanded(
          child: TextField(
            autofocus: true,
            controller: state.textController,
            decoration: InputDecoration(
              hintText: '回复： ${state.addCommentInfo['tcName']}',
            ),
          ),
        ),
        SizedBox(
          width: Adapt.px(8),
        ),
        IconButton(
          icon: Icon(
            Icons.send,
            color: Colors.blue,
            size: 18,
          ),
          onPressed: () {
            var data = {
              'tcId': 0,
              'tcName': '',
            };
            dispatch(CommentDetailActionCreator.onAddToComment(data));
          },
        ),
      ],
    ),
  );
}

Widget beforeForcus(CommentDetailState state, Dispatch dispatch) {
  return Container(
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: FlatButton(
            child: Text('click'),
            onPressed: () async {
              dispatch(CommentDetailActionCreator.onCommentClick());
            },
          ),
        ),
      ],
    ),
  );
}
