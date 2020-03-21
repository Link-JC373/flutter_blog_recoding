import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    FavArticleCellState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
      dispatch(FavArticleCellActionCreator.onJumpToDetail());
    },
    child: Container(
      height: Adapt.px(200.0),
      padding: EdgeInsets.all(Adapt.px(30.0)),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: Adapt.px(0.5),
            color: Colors.black,
          ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            state.results.title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: Adapt.px(40.0),
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: Adapt.px(15),
          ),
          Text(
            state.results.authorName,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: Adapt.px(30),
                decoration: TextDecoration.none),
          ),
        ],
      ),
    ),
  );
}
