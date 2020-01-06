import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    DetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '文章详情页',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    body: state.articleContent != null
        ? GestureDetector(
            onTap: () {
              dispatch(DetailActionCreator.clickBlank());
            },
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    child: ListView(
                      children: <Widget>[
                        Text('这里放作者简介'),
                        MarkdownBody(
                          data: state.articleContent,
                        ),
                        ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Text('这里要写评论'),
                            Text('这里要写评论'),
                            Text('这里要写评论'),
                            Text('这里要写评论'),
                            Text('这里要写评论'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                state.isFocus ? afterForcus() : beforeForcus(state, dispatch)
              ],
            ),
          )
        : SpinKitRing(color: Colors.blue),
  );
}

Widget afterForcus() {
  return Row(
    children: <Widget>[
      Expanded(
        child: TextField(
          autofocus: true,
        ),
      ),
    ],
  );
}

Widget beforeForcus(DetailState state, Dispatch dispatch) {
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: FlatButton(
          child: Text('click'),
          onPressed: () async {
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // if (!providerModal.isLogin) {
            //   Application.router.navigateTo(context, '/login');
            // } else {
            //   setState(() {
            //     isFocus = true;
            //   });
            // }
            dispatch(DetailActionCreator.commentClick());
          },
        ),
      ),
      Expanded(
        flex: 1,
        child: Row(
          children: <Widget>[
            LikeButton(
              // isLiked: providerModal.articleData['data']['isLike'],
              isLiked: state.isLiked,
              likeBuilder: (bool isLiked) {
                return Icon(
                  FontAwesomeIcons.thumbsUp,
                  color: isLiked ? Colors.blue : Colors.grey,
                );
              },
              likeCount: state.likeCount,
              // likeCount: 666,
              onTap: (bool isLiked) {
                // if (providerModal.isLogin) {
                //   return onLikeButtonTap(isLiked);
                // } else {
                //   Application.router.navigateTo(context, '/login');
                // }
              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              iconSize: 16,
              onPressed: () {},
            ),
            Text('233'),
          ],
        ),
      ),
    ],
  );
}
