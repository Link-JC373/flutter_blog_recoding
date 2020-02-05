import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AddFavState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('新增收藏夹'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            dispatch(AddFavActionCreator.onAddFav());
          },
          child: Text('确认'),
        )
      ],
    ),
    body: Container(
      padding: EdgeInsets.all(Adapt.px(40.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('名称'),
          SizedBox(
            height: Adapt.px(10.0),
          ),
          TextField(
            autofocus: true,
            controller: state.textFavNameController,
          )
        ],
      ),
    ),
  );
}
