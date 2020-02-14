import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    FavDetailState state, Dispatch dispatch, ViewService viewService) {
  var adapter = viewService.buildAdapter();

  return state.user != null
      ? NestedScrollView(
          controller: state.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  // title: Text(state.user.username),
                  expandedHeight: Adapt.px(500.0),
                  floating: false,
                  pinned: true,
                  snap: false,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(viewService.context).pop();
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    // title: Text("_playMate"),
                    background: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter:
                              ColorFilter.mode(Colors.black54, BlendMode.color),
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/background2.jpg',
                          ),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(Adapt.px(50.0),
                          Adapt.px(0.0), Adapt.px(50.0), Adapt.px(20)),
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: Adapt.px(250),
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  state.user.userIcon,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: Adapt.px(15)),
                                child: Text(
                                  state.user.username,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Adapt.px(30),
                          ),
                          Text(
                            '${state.favArticleListModel.favName}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Adapt.px(50),
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                '${state.favArticleListModel.count}篇',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: state.isSelf
                                      ? FlatButton(
                                          onPressed: () {
                                            Navigator.of(viewService.context)
                                                .pushNamed('changeInfo_page');
                                          },
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                Adapt.px(30),
                                                Adapt.px(10),
                                                Adapt.px(30),
                                                Adapt.px(10)),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1.5),
                                            ),
                                            child: Text(
                                              '编辑',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Adapt.px(30),
                                              ),
                                            ),
                                          ),
                                        )
                                      : FlatButton(
                                          onPressed: () {
                                            // dispatch(ResumeActionCreator.follow());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                Adapt.px(30),
                                                Adapt.px(10),
                                                Adapt.px(30),
                                                Adapt.px(10)),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1.5),
                                            ),
                                            child: Text(
                                              '收藏',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Adapt.px(30),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ];
          },
          body: Container(
            padding: EdgeInsets.only(top: Adapt.px(100)),
            color: Colors.grey[100],
            child: ListView.builder(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              itemBuilder: adapter.itemBuilder,
              itemCount: adapter.itemCount,
            ),
          ),
        )
      : SpinKitRing(
          color: Colors.blue,
        );
}
