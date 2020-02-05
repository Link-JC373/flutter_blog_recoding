import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<AddFavState> buildEffect() {
  return combineEffects(<Object, Effect<AddFavState>>{
    AddFavAction.action: _onAction,
    AddFavAction.onAddFav: _onAddFav,
  });
}

void _onAction(Action action, Context<AddFavState> ctx) {}
Future _onAddFav(Action action, Context<AddFavState> ctx) async {
  // print('------------->favName' + action.payload);
  var data = {
    'userId': ctx.state.userInfo['userId'],
    'favName': ctx.state.textFavNameController.text
  };
  await DioUtil.request('addFavorites', formData: data).then((res) {
    Navigator.of(ctx.context).pop();
  });
}
