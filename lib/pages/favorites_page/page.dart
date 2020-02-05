import 'package:blog_flutter/pages/favorites_page/favList_adapter/adapter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FavoritesPage extends Page<FavoritesState, Map<String, dynamic>> {
  FavoritesPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<FavoritesState>(
              adapter: NoneConn<FavoritesState>() + FavListAdapter(),
              slots: <String, Dependent<FavoritesState>>{}),
          middleware: <Middleware<FavoritesState>>[],
        );
}
