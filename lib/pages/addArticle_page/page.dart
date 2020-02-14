import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AddArticlePage extends Page<AddArticleState, Map<String, dynamic>> {
  AddArticlePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AddArticleState>(
                adapter: null,
                slots: <String, Dependent<AddArticleState>>{
                }),
            middleware: <Middleware<AddArticleState>>[
            ],);

}
