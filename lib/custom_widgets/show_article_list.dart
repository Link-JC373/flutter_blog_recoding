import 'dart:convert';

import 'package:blog_flutter/utils/adapt.dart';
import 'package:blog_flutter/utils/service_method.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_shop/provider/login_provider.dart';
// import 'package:flutter_shop/utils/service_method.dart';
// import 'package:provider/provider.dart';
// import '../routers/application.dart';

int pageSize = 10;
int pageNum = 0;
List<Map> articleList = [];
int _count = 10; //一次显示的条数

class ShowArticleList extends StatefulWidget {
  final String url;
  final String searchContent;
  final int articleTypeId;

  final String userId;

  // ShowArticleList({Key: key, this.url}) : super(Key: key);
  const ShowArticleList(
      {Key key, this.searchContent, this.url, this.articleTypeId, this.userId})
      : super(key: key);

  @override
  _ShowArticleListState createState() =>
      _ShowArticleListState(url, searchContent, articleTypeId, userId);
}

class _ShowArticleListState extends State<ShowArticleList> {
  final String url;

  final String searchContent;
  final int articleTypeId;
  final String userId;
  bool loading;

  _ShowArticleListState(
      this.url, this.searchContent, this.articleTypeId, this.userId);

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
      _count = 10;
      pageNum = 1;
    });
    var formPage = {
      'pageSize': pageSize,
      'pageNum': pageNum,
      'searchContent': searchContent,
      'articleTypeId': articleTypeId
    };
    try {
      DioUtil.request(url, formData: formPage).then((val) {
        var data = json.decode(val.toString());
        // print(data['data']['rows']);
        List<Map> newArticlList = (data['data']['rows'] as List).cast();
        setState(() {
          articleList.clear();
          articleList.addAll(newArticlList);
          pageNum++;
          loading = false;
          // _count += 10;
        });
        // print('hard');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? SpinKitRing(
            color: Colors.blue,
          )
        : EasyRefresh.custom(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ArticleList(
                      index: index,
                      userId: userId,
                    );
                  },
                  childCount: _count,
                ),
              ),
            ],
            onRefresh: () async {
              setState(() {
                pageNum = 1;
                _count = 0;

                // loading = true;
              });
              print('开始加载');
              var formPage = {
                'pageNum': pageNum,
                'pageSize': pageSize,
                'articleTypeId': articleTypeId
              };
              await DioUtil.request(url, formData: formPage).then((val) {
                var data = json.decode(val.toString());
                List<Map> newArticlesList =
                    (data['data']['rows'] as List).cast();
                // print(newArticlesList);
                setState(() {
                  articleList.clear();

                  articleList.addAll(newArticlesList);
                  pageNum++;
                  _count += (data['data']['rows'] as List).length;
                });
                print(articleList.length);
              });
            },
            onLoad: () async {
              print('开始加载更多');
              var formPage = {
                'pageNum': pageNum,
                'pageSize': pageSize,
                'searchContent': searchContent,
                'articleTypeId': articleTypeId
              };
              await DioUtil.request(url, formData: formPage).then((val) {
                var data = json.decode(val.toString());
                List<Map> newArticlesList =
                    (data['data']['rows'] as List).cast();
                setState(() {
                  articleList.addAll(newArticlesList);
                  pageNum++;
                  _count += (data['data']['rows'] as List).length;
                });
              });
            },
          );
  }
}

//文章列表展示控件
class ArticleList extends StatelessWidget {
  final int index;
  final String userId;
  // ArticleList(this.index);

  // List<Map> articleList;
  const ArticleList({Key key, this.index, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final providerModal = Provider.of<IsLoginModal>(context);
    if (articleList.length != 0) {
      // print(index);
      //Card本身似乎没有点击事件，使用 InkWell 包裹使其能够触发点击事件
      return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: Adapt.px(20.0)),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('detail_page', arguments: {
              'id': articleList[index]['id'],
              'userId': userId,
            });
          },
          child: Container(
            height: Adapt.px(370),
            padding: EdgeInsets.all(Adapt.px(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                        articleList[index]['user']['user_icon'],
                      ),
                    ),
                    Container(
                      width: Adapt.px(20),
                    ),
                    Text(articleList[index]['user']['username']),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child:
                            Text(articleList[index]['blog_type']['typename']),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: Adapt.px(10)),
                  child: Text(
                    articleList[index]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: Adapt.px(35),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: Adapt.px(20)),
                  height: Adapt.px(150),
                  child: Text(
                    articleList[index]['introduce'] == null
                        ? '这个人居然不写简介'
                        : articleList[index]['introduce'],
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.thumbsUp,
                        size: 12,
                      ),
                      Container(
                        width: Adapt.px(20),
                      ),
                      Text('${articleList[index]['likeCount']}'),
                      Container(
                        width: Adapt.px(40),
                      ),
                      Icon(
                        Icons.message,
                        size: 12,
                      ),
                      Container(
                        width: Adapt.px(20),
                      ),
                      Text(
                          '${articleList[index]['comments'].length + articleList[index]['comments_to_comments'].length}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //  Card(
        //   elevation: 5.0,
        //   child: Container(
        //     height: 180.0,
        //     padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        //     child: Column(
        //       children: <Widget>[
        //         Container(
        //           child: Row(
        //             children: <Widget>[
        //               Expanded(
        //                 child: Container(
        //                   child: Text(articleList[index]['user']['username']),
        //                 ),
        //               ),
        //               Expanded(
        //                 child: Container(
        //                   alignment: Alignment.centerRight,
        //                   child:
        //                       Text(articleList[index]['blog_type']['typename']),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         Container(
        //           margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        //           alignment: Alignment.centerLeft,
        //           child: Text(
        //             articleList[index]['title'],
        //             style: TextStyle(fontWeight: FontWeight.w500),
        //           ),
        //         ),
        //         Container(
        //           height: 50,
        //           margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        //           alignment: Alignment.topLeft,
        //           child: Text(articleList[index]['introduce']),
        //         ),
        //         Container(
        //           child: Row(
        //             children: <Widget>[
        //               Icon(
        //                 Icons.thumb_up,
        //                 size: 12,
        //               ),
        //               Text('${articleList[index]['likeCount']}'),
        //               Text('   '),
        //               Icon(
        //                 Icons.message,
        //                 size: 12,
        //               ),
        //               Text(
        //                   '${articleList[index]['comments'].length + articleList[index]['comments_to_comments'].length}'),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      );
    } else {
      return Center(
        child: Text(' '),
      );
    }
  }
}
