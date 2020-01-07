import 'dart:convert';

import 'package:blog_flutter/global_store/action.dart';
import 'package:blog_flutter/global_store/state.dart';
import 'package:blog_flutter/global_store/store.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:toast/toast.dart';

import 'package:image_picker/image_picker.dart';
import 'action.dart';
import 'state.dart';

Effect<ChangeInfoState> buildEffect() {
  return combineEffects(<Object, Effect<ChangeInfoState>>{
    Lifecycle.initState: _init,
    ChangeInfoAction.action: _onAction,
    ChangeInfoAction.onChangeAvatar: _onChangeAvatar,
    ChangeInfoAction.onChangeDisc: _onChangeDisc,
    ChangeInfoAction.onChangeUserName: _onChangeUserName,
    ChangeInfoAction.onChangeInfo: _onChangeInfo,
  });
}

void _onAction(Action action, Context<ChangeInfoState> ctx) {}
void _init(Action action, Context<ChangeInfoState> ctx) {
  print(ctx.state.userInfo);
  print('-----------------');
  ctx.dispatch(ChangeInfoActionCreator.initInfo(ctx.state.userInfo));
}

Future _onChangeAvatar(Action action, Context<ChangeInfoState> ctx) {
  return showModalBottomSheet(
      context: ctx.context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text("照相"),
              onTap: () async {
                var imageFile =
                    await ImagePicker.pickImage(source: ImageSource.camera);
                var imgData = await DioUtil.upLoadImage(imageFile);

                ctx.dispatch(ChangeInfoActionCreator.changeAvatar(
                    imgData['data']['url']));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("从相册中选择"),
              onTap: () async {
                var imageFile =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                if (imageFile != null) {
                  var imgData = await DioUtil.upLoadImage(imageFile);
                  ctx.dispatch(ChangeInfoActionCreator.changeAvatar(
                      imgData['data']['url']));
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

Future _onChangeDisc(Action action, Context<ChangeInfoState> ctx) {
  return showDialog<Null>(
    context: ctx.context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('修改签名'),
        content: SingleChildScrollView(
          child: TextField(
            autofocus: true,
            controller: ctx.state.textDiscCT,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("确定"),
            onPressed: () {
              ctx.dispatch(ChangeInfoActionCreator.changeDisc(
                  ctx.state.textDiscCT.text));
              Navigator.of(context).pop();
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

Future _onChangeUserName(Action action, Context<ChangeInfoState> ctx) {
  return showDialog<Null>(
    context: ctx.context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('修改用户名'),
        content: SingleChildScrollView(
          child: TextField(
            autofocus: true,
            controller: ctx.state.textNameCT,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("确定"),
            onPressed: () {
              ctx.dispatch(ChangeInfoActionCreator.changeUserName(
                  ctx.state.textNameCT.text));
              Navigator.of(context).pop();
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

Future _onChangeInfo(Action action, Context<ChangeInfoState> ctx) async {
  var userInfo = {
    'userIcon': ctx.state.imgUrl,
    'userName': ctx.state.userName,
    'disc': ctx.state.disc,
    'id': ctx.state.id
  };

  var res =
      await DioUtil.request('changeInfo', formData: json.encode(userInfo));
  res = json.decode(res.toString());
  // GlobalStore.store.dispatch(GlobalStoreActionCreator.loginAction(res['data']));
  // Fluttertoast.showToast(
  //   msg: "修改成功",
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity: ToastGravity.CENTER,
  //   timeInSecForIos: 1,
  //   backgroundColor: Colors.green,
  //   textColor: Colors.white,
  //   fontSize: 16.0,
  // );
  if (res['status'] == 200) {
    // Toast.show("修改成功", ctx.context, duration: 3, gravity: Toast.CENTER);
    Fluttertoast.showToast(
      msg: "修改成功",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    GlobalStore.store
        .dispatch(GlobalStoreActionCreator.loginAction(res['data']));
    Navigator.of(ctx.context).pop();
  } else {
    Fluttertoast.showToast(
      msg: "修改失败",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
