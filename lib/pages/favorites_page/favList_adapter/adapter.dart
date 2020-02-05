import 'package:blog_flutter/pages/favorites_page/favDetail_component/component.dart';
import 'package:blog_flutter/pages/favorites_page/favDetail_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'reducer.dart';
import 'state.dart';

class FavListAdapter extends DynamicFlowAdapter<FavoritesState> {
  FavListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'favDetail': FavDetailComponent(),
          },
          connector: _FavListConnector(),
          reducer: buildReducer(),
        );
}

class _FavListConnector extends ConnOp<FavoritesState, List<ItemBean>> {
  @override
  List<ItemBean> get(FavoritesState state) {
    List<ItemBean> items = [];
    for (var item in state.favList.results) {
      FavDetailState subState = FavDetailState();
      subState.result = item;
      items.add(ItemBean('favDetail', subState));
    }
    return items;
  }

  @override
  void set(FavoritesState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
