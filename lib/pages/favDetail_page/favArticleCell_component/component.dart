import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FavArticleCellComponent extends Component<FavArticleCellState> {
  FavArticleCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FavArticleCellState>(
                adapter: null,
                slots: <String, Dependent<FavArticleCellState>>{
                }),);

}
