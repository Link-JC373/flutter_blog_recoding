import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class ArticleListAdapterAdapter extends DynamicFlowAdapter<ArticleListAdapterState> {
  ArticleListAdapterAdapter()
      : super(
          pool: <String, Component<Object>>{
          },
          connector: _ArticleListAdapterConnector(),
          reducer: buildReducer(),
        );
}

class _ArticleListAdapterConnector extends ConnOp<ArticleListAdapterState, List<ItemBean>> {
  @override
  List<ItemBean> get(ArticleListAdapterState state) {
    return <ItemBean>[];
  }

  @override
  void set(ArticleListAdapterState state, List<ItemBean> items) {
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
