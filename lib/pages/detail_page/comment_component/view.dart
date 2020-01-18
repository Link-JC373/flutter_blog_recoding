import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentState state, Dispatch dispatch, ViewService viewService) {
  return InkWell(
    onTap: () {
      print('ready to jump!');
    },
    child: Container(
      // color: Colors.white,
      margin: EdgeInsets.only(top: Adapt.px(20)),
      padding: EdgeInsets.only(bottom: Adapt.px(10)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(Adapt.screenW() * 0.03),
            child: Align(
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  state.clr.user.userIcon,
                ),
                // backgroundImage: NetworkImage(
                //   'https://mirror-gold-cdn.xitu.io/16cf9de539bc9ae43fb?imageView2/1/w/180/h/180/q/85/interlace/1',
                // ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: Adapt.screenW() * 0.5,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Text(
                          // 'Name',
                          state.clr.user.username,
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          // 'disc',
                          state.clr.user.disc,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Adapt.screenW() * 0.07,
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.thumbsUp,
                        size: 12,
                        color: Colors.grey,
                        // color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: Adapt.screenW() * 0.15,
                    child: state.clr.likeCounts == 0
                        ? Text(' ')
                        : Text('${state.clr.likeCounts}'),
                  ),
                  Icon(
                    Icons.message,
                    size: 12,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    left: Adapt.screenW() * 0.02,
                    right: Adapt.screenW() * 0.02),
                width: Adapt.screenW() * 0.8,
                child: Text(
                  state.clr.commentContent,
                  softWrap: true,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
