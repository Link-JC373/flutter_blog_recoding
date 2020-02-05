import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentCellState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: EdgeInsets.only(top: Adapt.px(30)),
    child: Material(
      child: InkWell(
        child: Container(
          height: Adapt.px(440),
          padding: EdgeInsets.fromLTRB(
              Adapt.px(30), Adapt.px(30), Adapt.px(30), Adapt.px(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      state.result.user.userIcon,
                    ),
                  ),
                  Container(
                    width: Adapt.px(20),
                  ),
                  Text(state.result.user.username),
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(top: Adapt.px(20), bottom: Adapt.px(20)),
                child: Text(state.result.commentContent),
              ),
              Container(
                color: Colors.grey[300],
                width: Adapt.screenW() - Adapt.px(60),
                padding:
                    EdgeInsets.only(left: Adapt.px(30), right: Adapt.px(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: Adapt.px(20)),
                      child: Text(
                        state.result.articleTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: Adapt.px(30),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: Adapt.px(10)),
                      height: Adapt.px(120),
                      child: Text(
                        state.result.articleIntroduce,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
