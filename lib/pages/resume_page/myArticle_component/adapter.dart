import 'package:blog_flutter/pages/resume_page/myArticle_component/articleCell_component/component.dart';
import 'package:blog_flutter/pages/resume_page/myArticle_component/articleCell_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class MyArticleListAdapter extends DynamicFlowAdapter<MyArticleState> {
  MyArticleListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'articleCell': ArticleCellComponent(),
          },
          connector: _ArticleListConnector(),
          reducer: buildReducer(),
        );
}

class _ArticleListConnector extends ConnOp<MyArticleState, List<ItemBean>> {
  @override
  List<ItemBean> get(MyArticleState state) {
    List<ItemBean> items = [];
    // print('=====================');
    // print(state.articleList?.results);
    if (state.articleList?.results != null) {
      if (state.articleList.results.isNotEmpty == true) {
        for (var i in state.articleList.results) {
          // print('++++++++++++++');
          ArticleCellState subState = ArticleCellState();
          subState.alr = i;
          // print(i);
          items.add(ItemBean('articleCell', subState));
        }
      }
    }
    return items;
  }

  @override
  void set(MyArticleState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
