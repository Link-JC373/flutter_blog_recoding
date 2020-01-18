import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    DetailState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '文章详情页',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    body: state.articleContent != null
        ? GestureDetector(
            onTap: () {
              dispatch(DetailActionCreator.clickBlank());
            },
            child: Container(
              color: Colors.grey[200],

              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      child: ListView(
                        controller: state.scrollController,
                        // shrinkWrap: true,
                        children: <Widget>[
                          Text('这里放作者简介'),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(Adapt.px(20)),
                            child: MarkdownBody(
                              data: state.articleContent,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: Adapt.px(20.0)),
                            color: Colors.white,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: new NeverScrollableScrollPhysics(),
                              itemBuilder: adapter.itemBuilder,
                              itemCount: adapter.itemCount,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  state.isFocus
                      ? afterForcus(state, dispatch)
                      : beforeForcus(state, dispatch)
                ],
              ),
              // ),
            ),
          )
        : SpinKitRing(color: Colors.blue),
  );
}

Widget afterForcus(DetailState state, Dispatch dispatch) {
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
              hintText: '作者在等着你的回复哦~~',
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
            dispatch(DetailActionCreator.onAddComment());
          },
        ),
      ],
    ),
  );
}

Widget beforeForcus(DetailState state, Dispatch dispatch) {
  return Container(
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: FlatButton(
            child: Text('click'),
            onPressed: () async {
              dispatch(DetailActionCreator.onCommentClick());
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.thumbsUp,

                  color: state.userInfo != null ? Colors.blue : Colors.grey,
                  // color: Colors.blue,
                ),
                onPressed: () {
                  return dispatch(DetailActionCreator.likeAction());
                },
              ),
              state.likeCount == 0 ? Text(' ') : Text('${state.likeCount}'),
              IconButton(
                icon: Icon(Icons.message),
                iconSize: 16,
                onPressed: () {},
              ),
              Text('233'),
            ],
          ),
        ),
      ],
    ),
  );
}
