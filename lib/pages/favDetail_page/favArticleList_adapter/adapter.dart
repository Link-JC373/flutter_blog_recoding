import 'package:blog_flutter/pages/favDetail_page/favArticleCell_component/component.dart';
import 'package:blog_flutter/pages/favDetail_page/favArticleCell_component/state.dart';
import 'package:blog_flutter/pages/favDetail_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class FavArticleListAdapter extends DynamicFlowAdapter<FavDetailState> {
  FavArticleListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'favArticleCell': FavArticleCellComponent(),
          },
          connector: _FavArticleListConnector(),
          reducer: buildReducer(),
        );
}

class _FavArticleListConnector extends ConnOp<FavDetailState, List<ItemBean>> {
  @override
  List<ItemBean> get(FavDetailState state) {
    List<ItemBean> items = [];
    if (state.favArticleListModel?.results != null) {
      for (var item in state.favArticleListModel.results) {
        FavArticleCellState subState = FavArticleCellState();
        subState.results = item;
        // subState.userId = state.userId;
        items.add(ItemBean('favArticleCell', subState));
      }
    }

    return items;
  }

  @override
  void set(FavDetailState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
