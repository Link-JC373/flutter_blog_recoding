import 'package:blog_flutter/model/favorites.dart';
import 'package:blog_flutter/pages/detail_page/action.dart';
import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ActionMenuState state, Dispatch dispatch, ViewService viewService) {
  return IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {
      // dispatch(ActionMenuActionCreator.onShowDialog());
      if (state.userInfo != null) {
        List<Widget> iconList = [
          IconButton(
            onPressed: () {
              dispatch(ActionMenuActionCreator.onChangeFavState());
            },
            icon: state.havingFav
                ? Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : Icon(
                    Icons.star_border,
                    color: Colors.yellow,
                  ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.weixin,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.qq,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.weibo,
              color: Colors.blue,
            ),
          ),
        ];

        Widget getIconList(Widget widget) {
          return Container(
            child: widget,
          );
        }

        return showModalBottomSheet(
          // shape: ,
          context: viewService.context,
          builder: (BuildContext context) {
            return Container(
              height: Adapt.px(200),
              child: GridView.builder(
                itemCount: iconList.length,
                itemBuilder: (BuildContext context, int index) {
                  return getIconList(iconList[index]);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                    //单个子Widget的水平最大宽度
                    crossAxisCount: 4,
                    //水平单个子Widget之间间距
                    mainAxisSpacing: 20.0,
                    //垂直单个子Widget之间间距
                    crossAxisSpacing: 10.0),
              ),
            );
          },
        );
      } else {
        dispatch(DetailActionCreator.onGoToLogin());
      }
    },
  );
}
