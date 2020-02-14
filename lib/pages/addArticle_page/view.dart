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
          child: Text('发布'),
          onPressed: () {
            dispatch(AddArticleActionCreator.onAction());
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
                ),
              ),
              Expanded(
                child: TextField(
                  autofocus: true,
                  controller: state.textController,
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
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(Adapt.px(40)),
                alignment: Alignment.topCenter,
                child: Icon(
                  FontAwesomeIcons.alignLeft,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: TextField(
                  autofocus: true,
                  maxLines: null,
                  controller: state.textController,
                  decoration: InputDecoration(
                    hintText: '简介',
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
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(Adapt.px(40)),
                alignment: Alignment.topCenter,
                child: Icon(
                  FontAwesomeIcons.tags,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: TextField(
                  autofocus: true,
                  maxLines: null,
                  controller: state.textController,
                  decoration: InputDecoration(
                    hintText: '简介',
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
