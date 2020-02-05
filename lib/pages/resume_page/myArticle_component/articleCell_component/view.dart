import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ArticleCellState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: EdgeInsets.only(top: Adapt.px(30)),
    child: Material(
      child: InkWell(
        onTap: () {
          Navigator.of(viewService.context)
              .pushNamed('detail_page', arguments: {'id': state.alr.articleId});
        },
        child: Container(
          height: Adapt.px(370),
          padding: EdgeInsets.all(Adapt.px(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                      state.alr.user.userIcon,
                    ),
                  ),
                  Container(
                    width: Adapt.px(20),
                  ),
                  Text(state.alr.user.username),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(state.alr.blogType),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: Adapt.px(20)),
                child: Text(
                  state.alr.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: Adapt.px(35),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: Adapt.px(20)),
                height: Adapt.px(150),
                child: Text(
                  state.alr.introduce,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.thumbsUp,
                      size: 12,
                    ),
                    Container(
                      width: Adapt.px(20),
                    ),
                    Text('${state.alr.likeCount}'),
                    Container(
                      width: Adapt.px(40),
                    ),
                    Icon(
                      Icons.message,
                      size: 12,
                    ),
                    Container(
                      width: Adapt.px(20),
                    ),
                    Text('${state.alr.commentCount}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
