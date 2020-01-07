import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ChangeInfoState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('修改信息'),
      centerTitle: true,
      actions: <Widget>[
        FlatButton(
          onPressed: () => {dispatch(ChangeInfoActionCreator.onChangeInfo())},
          child: Text('确认'),
        )
      ],
    ),
    body: Container(
      color: Colors.grey[100],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: Adapt.px(100),
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                SizedBox(
                  width: 5,
                ),
                Text('个人信息'),
              ],
            ),
          ),
          //头像区域
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            child: FlatButton(
              color: Colors.white,
              // onPressed: () => viewService.buildComponent('changeAvatar'),
              onPressed: () =>
                  {dispatch(ChangeInfoActionCreator.onChangeAvatar())},
              child: Container(
                height: Adapt.px(150),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        child: Text('头像'),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        state.imgUrl,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            child: FlatButton(
              color: Colors.white,
              onPressed: () =>
                  {dispatch(ChangeInfoActionCreator.onChangeUserName())},
              child: Container(
                height: Adapt.px(100),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        child: Text('设置昵称'),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Text(
                      '${state.userName}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            child: FlatButton(
              color: Colors.white,
              onPressed: () =>
                  {dispatch(ChangeInfoActionCreator.onChangeDisc())},
              child: Container(
                height: Adapt.px(100),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        child: Text(
                          '个性签名',
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Text('${state.disc}'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
