import 'package:blog_flutter/pages/resume_page/more_component/component.dart';
import 'package:blog_flutter/pages/resume_page/myArticle_component/component.dart';
import 'package:blog_flutter/pages/resume_page/myComment_component/component.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'more_component/state.dart' hide initState;
import 'myArticle_component/state.dart' hide initState;
import 'myComment_component/state.dart' hide initState;
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ResumePage extends Page<ResumeState, Map<String, dynamic>>
    with TickerProviderMixin {
  ResumePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ResumeState>(
              adapter: null,
              slots: <String, Dependent<ResumeState>>{
                'MyArticle': MyArticleConnector() + MyArticleComponent(),
                'MyComment': MyCommentConnector() + MyCommentComponent(),
                'More': MoreConnector() + MoreComponent(),
              }),
          middleware: <Middleware<ResumeState>>[],
        );
}
