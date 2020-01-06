import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MemberState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: PreferredSize(
      child: AppBar(
        title: Text('ME!'),
        centerTitle: true,
      ),
      preferredSize: Size.fromHeight(Adapt.px(70)),
    ),
    body: Container(
      color: Colors.grey[100],
      child: content(state, dispatch),
    ),
  );
}

Widget content(MemberState state, Dispatch dispatch) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      personInfomation(state, dispatch),
      aboutMe(),
    ],
  );
}

Widget personInfomation(MemberState state, Dispatch dispatch) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 15),
    child: FlatButton(
      onPressed: () {
        // if (providerModal.isLogin) {
        //   IsLoginModal.handleTap('changeInfo', context);
        // } else {
        //   // Application.router.navigateTo(context, '/login');
        // }
        dispatch(MemberActionCreator.onHandleClick());
      },
      color: Colors.white,
      child: Container(
        height: Adapt.px(140),
        child: Container(
          // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 24,
                backgroundImage: state.userInfo != null
                    ? NetworkImage(
                        state.userInfo['userIcon'],
                      )
                    : NetworkImage(
                        'https://mirror-gold-cdn.xitu.io/16cf9de539bc9ae43fb?imageView2/1/w/180/h/180/q/85/interlace/1',
                      ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: Adapt.px(20)),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          state.userInfo != null
                              ? state.userInfo['userName']
                              : '登录/注册',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          state.userInfo != null
                              ? state.userInfo['disc']
                              : '简单介绍一下自己吧',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.center,
                child: Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget aboutMe() {
  // var screenSize = MediaQuery.of(context).size;

  return Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12),
          ),
        ),
        child: FlatButton(
          onPressed: () {},
          color: Colors.white,
          child: Container(
            height: Adapt.px(100),
            // padding: EdgeInsets.fromLTRB(20, 10, 10, 10),

            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.solidBell,
                  size: 16.0,
                  color: Colors.blue,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('消息中心'),
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
          onPressed: () {},
          color: Colors.white,
          child: Container(
            height: Adapt.px(100),

            // padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.solidThumbsUp,
                  size: 16.0,
                  color: Colors.green,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('我赞过的'),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        child: FlatButton(
          color: Colors.white,
          onPressed: () {},
          child: Container(
            height: Adapt.px(100),

            // padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.solidStar,
                  size: 16.0,
                  color: Colors.yellow,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('我的收藏'),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
