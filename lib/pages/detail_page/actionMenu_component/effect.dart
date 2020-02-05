import 'dart:convert';

import 'package:blog_flutter/model/favorites.dart';
import 'package:blog_flutter/pages/detail_page/action.dart';
import 'package:blog_flutter/pages/favorites_page/action.dart';
import 'package:blog_flutter/utils/adapt.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Effect<ActionMenuState> buildEffect() {
  return combineEffects(<Object, Effect<ActionMenuState>>{
    ActionMenuAction.action: _onAction,
    ActionMenuAction.onChangeFavState: _onChangeFavState,
    ActionMenuAction.onFav: _onFav,
    ActionMenuAction.onCancelFav: _onCancelFav,
  });
}

void _onAction(Action action, Context<ActionMenuState> ctx) {}
Future _onFav(Action action, Context<ActionMenuState> ctx) async {
  var res = await DioUtil.request('favArticle', formData: action.payload);
  if (res != null) {
    ctx.dispatch(ActionMenuActionCreator.change(true));

    Navigator.of(ctx.context).pop();
    Fluttertoast.showToast(
      msg: "收藏成功",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  } else {
    SpinKitCircle(
      color: Colors.blue,
    );
  }
}

Future _onCancelFav(Action action, Context<ActionMenuState> ctx) async {
  var res = await DioUtil.request('cancelFav', formData: action.payload);
  if (res != null) {
    res = json.decode(res);
    print('==========================================');
    print(res);
    if (res['data']['isFav'] == false) {
      ctx.dispatch(ActionMenuActionCreator.change(false));
    }
    Navigator.of(ctx.context).pop();
    Fluttertoast.showToast(
      msg: "取消收藏成功",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // ctx.dispatch(ActionMenuActionCreator.change());
  } else {
    SpinKitCircle(
      color: Colors.blue,
    );
  }
}

Future _onChangeFavState(Action action, Context<ActionMenuState> ctx) async {
  Navigator.of(ctx.context).pop();
  var data = {
    'userId': ctx.state.userInfo['userId'],
  };
  return showModalBottomSheet(
      context: ctx.context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(Adapt.px(30)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('添加到收藏夹'),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed('addFav_page')
                            .then((res) {
                          ctx.dispatch(
                              ActionMenuActionCreator.onChangeFavState());
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                child: FutureBuilder<dynamic>(
                  future: DioUtil.request('getFavorites', formData: data),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                        margin: EdgeInsets.only(top: Adapt.px(30)),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.black),
                        ),
                      );
                    } else {
                      var res = snapshot.data.toString();
                      FavListModel favListModel;
                      favListModel = FavListModel(json.decode(res));
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: favListModel.results.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                var data = {
                                  'articleId': ctx.state.articleId,
                                  'userId': ctx.state.userInfo['userId'],
                                  'favId': favListModel.results[index].favId
                                };
                                if (favListModel.results[index].isFav) {
                                  //取消收藏

                                  ctx.dispatch(
                                      ActionMenuActionCreator.onCancelFav(
                                          data));
                                } else {
                                  //添加收藏

                                  ctx.dispatch(
                                      ActionMenuActionCreator.onFav(data));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(Adapt.px(30.0)),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              '${favListModel.results[index].favName}'),
                                          SizedBox(
                                            height: Adapt.px(10),
                                          ),
                                          Text(
                                              '${favListModel.results[index].favCount}'),
                                        ],
                                      ),
                                    ),
                                    favListModel.results[index].isFav
                                        ? Align(
                                            alignment: FractionalOffset.center,
                                            child: Icon(Icons.check),
                                          )
                                        : Container(),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.black12),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
              // ListView()
            ],
          ),
        );
      });
}
