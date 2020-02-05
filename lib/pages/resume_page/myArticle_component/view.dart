import 'package:blog_flutter/custom_widgets/keepalive_widget.dart';
import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MyArticleState state, Dispatch dispatch, ViewService viewService) {
  var adapter = viewService.buildAdapter();

  return keepAliveWrapper(
    Container(
      color: Colors.grey[200],
      padding: EdgeInsets.only(top: Adapt.px(200)),
      child: ListView.builder(
        shrinkWrap: true,
        // controller: state.articleController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: adapter.itemBuilder,
        itemCount: adapter.itemCount,
      ),
    ),
  );
}
