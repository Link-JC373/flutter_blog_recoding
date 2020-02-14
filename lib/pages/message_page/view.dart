import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MessageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: AppBar(
        title: Text('消息中心'),
        centerTitle: true,
        // bottom: ,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: Adapt.screenH() / 5,
            width: Adapt.screenW(),
            alignment: Alignment.center,
            color: Colors.grey[100],
            child: Text('Ops! Sorry,您进入了一个暂未完工的页面.....'),
          ),
          Container(
            height: Adapt.screenH() / 2,
            width: Adapt.screenW(),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    'assets/images/working.jpg',
                  ),
                )),
          ),
        ],
      ));
}
