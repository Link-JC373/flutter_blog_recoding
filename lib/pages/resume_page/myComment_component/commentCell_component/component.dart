import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentCellComponent extends Component<CommentCellState> {
  CommentCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommentCellState>(
                adapter: null,
                slots: <String, Dependent<CommentCellState>>{
                }),);

}
