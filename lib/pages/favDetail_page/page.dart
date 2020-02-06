import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'favArticleList_adapter/adapter.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FavDetailPage extends Page<FavDetailState, Map<String, dynamic>> {
  FavDetailPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<FavDetailState>(
              adapter: null,
              slots: <String, Dependent<FavDetailState>>{
                'favArticleList':
                    NoneConn<FavDetailState>() + FavArticleListAdapter(),
              }),
          middleware: <Middleware<FavDetailState>>[],
        );
}
