import 'package:fish_redux/fish_redux.dart';

import 'adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyCommentComponent extends Component<MyCommentState> {
  MyCommentComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MyCommentState>(
              adapter: NoneConn<MyCommentState>() + MyCommentListAdapter(),
              slots: <String, Dependent<MyCommentState>>{}),
        );
}
