import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ResumeState state, Dispatch dispatch, ViewService viewService) {
  return DefaultTabController(
    length: state.tabs.length,
    child: NestedScrollView(
      controller: state.scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            child: SliverAppBar(
              title: Text(state.user.username),
              expandedHeight: Adapt.px(600.0),
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
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/background.jpg',
                      ),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(Adapt.px(30.0), Adapt.px(0.0),
                      Adapt.px(30.0), Adapt.px(20)),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: Adapt.px(180),
                      ),
                      CircleAvatar(
                        radius: 36,
                        backgroundImage: NetworkImage(
                          state.user.userIcon,
                        ),
                      ),
                      SizedBox(
                        height: Adapt.px(30),
                      ),
                      Text(
                        state.user.username,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: Adapt.px(5),
                      ),
                      Text(
                        state.user.disc ?? '',
                      ),
                      SizedBox(
                        height: Adapt.px(20),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('0',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w300)),
                              Text('关注'),
                            ],
                          ),
                          VerticalDivider(color: Colors.grey),
                          Column(
                            children: <Widget>[
                              Text('0',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w300)),
                              Text('关注者'),
                            ],
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
                                              color: Colors.white, width: 1.5),
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
                                        dispatch(ResumeActionCreator.follow());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            Adapt.px(30),
                                            Adapt.px(10),
                                            Adapt.px(30),
                                            Adapt.px(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1.5),
                                        ),
                                        child: Text(
                                          '关注',
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
              bottom: TabBar(
                controller: state.tabController,
                tabs: state.tabs.map((String name) => Tab(text: name)).toList(),
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
      body: TabBarView(
        controller: state.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          viewService.buildComponent('MyArticle'),
          viewService.buildComponent('MyComment'),
          viewService.buildComponent('More'),
        ],
      ),
    ),
  );
}
