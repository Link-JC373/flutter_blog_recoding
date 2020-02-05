import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MoreState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.grey[200],
    padding: EdgeInsets.only(top: Adapt.px(300)),
    child: Column(
      children: <Widget>[
        Container(
          child: FlatButton(
            color: Colors.white,
            onPressed: () {
              dispatch(MoreActionCreator.onJumpToFav());
            },
            child: Container(
              height: Adapt.px(100),

              // padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.solidStar,
                    size: 16.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text('收藏集'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
