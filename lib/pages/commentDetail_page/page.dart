import 'package:blog_flutter/pages/commentDetail_page/tcList_adapter/adapter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentDetailPage extends Page<CommentDetailState, Map<String, dynamic>> {
  CommentDetailPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CommentDetailState>(
              adapter: NoneConn<CommentDetailState>() + TcListAdapter(),
              slots: <String, Dependent<CommentDetailState>>{}),
          middleware: <Middleware<CommentDetailState>>[],
        );
}
