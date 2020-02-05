import 'dart:convert';

import 'package:blog_flutter/model/favorites.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<FavoritesState> buildEffect() {
  return combineEffects(<Object, Effect<FavoritesState>>{
    FavoritesAction.action: _onAction,
    FavoritesAction.onAddFav: _onAddFav,
    FavoritesAction.onShowDialog: _showDialog,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<FavoritesState> ctx) {}
Future _init(Action action, Context<FavoritesState> ctx) async {
  var data = {
    'userId': ctx.state.userId,
  };
  await DioUtil.request('getFavorites', formData: data).then((res) {
    FavListModel favListModel;
    if (res != null) favListModel = FavListModel(res);
    ctx.dispatch(FavoritesActionCreator.getFavList(favListModel));
  });
}

Future _onAddFav(Action action, Context<FavoritesState> ctx) async {
  // print('------------->favName' + action.payload);
  var data = {'userId': ctx.state.userId, 'favName': action.payload};
  await DioUtil.request('addFavorites', formData: data).then((res) {
    FavListModel favListModel;
    var data = json.decode(res.toString());
    if (data['data'] != null) favListModel = FavListModel(data['data']);
    ctx.dispatch(FavoritesActionCreator.getFavList(favListModel));
  });
}

Future _showDialog(Action action, Context<FavoritesState> ctx) async {
  return showDialog<Null>(
    context: ctx.context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('添加收藏夹名'),
        content: SingleChildScrollView(
          child: TextField(
            autofocus: true,
            controller: ctx.state.textFavName,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("确定"),
            onPressed: () {
              if (ctx.state.textFavName.text != null) {
                ctx.dispatch(FavoritesActionCreator.onAddFav(
                    ctx.state.textFavName.text));
                Navigator.of(context).pop();
              }
            },
          ),
          FlatButton(
            child: Text("取消"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
