import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AddArticleState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('分享文章'),
      actions: <Widget>[
        FlatButton(
          child: Text(
            '发布',
            style: TextStyle(
              color: Colors.white,
              fontSize: Adapt.px(40),
            ),
          ),
          onPressed: () {
            dispatch(AddArticleActionCreator.onSubmit());
          },
        ),
      ],
    ),
    body: Container(
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(Adapt.px(40)),
                alignment: Alignment.topCenter,
                child: Icon(
                  FontAwesomeIcons.alignLeft,
                  color: Colors.blue,
                  size: Adapt.px(30),
                ),
              ),
              Expanded(
                child: TextField(
                  autofocus: false,
                  controller: state.titleTextController,
                  decoration: InputDecoration(
                    hintText: '标题',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: Adapt.px(1),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(Adapt.px(40)),
                alignment: Alignment.topCenter,
                child: Icon(
                  FontAwesomeIcons.alignLeft,
                  color: Colors.blue,
                  size: Adapt.px(30),
                ),
              ),
              Expanded(
                child: TextField(
                  autofocus: false,
                  maxLines: null,
                  controller: state.introduceTextController,
                  decoration: InputDecoration(
                    hintText: '文章简介',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: Adapt.px(1),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(Adapt.px(40)),
                alignment: Alignment.topCenter,
                child: Icon(
                  FontAwesomeIcons.tags,
                  color: Colors.blue,
                  size: Adapt.px(30),
                ),
              ),
              Expanded(
                  child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: Adapt.px(15.0)),
                      child: RaisedButton(
                        color: state.onChoose[0]
                            ? Colors.black54
                            : Colors.grey[300],
                        onPressed: () {
                          dispatch(AddArticleActionCreator.onChangeChoose(0));
                        },
                        child: Text(
                          '游戏开发',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: Adapt.px(15.0)),
                      child: RaisedButton(
                        color: state.onChoose[1]
                            ? Colors.black54
                            : Colors.grey[300],
                        onPressed: () {
                          dispatch(AddArticleActionCreator.onChangeChoose(1));
                        },
                        child: Text(
                          '游戏运维',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: Adapt.px(15.0)),
                      child: RaisedButton(
                        color: state.onChoose[2]
                            ? Colors.black54
                            : Colors.grey[300],
                        onPressed: () {
                          dispatch(AddArticleActionCreator.onChangeChoose(2));
                        },
                        child: Text(
                          '游戏测评',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: Adapt.px(1),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(Adapt.px(40)),
                alignment: Alignment.topCenter,
                child: Icon(
                  FontAwesomeIcons.tasks,
                  color: Colors.blue,
                  size: Adapt.px(30),
                ),
              ),
              Expanded(
                child: TextField(
                  autofocus: false,
                  maxLines: null,
                  controller: state.contentTextController,
                  decoration: InputDecoration(
                    hintText: '文章内容',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
