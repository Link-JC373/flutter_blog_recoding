import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    FavDetailState state, Dispatch dispatch, ViewService viewService) {
  return InkWell(
    onTap: () {
      // FavDetailActionCreator
      dispatch(FavDetailActionCreator.onJumpToDetail());
    },
    child: Container(
      padding: EdgeInsets.all(Adapt.px(30.0)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${state.result.favName}'),
                SizedBox(
                  height: Adapt.px(10),
                ),
                Text('${state.result.favCount}'),
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Icon(Icons.arrow_right),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black12),
        ),
      ),
    ),
  );
}
