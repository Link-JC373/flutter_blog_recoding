import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ToCommentComponent extends Component<ToCommentState> {
  ToCommentComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ToCommentState>(
                adapter: null,
                slots: <String, Dependent<ToCommentState>>{
                }),);

}
