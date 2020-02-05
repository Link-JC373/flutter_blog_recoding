import 'package:fish_redux/fish_redux.dart';

import 'adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyArticleComponent extends Component<MyArticleState> {
  MyArticleComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MyArticleState>(
              adapter: NoneConn<MyArticleState>() + MyArticleListAdapter(),
              slots: <String, Dependent<MyArticleState>>{}),
        );
}
