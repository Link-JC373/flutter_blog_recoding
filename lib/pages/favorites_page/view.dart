import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    FavoritesState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();

  return Scaffold(
    appBar: AppBar(
      title: Text('收藏夹'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            dispatch(FavoritesActionCreator.onShowDialog());
          },
        )
      ],
    ),
    body: Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemBuilder: adapter.itemBuilder,
        itemCount: adapter.itemCount,
      ),
    ),
  );
}
